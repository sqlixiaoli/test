/**
 * Created by wfso on 2017/3/30.
 */


!function(global, factory){
  typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
    typeof define === 'function' && define.amd ? define(factory) :
      (global.fileUpload = factory());
}(this, function(){
  
  // 第二部创建视图
  function drawImage(file){
    var self = this;
    if(!file.type.match(/^image/)){
      alert("不支持的文件类型");
      return;
    }
    // 读取文件属性 
    var fr = new FileReader();
    // 绘制图片
    fr.onload = function(){
      fileOnLoad.call(self, fr, file.type);
    };
    fr.readAsDataURL(file);
  }
  
  function fileOnLoad(fr, type){
    
    this.img = new Image();
    
    this.img.src = fr.result;
    
    this.imageBox.html("");
    
    this.imageBox.append(this.img);
    var self = this;
    // 选框裁切图框
    $(this.img).Jcrop({
      allowSelect:false,
      allowMove:true,
      allowResize:true,
      aspectRatio:self.opt.cw/self.opt.ch,
      minSize:[100, 100], // min crop size
      bgOpacity:0.3, // fade opacity
      boxWidth:400,
      boxHeight:280,
      setSelect:[0,0,self.opt.cw,self.opt.ch],
      onChange:function(e){
        DrawCanvas.call(self, e.x, e.y, e.x2, e.y2);
      },
      onSelect:function(e){
        DrawCanvas.call(self, e.x, e.y, e.x2, e.y2);
      },
      onRelease:function(e){
        clearInfo.call(self, e);
      }
    });
  }
  
  function DrawCanvas(x1, y1, x2, y2){
    var ax = x2 - x1;
    var ay = y2 - y1;
    
    var context = this.canvasDom.getContext("2d");
    context.drawImage(this.img, x1, y1, ax, ay, 0, 0, this.opt.cw, this.opt.ch);
    
    this.imageData = this.canvasDom.toDataURL();
    var b = atob(this.imageData.split(/,/)[1]);
    var ub = new Uint8Array(b.length);
    for(var i = 0; i < b.length; i++){
      ub[i] = b.charCodeAt(i);
    }
    
    this.fileContent = new File([ub], "filename.jpg");
    
    if(this.fileContent.size > 500 * 1024){
      alert('您的图片过大,请重新上传！');
      return false;
    }
  }
  
  function clearInfo(e){
    console.log('success')
  }
  
  function upload(file){
    var self = this;
    form = new FormData();
    form.append("file", file);
    form.append("a", this.opt.action);
    form.append("fileType", 'image');
    form.append("v", this.opt.actionVersion);
    $.ajax({
      type:"POST",
      url:this.opt.url,
      data:form,
      processData:false,
      //必须false才会自动加上正确的Content-Type
      contentType:false,
      xhr:function(){
        var xhr = $.ajaxSettings.xhr();
        if(onprogress && xhr.upload){
          xhr.upload.addEventListener("progress", function(evt){onprogress.call(self,evt)}, false);
          return xhr;
        }
      },
      success:function(data){
        data = $.parseJSON(data)
        if(data.statusCode == 20001){
          alert(data.statusMsg);
          return false;
        }
        if(self.opt.callback){
          self.opt.callback.call(self, data);
        }
        self.wrapper.hide();
      },
      error:function(){
        $('#tit_layer').text('上传失败！');
        $('#tit_layer').css({'display':"block"});
  
        self.wrapper.hide();
      }
    });
    
  }
  
  function onprogress(evt){
    var loaded = evt.loaded; //已经上传大小情况
    var tot = evt.total; //附件总大小
    var per = Math.floor(100 * loaded / tot); //已经上传的百分比
    
    if(per > 0 && per < 100){
      this.progressText.text('上传中……');
    }else if(per == 100){
      this.progressText.text('上传成功');
      this.progressText.css({'display':"block","color":"skyblue"});
    }
    if(per > 20){
      this.progressBar.css({'padding-right':"10px", 'box-sizing':'border-box'});
    }
    this.progressBar.html(per + "%");
    if(per < 90){
      this.progressBar.css({
        "width":per + "%",
        "border-top-left-radius":'10px',
        "border-bottom-left-radius":'10px',
        "font-size":'12px'
      });
    }else{
      this.progressBar.css({"width":per + "%", "border-radius":'10px'});
    }
  }
  
  //  第一步调用 创建
  function fileUpload(option){
    
    this.opt = option;
    
    var wrapper = this.wrapper = $('<div class="fileUploadWrapper"></div>');
    
    var box = this.box = $('<div class="fileUploadBox"></div>');
    
    wrapper.append(box);
    
    var closeBtn = this.closeBtn = $('<span class="iconfont icon-close closeBtn"></span>');
    
    box.append(closeBtn);
    
    closeBtn.click(function(){
      wrapper.hide();
    });
    
    var imageBox = this.imageBox = $('<div class="imageBox"></div>');
    
    box.append(imageBox);
    
    box.append($('<p class="show_hint">预览效果</p>'));
    
    var canvas = this.canvas = $('<canvas width="'+option.cw+'" height="'+option.ch+'"></canvas>');
    
    this.canvasDom = canvas[0];
    
    box.append(canvas);
    
    var progressBox = this.progressBox = $('<div class="progressBox"></div>');
    
    box.append(progressBox);
    
    var progressBar = this.progressBar = $('<div class="progressBar"></div>');
    
    progressBox.append(progressBar);
    
    var progressText = this.progressText = $('<div class="progressText"></div>');
    
    progressBox.append(progressText);
    
    var saveBtn = this.saveBtn = $('<div class="saveBtn">保存</div>');
    
    box.append(saveBtn);
    
    var selectBtnText = this.selectBtnText = $('<a href="javascript:;" class="selectBtnText">选择图片</a>')
    
    var fileInput = this.fileInput = $("<input type='file' accept='image/png,image/jpeg,image/bmp' class='fileInput' />");
    
    var div = $("<div></div>");
    
    div.append(selectBtnText);
    
    this.box.append(div);
    
    selectBtnText.click(function(){
      fileInput.click();
    });
  
    var self = this;
    
    $(option.activeBtn).click(function(){
      wrapper.show();
      progressText.css({'display':"none", 'color':"#fff"});
      progressBar.text("0%");
      self.imageBox.html("");
      self.canvasDom.height = self.canvasDom.height;
      self.saveBtn.prop("disabled",true);
      self.saveBtn.unbind("click");
      self.saveBtn.css({"background-color":"#999999"});
      selectBtnText.text('选择图片');
      
      // 清空缓存的图片地址，保证再次选择同一张图片时依然会非触发 change 事件
      fileInput.val("");
      
      progressBar.css({"width":"0",
        "border-top-left-radius":'10px',
        "border-bottom-left-radius":'10px',
        'padding-right':"10px",
        "border-radius":'10px'
      });
    });
    
    
    fileInput.change(function(){
      drawImage.call(self, this.files[0]);
      selectBtnText.text('重新选择');
      
      // 建立保存图片按钮
      saveBtn.click(function(){
        upload.call(self, self.fileContent);
        self.saveBtn.prop("disabled",true);
        self.saveBtn.unbind("click");
        self.saveBtn.css({"background-color":"#999999"});
      });
      
      self.saveBtn.prop("disabled",false);
      self.saveBtn.css({"background-color":"#3BB0E0"});
    });
    
    $("body").append(wrapper);
    wrapper.hide();
  }
  
  return fileUpload;
});
