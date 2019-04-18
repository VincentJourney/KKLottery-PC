

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
//生成二维码
var CreateQRCodeImg = (data, func) => {
    $.axs('WebService.asmx/CreateQRCodeImg', JSON.stringify(data), data => { func(eval('(' + data.d + ')')) })
}
//查询抽奖日志 WeChatPublic/GetGameVoucher
var GetGameVoucher = (data, func) => {
    $.axs('WebService.asmx/GetGameVoucher', JSON.stringify(data), data => { func(eval('(' + data.d + ')')) })
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
 *简易计时器 暂时用来限制用户30秒误操作退出微信端
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
 * 简单加密手机号
 * 17671456101
 * */
var Encrypt = {
    //10位密文,可替换,不可重复
    ciphertext: 'qwertyuiop',
    //加密
    EncryptPhone: function (phone) {
        let newstr = "";
        for (var i of phone) {
            newstr += this.ciphertext.charAt(i)
        }
        return newstr;
    },
    //解密
    Deciphering: function (cryptograph) {
        let newstr = "";
        for (var i = 0; i < cryptograph.length; i++) {
            for (var j = 0; j < this.ciphertext.length; j++) {
                if (cryptograph[i] == this.ciphertext[j]) {
                    newstr += j;
                }
            }
        }
        return newstr;
    },
}

/**
 * 信息脱敏  ex: 15989328211 中间四位 4-7
 * @param {string} text 需要脱敏的信息
 * @param {string} mark 替换的标志
 * @param {number} start 开始位置
 * @param {number} end 结束位置
 */
var Desensitization = (text, mark, start, end) => {
    console.log(text);
    var text = text + '';
    var StartStr = text.substr(0, start);
    var EndStr = text.substr(end, text.length);
    var MarkStr = "";
    for (var i = 0; i < end - start; i++) {
        MarkStr += mark;
    }
    console.log(StartStr + MarkStr + EndStr)
    return StartStr + MarkStr + EndStr;
}
