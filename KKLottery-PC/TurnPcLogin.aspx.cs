using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KKLottery_PC
{
    public partial class TurnPcLogin : System.Web.UI.Page
    {
        public static string AppId = Setting.AppID;
        //public static string UnionId = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (!IsPostBack)
            //    {
            //        //测试
            //        UnionId = System.Configuration.ConfigurationManager.AppSettings["UnionId"];
            //        if (string.IsNullOrWhiteSpace(UnionId))
            //        {
            //            if (string.IsNullOrEmpty(Request.QueryString["code"]))
            //            {
            //                var GameId = Request.Params["GameId"];
            //                var Type = Request.Params["Type"];
            //                //string url = $@"https://open.weixin.qq.com/connect/oauth2/authorize?appid={Setting.AppID}&redirect_uri=https%3a%2f%2fbi.kingkeybanner.com%2fTurnPcLogin?GameId={GameId}&Type={Type}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
            //                //Response.Redirect(url);
            //            }
            //            else
            //            {
            //                Log.Warn($"GET TurnPcLogin Code:{Request.QueryString["code"]}", null);
            //                var obj = Setting.CodeGetOpenid(Request.QueryString["code"]);
            //                var obj2 = (JObject)JsonConvert.DeserializeObject(obj);
            //                UnionId = obj2["unionid"].ToString();
            //                Log.Warn($"GET TurnPcLogin UnionId:{UnionId}", null);
            //            }
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Log.Error("Turn_WC PageLoad", ex);
            //}
        }
    }
}