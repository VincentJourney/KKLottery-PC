using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using ThoughtWorks.QRCode.Codec;

namespace KKLottery_PC
{
    /// <summary>
    /// WebService 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        private static string LocalUrl = System.Configuration.ConfigurationManager.AppSettings["LocalUrl"];
        /// <summary>
        /// 会员查询
        /// </summary>
        /// <param name="">查询条件</param>
        /// <returns>是否成功、错误信息</returns>
        [WebMethod(EnableSession = true)]
        public string MemberInfo(string QueryType, string Code)
        {
            try
            {
                var mes = new
                {
                    QueryType = Convert.ToInt32(QueryType),
                    Code = Code
                };
                return PubFunc(mes, "Customer/MemberInfo");
            }
            catch (Exception ex)
            {
                Log.Error($"MemberInfo", ex);
                return null;
            }
        }

        /// <summary>
        /// 获取游戏规则
        /// </summary>
        /// <param name="">查询条件</param>
        /// <returns>是否成功、错误信息</returns>
        [WebMethod(EnableSession = true)]
        public string GetGameSetting(string GameType, string SettingID)
        {
            try
            {
                var mes = new
                {
                    GameType = int.Parse(GameType),
                    SettingID = SettingID,
                };
                return PubFunc(mes, "WeChatPublic/GetGameSetting");
            }
            catch (Exception ex)
            {
                Log.Error($"GetGameSetting", ex);
                return null;
            }
        }

        /// <summary>
        /// 查询游戏日志
        /// </summary>
        /// <param name="">查询条件</param>
        /// <returns>是否成功、错误信息</returns>
        [WebMethod(EnableSession = true)]
        public string GetGameJoinInfo(string SettingID, string OpenID)
        {
            try
            {
                var mes = new
                {
                    SettingID = SettingID,
                    OpenID = OpenID,
                };
                return PubFunc(mes, "WeChatPublic/GetGameJoinInfo");
            }
            catch (Exception ex)
            {
                Log.Error($"GetGameJoinInfo", ex);
                return null;
            }
        }

        /// <summary>
        /// 查询游戏抽奖日志
        /// </summary>
        /// <param name="">查询条件</param>
        /// <returns>是否成功、错误信息</returns>
        [WebMethod(EnableSession = true)]
        public string GetGameDrawLog(string SettingID, string OpenID)
        {
            try
            {
                var mes = new
                {
                    SettingID = SettingID,
                    OpenID = OpenID,
                };
                return PubFunc(mes, "WeChatPublic/GetGameDrawLog");
            }
            catch (Exception ex)
            {
                Log.Error($"GetGameDrawLog", ex);
                return null;
            }
        }

        /// <summary>
        /// 参加抽奖
        /// </summary>
        /// <param name="">查询条件</param>
        /// <returns>是否成功、错误信息</returns>
        [WebMethod(EnableSession = true)]
        public string GameJoin(string SettingID, string OpenID, string CustomerID, string CardID, string MobileNo, string ConSumptionType, string ConsumptionValue)
        {
            try
            {
                var mes = new
                {
                    SettingID = SettingID,
                    OpenID = OpenID,
                    CustomerID = CustomerID,
                    CardID = CardID,
                    MobileNo = MobileNo,
                    ConSumptionType = ConSumptionType,
                    ConsumptionValue = int.Parse(ConsumptionValue),
                };
                return PubFunc(mes, "WeChatPublic/GameJoin");
            }
            catch (Exception ex)
            {
                Log.Error($"GameJoin", ex);
                return null;
            }
        }


        public string PubFunc(object a, string Url)
        {
            try
            {
                string code = "true";
                string errorMessage = "";
                string data = "";
                LinkService ls = new LinkService();
                Response resp = ls.httprequest(a, Url);
                if (resp.Result.HasError)
                    return "{'HasError':true,'ErrorMessage':'" + resp.Result.ErrorMessage + "','Data':''}";
                data = resp.Data.ToString();
                code = "false";
                return "{'HasError':" + code + ",'ErrorMessage':'" + errorMessage + "','Data':" + data + "}";
            }
            catch (Exception ex)
            {
                Log.Error($"PubFunc {Url}", ex);
                return null;
            }
        }

        /// <summary>  
        /// 生成二维码图片  
        /// </summary>  
        /// <param name="text">要生成二维码的字符串</param>       
        /// <param name="size">大小尺寸</param>  
        /// <returns>二维码图片</returns>  
        [WebMethod(EnableSession = true)]
        public string CreateQRCodeImg(string text, int size)
        {
            var success = true;
            var data = "";
            try
            {
                //创建二维码生成类  
                QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
                //设置编码模式  
                qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
                //设置编码测量度  
                qrCodeEncoder.QRCodeScale = size;
                //设置编码版本  
                qrCodeEncoder.QRCodeVersion = 8;
                //设置编码错误纠正  
                qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
                //生成二维码图片  
                Bitmap bmp = qrCodeEncoder.Encode(text, Encoding.UTF8);

                //新建画板，因为bmp被锁无法直接生成
                Image bitmap = new System.Drawing.Bitmap(200, 200);
                Graphics g = Graphics.FromImage(bitmap);
                g.DrawImage(bmp, 0, 0);
                var imgName = $"/images/QRCodeImg/{Guid.NewGuid()}.png";
                var url = Server.MapPath($"~{imgName}");
                bitmap.Save(url, ImageFormat.Png);
                //MemoryStream ms = new MemoryStream();
                //bmp.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                //byte[] arr = new byte[ms.Length];
                //ms.Position = 0;
                //ms.Read(arr, 0, (int)ms.Length);
                //ms.Close();
                return JsonConvert.SerializeObject(new
                {
                    success,
                    data = $"{LocalUrl}{imgName}"
                });
            }
            catch (Exception ex)
            {
                Log.Error("动态创建二维码", ex);
                return JsonConvert.SerializeObject(
                new
                {
                    success = false,
                    data
                });
                throw new Exception(ex.Message);
            }
        }

    }
}
