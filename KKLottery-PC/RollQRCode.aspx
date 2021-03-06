﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RollQRCode.aspx.cs" Inherits="KKLottery_PC.RollQRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        body {
            background: url("images/QRBGIMG.jpg") no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .QRCodeBox {
            text-align: center;
            width: 28%;
            margin: 8% auto;
            color: white;
            background: #0e0f0f80;
            padding: 1%;
        }

        .Logo {
            padding: 1%;
        }
    </style>
</head>
<body>
    <%--    <div class="Logo">
        <img src="images/kingkeyLog.png" />
    </div>--%>
    <div class="QRCodeBox">
        <h1>微信扫码登陆</h1>
        <img src="images/Roll-WC.png" id="QRImg" />
        <h4>请您打开微信，扫描二维码登录</h4>
        <h5>注：30秒未操作自动退出</h5>
    </div>
</body>
</html>
<script src="Scripts/jquery-3.3.1.min.js"></script>
<script src="Scripts/Base.js"></script>
<script src="Scripts/Service.js"></script>
<script>
    var GameId = '<%=Request.Params["GameId"]%>';
    var Url = `https://bi.kingkeybanner.com/Roll-WC?GameId=${GameId}`;
    //获取GameType
    var RollGameType = parseInt('<%=System.Configuration.ConfigurationManager.AppSettings["RollGameType"].ToString()%>');
    $(() => {

        GetGameSetting({ GameType: RollGameType, SettingID: GameId }, data => {
            if (data.Data.length > 0) {
                console.log(data);
                if (data.Data[0].OrgID == "1f90fb71-8fe4-4a8d-84be-61307b05554c") {
                    $("body").css({
                        'background': 'url("images/KKONEQRIMG.jpg") no-repeat center center fixed',
                        '-webkit-background-size': 'cover',
                        '-moz-background-size': 'cover',
                        '-o-background-size': 'cover',
                        'background-size': 'cover',
                    });
                }
            }
        });

        //动态创建二维码
        if (!isEmpty(GameId)) {
            console.log(Url);
            CreateQRCodeImg({ text: Url, size: 4 }, data => {

                if (data.success)
                    $('#QRImg').attr('src', data.data)
                else
                    alert("游戏配置错误，请联系管理员");
            });
        }
        else {
            alert("游戏暂未配置！");
            return;
        }


        WsInit();
    });

    var WebSocketUser = 'Roll-PC';

    var GetConfigUrl = () => `<%=System.Configuration.ConfigurationManager.AppSettings["WebSocketUrl"].ToString()%>?user=${WebSocketUser}`;

    var WsInit = () => {
        WebSocketInit(GetConfigUrl(),
            e => console.log(`Open`),
            (e) => {
                var data = JSON.parse(e.data);
                console.log(data)
                if (data.SendTo == WebSocketUser) {
                    if (data.MesTitle == '登录信息')
                        window.location.href = `${WebSocketUser}.aspx?GameId=${GameId}`;
                }
                else
                    alert(data.MesData)
            },
            e => console.log(`error`),
            e => console.log(`close`)
        )
    }



</script>
