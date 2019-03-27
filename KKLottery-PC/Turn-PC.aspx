<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Turn-PC.aspx.cs" Inherits="KKLottery_PC.TurnPC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover" />
	<title></title>
	<link href="css/WeUI/weui.min.css" rel="stylesheet" />
	<style type="text/css">
		body {
			background: radial-gradient(circle,rgba(155,75,75,1) 0%,rgba(41,34,61,1) 100%);
		}

		.top {
			width: 100%;
		}

		.weui-grid {
			padding: 0;
		}

		.weui-grids {
			width: 32%;
			margin: 0 auto;
		}

		.weui-grid:before {
			border: 0;
		}

		.weui-grid:after {
			border: 0;
		}

		.weui-grids:before {
			border: 0;
		}

		a {
			text-align: center;
		}

		.img {
			width: 80%;
			margin-top: 1%;
			height: 152px;
		}

		.info {
			display: none;
			margin-top: 1%;
			width: 0%;
			height: 152px;
		}

		.shelter {
			opacity: 0.5;
			filter: alpha(opacity=50);
		}

		.bottom {
			width: 100%;
		}

		/*-----------------*/

		.textTemple {
			margin: 0 auto;
			padding: 0 1%;
			background-color: black;
			opacity: 0.5;
			border-radius: 5px;
			width: 50%;
		}

		.textStyle {
			color: white;
			font-size: 17px;
		}

		#UserInfo table {
			margin: 0 auto;
			width: 100%;
			margin-bottom: 3%;
		}

		#UserInfo td {
			text-align: left;
		}

		#UserJoinInfo {
			text-align: center;
		}

		#GameRule {
			margin-top: 2%;
		}

		.PrizeName {
			position: absolute;
			left: 32%;
			TOP: 70%;
		}

		h1#LayerH1 {
			color: #e04538;
			position: absolute;
			top: 26%;
			width: 35%;
			left: 50%;
			margin-left: -16%;
			text-align: center;
			font-size: 19px;
		}
	</style>
</head>
<body>
	<div style="width: 100%; overflow: hidden">
		<div style="width: 40%; float: left;">
			<div id="UserInfo" class="textTemple">
				<h2>会员信息</h2>
				<hr />
				<p>姓名：<span id="UserName"></span></p>
				<p>性别：<span id="UserSex"></span></p>
				<p>手机号码：<span id="UserPhone"></span></p>
				<p>会员卡号：<span id="UserCardCode"></span></p>
			</div>
			<%--<div id="UserJoinInfo" class="textTemple textStyle">
					<p>活动期间最大参与次数：<span id="GameMax"></span></p>
					<p>每人当日最大参与次数：<span id="GameDayPersonMax"></span></p>
					<p>用户参与总次数：<span id="TotalCount"></span>    剩余总参与次数:<span id="TotalCount2"></span></p>
					<p>用户当日参与次数：<span id="TodayCount"></span>    剩余当日参与次数：<span id="TodayCount2"></span></p>
					<p>当前是否可参与：<span id="CanJoin"></span></p>
				</div>--%>
			<div id="GameRule" class="textTemple textStyle">
				<div id="RuleWrap">
					<h3>游戏规则</h3>
					<div id="RuleText"></div>
				</div>
			</div>
		</div>

		<div style="width: 60%; float: left;">
			<div class="weui-grids" id="draw">
				<a href="javascript:;" id="a1" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/1.png" alt="" />
				</a>
				<a href="javascript:;" id="a2" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/2.png" alt="" />
				</a>
				<a href="javascript:;" id="a3" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/3.png" alt="" />
				</a>
				<a href="javascript:;" id="a4" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/4.png" alt="" />
				</a>
				<a href="javascript:;" id="a5" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/5.png" alt="" />
				</a>
				<a href="javascript:;" id="a6" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/6.png" alt="" />
				</a>
				<a href="javascript:;" id="a7" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/7.png" alt="" />
				</a>
				<a href="javascript:;" id="a8" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/8.png" alt="" />
				</a>
				<a href="javascript:;" id="a9" class="weui-grid">
					<span class="PrizeName">xixi</span>
					<img class="img" src="images/ldimg/fugai/1.png" alt="" />
					<img class="info" src="images/ldimg/jieguo/9.png" alt="" />
				</a>
			</div>
		</div>
	</div>
	<%--	<div id="UserInfo" class="textTemple">
		<table class="textStyle">
			<tr>
				<td>姓名：<span id="UserName"></span></td>
				<td>性别：<span id="UserSex"></span></td>
			</tr>
			<tr>
				<td>手机号码：<span id="UserPhone"></span></td>
				<td>会员卡号：<span id="UserCardCode"></span></td>
			</tr>
		</table>
	</div>--%>


	<%--	<div id="UserJoinInfo" class="textTemple textStyle">
		<p>用户参与总次数：<span id="TotalCount"></span></p>
		<p>用户当日参与次数：<span id="TodayCount"></span></p>
		<p>当前是否可参与：<span id="CanJoin"></span></p>
	</div>

	<div id="GameRule" class="textTemple textStyle">
		<div id="RuleWrap">
			<h3>游戏规则</h3>
			<div id="RuleText"></div>
		</div>
	</div>--%>

	<div id='info' style="display: none">
		<a href="#">
			<img src="images/tk_img.png" style="width: 100%;" /></a>
		<h1 id="LayerH1">100元</h1>
	</div>
