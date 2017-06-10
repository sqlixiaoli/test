function user_submit() {
    $(".submit_user").on("click", function () {
        var form = $(this).parents("form");
        ajax_user($(form).attr("action"), $(form).serializeArray());
    });
}


function ajax_user(_a, postdata) {
    $.ajax({
        //提交数据的类型 POST GET
        type: "POST",
        //提交的网址
        url: "/API/User/?a=" + _a + "&t=" + new Date().getTime(),
        //提交的数据
        data: postdata,
        //返回数据的格式
        datatype: "text",//"xml", "html", "script", "json", "jsonp", "text".
        //在请求之前调用的函数
        beforeSend: function () {
            if (Object.prototype.toString.call(postdata).lastIndexOf("Array")>=0) {
                $.each(postdata, function (i, obj) {
                    if (obj["name"] == "btnfun") {
                        setTimeout(function () { var a = eval(obj["value"]); a(postdata); }, 10);
                    }
                });
            }
            else {
                if (postdata.btnfun != null)
                { setTimeout(function () { var a = eval(postdata.btnfun); a(postdata); }, 10); }
            }
        },
        //成功返回之后调用的函数            
        success: function (d) {
            if (Object.prototype.toString.call(postdata).lastIndexOf("Array") >= 0) {
                $.each(postdata, function (i, obj) {
                    if (obj["name"] == "showdata") {
                        if (obj["value"] > 0) document.write(d);
                    }
                });
            }
            else {
                if (postdata.showdata != null) {
                    if (postdata.showdata > 0) document.write(d);
                }
            }

            var data = JSON.parse(d);
            if (data.Login == 1) {
                location.href = "/User/login.html";
            }
            else {
                if (data.callback != null) {
                    setTimeout(function () { var a = eval(data.callback); a(data); }, 10);
                }
            }
        },
        //调用执行后调用的函数
        complete: function (XMLHttpRequest, textStatus) {
            //alert(XMLHttpRequest.responseText);
            //alert(textStatus);
            //HideLoading();
        },
        //调用出错执行的函数
        error: function () {
            //请求出错处理
            alert("err");
        }
    });
}