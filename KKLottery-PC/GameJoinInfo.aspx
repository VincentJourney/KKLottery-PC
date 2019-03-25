<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameJoinInfo.aspx.cs" Inherits="KKLottery_PC.GameJoinInfo" %>

<!DOCTYPE html>
<link href="css/mui.min.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
</head>
<body>
	<div class="mui-card" style="margin: 0px;">
		<div class="mui-card-header mui-row" style="margin: 6vw 0; font-size: 6VW">
			<div class="mui-col-sm-4" onclick="Back()">返回</div>
			<div class="mui-col-sm-8">日志列表</div>
		</div>
		<div class="mui-card-content">
			<ul class="mui-table-view" id="Log"></ul>
		</div>
	</div>
</body>
</html>
<script src="Scripts/jquery-3.3.1.min.js"></script>
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
						Html += `<li class="mui-table-view-cell" style="font-size:5VW;margin: 5VW 0;">
			                     <a class="mui-navigate-right">
                                    <div class="mui-row">
                                        
                                         <div class="mui-col-sm-6">礼品名称：${item.WinPrizeName}</div>
                                         <div class="mui-col-sm-6">礼品类型：${FormatterType(item.WinPrizeType)}</div>
                                         
                                    </div>
                                 </a>
                             </li>`;
					});
					//<div class="mui-col-sm-3">消耗类型:${item.ConSumptionType}</div>
					//<div class="mui-col-sm-3">礼品值：${item.WinPrizeValue}</div>

					$('#Log').empty();
					$('#Log').append(Html);
				}
			}
			else {
				mui.alert(res.ErrorMessage);
			}
		})
	})
</script>
