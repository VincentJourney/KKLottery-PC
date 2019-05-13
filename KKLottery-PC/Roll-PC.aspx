<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Roll-PC.aspx.cs" Inherits="KKLottery_PC.RollPC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title></title>
    <style>
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
            padding-top: 3%;
        }

        table {
            border-spacing: 0;
            border-collapse: collapse;
            text-align: center;
        }

        .draw {
            width: 550px;
            height: 550px;
            background-image: url(images/转盘.png);
            background-repeat: no-repeat;
            background-size: 95%;
            background-position: top;
            padding-top: 89px;
        }

            .draw table {
                height: 77%;
                width: 77%;
                border-radius: 10px;
                margin-top: -51px;
                margin-left: 63px;
            }

                .draw table tr {
                    justify-content: space-between;
                    margin-bottom: 10px;
                    display: flex;
                }

                .draw table td {
                    position: relative;
                    width: 135px;
                    height: 135px;
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

        h1#LayerH1 {
            color: #e04538;
            position: absolute;
            top: 26%;
            width: 35%;
            left: 50%;
            margin-left: -16%;
            text-align: center;
            font-size: 22px;
        }

        .textTemple {
            margin: 0 20%;
            padding: 2% 3%;
            background-color: black;
            opacity: 0.5;
            border-radius: 12px;
            color: white;
        }

        .textStyle {
            color: white;
            font-size: 20px;
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
        }

        #GameRule {
            margin-top: 2%;
        }

        p {
            color: white;
        }

        .PrizeInfo {
            width: 380px;
            height: 380px;
            background: rgba(255,255,255,1);
            opacity: 1;
            border-radius: 20px;
            text-align: center;
            padding: 22px;
        }

        .marTop {
            margin-top: 50px;
        }

        .Logo {
            padding: 1%;
        }
    </style>

</head>
<body ng-app="mainApp" ng-controller="indexCtrl" style="background: radial-gradient(circle,rgba(155,75,75,1) 0%,rgba(41,34,61,1) 100%);">
    <div class="Logo">
        <img src="images/kingkeyLog.png" />
    </div>
    <main>
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
                <div id="UserJoinInfo" class="textTemple" style="margin-top: 2%;">
                    <p hidden>活动期间最大参与次数：<span id="GameMax"></span></p>
                    <p hidden>每人当日最大参与次数：<span id="GameDayPersonMax"></span></p>
                    <p>您已参与抽奖<span id="TotalCount"></span>次</p>
                    <p>今日还可抽奖<span id="TodayCount2"></span>次</p>
                    <p>活动还可参加<span id="TotalCount2"></span>次</p>
                    <p hidden>用户当日参与次数：<span id="TodayCount"></span>    剩余当日参与次数：<span id="TodayCount2old"></span></p>
                    <p hidden>当前是否可参与：<span id="CanJoin"></span></p>
                </div>
                <div id="GameRule" class="textTemple textStyle">
                    <div id="RuleWrap" style="word-break: break-all;">
                        <h3>游戏规则</h3>
                        <div id="RuleText"></div>
                    </div>
                </div>
            </div>

            <div style="width: 60%; float: left; height: 100%">
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
                                <img src="images/开始抽奖.png" class="draw-btn" id="begin" style="width: 100%; height: 100%;" />
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
            </div>
        </div>
    </main>

    <div id='info' style="display: none">
        <div class="PrizeInfo">
            <div style="font-size: 45px; color: red" class="marTop" id="PrizeTitle">恭喜您获得</div>
            <div id="LayerH1" class="marTop" style="font-size: 20px"></div>
            <div class="marTop">
                <img src="#" id="PrizeIMG" style="width: 200px;height: 200px;"/>
            </div>
        </div>
    </div>
</body>
</html>

