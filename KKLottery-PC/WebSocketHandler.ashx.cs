using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.WebSockets;

namespace KKLottery_PC
{
    /// <summary>
    /// WebSocketHandler 的摘要说明
    /// </summary>
    public class WebSocketHandler : IHttpHandler
    {
        private static Dictionary<string, WebSocket> CONNECT_POOL = new Dictionary<string, WebSocket>();//用户连接池
        private static Dictionary<string, List<MessageInfo>> MESSAGE_POOL = new Dictionary<string, List<MessageInfo>>();//离线消息池	


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            if (context.IsWebSocketRequest)
            {
                context.AcceptWebSocketRequest(ProcessChat);
            }
        }

        private async Task ProcessChat(AspNetWebSocketContext context)
        {
            WebSocket socket = context.WebSocket;
            string user = context.QueryString["user"].ToString();

            try
            {
                #region 用户添加连接池
                //第一次open时，添加到连接池中
                if (!CONNECT_POOL.ContainsKey(user))
                {
                    CONNECT_POOL.Add(user, socket);//不存在，添加

                    await Limit(CONNECT_POOL, user, "Roll-WC");

                    await Limit(CONNECT_POOL, user, "Turn-WC");
                }
                else
                    if (socket != CONNECT_POOL[user])//当前对象不一致，更新
                    CONNECT_POOL[user] = socket;

                #endregion

                #region 离线消息处理
                if (MESSAGE_POOL.ContainsKey(user))
                {
                    List<MessageInfo> msgs = MESSAGE_POOL[user];
                    foreach (MessageInfo item in msgs)
                    {
                        await socket.SendAsync(item.MsgContent, WebSocketMessageType.Text, true, CancellationToken.None);
                    }
                    MESSAGE_POOL.Remove(user);//移除离线消息
                }
                #endregion

                string descUser = string.Empty;//目的用户
                while (true)
                {
                    if (socket.State == WebSocketState.Open)
                    {
                        ArraySegment<byte> buffer = new ArraySegment<byte>(new byte[12000]);
                        WebSocketReceiveResult result = await socket.ReceiveAsync(buffer, CancellationToken.None);
                        #region 消息处理（字符截取、消息转发）
                        try
                        {
                            #region 关闭Socket处理，删除连接池
                            if (socket.State != WebSocketState.Open)//连接关闭
                            {
                                await SendToPCOut(CONNECT_POOL, user);
                                break;
                            }
                            #endregion

                            string userMsg = Encoding.UTF8.GetString(buffer.Array, 0, 12000);//发送过来的消息
                            userMsg = userMsg.Replace("\0", "").TrimStart('"').TrimEnd('"').Replace(@"\", "");
                            var mesInfo = JsonConvert.DeserializeObject<MesInfo>(userMsg);
                            if (mesInfo != null)
                            {
                                descUser = mesInfo.SendTo;//记录消息目的用户
                                buffer = new ArraySegment<byte>(Encoding.UTF8.GetBytes(userMsg));
                            }
                            else
                                buffer = new ArraySegment<byte>(Encoding.UTF8.GetBytes(userMsg));

                            if (CONNECT_POOL.ContainsKey(descUser))//判断客户端是否在线
                            {
                                WebSocket destSocket = CONNECT_POOL[descUser];//目的客户端
                                if (destSocket != null && destSocket.State == WebSocketState.Open)
                                    await destSocket.SendAsync(buffer, WebSocketMessageType.Text, true, CancellationToken.None);
                            }
                            else
                            {
                                await Task.Run(() =>
                                {
                                    if (!MESSAGE_POOL.ContainsKey(descUser))//将用户添加至离线消息池中
                                        MESSAGE_POOL.Add(descUser, new List<MessageInfo>());
                                    MESSAGE_POOL[descUser].Add(new MessageInfo(DateTime.Now, buffer));//添加离线消息
                                });
                            }
                        }
                        catch (Exception exs)
                        {
                            //消息转发异常处理，本次消息忽略 继续监听接下来的消息
                            Log.Error("WebSocketHandler  消息处理（字符截取、消息转发）", exs);
                        }
                        #endregion
                    }
                    else
                    {
                        break;
                    }
                }//while end
            }
            catch (Exception ex)
            {
                //整体异常处理
                if (CONNECT_POOL.ContainsKey(user)) CONNECT_POOL.Remove(user);
                Log.Error("WebSocketHandler 整体异常处理", ex);
            }
        }

        /// <summary>
        /// 手机端登录限制为1
        /// </summary>
        /// <param name="UserPool">用户池</param>
        /// <param name="UserName">发送到的用户名</param>
        /// <param name="LimitUser">限制用户名</param>
        /// <returns></returns>
        private async Task Limit(Dictionary<string, WebSocket> UserPool, string UserName, string LimitUser)
        {
            var userNameList = UserPool.Select(s => s.Key).Where(s => s.Contains(LimitUser)).ToList();
            if (userNameList.Count > 1)
            {
                foreach (var user in userNameList)
                {
                    if (user.Split('/')[0] == UserName.Split('/')[0])
                    {
                        var mes = new MesInfo2
                        {
                            SendTo = UserName,
                            MobileNo = "",
                            MesTitle = "提示",
                            MesData = $"已有用户登陆，须排队等待",
                            Result = false,
                        };
                        await SendMes(mes, CONNECT_POOL[UserName]);
                    }
                }
            }

            //if (UserPool.Where(s => s.Key.Contains(LimitUser)).Count() > 1 && UserName.Contains(LimitUser))
            //{

            //}
        }

        private static object OnLine_Lock = new object();
        /// <summary>
        /// 当链接关闭，通知PC端用户下线，删除用户
        /// </summary>
        /// <param name="UserPool"></param>
        /// <param name="UserName"></param>
        /// <returns></returns>
        private async Task SendToPCOut(Dictionary<string, WebSocket> UserPool, string UserName)
        {
            try
            {
                //手机端下线时，通知PC端
                if (CONNECT_POOL.ContainsKey(UserName))
                {
                    var sendTo = "";
                    var userType = "";
                    if (UserName.Contains("Roll"))
                    {
                        sendTo = "Roll-PC";
                        userType = "Roll-WC";
                    }
                    else
                    {
                        sendTo = "Turn-PC";
                        userType = "Turn-WC";
                    }

                    //当同一类型在线人数大于1时 不能关闭 返回false
                    var HasOnLine = false;
                    var mes = new MesInfo2();
                    lock (OnLine_Lock)
                    {
                        HasOnLine = CONNECT_POOL.Where(s => s.Key.Contains(userType)).Count() > 1 ? false : true;
                        mes = new MesInfo2
                        {
                            SendTo = sendTo,
                            MobileNo = UserName.Split('/')[1],
                            MesTitle = "连接信息",
                            MesData = $"下线-{HasOnLine}",
                            Result = false,
                        };
                    }
                    await SendMes(mes, CONNECT_POOL[sendTo]);
                    CONNECT_POOL.Remove(UserName);//删除连接池 
                }
            }
            catch (Exception ex)
            {
                Log.Error("SendToPCOut", ex);
            }
        }

        /// <summary>
        /// 发送消息
        /// </summary>
        /// <param name="mes"></param>
        /// <param name="ws"></param>
        /// <returns></returns>
        public async Task SendMes(MesInfo2 mes, WebSocket ws)
        {
            var ts = new ArraySegment<byte>(Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(mes)));
            await ws.SendAsync(ts, WebSocketMessageType.Text, true, CancellationToken.None);

        }

        /// <summary>
        /// 离线消息
        /// </summary>
        public class MessageInfo
        {
            public MessageInfo(DateTime _MsgTime, ArraySegment<byte> _MsgContent)
            {
                MsgTime = _MsgTime;
                MsgContent = _MsgContent;
            }
            public DateTime MsgTime { get; set; }
            public ArraySegment<byte> MsgContent { get; set; }
        }

        /// <summary>
        /// 消息模板
        /// </summary>
        public class MesInfo
        {
            public string SendTo { get; set; }      //发送的用户
                                                    //public string MesTitle { get; set; }    //消息题目
                                                    //public string MesData { get; set; }     //消息数据
                                                    //public bool Result { get; set; }        //结果是否错误

        }
        public class MesInfo2
        {
            public string SendTo { get; set; }
            public string MobileNo { get; set; }
            public string MesTitle { get; set; }
            public string MesData { get; set; }
            public bool Result { get; set; }
        }


    }
}