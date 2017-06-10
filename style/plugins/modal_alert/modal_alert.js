!function(w,$){
  /**
   * 模态弹窗，替换alert的弹出效果
   * @param text
   * @param url
   * @param data
   * @param method
   * @param ajaxCallBack
   * @param model
   * @returns {boolean}
   *
   */
  /************************  start  ************************/
  function modal_alert(text, url, data, method, ajaxCallBack, model){
    arguments = Array.prototype.slice.call(arguments, 0);
    var argNum = arguments.length;
    if(argNum == 0 || (typeof arguments[0] != "object" && typeof arguments[0] != "string") || (typeof arguments[0] == "object" && typeof arguments[0].text != "string")){
      console.log("system::modal_alert::arguments Error");
      return false;
    }
    var json = {};
    var defArg = {
      url:null,
      data:{},
      method:"get",
      model:null,
      ajaxCallBack:ajaxSuccess
    };
    if(typeof arguments[0] == "object"){
      json = arguments[0];
      argNum = 0;
      for(var i in defArg){
        if(!json[i]){
          json[i] = defArg[i];
        }else{
          argNum++;
        }
      }
    }else if(typeof arguments[0] == "string"){
      var index = [{"type":"string", "index":"url"},
        {"type":"object", "index":"data"},
        {"type":"string", "index":"method"},
        {"type":"function", "index":"ajaxCallBack"},
        {"type":"boolean", "index":"model"}];
      json.text = arguments.shift();
      while(arguments.length){
        var temp = arguments.shift();
        while(index.length){
          var i = index.shift();
          if(typeof temp == i.type){
            json[i.index] = temp;
            break;
          }else{
            json[i.index] = defArg[i.index];
          }
        }
      }
      while(index.length){
        var i = index.shift();
        json[i.index] = defArg[i.index];
      }
    }
    if(argNum > 1 && json.model == null){
      json.model = true;
    }else if(json.model == null){
      json.model = false;
    }
    var callBack;
    if(json.url == null){
      if(json.ajaxCallBack == defArg.ajaxCallBack){
        callBack = function(){
        }
      }else{
        callBack = json.ajaxCallBack;
      }
    }else{
      if(json.model){
        callBack = function(e){
          console.log(e);
          if($(e.target).data("id") == "yes"){
            $.ajax({
              url:json.url,
              type:json.method,
              data:json.data,
              dataType:'json',
              cache:false,
              success:json.ajaxCallBack,
              error:function(XMLHttpRequest, textStatus, errorThrown){
                console.log("system::modal_alert::Ajax出错：" + textStatus);
              }
            });
          }
        };
      }else{
        callBack = function(e){
          if(json.url){
            location.href = json.url;
          }
        }
      }
    }
    if(json.model){
      $(".alerts").hide();
      $(".confirm").show();
    }else{
      $(".confirm").hide();
      $(".alerts").show();
    }
    
    $(".modal-body p").html(text);
    $("#mymodal-data").modal({
      backdrop:"static"
    }).one('shown.bs.modal', function(e){
      $("#mymodal-data").data("id", "");
      if($("#_btn_ok:not(:hidden)").length){
        $("#_btn_ok").focus().on("keydown", function(event){
          if(event.keyCode == 13){
            dispatch($(this)[0], "click");
          }
        });
      }else if($("#_btn_yes:not(:hidden)").length){
        $("#_btn_yes").on("keydown", function(event){
          if(event.keyCode == 13){
            dispatch($(this)[0], "click");
          }else if(event.keyCode == 37 || event.keyCode == 39){
            $("#_btn_no").focus();
          }
        });
        $("#_btn_no").on("keydown", function(event){
          if(event.keyCode == 13){
            dispatch($(this)[0], "click");
          }else if(event.keyCode == 37 || event.keyCode == 39){
            $("#_btn_yes").focus();
          }
        });
      }
    }).one("hidden.bs.modal", callBack);
    
    return false;
  }

  /************************  end  ************************/
  
  /**
   * @param data
   * @description 给 modal_alert 提供功能函数
   */
  function ajaxSuccess(data){
    console.log(typeof data);
    if(typeof data != 'object'){
      data = JSON.parse(data);
    }
    if(data.status == "ok"){
      if(data.alert_message && data.gourl){
        modal_alert(data.alert_message,data.gourl,false);
      }else if(data.alert_message){
        modal_alert(data.alert_message);
      }else if(data.gourl){
        document.location = data.gourl;
      }
    }else{
      console.log("system::modal_alert::AjaxCallback返回status不是ok");
    }
  }
  w.modal_alert = modal_alert;
  w.alert = function(data){
    modal_alert(data.toString());
  };
  
  /**
   * 向页面中加入模态弹窗的html代码
   */
  $(function(){
    var modal_str = '<div class="modal fade bs-example-modal-sm none" id="mymodal-data" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">\
  <div class="modal-dialog">\
    <div class="modal-content">\
    <div class="modal-header">\
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>\
    <h4 class="modal-title">小提示</h4>\
    </div>\
    <div class="modal-body">\
    <p>模态弹出窗主体内容</p>\
    </div>\
    <div class="modal-footer">\
    <div class="confirm none">\
    <button type="button" id="_btn_yes" class="btn btn-primary" data-id="yes" onclick="$(\'#mymodal-data\').data(\'id\',\'yes\')" data-dismiss="modal">是</button>\
    <button type="button" id="_btn_no" class="btn btn-default" data-id="no" onclick="$(\'#mymodal-data\').data(\'id\',\'no\')" data-dismiss="modal">否</button>\
    </div>\
    <div class="alerts">\
    <button type="button" id="_btn_ok" class="btn btn-primary" data-id="ok" onclick="$(\'#mymodal-data\').data(\'id\',\'ok\')" data-dismiss="modal">确定</button>\
    </div>\
    </div>\
    </div>\
    </div>\
    </div>';
    $("body").append(modal_str);
  });
}(window,jQuery);





