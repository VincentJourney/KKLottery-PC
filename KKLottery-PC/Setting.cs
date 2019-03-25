using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Configuration;

namespace KKLottery_PC
{
	public class Setting
	{
		public static string AppID = ConfigurationManager.AppSettings["AppId"];
		public static string Secret = ConfigurationManager.AppSettings["AppSecret"];

		/// <summary>
		/// 用Code换取Openid
		/// </summary>
		/// <param name="Code"></param>
		/// <returns></returns>
		public static string CodeGetOpenid(string Code)
		{
			try
			{
				string url = $"https://api.weixin.qq.com/sns/oauth2/access_token?appid={AppID}&secret={Secret}&code={Code}&grant_type=authorization_code";
				return HttpGet(url);
			}
			catch (Exception ex)
			{
				Log.Error("CodeGetOpenid", ex);
				return "";
			}

		}

		/// <summary>
		/// HTTPGet
		/// </summary>
		/// <param name="Code"></param>
		/// <returns></returns>
		public static string HttpGet(string url)
		{
			WebRequest request = WebRequest.Create(url);
			request.Timeout = 2000;
			request.Method = "GET";
			WebResponse response = request.GetResponse();
			Stream s = response.GetResponseStream();
			StreamReader sr = new StreamReader(s, Encoding.GetEncoding("utf-8"));
			string result = sr.ReadToEnd();
			sr.Dispose();
			sr.Close();
			s.Dispose();
			s.Close();
			return result;
		}
	}
}