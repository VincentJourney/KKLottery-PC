﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Turn-WC.aspx.cs" Inherits="KKLottery_PC.TurnWC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover" />
	<title></title>
	<link href="css/WeUI/weui.min.css" rel="stylesheet" />
	<style type="text/css">
		body {
			background: #E7244B;
		}

		.top {
			width: 100%;
		}

		.weui-grid {
			padding: 0;
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
			width: 90%;
			margin-top: 1vw;
			height: 33.9vw;
		}

		.info {
			display: none;
			margin-top: 1vw;
			width: 0;
			height: 33.9vw;
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
			margin: 0 2VW;
			padding: 0 1VW;
			background-color: black;
			opacity: 0.5;
			border-radius: 1vw;
		}

		.textStyle {
			color: white;
			font-size: 3.5vw;
		}

		#UserInfo table {
			margin: 4VW auto;
			width: 100%;
			margin-bottom: 10%
		}

		#UserInfo td {
			text-align: left;
		}

		#UserJoinInfo {
			text-align: center;
		}

		#GameRule {
			margin-top: 2VW;
		}

		.PrizeName {
			position: absolute;
			left: 14VW;
			TOP: 14vw;
		}

		h1#LayerH1 {
			color: #e04538;
			position: absolute;
			top: 26%;
			width: 35%;
			left: 50%;
			margin-left: -16%;
			text-align: center;
			font-size: 5VW;
		}

		.hover :hover {
			background-color: darkgreen;
		}
	</style>
