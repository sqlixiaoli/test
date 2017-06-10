!function(W){
  var fileUpload={
    init:function(){
      W.fileUpload={};
      var me=this;
      $.fn.fileUpload=function(option){
        me.sel=this.selector;
        W.fileUpload[me.sel]={};
        W.fileUpload[me.sel].url=option.url;
        W.fileUpload[me.sel].path=option.path;
        W.fileUpload[me.sel].action=option.action;
        W.fileUpload[me.sel].type=option.type || 'file';
        W.fileUpload[me.sel].input=$(this[0]);
        W.fileUpload[me.sel].btn_text=option.btn_text || '上传文件';
        W.fileUpload[me.sel].initImg=option.initImg || 'fileUpload/images/user.png';
        W.fileUpload[me.sel].initFile=option.initFile || 1;
        W.fileUpload[me.sel].showImg=option.showImg || 1;
        W.fileUpload[me.sel].status=0;
        W.fileUpload[me.sel].windowSet=option.windowSet || false;
        W.fileUpload[me.sel].windowFun=option.windowFun;
        W.fileUpload[me.sel].onSuccess=option.onSuccess || 1;
        W.fileUpload[me.sel].onError=option.onError || 1;
        me.timer=0;
        me.createEle();
        me.createModal();
        me.upload_img();
        var box=null;
        switch(W.fileUpload[me.sel].type){
          case 'image':box= [ 'jpg', 'jpeg', 'bmp', 'gif', 'png' ];break;
          case 'file':box=[ 'doc', 'docx', 'wps', 'txt', 'xls', 'xlsx', 'pdf', 'ppt', 'pptx' ];break;
          case 'compress':box= [ 'zip', 'rar' ];break;
          case 'video':box=[ 'mp4', '3gp', 'rm', 'fl4v', 'avi', 'wmv', 'flv', 'f4v', 'rmvb', 'ogg', 'ogv', 'swf' ];break;
          case 'audio':box= [ 'mp3', 'ogg', 'wav' ];break;
          case 'app':box= ['apk'];break;
        }
        
        W.fileUpload[me.sel].accept=option.accept || box;
      }
    },
    createEle:function(){
      W.fileUpload[this.sel].input.wrap('<span class="fileinput-button">'+W.fileUpload[this.sel].btn_text+'</span>');
      if(W.fileUpload[this.sel].type=='image'){
        W.fileUpload[this.sel].input.parents('.fileUpload_v').append('<img src="'+W.fileUpload[this.sel].initImg+'" alt="" class="fileUpload_v fileImg"/><input type="hidden" name="" class="fileUpload_v hideInp" /><input type="hidden" class="fileUpload_v file_Name"/>');
      }else{
        var box;
        if(W.fileUpload[this.sel].initFile!=1){
          box=W.fileUpload[this.sel].initFile;
        }else{
          box='';
        }
        W.fileUpload[this.sel].input.parents('.fileUpload_v').append('<input type="text" class="fileUpload_v fileName" disabled="true" value="'+box+'"/><input type="hidden" name="" class="fileUpload_v hideInp" /><input type="hidden" class="fileUpload_v file_Name"/>');
      }
    },
    createModal:function(){
      W.fileUpload[this.sel].input.parents('.fileUpload_v').append('<div class="fileUpload_v modal">' +
        '<div class="fileUpload_v modal_dialog">' +
        '<div class="fileUpload_v modal_content"><div class="fileUpload_close" style="float:right;width:30px;height:30px;border-radius:50px;background:rgba(0,0,0,0.6);color:#fff;text-align: center;line-height: 30px;font-size: 12px;position: absolute;right: -7px;top: -6px;cursor:pointer;">X</div>' +
        '<div class="fileUpload_v modal_header">...</div>'+
        '<div class="fileUpload_v modal_body"><div class="fileUpload_v bar" style="width:0%"></div><span></span></div>'+
        '<div class="fileUpload_v modal_footer"><button type="button" class="fileUpload_yes btn btn-primary">确定</button><button type="button" class="fileUpload_no btn btn-primary">取消上传</button></div>'+
        '</div></div></div>');
      $('.fileUpload_v.modal').hide();
      
      $('.fileUpload_yes').unbind('click');
      $('.fileUpload_yes').add('.fileUpload_close').bind('click',function(){
        $('.fileUpload_v.modal').hide();
      });
    },
    modal_alt:function(header,body,btn){
      var modal=$(this.sel).parent().siblings('div.modal');
      modal.find('.fileUpload_v.modal_header').html(header);
      modal.find('.fileUpload_v.modal_body').html(body);
      if(btn){
        modal.find('.fileUpload_no').show();
      }else{
        modal.find('.fileUpload_no').hide();
      }
      modal.show();
    },
    upload_img:function(){
      var tmp_id = new UUID();
      var jqXHR;
      var input_hidden_id=W.fileUpload[this.sel].input.parent().siblings('.hideInp');
      var input_hidden_val=W.fileUpload[this.sel].input[0].id;
      var fileName=W.fileUpload[this.sel].input.parent('span').siblings('.file_Name');
      var show_id=W.fileUpload[this.sel].input.parent().next('img');
      var me=this;
      W.fileUpload[this.sel].input.fileupload({
        url:W.fileUpload[me.sel].url,
        fileName:"uploadfile",
        formData:{
          a:W.fileUpload[me.sel].action,
          path:W.fileUpload[me.sel].path,
          tmp_id:tmp_id
        },
        add:function(e, data){
          if(W.fileUpload[me.sel].windowSet){
            W.fileUpload[me.sel].windowFun();
          }
          me.sel='#'+e.target.id;
          var filename = data.files[0].name.toString();
          W.fileUpload[me.sel].status=0;
          var filetype = filename.substr(filename.lastIndexOf(".") + 1).toLocaleLowerCase();
          if($.inArray(filetype, W.fileUpload[me.sel].accept) >= 0){
            me.modal_alt('上传文件中','<div class="fileUpload_v bar" style="width:0%"></div><span></span>',true);
            $('.fileUpload_v.modal .fileUpload_yes').hide();
            data.autoUpload = true;
            jqXHR = data.submit();
          }else{
            if($('#loading').length!=0)$('#loading').modal('hide');
            me.modal_alt('提示','暂不支持该类型文件上传<br/>仅允许上传 .'+W.fileUpload[me.sel].accept.toString().replace(/\,/g,',&nbsp;.')+' 类型文件',true);
            $('.fileUpload_yes').show().prop('disabled',false);
            $('.fileUpload_no').hide();
          }
          $('.fileUpload_no').one('click',function(){jqXHR.abort();$('.fileUpload_v.modal').hide();if(me.timer!=0){clearTimeout(me.timer);}});
        },
        done:function(e, data){
          var jsn=JSON.parse(data.result);
          if($('#loading').length!=0)$('#loading').modal('hide');
          if(jsn.status== "ERROR"){
            W.fileUpload[me.sel].status=1;
            me.modal_alt('提示','暂不支持该类型文件上传<br/>仅允许上传 .'+W.fileUpload[me.sel].accept.toString().replace(/\,/g,',.')+' 类型文件',true);
            $('.fileUpload_v.modal .fileUpload_yes').show().prop('disabled',false);
            $('.fileUpload_v.modal .fileUpload_no').hide();
            if(W.fileUpload[me.sel].onError!=1){
              W.fileUpload[me.sel].onError(e,data);
            }
            return;
          }
          me.timer=setTimeout(function(){
            if(W.fileUpload[me.sel].complete && W.fileUpload[me.sel].status==0){
              $('.fileUpload_no').hide();
              $('.fileUpload_v.modal .fileUpload_yes').show().prop('disabled',false);
              $('.fileUpload_v.modal_body .bar').siblings('span').html('上传成功，提交后生效');
              $('.fileUpload_v.modal .fileUpload_yes').show();
              $.each(data.files, function(index, file){
                var file_type = file.name.substr(file.name.lastIndexOf("."));
                $(fileName).val(file.name).siblings('.fileName').val(file.name);
                $(input_hidden_id).val(jsn.fileId).attr('name',input_hidden_val);
                $(input_hidden_id).next().val(file.name).attr('name',input_hidden_val+'_filename');
                $(input_hidden_id).val(jsn.fileId).attr('name',input_hidden_val);
                $(show_id).attr('src',jsn.url);
              });
              tmp_id =  new UUID();
              data.formData.tmp_id =tmp_id;
              if(W.fileUpload[me.sel].onSuccess!=1){
                W.fileUpload[me.sel].onSuccess(e,data);
              }
            }
          },1000);
          
        },
        progressall: function (e, data) {
          var progress = parseInt(data.loaded / data.total * 100, 10);
          $('.fileUpload_v.modal_body .bar').animate({width:progress + '%'},50);
          if(progress==100){
            $('.fileUpload_v.modal_body .bar').stop(true).animate({width:progress + '%'},50);
            W.fileUpload[me.sel].complete=true;
            $('.fileUpload_v.modal .fileUpload_no').hide();
            $('.fileUpload_v.modal .fileUpload_yes').show().prop('disabled',true);
            $('.fileUpload_v.modal_body .bar').siblings('span').html('正在检测上传文件...');
          }else{
            $('.fileUpload_v.modal_body .bar').siblings('span').html(progress+'%');
          }
        }
      });
    }
  }
  fileUpload.init();
}(window);
    