</body>
</html>
<link href="css/layer.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-3.3.1.min.js"></script>
<script src="Scripts/mui.min.js"></script>
<script src="Scripts/layer.js"></script>
<script src="Scripts/Base.js"></script>
<script src="Scripts/Service.js"></script>
<script>
	var WebSocketState = false;		// WebSocket链接状态
	var LoginState = false;			// LoginState登录状态
	var UserInfo;					// 用户信息
	var GameRuleImg;				// 游戏规则底图设置--  websocket消息长度拆分
	var GamePrizeList;				// 游戏奖品设置
	var GameJoinLog;				// 用户参加游戏记录
	var LotteryFinalPrize;		    // 实际抽奖的奖品
	var LotteryFinalId;             // 手机端点击的A标签
	var OpenId;

	var time = 400;
	var verticalOpts = [{ 'width': '0%' }, { 'width': '80%' }];
	var turnImg;

	var StartLottery = () => {
		$(`#${LotteryFinalId}`).find('.img').stop().animate(verticalOpts[0], time, function () {
			$(this).hide().next().show();
			$(this).next().animate(verticalOpts[1], time);
			$(this).parent().find('.PrizeName').html(LotteryFinalPrize.PrizeName);
			$(this).parent().find('.PrizeName').show();

			$('#info h1').text($(this).parent().find('.PrizeName').text());
			setTimeout(function () {
				layer.open({
					type: 1,
					shadeClose: true,
					shade: false,
					maxmin: true,		//开启最大化最小化按钮
					area: ['893px', '600px'],
					content: $('#info').html()
				});
			}, 2000);
		});
	}

	//重置牌面
	var ReSet = () => {
		LotteryFinalPrize = null;
		$(`#${LotteryFinalId}`).find('.img').next().hide();
		$(`#${LotteryFinalId}`).parent().find('.PrizeName').html('');
		$(`#${LotteryFinalId}`).parent().find('.PrizeName').hide();
		$(`#${LotteryFinalId}`).find('.img').stop().animate(verticalOpts[1], time, function () {
			$(this).show();
		})
		LotteryFinalId = null;
	}

	$(() => {
		//WebSocket初始化  
		WsInit();

		$('.PrizeName').hide();
	});

	/**业务 */
	//用户信息
	var ShowUserInfo = () => {
		$('#UserName').html(UserInfo.UserName);
		$('#UserSex').html(UserInfo.UserSex);
		$('#UserPhone').html(UserInfo.UserPhone);
		$('#UserCardCode').html(UserInfo.UserCardCode);
	}
	//游戏设置
	var ShowGameRuleImg = () => {
		//加载规则
		$('#RuleText').html(GameRuleImg.RuleText);
		//加载底图
		$("body").css("background", `url("${ResourceUrl}${GameRuleImg.MainImg}") round`);

	}

	var ShowGamePrizeList = () => {
		//加载奖品图片
		$("#draw a").each(function (i, o) {
			$(`#a${i + 1}`).find('.info').attr('src', `${ResourceUrl}${GamePrizeList.PrizeList[i].PrizeImg}`)
		})
	}

	//游戏参加日志
	var ShowGameJoinLog = () => {
		$('#TotalCount').html(GameJoinLog.TotalCount);
		$('#TodayCount').html(GameJoinLog.TodayCount);
		if (GameJoinLog.CanJoin)
			$('#CanJoin').html('您还可以继续抽奖哟！');
		else
			$('#CanJoin').html('不好意思，您的抽奖次数已用完');
	}

	//工具

	var GetConfigUrl = () => '<%=System.Configuration.ConfigurationManager.AppSettings["WebSocketUrl"].ToString()%>' + '?user=Turn-PC';
	//获取资源Url
	var ResourceUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["ResourceUrl"].ToString()%>';

	var WsInit = () => {
		WebSocketInit(GetConfigUrl(),
			e => console.log(`Open`),
			e => {
				var data = JSON.parse(e.data);
				console.log(data)
				if (!data.Result) {
					if (data.MesData == "Open")
						WebSocketState = true;
					switch (data.MesTitle) {
						case "登录信息":
							if (data.MesData == "已登录")
								LoginState = true;
							break;
						case "用户信息":
							UserInfo = data.MesData;
							OpenId = data.MobileNo;
							ShowUserInfo();
							break;
						case "规则底图设置":
							GameRuleImg = data.MesData;
							ShowGameRuleImg();
							break;
						case "游戏奖品设置":
							GamePrizeList = data.MesData;
							ShowGamePrizeList();
							break;
						case "游戏日志":
							GameJoinLog = data.MesData;
							ShowGameJoinLog();
							break;
						case "抽奖结果":
							LotteryFinalPrize = data.MesData.LotteryFinalPrize;
							LotteryFinalId = data.MesData.Id;
							break;
						case "抽奖状态":
							if (data.MesData == "开始抽奖")
								StartLottery();
							break;
						case "领奖信息":
							if (data.MesData == "点击领奖") {
								layer.closeAll();
								ReSet();
							}
							break;
						case "连接信息":
							if (data.MesData.indexOf("下线") != -1) {
								if (OpenId == data.MobileNo)
									window.location.href = "TurnQRCode.aspx";
							}
							break;
					}
				}
				else
					alert(data.MesData)
			},
			e => console.log(`error`),
			e => console.log(`close`),
		)
	}
</script>
















