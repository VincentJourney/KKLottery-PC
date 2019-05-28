<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Turn-WC.aspx.cs" Inherits="KKLottery_PC.TurnWC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover" />
    <title></title>
    <link href="css/mui.min.css" rel="stylesheet" />
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

            .weui-grid:before {
                border: 0;
            }

            .weui-grid:after {
                border: 0;
            }

        .weui-grids:before {
            border: 0;
        }

        .weui-grids:after {
            width: 0;
            border-left: 0;
        }

        a {
            text-align: center;
        }

        .img {
            width: 90%;
            margin-top: 1vw;
            height: 25VW;
        }

        .info {
            display: none;
            margin-top: 1vw;
            width: 0;
            height: 25vw;
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
            opacity: 0.3;
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
            padding: 5%;
        }

        .PrizeName {
            position: absolute;
            left: 14VW;
            TOP: 14vw;
        }

        h1#LayerH1 {
            color: #e04538;
            font-size: 5VW;
        }

        .hover :hover {
            background-color: darkgreen;
        }

        .PrizeInfo {
            width: 64vw;
            height: 64vw;
            background: rgba(255,255,255,1);
            opacity: 1;
            border-radius: 2vw;
            text-align: center;
            padding: 6VW;
        }

        .marTop {
            margin-top: 3vw;
        }

        .NewGrid {
            position: relative;
            float: left;
            width: 20%;
            box-sizing: border-box;
        }

        p {
            margin-bottom: 2px;
            font-size: 12px;
            COLOR: WHITE;
        }

        a {
            text-decoration: none;
            color: black;
            font-size: 4vw;
        }
    </style>
</head>
<body>
    <%--用户信息--%>
    <%--    <div id="UserInfo" class="textTemple">
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

    <%--奖品存放区--%>
    <div class="weui-grids" id="draw" style="padding: 5%; border-left: 0; margin-top: 20VW;">
    </div>



    <%--游戏规则--%>
    <div id="GameRule" class="textTemple textStyle">
        <div id="RuleWrap" style="word-break: break-all">
            <h3 style="text-align: center">— 游戏规则 —</h3>
            <div id="RuleText" style="padding-bottom: 5%; padding-top: 5%; font-size: 4vw;"></div>
        </div>

        <p style="text-align: center">您已参与<span id="TotalCount"></span>次，今日还可参与<span id="TodayCount2"></span>次</p>
    </div>

    <%--活动参与详情--%>
    <%--    <div id="UserJoinInfo" class="textTemple textStyle">
        <p style="text-align: center">您已参与<span id="TotalCount"></span>次，今日还可参与<span id="TodayCount2"></span>次</p>
        <p hidden>活动可参与次数：<span id="GameMax"></span>  当日可参与次数：<span id="GameDayPersonMax"></span> 已参与次数：<span id="TodayCount"></span> 剩余次数：<span id="TodayCount2old"></span></p>
        <p hidden>当前是否可参与：<span id="CanJoin"></span></p>
    </div>--%>

    <%--抽奖日志--%>
    <div id="GetGameJoinInfo" class="textStyle hover" style="margin-top: 2%; margin-top: 5%;">
        <div style="text-align: center">
            <a onclick="SelectJoinInfo()">— 中奖纪录 —</a>
        </div>
    </div>
    <%--中奖纪录弹窗--%>
    <div id='info' style="display: none">
        <div class="PrizeInfo">
            <div style="font-size: 7vw; color: red" class="marTop" id="PrizeTitle">恭喜您获得</div>
            <div id="LayerH1" class="marTop"></div>
            <div class="marTop">
                <img src="#" id="PrizeIMG" style="width: 30vw" />
            </div>
            <div class="marTop">
                <button type="button" class="mui-btn mui-btn-danger" onclick="ReceivePrize()">继续抽奖</button>
            </div>
        </div>
    </div>
