<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameJoinInfo.aspx.cs" Inherits="KKLottery_PC.GameJoinInfo" %>

<!DOCTYPE html>
<link href="css/mui.min.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<style type="text/css">
		*, :after, :before {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		* {
			margin: 0;
			padding: 0;
		}

		body {
			font-size: 3.5VW;
			color: white;
		}

		.Title {
			top: 0;
			width: 100%;
			overflow: hidden;
			background-color: black;
			opacity: 0.4;
		}

		.LogMode {
			margin: 5VW auto;
			overflow: hidden;
			background: black;
			opacity: 0.4;
			height: 14vw;
			width: 90%;
			border-radius: 2vw;
			text-align: center;
			line-height: 7vw;
		}

		li {
			list-style: none;
		}
	</style>
</head>
<body style="background: radial-gradient(circle,rgba(155,75,75,1) 0%,rgba(41,34,61,1) 100%);">
	<div class="Title">
		<div style="float: left; width: 40%; line-height: 14vw; padding-left: 6%;" onclick="Back()">返回</div>
		<div style="float: left; width: 60%; line-height: 14vw; padding-left: 2%;">日志列表</div>
	</div>

	<div id="LogList">
		<div class="LogMode">
			<div style="float: left; width: 20%; line-height: 19vw;">
				<img src="images/PrizeIMG.png" />
			</div>
			<div style="float: left; width: 80%">
				<ul>
					<li>暂无历史记录</li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>
<script src="Scripts/jquery-3.3.1.min.js"></script>
<script src="Scripts/mui.min.js"></script>
<script src="Scripts/Base.js"></script>
<script src="Scripts/Service.js"></script>
<script>
	var SettingId = '<%=Request.Params["SettingID"] %>';
	var OpenID = '<%=Request.Params["OpenID"] %>';
	var User = '<%=Request.Params["User"] %>';

	var FormatterType = Type => {
		switch (Type) {
			case "1": return "礼品";
			case "2": return "礼券";
			case "3": return "积分";
			case "4": return "感谢参与";
			default: return "";
		}
	}
	var Back = () => {
		window.location.href = `${User}.aspx`;
	}

	$(function () {
		//查询抽奖日志
		GetGameDrawLog({ SettingID: SettingId, OpenID }, res => {
			console.log(res)
			if (!res.HasError) {
				if (res.Data.length > 0) {
					var Html = "";
					res.Data.forEach(item => {
						var ConsumptionType = item.ConsumptionType == '1' ? '积分' : '礼券';
						Html += `<div class="LogMode">
			                          <div style="float: left; width: 20%; line-height: 19vw;">
			                       	       <img src="images/PrizeIMG.png" />
			                          </div>
			                          <div style="float: left; width: 80%"><ul>`;
						switch (item.WinPrizeType) {
							case '1':
								Html += `<li>您消耗了${item.ConsumptionValue}${ConsumptionType}，抽中了${item.WinPrizeName}</li>`;
								break;
							case '2':
								Html += `<li>您消耗了${item.ConsumptionValue}${ConsumptionType}，抽中了${item.WinPrizeName}</li>`;
								break;
							case '3':
								Html += `<li>您消耗了${item.ConsumptionValue}${ConsumptionType}，抽中了${item.WinPrizeValue}${FormatterType(item.WinPrizeType)}</li>`;
								break;
							case '4':
								Html += `<li>很遗憾，您消耗了${item.ConsumptionValue}${ConsumptionType}，什么都没有抽到...</li>`;
								break;
							default: break;
						}
						Html += ` <li>${item.AddedOn}</li></ul></div></div>`;
					});
					$('#LogList').empty();
					$('#LogList').append(Html);
				}
			}
			else {
				mui.alert(res.ErrorMessage);
			}
		})
	})

	var FormatterPrizeType = Type => {
		switch (Type) {
			case '1': return '礼品';
			case '2': return '礼券';
			case '3': return '积分';
			case '4': return '感谢参与';
			default: return '';
		}
	}
</script>
