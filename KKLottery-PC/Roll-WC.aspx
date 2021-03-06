﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Roll-WC.aspx.cs" Inherits="KKLottery_PC.RollWC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover" />
    <title></title>

    <link href="css/mui.min.css" rel="stylesheet" />
    <link href="css/WeUI/weui.min.css" rel="stylesheet" />
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

        main {
            padding-top: 3em;
        }

        table {
            border-spacing: 0;
            border-collapse: collapse;
            text-align: center;
        }

        .draw {
            width: 100%;
            height: 100vw;
            background-image: url(images/转盘.png);
            background-repeat: no-repeat;
            background-size: 95%;
            background-position: top;
            padding-top: 12%;
        }

            .draw table {
                height: 77%;
                width: 77%;
                border-radius: 10px;
                margin-top: -5vw;
                margin-left: 11vw;
            }

                .draw table tr {
                    justify-content: space-between;
                    margin-bottom: 1vw;
                    display: flex;
                }

                .draw table td {
                    position: relative;
                    width: 25vw;
                    height: 25vw;
                    border: 0;
                    background-color: rgba(255,255,255,0.1);
                    text-align: center;
                    font-size: 8px;
                    border-radius: 10px;
                    display: inline-block;
                    filter: grayscale(0%);
                }

            .draw .item img {
                width: 100%;
                height: 100%;
                border-radius: 10px;
            }

            .draw .item.active {
                background-color: rgba(0,0,0,.3);
                color: #000;
                z-index: 999;
                filter: grayscale(100%);
                border-radius: 10px;
                -webkit-box-shadow: 0 0 0px rgba(248,248,255,1);
            }


        #LayerH1 {
            color: #e04538;
            font-size: 5VW;
        }

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
            margin: 0 auto;
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

        .hover :hover {
            background-color: darkgreen;
        }

        p {
            color: white;
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


        p {
            margin-bottom: 2px;
            font-size: 12px;
        }

        .light {
            background-color: rgba(0,0,0,.3);
            color: #000;
            z-index: 999;
            filter: grayscale(100%);
            border-radius: 10px;
        }

        a {
            text-decoration: none;
            color: black;
            font-size: 4vw;
        }
    </style>

</head>
<body ng-app="mainApp" ng-controller="indexCtrl" style="background: radial-gradient(circle,rgba(155,75,75,1) 0%,rgba(41,34,61,1) 100%);">
    <div class="headerWrapper container-fluid">
    </div>
    <main>
        <%--        <div id="UserInfo" class="textTemple">
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

        <div class="draw" id="lottery">
            <table>
                <tr>
                    <td class="item lottery-unit lottery-unit-0">
                        <img src="images/谢谢参与.png" id="PrizeImg_0" /></td>
                    <td class="item lottery-unit lottery-unit-1">
                        <img src="images/谢谢参与.png" id="PrizeImg_1" /></td>
                    <td class="item lottery-unit lottery-unit-2">
                        <img src="images/谢谢参与.png" id="PrizeImg_2" /></td>
                </tr>
                <tr>
                    <td class="item lottery-unit lottery-unit-7">
                        <img src="images/谢谢参与.png" id="PrizeImg_7" /></td>
                    <td class="">
                        <img src="images/开始抽奖.png" class="draw-btn" id="begin" style="width: 100%; height: 100%;" onclick="drawFunc()" />
                    </td>
                    <td class="item lottery-unit lottery-unit-3">
                        <img src="images/谢谢参与.png" id="PrizeImg_3" /></td>
                </tr>
                <tr>
                    <td class="item lottery-unit lottery-unit-6">
                        <img src="images/谢谢参与.png" id="PrizeImg_6" /></td>
                    <td class="item lottery-unit lottery-unit-5">
                        <img src="images/谢谢参与.png" id="PrizeImg_5" /></td>
                    <td class="item lottery-unit lottery-unit-4">
                        <img src="images/谢谢参与.png" id="PrizeImg_4" /></td>
                </tr>
            </table>
        </div>



        <div id="GameRule" class="textTemple textStyle">
            <div id="RuleWrap" style="word-break: break-all">
                <h3 style="text-align: center;">— 游戏规则 —</h3>
                <div id="RuleText" style="padding-bottom: 5%; padding-top: 5%; font-size: 4vw;"></div>
            </div>


            <p style="text-align: center">您已参与<span id="TotalCount"></span>次，今日还可参与<span id="TodayCount2"></span>次</p>
        </div>

        <%--        <div id="UserJoinInfo" class="textTemple textStyle">
            <p>您已参与<span id="TotalCount"></span>次，今日还可参与<span id="TodayCount2"></span>次</p>
            <p hidden>活动可参与次数：<span id="GameMax"></span>  当日可参与次数：<span id="GameDayPersonMax"></span> 已参与次数：<span id="TodayCount"></span> 剩余次数：<span id="TodayCount2old"></span></p>

            <p hidden>当前是否可参与：<span id="CanJoin"></span></p>
        </div>--%>

        <div id="GetGameJoinInfo" class="textStyle hover" style="margin-top: 3%; margin-bottom: 2%;">
            <div style="text-align: center">
                <a onclick="SelectJoinInfo()">— 中奖纪录 —</a>
            </div>
        </div>
    </main>

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

    <div id='Loading' style="display: none">
        <img src="images/Loading.gif" style="opacity: 0.9;" />
    </div>
</body>
</html>

<link href="css/layer.css" rel="stylesheet" type="text/css" />
<script src="Scripts/mui.min.js"></script>
<script src="Scripts/jquery-3.3.1.min.js"></script>
<script src="Scripts/layer.js"></script>
<script src="Scripts/Base.js?v=21222"></script>
<script src="Scripts/Service.js"></script>

<script type="text/javascript">

    var SettingId;				//GameJoin接口所用
    var CustomerID;				//GameJoin接口所用
    var CardID;					//GameJoin接口所用
    var MobileNo;				//GameJoin接口所用
    var ConSumptionType;		//GameJoin接口所用
    var ConsumptionValue;		//GameJoin接口所用
    var PrizeList;				//奖品列表
    var LotteryFinalNum = 0;	//实际抽奖的奖品序号
    var CanJoin = false;
    var GameMax = 0;			//活动期间最大参与次数
    var GameDayPersonMax = 0;	//每人当日最大参与次数
    var GameDayPersonMax2 = 0;	//每人当日最大参与次数
    var UserInfo;				//用户信息
    var GameId ='<%=Request.Params["GameId"]%>';

    $(function () {
        SimpleTimer.Start();
        SimpleTimer.Back();

        GetGameSetting({ GameType: RollGameType, SettingID: GameId }, data => {
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
            } else {
                mui.alert(data.ErrorMessage);
            }

        });
        //初始化
        lottery.init('lottery');
    });

    /*******抽奖 */
    var drawFunc = () => {
        SimpleTimer.ReSet();

        $('.draw-btn').removeAttr('onclick')		//抽奖过程中不允许重复抽奖

        if (!CanJoin) {
            mui.alert("您的抽奖次数已经用完");
            return;
        }
        GameJoinApi(res => {
            $('#PrizeIMG').removeAttr('hidden');
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
                    LotteryFinalNum = i;		//得到实际抽奖的奖品序号
                    if (PrizeList[i].PrizeName == WinPrizeName) {
                        $('#PrizeIMG').attr('src', ResourceUrl + PrizeList[i].PrizeImg);
                        break;
                    }
                }
                SocketSend("Roll-PC", "<%=UnionId%>", '抽奖结果', res, false);
                //查询游戏日志
                GetGameJoinInfo({ SettingID: SettingId, OpenID: '<%= UnionId%>' }, res => {
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

                        //发送游戏设置给PC端
                        SocketSend("Roll-PC", "<%=UnionId%>", '游戏日志', {
                            TotalCount: res.Data.PersonalTotalCount,
                            TodayCount: res.Data.PersonalTodayCount,
                            TotalCount2: GameMax - res.Data.PersonalTotalCount,
                            CanJoin: res.Data.CanJoin,
                            GameMax,
                            GameDayPersonMax2
                        }, false);
                    }
                    else {
                        mui.alert(res.ErrorMessage);
                    }
                })
                if (click)				//click控制一次抽奖过程中不能重复点击抽奖按钮，后面的点击不响应
                    return false;
                else {
                    SocketSend("Roll-PC","<%=UnionId%>", '抽奖状态', '开始抽奖', false);		//发送开始抽奖标识
                    lottery.speed = 100;
                    lottery.prize = 0;
                    roll();				//转圈过程不响应click事件，会将click置为false
                    click = true;		//一次抽奖完成后，设置click为true，可继续抽奖
                    return false;
                }
            }
        })
    }

    var click = false;
    //抽奖
    var lottery = {
        index: -1,		//当前转动到哪个位置，起点位置
        count: 0,		//总共有多少个位置
        timer: 0,		//setTimeout的ID，用clearTimeout清除
        speed: 20,		//初始转动速度
        times: 0,		//转动次数
        cycle: 50,		//转动基本次数：即至少需要转动多少次再进入抽奖环节
        prize: -1,		//中奖位置
        init: function (id) {
            if ($('#' + id).find('.lottery-unit').length > 0) {
                $lottery = $('#' + id);
                $units = $lottery.find('.lottery-unit');
                this.obj = $lottery;
                this.count = $units.length;
            };
        },
        roll: function () {
            var index = this.index;
            var count = this.count;
            var lottery = this.obj;
            $(lottery).find('.lottery-unit.lottery-unit-' + index).addClass('active');
            index += 1;
            if (index > count - 1) {
                index = 0;
            };
            $(lottery).find('.lottery-unit.lottery-unit-' + index).removeClass('active');
            this.index = index;
            return false;
        },
        stop: function (index) {
            this.prize = index;
            return false;
        }
    };
    //循环调用转动方法
    function roll(index) {
        lottery.times += 1;
        lottery.roll();		//转动过程调用的是lottery的roll方法，这里是第一次调用初始化
        if (lottery.times > lottery.cycle + 10 && lottery.prize == lottery.index) {
            clearTimeout(lottery.timer);
            layer.open({
                type: 1,
                shadeClose: true,
                shade: false,
                maxmin: true,		//开启最大化最小化按钮
                area: ['893px', '600px'],
                content: $('#info').html()
            });
            lottery.prize = -1;
            lottery.times = 0;
            click = false;
            $('.draw-btn').attr('onclick', 'drawFunc()')		//抽奖过程中不允许重复抽奖
        } else {
            if (lottery.times < lottery.cycle) {
                lottery.speed -= 10;
            } else if (lottery.times == lottery.cycle) {
                //var index = Math.random() * (lottery.count) | 0;		//静态演示，随机产生一个奖品序号，实际需请求接口产生
                lottery.prize = LotteryFinalNum;
            } else {
                if (lottery.times > lottery.cycle + 10 && ((lottery.prize == 0 && lottery.index == 7) || lottery.prize == lottery.index + 1)) {
                    lottery.speed += 110;
                } else {
                    lottery.speed += 20;
                }
            }
            if (lottery.speed < 40) {
                lottery.speed = 40;
            };
            lottery.timer = setTimeout(roll, lottery.speed);		//循环调用
        }
        return false;
    }



    /******业务 */

    //小游戏信息查询
    var CrmLoad = () => {
        //请求会员信息
        MemberInfo({ QueryType: '4', Code: '<%= UnionId %>' }, data => {

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
        GetGameSetting({ GameType: RollGameType, SettingID: GameId }, data => {
            console.log(data)
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
                $("main").css("background", `url("${ResourceUrl}${data.Data[0].GameRuleImg}")`);
                $("main").css("background-size", `cover`);
                $("main").css("background-repeat", `no-repeat`);

                //加载奖品图片
                for (var i = 0; i < data.Data[0].WcGamePrizeList.length; i++) {
                    //$(`#PrizeImg_${i}`).html(`<img src="${ResourceUrl}${data.Data[0].WcGamePrizeList[i].PrizeImg}" alt="" style="width:80%;height:100%"/>`)
                    $(`#PrizeImg_${i}`).attr('src', `${ResourceUrl}${data.Data[0].WcGamePrizeList[i].PrizeImg}`)

                    //$(`span#PrizeName_${i}`).html(data.Data[0].WcGamePrizeList[i].PrizeName)
                }
                //$("td.item div.img").each(function (i, o) {
                //    console.log(i);
                //    $(`#PrizeImg_${i}`).html(`<img src="${ResourceUrl}${data.Data[0].WcGamePrizeList[i].PrizeImg}" alt="" style="width:80%;height:100%"/>`)
                //})

                //加载奖品描述
                //$("td.item span").each(function (i, o) {
                //    $(`span#PrizeName_${i}`).html(data.Data[0].WcGamePrizeList[i].PrizeName)
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

                        //发送游戏设置给PC端
                        SocketSend("Roll-PC", "<%=UnionId%>", '游戏日志', {
                            TotalCount: res.Data.PersonalTotalCount,
                            TodayCount: res.Data.PersonalTodayCount,
                            CanJoin: res.Data.CanJoin,
                            GameMax,
                            GameDayPersonMax2
                        }, false);
                    }
                    else {
                        mui.alert(res.ErrorMessage);
                    }
                })

                SendMessageByCheckState(() => {

                    //发送用户消息给PC端
                    SocketSend("Roll-PC", "<%=UnionId%>", '用户信息', UserInfo, false);

                    //发送游戏设置给PC端
                    SocketSend("Roll-PC","<%=UnionId%>", '规则底图设置', {
                        RuleText: data.Data[0].GameRuleDesc,
                        MainImg: data.Data[0].PCImg
                    }, false);
                    SocketSend("Roll-PC", "<%=UnionId%>", 'GameId', GameId, false);
                    //发送游戏设置给PC端
                    SocketSend("Roll-PC", "<%=UnionId%>", '游戏奖品设置', {
                        PrizeList: PrizeList
                    }, false);
                });

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
            OpenID:'<%=UnionId%>',
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

    var FormatterPrizeType = Type => {
        switch (Type) {
            case '1': return '礼品';
            case '2': return '礼券';
            case '3': return '积分';
            case '4': return '感谢参与';
            default: return '';
        }
    }

    /************工具 */

    //递归查询是否已连接
    var SelectLoginState = func => {
        setTimeout(function () {
            if (JSocket.getWebSocketState() == 1) {
                SocketSend("Roll-PC","<%=UnionId%>", '登录信息', '已登录', false);
                func();
            }
            else
                SelectLoginState(func);
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
    var GetConfigUrl = () => '<%=System.Configuration.ConfigurationManager.AppSettings["WebSocketUrl"].ToString()%>' + '?user=Roll-WC/<%=UnionId%>';
    //获取CRM接口Url
    var GameApiServerUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["GameApiServerUrl"].ToString()%>' + 'api/';
    //获取资源Url
    var ResourceUrl ='<%=System.Configuration.ConfigurationManager.AppSettings["ResourceUrl"].ToString()%>';
    //获取GameType
    var RollGameType = parseInt('<%=System.Configuration.ConfigurationManager.AppSettings["RollGameType"].ToString()%>');

    /**
     * WebSocket发送消息
     * @param {any} s		发送目的
     * @param {any} o		openid
     * @param {any} mt		消息标题
     * @param {any} md		消息内容
     * @param {any} r		是否有错
     */
    var SocketSend = (s, o, mt, md, r = false) => {
        JSocket.sendJMes(new WcMessage(s, o, mt, md, r).stringify())
    }

    //加载层
    var ShowLoading = () => {
        layer.open({
            type: 1,
            shadeClose: true,
            shade: false,
            maxmin: true,		//开启最大化最小化按钮
            area: ['893px', '600px'],
            content: $('#Loading').html()
        });
    }

    //点击领奖
    var ReceivePrize = () => {
        layer.closeAll();
        SocketSend("Roll-PC","<%=UnionId%>", '领奖信息', '点击领奖', false);
    };

    var SelectJoinInfo = () => {
        if (isEmpty(SettingId) || isEmpty('<%=UnionId%>')) {
            mui.alert('用户信息不全,请刷新页面');
            return;
        }
        window.location.href = `GameJoinInfo.aspx?SettingID=${SettingId}&OpenID=<%=UnionId%>&User=Roll-WC&GameId=${GameId}`
    }
</script>
