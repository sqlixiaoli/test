<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>云图 | Yun-TU</title>
    <!--#include virtual="/User/head.html" -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">       

        <!--#include virtual="/User/menu_left.html" -->

        <div class="content-wrapper">

             

            <section class="content-header" id="vue-project-info">
                  <h1><a :href="'project_view.aspx?id='+project.id">{{project.projectName}}</a>  > <a :href="'project_image_list.aspx?projectid='+project.id">场景管理</a> <small> > {{info.imgTitle}}</small></h1>
            </section>
            <section class="content">

                <div class="row">
                    <div class="col-md-9" id="vue-project-info1">
                        <!-- Horizontal Form -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">场景管理【{{info.imgTitle}}】</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body form-horizontal" id="vue-project-image-list">
                                <iframe id="panobj" :src="'/User/PAN/edit_scene.aspx?id='+info.id" style="width:100%; height:700px;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">

                         <div class="box box-primary" id="op_main">
            <div class="box-header">
              <i class="fa fa-edit"></i>

              <h3 class="box-title">操作</h3>
            </div>
                              <div class="box-body pad table-responsive">
                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="set_scene_now_address()">设置为初始位置</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="on_pan_scene_add_hotspot()">添加场景跳转</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="set_info('project_image_hotspot_page_add.html')">添加资源网页热点</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="set_info('project_image_hotspot_http_add.html')">添加外链接热点</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="set_info('project_image_hotspot_image_add.html')">添加贴图</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="set_info('project_image_hotspot_snow.html')">动画特效管理</button>
                              </div>
                             
                             </div>


                         <div class="box box-primary" id="op_setinfo" style="display:none">
                         </div>

                        <!--#include virtual="project_image_hotspot_scene_add.html" -->
                        <!--#include virtual="project_image_hotspot_scene_edit.html" -->

                        <div  style="display:none">
                                 <input type="input" id="scene_h" value="0" />
                                  <input type="input" id="scene_v" value="0" />
                                  <input type="input" id="scene_f" value="0" />
                                  <input type="input" id="hotspot_name" value="" />
                                  <input type="input" id="hotspot_type" value="" />
                                  <input type="input" id="hotspot_toscenename" value="" />
                                  <input type="input" id="hotspot_list" value="" />
                                  <input type="input" id="project_id" value="0" />
                             </div>

                    </div>
                </div>
            </section>

            

        </div>

        <!--#include virtual="/User/menu_button.html" -->

        <script src="/style/user/js/pro_edit_scene.js"></script>

        <script>

            ajax_user("project_image_get", { callback: 'fun_info', btnfun: 'fun_load', showdata: 0, id: $.getUrlParam("id"), hotspot: 1 });
            var hotspotlist = [];
            function fun_info(result) {

                var vm = new Vue({
                    el: "#vue-project-info",
                    data: result.data
                });

                var vm = new Vue({
                    el: "#vue-project-info1",
                    data: result.data
                });

                set_hotspotlist(result.data.hotspot.data);

                $("#project_id").val(result.data.project.id);
                ajax_user("pan_group_list", { callback: 'fun_list_group', btnfun: 'fun_load', showdata: 0, projectId: $("#project_id").val() });
                ajax_user("project_image_list", { callback: 'fun_list_image', btnfun: 'fun_load', showdata: 0, projectid: $("#project_id").val() });
            }           

            function fun_list_group(result) {
                var vm = new Vue({
                    el: "#hotspot_add_image_group",
                    data: result.data
                });
            }

            function fun_list_image(result) {
                var vm = new Vue({
                    el: "#hotspot_add_image",
                    data: result.data
                });
                loading_hide();
            }



            function fun_load(data) {
                //alert("开始加载");
                loading();
            }

            //设置当前位置
            function set_scene_now_address() {
                ajax_user("project_image_edit", { callback: 'fun_set_now_address', showdata: 0, id: $.getUrlParam("id"), hlookat: $("#scene_h").val(), vlookat: $("#scene_v").val(), fov: $("#scene_f").val() });
            }
            function fun_set_now_address(result) {
                modal_msg("设置成功！");
            }

            function pan_scene_now_address(h, v, f) {
                $("#scene_h").val(h);
                $("#scene_v").val(v);
                $("#scene_f").val(f);
            }                       

            function pan_scene_hotspot_status(_name) {
                $("#hotspot_name").val(_name);

                var _type = kp.hotspot.systype($("#hotspot_name").val());
                
                if (_type == 1)
                {
                    set_info('project_image_hotspot_image_edit.html');
                }
                else if (_type == 4) {
                    set_info('project_image_hotspot_http_edit.html');
                }
                else
                {
                    on_pan_scene_edit_hotspot();
                }
            }

            function set_hotspotlist(list)
            {
                var _hotspot_list = "";
                hotspotlist = list;
                $.each(hotspotlist, function (i, skey) {
                    if (_hotspot_list == "")
                        _hotspot_list = skey.hotspotName;
                    else
                        _hotspot_list = _hotspot_list + "," + skey.hotspotName;
                });
                $("#hotspot_list").val(_hotspot_list);
            }
            
            //通用函数

            function get_hotspotId(name) {
                var hotspotId = 0;
                $.each(hotspotlist, function (i, skey) {
                    if (skey.hotspotName.toLowerCase() == name) {
                        hotspotId = skey.id;
                    }
                });
                return hotspotId;
            }

            function get_hotspotData(_type,name) {
                var _reuturn = null;
                $.each(hotspotlist, function (i, skey) {
                    if (skey.hotspotName.toLowerCase() == name.toLowerCase()) {
                        if (_type == "id") { _reuturn = skey.id }
                        else if (_type == "hotspotTarget") { _reuturn = skey.hotspotTarget }
                        else if (_type == "hotspotTitleView") { _reuturn = skey.hotspotTitleView }
                        else if (_type == "hotspotData") { _reuturn = skey.hotspotData }
                        else if (_type == "hotspotTitle") { _reuturn = skey.hotspotTitle }
                    }
                });
                return _reuturn;
            }

            function set_info(_url)
            {                
                _url = url_time(_url);
                $.swithView("op_setinfo", "op_main");
                $("#op_setinfo").load(_url);
            }
            function set_info_close() {                
                $.swithView("op_main", "op_setinfo");
            }

            function hotspot_set_title(_name, _title)
            {
                kp.hotspot.title(_name, _title);
            }

            function hotspot_set_scale(_name, _max, _value) {
                if (_value == null) _value = 0.1;
                if (_max) {
                    kp.hotspot.scale(_name, kp.hotspot.scale(_name) + _value);
                }
                else {
                    kp.hotspot.scale(_name, kp.hotspot.scale(_name) - _value);
                }
            }

            function hotspot_set_rotate(_name, _max, _value) {
                if (_value == null) _value = 1;
                if (_max) {
                    kp.hotspot.rotate(_name, kp.hotspot.rotate(_name) + _value);
                }
                else {
                    kp.hotspot.rotate(_name, kp.hotspot.rotate(_name) - _value);
                }
            }

        </script>
    </div>
</body>
</html>