</body>
</html>
<link href="css/layer.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-3.3.1.min.js"></script>
<script src="Scripts/mui.min.js"></script>
<script src="Scripts/layer.js"></script>
<script src="Scripts/Base.js?v=12111"></script>
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
    var GameMax = 0;			//活动期间最大参与次数
    var GameDayPersonMax = 0;	//每人当日最大参与次数
    var GameDayPersonMax2 = 0;	//每人当日最大参与次数
    var UserInfo;				//用户信息
    var GameId = '<%=Request.Params["GameId"]%>';
    var clickstate = 0;
    var time = 400;
    var verticalOpts = [{ 'width': '0' }, { 'width': '90%' }];

    var turnImg;

    //抽奖
    var turn = function (target, time, opts) {
        target.find('a').click(function () {
            target.find('a').unbind('click');
            SimpleTimer.ReSet();

            if (clickstate == 1)
                return;

            if (!CanJoin) {
                mui.alert("您的抽奖次数已经用完");
                return;
            }

            GameJoinApi(res => {
                if (res.HasError)
                    mui.alert(res.ErrorMessage);
                else {
                    if (res.Data.WinPrizeType == '4') {
                        $('#PrizeTitle').text("谢谢参与");
                        $('#LayerH1').text("很遗憾您未能获得奖品");
                        $('#PrizeIMG').attr('hidden', 'hidden');
                    }
                    else {
                        $('#LayerH1').text(res.Data.WinPrizeName);
                        $('#PrizeIMG').attr('src', 'images/PrizeIMG.png');
                    }

                    var WinPrizeName = res.Data.WinPrizeName;
                    for (var i = 0; i < PrizeList.length; i++) {
                        if (PrizeList[i].PrizeName == WinPrizeName) {
                            LotteryFinalPrize = PrizeList[i];
                            break;
                        }
                    }
                    var current = $(this);//当前a标签
                    SocketSend("Turn-PC" + GameId, "<%=UnionId%>", '抽奖结果', { LotteryFinalPrize, Id: this.id }, false);
                    turnImg = current;
                    $(this).find('.img').stop().animate(opts[0], time, function () {
                        $(this).next().attr('src', ResourceUrl + LotteryFinalPrize.PrizeImg);
                        $(this).hide().next().show();
                        $(this).next().animate(opts[1], time);
                        //$(this).parent().find('.PrizeName').html(WinPrizeName);
                        //$(this).parent().find('.PrizeName').show();
                        clickstate = 1;

                        $('#PrizeIMG').attr('src', ResourceUrl + LotteryFinalPrize.PrizeImg);

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
                    SocketSend("Turn-PC" + GameId, "<%=UnionId%>", '抽奖状态', '开始抽奖', false);		//发送开始抽奖标识
                    //查询游戏日志
                    GetGameJoinInfo({ SettingID: SettingId, OpenID: '<%= UnionId%>' }, res => {
                        if (!res.HasError) {
                            $('#TotalCount').html(res.Data.PersonalTotalCount);
                            //$('#TodayCount').html(res.Data.PersonalTodayCount);
                            $('#TotalCount2').html(GameDayPersonMax - res.Data.PersonalTotalCount);
                            $('#TodayCount2').html(GameDayPersonMax2 - res.Data.PersonalTodayCount);
                            if (res.Data.CanJoin) {
                                $('#CanJoin').html('您还可以继续抽奖哟！');
                                CanJoin = true;
                            }
                            else {
                                $('#CanJoin').html('不好意思，您的抽奖次数已用完');
                            }
                            var TotalCount = res.Data.PersonalTotalCount;
                            var TotalCount2 = GameDayPersonMax - res.Data.PersonalTotalCount;
                            var TodayCount2 = GameDayPersonMax2 - res.Data.PersonalTodayCount;
                            //发送游戏设置给PC端
                            SocketSend("Turn-PC" + GameId, "<%=UnionId%>", '游戏日志', {
                                TotalCount: TotalCount,
                                TodayCount: res.Data.PersonalTodayCount,
                                TotalCount2: TotalCount2,
                                CanJoin: res.Data.CanJoin,
                                TodayCount2
                            }, false);
                        }
                        else {
                            mui.alert(res.ErrorMessage);
                        }
                    })
                }
            })
        });
    }

    $(function () {
        ShowMain();

        SimpleTimer.Start();
        SimpleTimer.Back();

        //$('.PrizeName').hide();
        GetGameSetting({ GameType: TurnGameType, SettingID: GameId }, data => {
            console.log(data)
            if (!data.HasError) {
                if (data.Data.length == 0) {
                    mui.alert("游戏暂未配置");
                    return
                }


                GameMax = data.Data[0].GameMax;
                GameDayPersonMax = data.Data[0].GamePersonMax;
                GameDayPersonMax2 = data.Data[0].GameDayPersonMax;
                $("#GameMax").html(GameMax);
                $("#GameDayPersonMax").html(GameDayPersonMax);

                var PulishTo = data.Data[0].PulishTo;		// 1:手机端  2:PC端  3:手机+PC(不要)  4:手机PC同步
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

    //展示页面奖品图片
    var ShowMain = () => {
        $("#draw").empty();
        var html = "";
        for (var i = 1; i <= 15; i++) {
            html += `<a href="javascript:;" id="a${i}" class="NewGrid">
                         <span class="PrizeName"></span>
                         <img class="img" src="images/ldimg/fugai/TurnBGimg.jpg" alt="" />
                         <img class="info" src="images/ldimg/jieguo/1.png" alt="" />
                     </a>`;
        }
        $("#draw").append(html);
    }

    /******业务 */

    //小游戏信息查询
    var CrmLoad = () => {
        //请求会员信息
        MemberInfo({ QueryType: '4', Code: '<%= UnionId %>' }, data => {
            console.log(data)
            if (!data.HasError) {
                CustomerID = data.Data.MemberID;
                CardID = data.Data.CardInfoList[0].CardID;
                MobileNo = data.Data.MobileNo;
                $('#UserName').html(Desensitization(data.Data.FullName, '*', 1, 2));
                $('#UserSex').html(FormatterSex(data.Data.Gender));
                $('#UserPhone').html(Desensitization(data.Data.MobileNo, '*', 4, 7));
                $('#UserCardCode').html(Desensitization(data.Data.CardInfoList[0].CardCode, '*', 3, 6));

                UserInfo = {
                    UserName: Desensitization(data.Data.FullName, '*', 1, 2),
                    UserSex: FormatterSex(data.Data.Gender),
                    UserPhone: Desensitization(data.Data.MobileNo, '*', 4, 7),
                    UserCardCode: Desensitization(data.Data.CardInfoList[0].CardCode, '*', 3, 6)
                }

            }
            else {
                if (data.ErrorMessage.includes('会员不存在'))
                    window.location.href = 'Register.aspx'
                else
                    mui.alert(data.ErrorMessage);
            }
        });

        //查询游戏规则
        GetGameSetting({ GameType: TurnGameType, SettingID: GameId }, data => {
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
                $("body").css("background", `url("${ResourceUrl}${data.Data[0].GameRuleImg}")`);
                $("body").css("background-size", `cover`);
                $("body").css("background-repeat", `no-repeat`);

                //加载奖品图片
                //$("#draw a").each(function (i, o) {
                //    $(`#a${i + 1}`).find('.info').attr('src', `${ResourceUrl}${data.Data[0].WcGamePrizeList[i].PrizeImg}`)
                //})

                //加载奖品描述
                //$("#draw a").each(function (i, o) {
                //    $(`#a${i + 1} span.PrizeName`).html(data.Data[0].WcGamePrizeList[i].PrizeName)
                //})




                //查询游戏日志
                GetGameJoinInfo({ SettingID: SettingId, OpenID: '<%= UnionId%>' }, res => {
                    console.log(res)
                    if (!res.HasError) {
                        $('#TotalCount').html(res.Data.PersonalTotalCount);
                        $('#TodayCount').html(res.Data.PersonalTodayCount);
                        $('#TotalCount2').html(GameDayPersonMax - res.Data.PersonalTotalCount);
                        $('#TodayCount2').html(GameDayPersonMax2 - res.Data.PersonalTodayCount);
                        if (res.Data.CanJoin) {
                            $('#CanJoin').html('您还可以继续抽奖哟！');
                            CanJoin = true;
                        }
                        else {
                            $('#CanJoin').html('不好意思，您的抽奖次数已用完');
                        }

                        setTimeout(() => {
                            SocketSend("Turn-PC" + GameId, "<%=UnionId%>", '游戏日志', {
                                TotalCount: res.Data.PersonalTotalCount,
                                TodayCount: res.Data.PersonalTodayCount,
                                TotalCount2: GameDayPersonMax - res.Data.PersonalTotalCount,
                                TodayCount2: GameDayPersonMax2 - res.Data.PersonalTodayCount,
                                GameMax,
                                GameDayPersonMax,
                                CanJoin: res.Data.CanJoin
                            }, false);
                        }, 4000)

                    }
                    else {
                        mui.alert(res.ErrorMessage);
                    }
                })

                setInterval(() => {
                    //发送用户消息给PC端
                    SocketSend("Turn-PC" + GameId, "<%=UnionId%>", '用户信息', UserInfo, false);
                    //发送游戏设置给PC端
                    SocketSend("Turn-PC" + GameId,"<%=UnionId%>", '规则底图设置', {
                        RuleText: data.Data[0].GameRuleDesc,
                        MainImg: data.Data[0].PCImg
                    }, false);
                    SocketSend("Turn-PC" + GameId, "<%=UnionId%>", 'GameId', GameId, false);
                    //发送游戏设置给PC端
        <%--            SocketSend("Turn-PC", "<%=UnionId%>", '游戏奖品设置', {
                        PrizeList: PrizeList
                    }, false);--%>
                    //发送游戏设置给PC端

                }, 2000);

            }
            else {
                mui.alert(data.ErrorMessage);
            }
        })
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
                SocketSend("Turn-PC" + GameId, "<%=UnionId%>", '登录信息', '已登录', false);
                func();
            }
            else {
                SelectLoginState(func);
            }
        }, 1000);
    }

    //递归查询是否已连接
    var SendMessageByCheckState = func => {
        var doSend = setInterval(function () {
            if (JSocket.getWebSocketState() == 1) {
                func();
                clearInterval(doSend);
            }
            else
                SendMessageByCheckState(func);
        }, 1000);
    }





    //获取WebSocketUrl
    var GetConfigUrl = () => '<%=System.Configuration.ConfigurationManager.AppSettings["WebSocketUrl"].ToString()%>' + '?user=Turn-WC' + GameId+'/<%=UnionId%>';
    //获取CRM接口Url
    var GameApiServerUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["GameApiServerUrl"].ToString()%>' + 'api/';
    //获取资源Url
    var ResourceUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["ResourceUrl"].ToString()%>';
    //获取GameType
    var TurnGameType = parseInt('<%=System.Configuration.ConfigurationManager.AppSettings["TurnGameType"].ToString()%>');

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
    var ReceivePrize = () => {
        layer.closeAll();
        SocketSend("Turn-PC", "<%=UnionId%>", '领奖信息', '点击领奖', false);
        ReSet();
        $('#draw').find('a').bind('click', function () {
            turn($('#draw'), 400, verticalOpts);
        });
    }

    //重置牌面
    var ReSet = () => {
        clickstate = 0;
        LotteryFinalPrize = null;
        turnImg.find('.img').next().hide();
        //turnImg.parent().find('.PrizeName').html('');
        //turnImg.parent().find('.PrizeName').hide();
        turnImg.find('.img').next().attr('src', '');
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
        window.location.href = `GameJoinInfo.aspx?SettingID=${SettingId}&OpenID=<%=UnionId%>&User=Turn-WC&GameId=${GameId}`
    }
</script>
