using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;

namespace KKLottery_PC
{
    public partial class TurnWC : System.Web.UI.Page
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

                    Log.Warn($"GET WC Code:{Request.QueryString["code"]}", null);
                    if (string.IsNullOrWhiteSpace(UnionId))
                    {
                        Log.Warn($"GET WC Code:{Request.QueryString["code"]}", null);
                        if (string.IsNullOrEmpty(Request.QueryString["code"]))
                        {
                            var GameId = Request.Params["GameId"];
                            string url = $@"https://open.weixin.qq.com/connect/oauth2/authorize?appid={Setting.AppID}&redirect_uri=https://bi.kingkeybanner.com/Turn-WC?GameId={GameId}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
                            Response.Redirect(url);
                        }
                        else
                        {
                            Log.Warn($"GET Turn_WC Code:{Request.QueryString["code"]}", null);
                            var obj = Setting.CodeGetOpenid(Request.QueryString["code"]);
                            var obj2 = (JObject)JsonConvert.DeserializeObject(obj);
                            UnionId = obj2["unionid"].ToString();
                            Log.Warn($"GET WC UnionId:{UnionId}", null);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error("Turn_WC PageLoad", ex);
            }
        }
    }
}