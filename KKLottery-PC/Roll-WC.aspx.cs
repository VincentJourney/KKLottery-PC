using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;

namespace KKLottery_PC
{
    public partial class RollWC : System.Web.UI.Page
    {
        public static string UnionId = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    //测试
                    UnionId = System.Configuration.ConfigurationManager.AppSettings["UnionId"];
                    if (string.IsNullOrWhiteSpace(UnionId))
                    {
                        if (string.IsNullOrEmpty(Request.QueryString["code"]))
                        {
                            var GameId = Request.Params["GameId"];
                            string url = $@"https://open.weixin.qq.com/connect/oauth2/authorize?appid={Setting.AppID}&redirect_uri=https%3a%2f%2fbi.kingkeybanner.com%2fRoll-WC?GameId={GameId}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
                            Response.Redirect(url);
                        }
                        else
                        {
                            var obj = Setting.CodeGetOpenid(Request.QueryString["code"]);
                            var obj2 = (JObject)JsonConvert.DeserializeObject(obj);
                            UnionId = obj2["unionid"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error("Roll-WC PageLoad", ex);
            }
        }


    }
}