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
                        Log.Warn($"GET Turn_WC Code:{Request.QueryString["code"]}", null);
                        var obj = Setting.CodeGetOpenid(Request.QueryString["code"]);
                        var obj2 = (JObject)JsonConvert.DeserializeObject(obj);
                        UnionId = obj2["unionid"].ToString();
                        Log.Warn($"GET TurnPcLogin UnionId:{UnionId}", null);
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