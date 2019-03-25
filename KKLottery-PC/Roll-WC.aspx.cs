﻿using Newtonsoft.Json;
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

					Log.Warn($"GET WC Code:{Request.QueryString["code"]}", null);
					if (string.IsNullOrWhiteSpace(UnionId))
					{
						Log.Warn($"GET WC Code:{Request.QueryString["code"]}", null);
						if (string.IsNullOrEmpty(Request.QueryString["code"]))
						{
							string url = $@"https://open.weixin.qq.com/connect/oauth2/authorize?appid={Setting.AppID}&redirect_uri=https%3a%2f%2fcloud.ascentis.cn%2fKKLottery%2fRoll-WC&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
							Response.Redirect(url);
						}
						else
						{
							Log.Warn($"GET Roll_WC Code:{Request.QueryString["code"]}", null);
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
				Log.Error("Roll-WC PageLoad", ex);
			}
		}


	}
}