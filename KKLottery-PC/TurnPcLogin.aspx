<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnPcLogin.aspx.cs" Inherits="KKLottery_PC.TurnPcLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登陆</title>
    <link rel="stylesheet" type="text/css" href="css/PennCss/css/login2.css" />
    <link rel="stylesheet" type="text/css" href="css/PennCss/css/common.css" />
    <script type="text/javascript" src="Scripts/PennJs/js/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/PennJs/js/Rem.js"></script>
    <%--    <script type="text/javascript" src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>--%>
    <script type="text/javascript" src="Scripts/PennJs/js/login.js"></script>
    <script type="text/javascript" src="Scripts/PennJs/js/Tools.js"></script>
    <script src="Scripts/Service.js"></script>
    <style type="text/css">
        .wrapper {
            position: fixed;
            width: 5rem;
            height: 4.8rem;
            top: 50%;
            left: 50%;
            margin-top: -2.4rem;
            margin-left: -2.5rem;
            background: rgba(203,123,125,.7);
            border-radius: .1rem;
        }

        form > input {
            display: block;
            width: 4.2rem;
            height: 0.56rem;
            font-size: .3rem;
            line-height: .56rem;
            background: rgba(255,255,255,1);
            margin: .4rem 0;
            border: 0;
            border-radius: 3px;
        }

        form > div > input {
            display: block;
            width: 4.2rem;
            height: 0.56rem;
            font-size: .3rem;
            line-height: .56rem;
            background: rgba(255,255,255,1);
            border: 0;
            border-radius: 3px;
        }

        .submitBtn {
            font-size: 0.28rem;
            font-family: PingFang SC;
            font-weight: bold;
            line-height: 0.44rem;
            color: rgba(255,255,255,1);
            background: rgba(214,69,61,1);
            outline: none;
            cursor: pointer;
        }

            .submitBtn:active {
                background: rgba(214,69,64,1);
            }

        label {
            display: block;
            height: 3em;
            font-size: 0.3rem;
            font-family: PingFang SC;
            font-weight: bold;
            line-height: 3em;
            color: rgba(255,255,255,1);
            opacity: 1;
            text-align: center;
            border-bottom: 3px solid rgba(255,255,255,1);
        }
    </style>
</head>

<body>
    <header>
        <img class="logo" src="images/logo@2x.png" />
    </header>

    <div class="login" style="margin-top: 50px; background-color: rgba(255,255,255,0.1); border-radius: 5px;">
        <div class="header">
            <div class="switch" id="switch">
                <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">手机登录</a>
                <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">扫码登入</a>
                <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 50%; left: 0px;"></div>
            </div>
        </div>
        <div class="web_qr_login" id="web_qr_login" style="display: block;">
            <div class="web_login" id="web_login">
                <div class="login-box">
                    <div class="login_form">
                        <form action="" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
                            <input type="hidden" name="did" value="0" />
                            <input type="text" value="" id="phoneNo" placeholder="手机号码" style="text-indent: 1em;" type="number" maxlength="11" />
                            <div style="float: left; margin-bottom: 20px;">
                                <input type="text" value="" id="Code" placeholder="验证码" style="text-indent: 1em; width: 2rem; margin-left: 0px; float: left;" type="number" maxlength="6" />
                                <input class="submitBtn" onclick="sendMsgCode()" id="moBtn" type="button" style="width: 7em; float: left; margin-left: 10px; font-size: .2rem; background: rgba(214,69,64,1); color: white;" value="获取验证码" />
                            </div>
                            <a id="secondShow" style="padding-top: 10px; color: #000000;" href="javascript:;"></a>

                            <!--<input class="submitBtn" type="submit" value="登陆"/>-->
                            <input class="submitBtn" id="btnLogin" type="button" value="登陆" />
                        </form>
                    </div>
                </div>
            </div>
            <!--登录end-->
        </div>

        <!--注册-->
        <div class="web_qr_login" id="qlogin" style="display: none;">
            <div class="web_login" id="web_login">
                <div class="login-box">
                    <div class="login_form" style="width: 100%; margin: 0 auto;">
                        <form action="" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
                            <input type="hidden" name="did" value="0" />
                            <div id="login_container" style="width: 300px; margin: 0 auto;"></div>
                        </form>
                    </div>

                </div>

            </div>
        </div>
        <!--注册end-->
    </div>

    <footer></footer>

</body>

