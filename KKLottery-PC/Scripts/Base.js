﻿


//发送端
(() => {
    var ws;
    var url;
    window.JSocket = {
        init: function (Url) {
            var support = "MozWebSocket" in window ? "MozWebSocket" : ('WebSocket' in window ? 'WebSocket' : null);
            if (support == null) {
                alert("浏览器不支持WebSocket!");
                return false;
            }
            url = Url;
            this.connect(Url);
        },
        connect: function (url) {
            try {
                ws = new WebSocket(url);
                if (ws.readyState === WebSocket.CONNECTING) {
                    console.log("正在连接WebSocket服务器...");
                }
                ws.onopen = this.onopen;
                ws.onmessage = this.onmessage;
                ws.onclose = this.onclose;
                ws.onerror = this.onerror;
            } catch (e) {
                console.log("connectError：" + e);
            }
        },
        disconnect: () => {
            if (ws != null && ws.readyState === WebSocket.OPEN) {
                console.log('连接已关闭');
                ws.close();  //关闭TCP连接
            }
        },
        onopen: e => {
            if (ws.readyState === WebSocket.OPEN) {
                console.log('WebSocket已连接');
            }
        },
        onmessage: e => {
            var data = JSON.parse(e.data);
            console.log(data);
            if (data.MesTitle == "提示") {
                ws.close();

                let throttleFunc = throttle(() => {
                    $confirm(data.MesData, () => {
                        //alert("Close");
                        WeixinJSBridge.call('closeWindow');
                    })
                }, 5000);

                throttleFunc();


            }
        },
        onclose: e => {
            console.log(e);
            if (e.code == 1006) {//当遇到不明状态websocket关闭。。
                JSocket.init(url);
                //window.location.reload();
            }
        },
        onerror: e => {
            console.log(e);
        },
        sendMessage: msg => {
            if (ws != null && ws.readyState === WebSocket.OPEN) {
                if (msg == "" || msg == null || msg == "undefined") {
                    return false;
                }
                ws.send(msg);
            } else {
                console.log("发送失败！原因：可能是WebSocket未能建立连接！");
            }
        },
        sendJMes: msg => {
            if (ws != null && ws.readyState === WebSocket.OPEN) {
                if (msg == "" || msg == null || msg == "undefined") {
                    return false;
                }
                ws.send(JSON.stringify(msg));
            } else {
                console.log("发送失败！原因：可能是WebSocket未能建立连接！");
            }
        },
        getWebSocketState: () => {
            var result = "";
            switch (ws.readyState) {
                case 0:
                    result = "连接正在进行中，但还未建立";
                    break;
                case 1:
                    result = "连接已经建立。消息可以在客户端和服务器之间传递";
                    break;
                case 2:
                    result = "连接正在进行关闭握手";
                    break;
                case 3:
                    result = "连接已经关闭，不能打开";
                    break;
            }
            return ws.readyState;
        },
    };


})();



/**
 * WebSocket初始化
 * @param {any} url 
 * @param {any} o open
 * @param {any} m message
 * @param {any} e error
 * @param {any} c close
 */
var WebSocketInit = (url, o, m, e, c) => {
    var support = "MozWebSocket" in window ? "MozWebSocket" : ('WebSocket' in window ? 'WebSocket' : null);
    if (support == null) {
        alert("浏览器不支持WebSocket!");
        return false;
    }
    var ws = new WebSocket(url);
    ws.onopen = o;
    ws.onmessage = m;
    ws.onerror = e;
    ws.onclose = c;
}

//检查字符串是否为空，为空返回true
var isEmpty = str => {
    if (str == null || typeof (str) == "undefined" || str == "")
        return true;
    return false;
}


/**
 * 获取url参数
 * @param {any} name
 */
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

/**
 * 对话框
 * @param {any} mes 消息
 * @param {any} func 回调
 */
var $confirm = (mes, func) => {
    if (confirm(mes))
        func();
    else
        func();
}

/**
 * 节流
 * @param {Function} callback 回调函数
 * @param {Number} duration 延迟时间
 */
function throttle(callback, duration) {
    let last, defer;
    return arg => {
        let now = + new Date();
        if (last && now < last + duration) {
            clearTimeout(defer);
            defer = setTimeout(function () {
                last = now;
                callback.call(this, arg);
            }, duration);
        }
        else {
            last = now;
            callback.call(this, arg);
        }
    }
}

