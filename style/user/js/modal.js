var modal_url = "";
//通用
function modal_lg(_title, _url) {
    modal_url = _url;
    $('#modal_lg').modal('show')
    $('#modal_lg_title').html(_title)
    $("#modal_lg_body").load(_url);
}
function modal_lg_hide()
{ $('#modal_lg').modal('hide') }


function modal_sm(_title, _url) {
    modal_url = _url;
    $('#modal_sm').modal('show')
    $('#modal_sm_title').html(_title)
    $("#modal_sm_body").load(_url);
}
function modal_sm_hide()
{ $('#modal_sm').modal('hide') }

function modal_def(_title, _url) {
    modal_url = _url;
    $('#modal_box').modal('show')
    $('#modal_box_title').html(_title)
    $("#modal_box_body").load(_url);
}
function modal_def_hide()
{ $('#modal_box').modal('hide') }
function modal_box_hide() { modal_def_hide(); }

function modal_url_pra(name) {
    return $.getUrlParam(name, modal_url);
}

function modal_hide() {
    modal_sm_hide();
    modal_lg_hide();
    modal_def_hide();
    loading_hide();
}


function modal_msg(msg, time, url)
{
    if (time == null) { time = 1000; } else { time = time * 1000; }
    $('#modal_msg').modal({ backdrop: 'static', keyboard: false });
    $('#modal_msg').modal('show');   
    $("#modal_msg_body").html(msg);
    setTimeout(function () {
        $('#modal_msg').modal('hide');
        if (url != null)
        {
            if (url == "")
            { location.replace(location.href); }
            else {
                location.href = url;
            }
        }
    }, time);
}

function loading(msg)
{
    $('#modal_loading').modal({ backdrop: 'static', keyboard: false });
    $('#modal_loading').modal('show');
    if (msg != null) {
        $("#modal_loading_body").html(msg);
    }
}

function loading_hide()
{
    $('#modal_loading').modal('hide');
}


function modal_mutual(title, msg, call_define, call_cancel)
{
    $('#modal_mutual').modal({ backdrop: 'static', keyboard: false });
    $('#modal_mutual').modal('show');
    $('#modal_mutual_title').html(title);
    $('#modal_mutual_body').html(msg);

    $('#modal_mutual_bt_cancel').on("click", function () {        
        $('#modal_mutual').modal('hide');
        if (call_cancel != null) {            
            if (typeof (call_cancel) == "function") {
                setTimeout(function () { call_cancel(); }, 10);
            }
            else { setTimeout(function () { var a = eval(call_cancel); a(); }, 10); }
        }
    });

    $('#modal_mutual_bt_define').on("click", function () {
        $('#modal_mutual').modal('hide');
        if (call_define != null) {
            if (typeof (call_define) == "function") {
                setTimeout(function () { call_define(); }, 10);
            }
            else { setTimeout(function () { var a = eval(call_define); a(); }, 10); }
        }
    });
}

    //二次封装 选择ICON
function tool_icon_select(call_fun) {
    modal_lg("选择ICON", "/User/tool/icon_select.html?call=" + call_fun)
}

function tool_user_image_select(call_fun, project_id) {
    modal_lg("选择贴图", "/User/tool/user_image_select.html?project_id=" + project_id + "&call=" + call_fun)
}