</head>
<body>
	<div id="UserInfo" class="textTemple">
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
	</div>
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

	<div id="UserJoinInfo" class="textTemple textStyle">
		<p>用户参与总次数：<span id="TotalCount"></span></p>
		<p>用户当日参与次数：<span id="TodayCount"></span></p>
		<p>当前是否可参与：<span id="CanJoin"></span></p>
	</div>

	<div id="GetGameJoinInfo" class="textTemple textStyle hover" style="margin-top: 2%;">
		<div style="text-align: center">
			<a onclick="SelectJoinInfo()">查询抽奖日志</a>
		</div>
	</div>

	<div id="GameRule" class="textTemple textStyle">
		<div id="RuleWrap">
			<h3>游戏规则</h3>
			<div id="RuleText"></div>
		</div>
	</div>

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

	var SettingId;				//GameJoin接口所用
	var CustomerID;				//GameJoin接口所用
	var CardID;					//GameJoin接口所用
	var MobileNo;				//GameJoin接口所用
	var ConSumptionType;		//GameJoin接口所用
	var ConsumptionValue;		//GameJoin接口所用
	var PrizeList;				//奖品列表
	var LotteryFinalPrize;	    //实际抽奖的奖品
	var CanJoin = false;

	var clickstate = 0;
	var time = 400;
	var verticalOpts = [{ 'width': '0' }, { 'width': '90%' }];

	var turnImg;

	//抽奖
	var turn = function (target, time, opts) {
		target.find('a').click(function () {
			if (clickstate == 1)
				return;

			if (!CanJoin) {
				mui.alert("您的抽奖次数已经用完");
				return;
			}



			GameJoinApi(res => {
				console.log(res)
				if (res.HasError)
					mui.alert(res.Result.ErrorMessage);
				else {
					var WinPrizeName = res.Data.WinPrizeName;
					for (var i = 0; i < PrizeList.length; i++) {
						if (PrizeList[i].PrizeName == WinPrizeName) {
							LotteryFinalPrize = PrizeList[i];
							break;
						}
					}
					var current = $(this);//当前a标签
					SocketSend("Turn-PC", "<%=UnionId%>", '抽奖结果', { LotteryFinalPrize, Id: this.id }, false);
					turnImg = current;
					$(this).find('.img').stop().animate(opts[0], time, function () {
						$(this).hide().next().show();
						$(this).next().animate(opts[1], time);
						$(this).parent().find('.PrizeName').html(WinPrizeName);
						$(this).parent().find('.PrizeName').show();
						clickstate = 1;

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
							Finishi();
						}, 2000);
					});
					SocketSend("Turn-PC", "<%=UnionId%>", '抽奖状态', '开始抽奖', false);		//发送开始抽奖标识
					SelectMemberInfo();
				}
			})
		});
	}

	$(() => {
		$('.PrizeName').hide();

		GetGameSetting({ GameType: 4 }, data => {
			if (!data.HasError) {
				if (data.Data.length == 0) {
					mui.alert("游戏暂未配置");
					return
				}
				var PulishTo = data.Data[0].PulishTo;		//手机端 1 PC端 2 手机+PC 3 手机PC同步 4
				if (PulishTo == '4') {
					//初始化WebSocket
					JSocket.init(GetConfigUrl());
					//递归查询是否已连接		//CRM 业务代码
					SelectLoginState(() => { CrmLoad() });
				}
				else {
					CrmLoad();
				}
				turn($('#draw'), 400, verticalOpts);
			} else {
				mui.alert(data.ErrorMessage);
			}
		});
	});

	/******业务 */

	//小游戏信息查询
	var CrmLoad = () => {
		//请求会员信息
		SelectMemberInfo();

		//查询游戏规则
		GetGameSetting({ GameType: 4 }, data => {
			if (!data.HasError) {
				if (data.Data.length == 0) {
					mui.alert("游戏暂未配置");
					return
				}
				SettingId = data.Data[0].SettingID;
				ConSumptionType = data.Data[0].RewardType;
				ConsumptionValue = data.Data[0].RewardValue;
				PrizeList = data.Data[0].WcGamePrizeList;

				//加载规则
				$('#RuleText').html(data.Data[0].GameRuleDesc);

				//加载底图
				$("body").css("background", `url("${ResourceUrl}${data.Data[0].PCImg}") round`);

				//加载奖品图片
				$("#draw a").each(function (i, o) {
					$(`#a${i + 1}`).find('.info').attr('src', `${ResourceUrl}${data.Data[0].WcGamePrizeList[i].PrizeImg}`)
				})

				//加载奖品描述
				$("#draw a").each(function (i, o) {
					$(`#a${i + 1} span.PrizeName`).html(data.Data[0].WcGamePrizeList[i].PrizeName)
				})

				//发送游戏设置给PC端
				SocketSend("Turn-PC","<%=UnionId%>", '规则底图设置', {
					RuleText: data.Data[0].GameRuleDesc,
					MainImg: data.Data[0].PCImg
				}, false);

				//发送游戏设置给PC端
				SocketSend("Turn-PC","<%=UnionId%>", '游戏奖品设置', {
					PrizeList: PrizeList
				}, false);

				//查询游戏日志
				GetGameJoinInfo({ SettingID: SettingId, OpenID: '<%= UnionId%>' }, res => {
					if (!res.HasError) {
						$('#TotalCount').html(res.Data.PersonalTotalCount);
						$('#TodayCount').html(res.Data.PersonalTodayCount);
						if (res.Data.CanJoin) {
							$('#CanJoin').html('您还可以继续抽奖哟！');
							CanJoin = true;
						}
						else {
							$('#CanJoin').html('不好意思，您的抽奖次数已用完');
						}

						//发送游戏设置给PC端
						SocketSend("Turn-PC", "<%=UnionId%>", '游戏日志', {
							TotalCount: res.Data.PersonalTotalCount,
							TodayCount: res.Data.PersonalTodayCount,
							CanJoin: res.Data.CanJoin
						}, false);
					}
					else {
						mui.alert(res.ErrorMessage);
					}
				})
			}
			else {
				mui.alert(data.ErrorMessage);
			}
		})
	}

	var SelectMemberInfo = () => {
		MemberInfo({ QueryType: '4', Code: '<%= UnionId %>' }, data => {
			if (!data.HasError) {
				CustomerID = data.Data.MemberID;
				CardID = data.Data.CardInfoList[0].CardID;
				MobileNo = data.Data.MobileNo;
				$('#UserName').html(data.Data.FullName);
				$('#UserSex').html(FormatterSex(data.Data.Gender));
				$('#UserPhone').html(data.Data.MobileNo);
				$('#UserCardCode').html(data.Data.CardInfoList[0].CardCode);

				//发送用户消息给PC端
				SocketSend("Turn-PC", "<%=UnionId%>", '用户信息', {
					UserName: data.Data.FullName,
					UserSex: FormatterSex(data.Data.Gender),
					UserPhone: data.Data.MobileNo,
					UserCardCode: data.Data.CardInfoList[0].CardCode
				}, false);
			}
			else {
				if (data.ErrorMessage.includes('会员不存在'))
					window.location.href = 'Register.aspx'
				else
					mui.alert(data.ErrorMessage);
			}
		});
	}

	//参加抽奖
	var GameJoinApi = func => {
		let jsonData = {
			SettingID: SettingId,
			OpenID: '<%=UnionId%>',
			CustomerID: CustomerID,
			CardID: CardID,
			MobileNo: MobileNo,
			ConSumptionType: ConSumptionType,
			ConsumptionValue: ConsumptionValue,
		}
		GameJoin(jsonData, res => {
			func(res)
		});
	}




	var FormatterSex = Type => {
		switch (Type) {
			case '0': return '女';
			case '1': return '男';
			case '2': return '未知';
		}
	}

	/************工具 */

	//递归查询是否已连接
	var SelectLoginState = func => {
		setTimeout(function () {
			if (JSocket.getWebSocketState() == 1) {
				SocketSend("Turn-PC", "<%=UnionId%>", '登录信息', '已登录', false);
				func();
			}
			else {
				SelectLoginState(function () {

				});
			}
		}, 500);
	}

	//获取WebSocketUrl
	var GetConfigUrl = () => '<%=System.Configuration.ConfigurationManager.AppSettings["WebSocketUrl"].ToString()%>' + '?user=Turn-WC/<%=UnionId%>';
	//获取CRM接口Url
	//获取CRM接口Url
	var GameApiServerUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["GameApiServerUrl"].ToString()%>' + 'api/';
	//获取资源Url
	var ResourceUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["ResourceUrl"].ToString()%>';

	/**
     * WebSocket发送消息
     * @param {any} s		发送目的
     * @param {any} o		UnionId
     * @param {any} mt		消息标题
     * @param {any} md		消息内容
     * @param {any} r		是否有错
     */
	var SocketSend = (s, o, mt, md, r = false) => {
		JSocket.sendJMes(new WcMessage(s, o, mt, md, r).stringify())
	}

	//点击屏幕关闭弹出层
	var Finishi = () => {
		$(document).click(() => {
			layer.closeAll();
			SocketSend("Turn-PC", "<%=UnionId%>", '领奖信息', '点击领奖', false);

			ReSet();
		});
	}

	//重置牌面
	var ReSet = () => {
		clickstate = 0;
		LotteryFinalPrize = null;
		turnImg.find('.img').next().hide();
		turnImg.parent().find('.PrizeName').html('');
		turnImg.parent().find('.PrizeName').hide();
		turnImg.find('.img').stop().animate(verticalOpts[1], time, function () {
			$(this).show();
		})
		turnImg = null;
		$(document).unbind('click');
	}

	var SelectJoinInfo = () => {
		if (isEmpty(SettingId) || isEmpty('<%=UnionId%>')) {
			mui.alert('用户信息不全,请刷新页面');
			return;
		}
		window.location.href = `GameJoinInfo.aspx?SettingID=${SettingId}&OpenID=<%=UnionId%>&User=Turn-WC`
	}
</script>
