<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnOnlyPC.aspx.cs" Inherits="KKLottery_PC.TurnOnlyPC" %>

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
            width: 85%;
            margin-left: 5%;
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
            width: 98%;
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
            margin: 0 20%;
            padding: 2% 3%;
            background-color: black;
            opacity: 0.5;
            border-radius: 12px;
            width: 50%;
            color: white;
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
            margin-top: 2%;
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
            margin-top: 72px;
        }


        .NewGrid {
            position: relative;
            float: left;
            width: 16%;
            box-sizing: border-box;
            margin: 1% 1%;
        }

        .TopShow {
            overflow: hidden;
            padding: 1%;
        }

        .BackButtom {
        }

        .BackButtom2 {
            color: #fff;
            border: 1px solid #dd524d;
            background-color: #dd524d;
            width: 100px;
            height: 50px;
            border-radius: 12px;
            float: right;
            margin-top: 2%;
            margin-right: 5%;
        }

        .LogoButtom {
            width: 50%;
            float: left;
        }

        .Logo {
            /*padding: 1%;*/
        }

        .Receive {
            color: #fff;
            border: 1px solid #dd524d;
            background-color: #dd524d;
            width: 200px;
            height: 50px;
            border-radius: 12px;
        }
    </style>
</head>
<body>
    <%--页面LOGO--%>
    <div class="TopShow">
        <div class="Logo LogoButtom">
            <img src="images/kingkeyLog.png" />
        </div>
        <div class="BackButtom LogoButtom">
            <button type="button" class="BackButtom2" onclick="BackButtom()">返回</button>
        </div>
    </div>

    <%--会员信息展示--%>
    <div style="width: 100%; overflow: hidden; margin-top: 3%">
        <div style="width: 40%; float: left;">
            <div id="UserInfo" class="textTemple">
                <h2>会员信息</h2>
                <hr />
                <p>姓名：<span id="UserName"></span></p>
                <p>性别：<span id="UserSex"></span></p>
                <p>手机号码：<span id="UserPhone"></span></p>
                <p>会员卡号：<span id="UserCardCode"></span></p>
            </div>

            <div id="GameRule" class="textTemple textStyle">
                <div id="RuleWrap">
                    <h3>游戏规则</h3>
                    <div id="RuleText"></div>
                </div>
            </div>
        </div>

        <%--奖品区--%>
        <div style="width: 60%; float: left;">
            <div class="weui-grids" id="draw">
            </div>
            <div id="UserJoinInfo" class="textTemple textStyle" style="margin: 0px 6%; width: 69%; font-size: 13px;">
                <p>活动可参与次数：<span id="GameMax"></span>  已参与次数：<span id="TotalCount"></span> 剩余次数：<span id="TotalCount2"></span></p>
                <p>当日可参与次数：<span id="GameDayPersonMax"></span> 已参与次数：<span id="TodayCount"></span> 剩余次数：<span id="TodayCount2"></span></p>


                <%--                <p>活动期间最大参与次数：<span id="GameMax"></span></p>
                <p>每人当日最大参与次数：<span id="GameDayPersonMax"></span></p>
                <p>用户参与总次数：<span id="TotalCount"></span></p>
                <p>剩余总参与次数:<span id="TotalCount2"></span></p>
                <p>用户当日参与次数：<span id="TodayCount"></span></p>
                <p>剩余当日参与次数：<span id="TodayCount2"></span></p>--%>
                <%--  <p>当前是否可参与：<span id="CanJoin"></span></p>--%>
            </div>
        </div>
    </div>

    <%--中奖后弹窗--%>
    <div id='info' style="display: none">
        <div class="PrizeInfo">
            <div style="font-size: 45px; color: red" class="marTop" id="PrizeTitle">恭喜您获得</div>
            <div id="LayerH1" class="marTop" style="font-size: 20px"></div>
            <div class="marTop">
                <img src="#" id="PrizeIMG" />
            </div>
            <div class="marTop">
                <button type="button" class="Receive" onclick="ReceivePrize()">继续抽奖</button>
            </div>
        </div>
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
    var GameMax = 0;			//活动期间最大参与次数
    var GameDayPersonMax = 0;	//每人当日最大参与次数
    var UserInfo;				//用户信息
    var RequestMobileNo = '<%=Request.Params["id"]%>';
    var GameId = '<%=Request.Params["GameId"]%>';
    var DecMobileNo;

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
                alert("您的抽奖次数已经用完");
                return;
            }

            GameJoinApi(res => {
                if (res.HasError)
                    alert(res.ErrorMessage);
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
                    turnImg = current;
                    $(this).find('.img').stop().animate(opts[0], time, function () {
                        $(this).next().attr('src', ResourceUrl + LotteryFinalPrize.PrizeImg);//下层图片赋值
                        $(this).hide().next().show();//上层隐藏 下层显示
                        $(this).next().animate(opts[1], time); //下层出现
                        //$(this).parent().find('.PrizeName').html(WinPrizeName);
                        //$(this).parent().find('.PrizeName').show();
                        clickstate = 1;


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
                    //查询游戏日志
                    GetGameJoinInfo({ SettingID: SettingId, OpenID: CustomerID }, res => {
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
                        }
                        else {
                            alert(res.ErrorMessage);
                        }
                    })
                }
            })
        });
    }

    $(() => {
        ShowMain();
        //解密手机号
        DecMobileNo = Encrypt.Deciphering(RequestMobileNo)

        if (!isEmpty(DecMobileNo)) {
            GetGameSetting({ GameType: TurnGameType, SettingID: GameId }, data => {
                console.log(data)
                if (!data.HasError) {
                    if (data.Data.length == 0) {
                        alert("游戏暂未配置");
                        return
                    }
                    GameMax = data.Data[0].GameMax;
                    GameDayPersonMax = data.Data[0].GameDayPersonMax;
                    $("#GameMax").html(GameMax);
                    $("#GameDayPersonMax").html(GameDayPersonMax);
                    CrmLoad();
                    turn($('#draw'), 400, verticalOpts);
                } else {
                    alert(data.ErrorMessage);
                }
            });
        }
        else {
            alert('未正常登陆！');
        }
    });


    //展示页面奖品图片
    var ShowMain = () => {
        $("#draw").empty();
        var html = "";
        for (var i = 1; i <= 15; i++) {
            html += `<a href="javascript:;" id="a${i}" class="NewGrid">
                         <span class="PrizeName"></span>
                         <img class="img" src="images/ldimg/fugai/1.png" alt="" />
                         <img class="info" src="images/ldimg/jieguo/1.png" alt="" />
                     </a>`;
        }
        $("#draw").append(html);
    }

    /******业务 */

    //小游戏信息查询
    var CrmLoad = () => {
        //请求会员信息
        MemberInfo({ QueryType: '3', Code: DecMobileNo }, data => {
            if (!data.HasError) {
                CustomerID = data.Data.MemberID;
                CardID = data.Data.CardInfoList[0].CardID;
                MobileNo = data.Data.MobileNo;
                $('#UserName').html(Desensitization(data.Data.FullName, '*', 1, 2));
                $('#UserSex').html(FormatterSex(data.Data.Gender));
                $('#UserPhone').html(Desensitization(data.Data.MobileNo, '*', 4, 7));
                $('#UserCardCode').html(Desensitization(data.Data.CardInfoList[0].CardCode, '*', 3, 6));

                UserInfo = {
                    UserName: data.Data.FullName,
                    UserSex: FormatterSex(data.Data.Gender),
                    UserPhone: data.Data.MobileNo,
                    UserCardCode: data.Data.CardInfoList[0].CardCode
                }

            }
            else {
                alert(data.ErrorMessage);
            }
        });

        //查询游戏规则
        GetGameSetting({ GameType: TurnGameType, SettingID: GameId }, data => {
            if (!data.HasError) {
                if (data.Data.length == 0) {
                    alert("游戏暂未配置");
                    return
                }
                SettingId = data.Data[0].SettingID;
                ConSumptionType = data.Data[0].RewardType;
                ConsumptionValue = data.Data[0].RewardValue;
                PrizeList = data.Data[0].WcGamePrizeList;

                //加载规则
                $('#RuleText').html(data.Data[0].GameRuleDesc);

                //加载底图
                $("body").css({
                    'background': `url("${ResourceUrl}${data.Data[0].PCImg}") no-repeat`
                    , 'background-size': 'cover'
                });

                //加载奖品图片
                //$("#draw a").each(function (i, o) {
                //    $(`#a${i + 1}`).find('.info').attr('src', `${ResourceUrl}${data.Data[0].WcGamePrizeList[i].PrizeImg}`)
                //})

                //加载奖品描述
                //$("#draw a").each(function (i, o) {
                //    $(`#a${i + 1} span.PrizeName`).html(data.Data[0].WcGamePrizeList[i].PrizeName)
                //})

                //查询游戏日志
                GetGameJoinInfo({ SettingID: SettingId, OpenID: CustomerID }, res => {
                    console.log(res)
                    if (!res.HasError) {
                        $('#TotalCount').html(res.Data.PersonalTotalCount);
                        $('#TodayCount').html(res.Data.PersonalTodayCount);
                        $('#TotalCount2').html(GameMax - res.Data.PersonalTotalCount);
                        $('#TodayCount2').html(GameDayPersonMax - res.Data.PersonalTodayCount);
                        if (res.Data.CanJoin) {
                            $('#CanJoin').html('您还可以继续抽奖哟！');
                            CanJoin = true;
                        }
                        else {
                            $('#CanJoin').html('不好意思，您的抽奖次数已用完');
                        }
                    }
                    else {
                        alert(res.ErrorMessage);
                    }
                })
            }
            else {
                alert(data.ErrorMessage);
            }
        })
    }



    //参加抽奖
    var GameJoinApi = func => {
        let jsonData = {
            SettingID: SettingId,
            OpenID: CustomerID,
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

    //获取CRM接口Url
    var GameApiServerUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["GameApiServerUrl"].ToString()%>' + 'api/';
    //获取资源Url
    var ResourceUrl = '<%=System.Configuration.ConfigurationManager.AppSettings["ResourceUrl"].ToString()%>';
    //获取GameType
    var TurnGameType = parseInt('<%=System.Configuration.ConfigurationManager.AppSettings["TurnGameType"].ToString()%>');


    //点击屏幕关闭弹出层
    var ReceivePrize = () => {
        layer.closeAll();
        ReSet();
        $('#draw').find('a').bind('click', function () {
            turn($('#draw'), 400, verticalOpts);
        });
    }

    var BackButtom = () => {
        window.location.href = `TurnPcLogin.aspx?GameId=${GameId}`
    }

    //重置牌面
    var ReSet = () => {
        clickstate = 0;
        LotteryFinalPrize = null;
        turnImg.find('.img').next().hide(); //下层隐藏 
        turnImg.find('.img').next().attr('src', '');
        turnImg.find('.img').stop().animate(verticalOpts[1], time, function () { //下层消失 上层展示
            $(this).show();
        })
        turnImg = null;
        $(document).unbind('click');
    }



</script>

