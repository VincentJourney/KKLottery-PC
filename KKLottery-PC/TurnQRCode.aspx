<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnQRCode.aspx.cs" Inherits="KKLottery_PC.TurnQRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
</head>
<body>
	<div style="text-align: center; margin-top: 10%; width: 100%;">
		<h1>请扫描下方二维码</h1>
		<img src="images/Turn-WC.png" />
		<h3>翻牌小游戏</h3>
	</div>
</body>
</html>
<script src="Scripts/jquery-3.3.1.min.js"></script>
<script src="Scripts/Base.js"></script>
<script src="Scripts/Service.js"></script>
<script>

	$(() => {
		WsInit();
	});

	var WebSocketUser = 'Turn-PC';

	var GetConfigUrl = () => `<%=System.Configuration.ConfigurationManager.AppSettings["WebSocketUrl"].ToString()%>?user=${WebSocketUser}`;

	var WsInit = () => {
		WebSocketInit(GetConfigUrl(),
			e => console.log(`Open`),
			e => {
				var data = JSON.parse(e.data);
				if (data.SendTo == WebSocketUser) {
					if (data.MesTitle == '用户信息')
						window.location.href = `${WebSocketUser}.aspx`;
				}
				else
					alert(data.MesData)
			},
			e => console.log(`error`),
			e => console.log(`close`)
		)
	}



</script>
