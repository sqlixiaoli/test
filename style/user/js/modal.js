//通用
function modal_lg(_title, _url)
{
    $('#modal_lg').modal('show')
    $('#modal_lg_title').html(_title)
    $("#modal_lg_body").load(_url);
}
function modal_sm(_title, _url) {
    $('#modal_sm').modal('show')
    $('#modal_sm_title').html(_title)
    $("#modal_sm_body").load(_url);
}
function modal_def(_title, _url) {
    $('#modal_box').modal('show')
    $('#modal_box_title').html(_title)
    $("#modal_box_body").load(_url);
}

//二次封装 选择ICON
function tool_icon_select(call_fun) {
    modal_lg("选择ICON", "/User/tool/icon_select.html?call=" + call_fun)   
}