<link href="css/layer.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-3.3.1.min.js"></script>
<script src="Scripts/layer.js"></script>
<script src="Scripts/Base.js"></script>
<script src="Scripts/Service.js"></script>
<script type="text/javascript">

    var WebSocketState = false;		// WebSocket链接状态
    var LoginState = false;			// LoginState登录状态
    var UserInfo;					// 用户信息
    var GameRuleImg;				// 游戏规则底图设置--  websocket消息长度拆分
    var GamePrizeList;				// 游戏奖品设置
    var GameJoinLog;				// 用户参加游戏记录
    var LotteryResult;				// 抽奖信息
    var LotteryFinalNum = 0;		// 实际抽奖的奖品序号
    var OpenId;
    var GameId ='<%=Request.Params["GameId"]%>';

    $(function () {
        //初始化WebSocket
        WsInit();

        lottery.init('lottery');
    });

    /**抽奖 */
    var click = false;
    //抽奖
    var lottery = {
        index: -1, //当前转动到哪个位置，起点位置
        count: 0, //总共有多少个位置
        timer: 0, //setTimeout的ID，用clearTimeout清除
        speed: 20, //初始转动速度
        times: 0, //转动次数
        cycle: 50, //转动基本次数：即至少需要转动多少次再进入抽奖环节
        prize: -1, //中奖位置
        init: function (id) {
            if ($('#' + id).find('.lottery-unit').length > 0) {
                $lottery = $('#' + id);
                $units = $lottery.find('.lottery-unit');
                this.obj = $lottery;
                this.count = $units.length;
                $lottery.find('.lottery-unit.lottery-unit-' + this.index).addClass('active');
            };
        },
        roll: function () {
            var index = this.index;
            var count = this.count;
            var lottery = this.obj;
            $(lottery).find('.lottery-unit.lottery-unit-' + index).addClass('active');
            index += 1;
            if (index > count - 1)
                index = 0;
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
    function roll() {

        lottery.times += 1;
        lottery.roll(); //转动过程调用的是lottery的roll方法，这里是第一次调用初始化

        if (lottery.times > lottery.cycle + 10 && lottery.prize == lottery.index) {
            clearTimeout(lottery.timer);
            layer.open({
                type: 1,
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                area: ['893px', '600px'],
                content: $('#info').html()
            });

            lottery.prize = -1;
            lottery.times = 0;
            click = false;
        } else {
            if (lottery.times < lottery.cycle) {
                lottery.speed -= 10;
            } else if (lottery.times == lottery.cycle) {
                //var index = Math.random() * (lottery.count) | 0;		//产生奖品
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
            lottery.timer = setTimeout(roll, lottery.speed); //循环调用
        }
        return false;
    }
    //点击抽奖事件
    var BtnClick = () => {
        //if (!GameJoinLog.CanJoin) {
        //    alert("您的抽奖次数已经用完")
        //    return false;
        //}
        if (click) { //click控制一次抽奖过程中不能重复点击抽奖按钮，后面的点击不响应
            return false;

        } else {
            lottery.speed = 100;
            lottery.prize = 0;
            roll(); //转圈过程不响应click事件，会将click置为false
            click = true; //一次抽奖完成后，设置click为true，可继续抽奖
            return false;
        }
    }

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

        ////加载底图
        $("body").css("background", `url("${ResourceUrl}${GameRuleImg.MainImg}") round`);
        $("body").css("background-size", `cover`);
        $("body").css("background-repeat", `no-repeat`);

    }

    var ShowGamePrizeList = () => {
        //加载奖品图片
        $(".draw td").each(function (i, o) {
            //$(`#PrizeImg_${i}`).html(`<img src="${ResourceUrl}${GamePrizeList.PrizeList[i].PrizeImg}" alt="" style="width:80%;height:100%"/>`)
            $(`#PrizeImg_${i}`).attr('src', `${ResourceUrl}${GamePrizeList.PrizeList[i].PrizeImg}`)
        })

        ////加载奖品描述
        //$("td.item span").each(function (i, o) {
        //    $(`span#PrizeName_${i}`).html(GamePrizeList.PrizeList[i].PrizeName)
        //})
    }
    //游戏参加日志
    var ShowGameJoinLog = () => {
        $('#TotalCount').html(GameJoinLog.TotalCount);
        $('#TodayCount').html(GameJoinLog.TodayCount);
        $('#GameMax').html(GameJoinLog.GameMax);
        $('#GameDayPersonMax').html(GameJoinLog.GameDayPersonMax);
        $('#TotalCount2').html(GameJoinLog.GameMax - GameJoinLog.TotalCount);
        $('#TodayCount2').html(GameJoinLog.GameDayPersonMax2 - GameJoinLog.TodayCount);
        if (GameJoinLog.CanJoin)
            $('#CanJoin').html('您还可以继续抽奖哟！');
        else
            $('#CanJoin').html('不好意思，您的抽奖次数已用完');
    }


    /**工具 */

    var GetConfigUrl = () => '<%=System.Configuration.ConfigurationManager.AppSettings["WebSocketUrl"].ToString()%>' + '?user=Roll-PC';
    //获取资源Url
    var ResourceUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["ResourceUrl"].ToString()%>';

    //点击屏幕关闭弹出层
    $(document).click(() => {
        layer.closeAll();
    });

    var WsInit = () => {
        WebSocketInit(GetConfigUrl(),
            (e) => {
                console.log(`Open`)
            },
            (e) => {
                var data = JSON.parse(e.data);
                console.log(data)
                if (!data.Result) {
                    if (data.MesData == "Open")
                        WebSocketState = true;
                    switch (data.MesTitle) {
                        case '登录信息':
                            if (data.MesData == "已登录")
                                LoginState = true;
                            break;
                        case '用户信息':
                            UserInfo = data.MesData;
                            OpenId = data.MobileNo;
                            ShowUserInfo();
                            break;
                        case '规则底图设置': GameRuleImg = data.MesData;
                            ShowGameRuleImg();
                            break;
                        case '游戏奖品设置': GamePrizeList = data.MesData;
                            ShowGamePrizeList();
                            break;
                        case '游戏日志': GameJoinLog = data.MesData;
                            ShowGameJoinLog();
                            break;
                        case '抽奖结果':
                            LotteryResult = data.MesData;
                            for (var i = 0; i < GamePrizeList.PrizeList.length; i++) {
                                LotteryFinalNum = i;
                                var prizeImg = "";
                                if (GamePrizeList.PrizeList[i].PrizeName == LotteryResult.Data.WinPrizeName) {
                                    prizeImg = GamePrizeList.PrizeList[i].PrizeImg;
                                    break;
                                }

                            }

                            if (LotteryResult.Data.WinPrizeType == '4') {
                                $('#PrizeTitle').text("谢谢参与");
                                $('#LayerH1').text("很遗憾您未能获得奖品");
                                $('#PrizeIMG').attr('hidden', 'hidden');
                            }
                            else {
                                $('#LayerH1').text(LotteryResult.Data.WinPrizeName);
                                $('#PrizeIMG').attr('src', ResourceUrl + prizeImg);
                            }
                            break;
                        case '抽奖状态':
                            if (data.MesData == "开始抽奖")
                                BtnClick();
                            break;
                        case '领奖信息':
                            if (data.MesData == "点击领奖")
                                layer.closeAll();
                            break;
                        case '连接信息':
                            if (data.MesData.indexOf("下线") != -1 && data.MesData.indexOf("True") != -1) {
                                window.location.href = `RollQRCode.aspx?GameId=${GameId}`;
                            }
                            break;
                        //case "GameId":
                        //    GameId = data.MesData.GameId;
                        //    break;
                    }
                }
                else {
                    alert(data.MesData)
                }
            },
            (e) => {
                console.log(`error`)
            },
            (e) => {
                console.log(`close`)
            },
        )
    }

</script>
