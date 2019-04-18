using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace KKLottery_PC
{
    public enum LogLevel
    {
        Debug,
        Info,
        Warn,
        Error
    }

    public class Log
    {
        public static LogLevel Level = LogLevel.Info;

        public static Action<LogLevel, string, Exception> LogAction = (level, message, ex) =>
        {
            if (level >= Level)
            {
                string logfile = HttpRuntime.AppDomainAppPath.ToString() + "Log/" + DateTime.Now.ToString("yyyy-MM-dd") + "-logInfo.txt";
                StreamWriter sw = File.AppendText(logfile);
                var loginfo = $@"
时间:{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}
类型:{level}
基本信息:{message}
基本信息:{JsonConvert.SerializeObject(ex)}";
                sw.WriteLine(loginfo);
                sw.Close();
            }
        };

        public static void Warn(string Message, Exception ex) => LogAction(LogLevel.Warn, Message, ex);
        public static void Error(string Message, Exception ex) => LogAction(LogLevel.Error, Message, ex);
    }
}