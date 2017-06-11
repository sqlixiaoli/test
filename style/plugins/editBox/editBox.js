!function(w,$){
  /**
   * 模态弹窗，替换alert的弹出效果
   * @param label
   * @param type
   * @param callback
   * @param defaultValue
   * @param selectOption
   * @returns {boolean}
   */
  /************************  start  ************************/
  
  function toString(data){
    return Object.prototype.toString.call(data);
  }
  
  function editBox(label, type, callback, defaultValue,selectOption){
    if(toString(label) !=toString("")){
      throw new Error("system::editBox::arguments Error label is not a string");
    }
    if($.inArray(type,["input","textarea","select"]) == -1){
      throw new Error("system::editBox::arguments Error type is not a [\"input\",\"textarea\",\"select\"]");
    }
    if(toString(callback) != "[object Function]"){
      throw new Error("system::editBox::arguments Error callback is not a Function ");
    }
    
    
    $("#myEditBox h4").html(label);
    if(defaultValue){
      $("#myEditBox input").val(defaultValue);
    }
    $("#myEditBox").modal({
      backdrop:"static"
    }).one('shown.bs.modal', function(e){
      $("#myEditBox").data("id", "");
      $("#myEditBox #_btn_yes").on("keydown", function(event){
        if(event.keyCode == 13){
          $(this).click();
        }else if(event.keyCode == 37 || event.keyCode == 39){
          $("#myEditBox #_btn_no").focus();
        }
      });
  
      $("#myEditBox #_btn_no").on("keydown", function(event){
        if(event.keyCode == 13){
          $(this).click();
        }else if(event.keyCode == 37 || event.keyCode == 39){
          $("#myEditBox #_btn_yes").focus();
        }
      });
     
    }).one("hidden.bs.modal", function(e){
      if($(e.target).data("id") == "yes"){
        callback($("#myEditBox input").val());
      }
    });
    
    return false;
  }

  /************************  end  ************************/
  
  w.editBox = editBox;
  
  /**
   * 向页面中加入模态弹窗的html代码
   */
  $(function(){
    var modal_str = '<div class="modal fade bs-example-modal-sm none" id="myEditBox" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">\
  <div class="modal-dialog">\
    <div class="modal-content">\
    <div class="modal-header">\
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>\
    <h4 class="modal-title">小提示</h4>\
    </div>\
    <div class="modal-body">\
    <p><input></p>\
    </div>\
    <div class="modal-footer">\
    <div class="alerts">\
    <button type="button" id="_btn_yes" class="btn btn-primary" data-id="yes" onclick="$(\'#myEditBox\').data(\'id\',\'yes\')" data-dismiss="modal">确定</button>\
    <button type="button" id="_btn_no" class="btn btn-primary" data-id="no" onclick="$(\'#myEditBox\').data(\'id\',\'no\')" data-dismiss="modal">取消</button>\
    </div>\
    </div>\
    </div>\
    </div>\
    </div>';
    $("body").append(modal_str);
  });
}(window,jQuery);





