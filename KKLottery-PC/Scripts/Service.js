

jQuery.axs = function (url, data, func) {
	$.ajax({
		async: false,
		type: 'POST',
		contentType: 'application/json; charset=utf-8',
		url: url,
		data: data,
		dataType: 'json',
		success: function (data) {
			func(data)
		},
		error: function (xhr, type) {
			console.log(xhr)
		}
	});
};


//获取会员信息 Customer/MemberInfo
var MemberInfo = (data, func) => {
	$.axs('WebService.asmx/MemberInfo', JSON.stringify(data), data => { func(eval('(' + data.d + ')')) })
}
//获取游戏规则 WeChatPublic/GetGameSetting
var GetGameSetting = (data, func) => {
	$.axs('WebService.asmx/GetGameSetting', JSON.stringify(data), data => { func(eval('(' + data.d + ')')) })
}
//查询游戏日志 WeChatPublic/GetGameJoinInfo
var GetGameJoinInfo = (data, func) => {
	$.axs('WebService.asmx/GetGameJoinInfo', JSON.stringify(data), data => { func(eval('(' + data.d + ')')) })
}
//参加抽奖 WeChatPublic/GameJoin
var GameJoin = (data, func) => {
	$.axs('WebService.asmx/GameJoin', JSON.stringify(data), data => { func(eval('(' + data.d + ')')) })
}
//查询抽奖日志 WeChatPublic/GetGameDrawLog
var GetGameDrawLog = (data, func) => {
	$.axs('WebService.asmx/GetGameDrawLog', JSON.stringify(data), data => { func(eval('(' + data.d + ')')) })
}

/**
 * WebSocket  消息Model
 * @param {string} sendTo		发送目标  ex:Roll_PC
 * @param {string} MobileNo		发送者唯一标识，取至CRM  ex:15989328211
 * @param {string} mesTitle		消息标题  ex:用户信息
 * @param {Object} mesData		消息数据  ex:{username:"",sex:""}
 * @param {boolean} result	    错误与否  ex: true or false
 */
function WcMessage(sendTo, mobileNo, mesTitle, mesData, result) {
	this.SendTo = sendTo;
	this.MobileNo = mobileNo;
	this.MesTitle = mesTitle;
	this.MesData = mesData;
	this.Result = result;
	this.stringify = () => {
		return JSON.stringify(this);
	}
}

/**
 *简易计时器
 */
(() => {
	var LimitTime = 0;		//限制时间
	var timer;				//计时器
	window.SimpleTimer = {
		Start: () => timer = setInterval(() => { LimitTime++ }, 1000),	//计时开始
		ReSet: () => LimitTime = 0,			//重置计时
		GetLimitTime: () => LimitTime,		//获取计时时间
		Stop: () => clearInterval(timer),	//计时暂停
		Back: () => {						//30秒无操作，自动推出微信页面
			setInterval(() => {
				if (LimitTime >= 30) {
					LimitTime = 0;
					WeixinJSBridge.call('closeWindow');
				}
			}, 1000)
		}
	}
})();

/**
 *
 * */
//function SimpleTimer() {
//	this.limitTime = 0;
//	this.timer = null;
//	this.Start = () => this.timer = setInterval(() => { this.limitTime++ }, 1000);
//	this.ReSet = () => this.limitTime = 0;
//	this.Stop = () => clearInterval(this.timer);
//}

