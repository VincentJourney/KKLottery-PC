//登入
function aicAjaxCode(apiCommand, jsondata, func) {
    //var aicUrl = "http://183.62.205.27:8006/api/customer/"+apiCommand
    var aicUrl = "https://crm.kingkeybanner.com:8016/api/customer/" + apiCommand
    var JShared = {
        "Shared": {
            "appid": "12345678",
            "OrgCode": "100",
        },
        "Data": jsondata
    }
    var str = JSON.stringify(JShared)//数据序列化
    str = { request: str }//请求格式化
    $.ajax({
        async: true,
        type: "POST",
        url: aicUrl,
        data: str,
        dataType: 'json',
        success: function (data) {
            func(data);

        }
    });
}
//会员
function aicAjax(apiCommand, jsondata, func) {
    var aicUrl = "https://crm.kingkeybanner.com:8016/api/customer/" + apiCommand
    var JShared = {
        "Shared": {
            "CorpCode": "c001",
            "OrgCode": "11",
            "AppCode": "Wechat",
            "Signature": "ir932j9u322c",
        },
        "Data": jsondata
    }
    var str = JSON.stringify(JShared)//数据序列化
    str = { request: str }//请求格式化
    $.ajax({
        async: true,
        type: "POST",
        url: aicUrl,
        data: str,
        dataType: 'json',
        success: function (data) {
            func(data)

        }
    });
}

//抽奖
function aicAjaxGame(apiCommand, jsondata, func) {
    var aicUrl = "https://crm.kingkeybanner.com:8016/api/WeChatPublic/" + apiCommand
    var JShared = {
        "Shared": {
            "CorpCode": "C001",
            "OrgCode": "11",
            "AppCode": "Wechat",
            "Signature": "ir932j9u322c",
            "appid": "12345678",
        },
        "Data": jsondata
    }
    var str = JSON.stringify(JShared)//数据序列化
    str = { request: str }//请求格式化
    $.ajax({
        async: true,
        type: "POST",
        url: aicUrl,
        data: str,
        dataType: 'json',
        success: function (data) {
            if (!data.Result.HasError) {
                func(data)
            } else {
                let showErr = ""
                showErr += "<li>提示</li><li>" + data.Result.ErrorMessage + "</li><li><img src='images/mask.png' alt='奖品' /></li><li><button class='boundingBtn'>确定</button></li>"
                $(".bounding ul").html(showErr)
                $(".bounding").show(300)
            }
        }
    });
}


