var modal_url = "";
//通用
function modal_lg(_title, _url)
{
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
function modal_box_hide()
{ $('#modal_box').modal('hide') }


function modal_url_pra(name)
{
    return $.getUrlParam(name, modal_url);
}

//二次封装 选择ICON
function tool_icon_select(call_fun) {
    modal_lg("选择ICON", "/User/tool/icon_select.html?call=" + call_fun)   
}