<script type="text/javascript">
    var GameId = '<%=Request.Params["GameId"]%>';
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    var GameId = GetQueryString("GameId");
    if (GameId == "" || GameId == null) {
        alert("暂未设置游戏规则");
    }
    sessionStorage.setItem("GameId", GameId);
    var code = GetQueryString("Code");
    if (code) {
        const jsonData = {
            "Code": code
        }
        aicAjaxGame("GetWechatOpenId", jsonData, function (res) {
            if (!res.Result.HasError) {
                const jsonData = {
                    "QueryType": 4,
                    "Code": code
                }
                aicAjax("MemberInfo", jsonData2, function (res) {
                    if (!res.Result.HasError) {
                        var data = res.Data
                        sessionStorage.setItem("user", JSON.stringify(data))
                        window.location.href = "index.html"
                    } else {
                        alert(res.Result.ErrorMessage);
                    }
                });
            } else {
                alert(res.Result.ErrorMessage);
            }
        });
    }
    function success_jsonpCallback(data) {
        alert(data);

    }
    //const hrefStyle = "data:text/css;base64,LmltcG93ZXJCb3ggLnFyY29kZSB7d2lkdGg6IDE1MHB4O21hcmdpbi10b3A6MmVtO30KLmltcG93ZXJCb3ggLnRpdGxlIHtkaXNwbGF5OiBub25lO30KLnN0YXR1c19pY29uIHtkaXNwbGF5OiBub25lfQouaW1wb3dlckJveCAuc3RhdHVzIHt0ZXh0LWFsaWduOiBjZW50ZXI7fQo=";
    //var obj = new WxLogin({
    //    self_redirect: true,
    //    id: "login_container",
    //    appid: "wxbdc5610cc59c1631",
    //    scope: "snsapi_login",
    //    redirect_uri: "https%3a%2f%2fpassport.yhd.com%2fwechat%2fcallback.do",
    //    state: "123",
    //    style: "white",
    //    href: hrefStyle,
    //});
    var countdown = 60;  // 时长 s
    // 获取验证码按钮点击事件
    function sendMsgCode() {
        const MobileNo = $("#phoneNo").val();
        if (MobileNo == "") {
            alert("手机号码不能为空")
            return
        }
        else if (!(/^1(3|4|5|7|8)\d{9}$/.test(MobileNo))) {
            alert("手机号码有误，请重填");
            return;
        }
        $("#secondShow").css('display', 'block');
        $("#moBtn").css('display', 'none');
        $("#secondShow").html('&nbsp;&nbsp;&nbsp;重新发送(' + (countdown) + 's)');
        var timer = setInterval(function () {
            if (countdown == 0) {
                clearInterval(timer);
                $("#secondShow").css('display', 'none');
                $("#moBtn").css('display', 'block');
                countdown = 30;
                console.log(countdown);
            }
            $("#secondShow").html('&nbsp;&nbsp;&nbsp;重新发送(' + (countdown - 1) + 's)');
            countdown--;
        }, 1000);
        const jsonDataCode = {
            "CodeLength": 6,
            "NeedChar": false,
            "MobileNo": MobileNo
        }
        aicAjaxCode("SendVerificationCode", jsonDataCode, function (res) {
            if (!res.Result.HasError) {
                if (res.Data.CallStatus) {
                    $("#Code").removeAttr("disabled");
                    var data = res.Data
                    sessionStorage.setItem("CallID", res.Data.CallID);
                    //window.location.href="index.html"
                } else {
                    alert("验证码发送失败:" + res.Data.Message)
                }
            } else {
                alert("验证码发送失败:" + res.Result.ErrorMessage)
            }
        });
    }
    $("#btnLogin").click(function () {
        if (GameId == "" || GameId == null) {
            alert("暂未设置游戏规则");
            return;
        }
        const MobileNo = $("#phoneNo").val();
        const VerificationCode = $("#Code").val();
        if (MobileNo == "") {
            alert("手机号码不能为空")
            return
        }
        if (VerificationCode == "") {
            alert("验证码不能为空")
            return
        }

        else if (!(/^1(3|4|5|7|8)\d{9}$/.test(MobileNo))) {

            alert("手机号码有误，请重填");
            return;
        }
        else {
            //					var Confirm = confirm("您的登陆账号为："+MobileNo);
            //					if(confirm){


            //验证短信验证码
            //请求字段
            const jsonDataCode = {
                "VerificationCode": VerificationCode,
                "CallID": sessionStorage.getItem("CallID"),
                "MobileNo": MobileNo
            }
            aicAjaxCode("ValidateVerificationCode", jsonDataCode, function (res) {
                if (res) {
                    if (res.Data.CallStatus) {
                        //请求字段
                        const jsonData = {
                            "QueryType": 3,
                            "Code": MobileNo
                        }
                        aicAjax("MemberInfo", jsonData, function (res) {
                            if (!res.Result.HasError) {
                                var data = res.Data
                                sessionStorage.setItem("user", JSON.stringify(data))
                                //加密手机号登录
                                window.location.href = `TurnOnlyPC.aspx?id=${Encrypt.EncryptPhone(MobileNo)}&GameId=${GameId}`
                            } else {
                                alert(res.Result.ErrorMessage);
                            }
                        });
                    } else {
                        alert("验证码错误，请重新输入");
                    }
                }
            })
            //
            //					}else{
            //						return;
            //					}
        }
    })

</script>


</html>
