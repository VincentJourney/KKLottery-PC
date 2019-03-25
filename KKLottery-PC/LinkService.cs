using Newtonsoft.Json;
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
	public class LinkService
	{
		private static string url = ConfigurationManager.AppSettings["GameApiServerUrl"] + "api/";

		public Response httprequest(object t, string method)
		{
			HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url + method);
			request.Method = "POST";
			request.ContentType = "application/x-www-form-urlencoded";
			//request.ReadWriteTimeout = 30 * 1000;

			///添加参数  
			Dictionary<String, String> dicList = new Dictionary<String, String>();
			Request req = new Request();
			req.Data = t;
			req.Shared = new shared();
			req.Shared.CorpCode = ConfigurationManager.AppSettings["CorpCode"];
			req.Shared.OrgCode = ConfigurationManager.AppSettings["OrgCode"];
			req.Shared.AppCode = ConfigurationManager.AppSettings["AppCode"];
			req.Shared.Signature = ConfigurationManager.AppSettings["Signature"];
			req.Shared.appid = ConfigurationManager.AppSettings["appid"];
			string reqstring = JsonConvert.SerializeObject(req);
			dicList.Add("request", reqstring);
			String postStr = buildQueryStr(dicList);
			byte[] data = Encoding.UTF8.GetBytes(postStr);

			request.ContentLength = postStr.Length;

			Stream myRequestStream = request.GetRequestStream();
			myRequestStream.Write(data, 0, data.Length);
			myRequestStream.Close();

			HttpWebResponse response = (HttpWebResponse)request.GetResponse();
			StreamReader myStreamReader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);

			string retString = myStreamReader.ReadToEnd();

			Response obj = JsonConvert.DeserializeObject<Response>(retString);

			return obj;
		}
		/// <summary>
		/// HTTPGet
		/// </summary>
		/// <param name="Code"></param>
		/// <returns></returns>
		public string HttpGet(string url)
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
		private string buildQueryStr(Dictionary<String, String> dicList)
		{
			String postStr = "";

			foreach (var item in dicList)
			{
				postStr += item.Key + "=" + HttpUtility.UrlEncode(item.Value, Encoding.UTF8) + "&";
			}
			postStr = postStr.Substring(0, postStr.LastIndexOf('&'));
			return postStr;
		}
	}


	public class Request
	{
		public shared Shared { get; set; }
		public object Data { get; set; }

	}
	public class shared
	{
		public string CorpCode { get; set; }
		public string OrgCode { get; set; }
		public string AppCode { get; set; }
		public string Signature { get; set; }
		public string appid { get; set; }
	}

	public class Response
	{
		public Result Result { get; set; }
		public object Data { get; set; }
	}
	public class Result
	{
		public bool HasError { get; set; }
		public int ErrorCode { get; set; }
		public string ErrorMessage { get; set; }
	}
}