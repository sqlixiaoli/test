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

                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="pan_scene_hotspot_scale(true)">+</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="pan_scene_hotspot_scale(false)">-</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="pan_scene_hotspot_add()">保存数据</button>


                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="pan_scene_hotspot_delete()">管理场景跳转</button>

                                  <button type="button" class="btn btn-block btn-primary btn-lg">管理热点链接</button>

                                  <button type="button" class="btn btn-block btn-primary btn-lg">设置背景音乐</button>

                              </div>
                             
                             </div>

                        <!--#include virtual="project_image_hotspot_scene_add.html" -->

                        <div style="display:block">
                                 <input type="input" id="scene_h" value="0" />
                                  <input type="input" id="scene_v" value="0" />
                                  <input type="input" id="scene_f" value="0" />
                                  <input type="input" id="hotspot_name" value="" />
                                  <input type="input" id="hotspot_title" value="" />
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

            ajax_user("project_image_get", { callback: 'fun_info', btnfun: 'fun_load', showdata: 0, id: $.getUrlParam("id"), hotspot:1 });
            function fun_info(result) {

                var vm = new Vue({
                    el: "#vue-project-info",
                    data: result.data
                });

                var vm = new Vue({
                    el: "#vue-project-info1",
                    data: result.data
                });

                var _hotspot_list = "";
                $.each(result.data.hotspot.data, function (i, skey) {
                    if (_hotspot_list == "")
                        _hotspot_list = skey.hotspotName;
                    else
                        _hotspot_list = _hotspot_list + "," + skey.hotspotName;
                });

                $("#hotspot_list").val(_hotspot_list);

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
            }



            function fun_load(data) {
                //alert("开始加载");
            }

            //设置当前位置
            function set_scene_now_address() {
                ajax_user("project_image_edit", { callback: 'fun_set_now_address', showdata: 0, id: $.getUrlParam("id"), hlookat: $("#scene_h").val(), vlookat: $("#scene_v").val(), fov: $("#scene_f").val() });
            }
            function fun_set_now_address(result) {
                alert("设置成功！");
            }

            function pan_scene_now_address(h, v, f) {
                $("#scene_h").val(h);
                $("#scene_v").val(v);
                $("#scene_f").val(f);
            }

            function pan_scene_add_hotspot() {
                var panobj = document.getElementById("panobj");
                var _name = "hotspot_" + Math.uuid(18, 16);
                var _title = "1";
                kp.hotspot.add(_name, "/File/icon/vtourskin_hotspot.png", $("#scene_h").val(), $("#scene_v").val(), _title);
                $("#hotspot_name").val(_name);
                $("#hotspot_title").val(_title);
            }

            function pan_scene_hotspot_scale(isadd) {
                var name = $("#hotspot_name").val();
                if (isadd) {
                    kp.hotspot.scale(name, kp.hotspot.scale(name) + 0.1);
                }
                else { kp.hotspot.scale(name, kp.hotspot.scale(name) - 0.1); }
            }
            

            function pan_scene_hotspot_status(_name, h, v, _scale, _rotate, _url) {

            }

            function pan_scene_hotspot_status1() {
                //var name = $("#hotspot_name").val();
                //$("#hotspot_h").val(pan_hotspot_get_val(name, "ath"));            
            }

            function pan_scene_hotspot_delete() {
                // var name = $("#hotspot_name").val();
                //// kp.hotspot.visible(name, false);
                // alert(kp.hotspot.ath(name));
                // alert(kp.hotspot.ath(name));
            }

            //function pan_hotspot_get_val(_name,ac)
            //{
            //    return panobj.contentWindow.getkp().get("hotspot['" + _name + "']." + ac);
            //}
            //function pan_hotspot_get_set(_name, ac,val) {
            //    panobj.contentWindow.getkp().set("hotspot['" + _name + "']." + ac,val);
            //}

            //通用函数
            function hotspot_set_title(_name, _title)
            {
                kp.hotspot.title(_name, _title);
            }

            function hotspot_set_scale(_name, _max) {
                if (_max) {
                    kp.hotspot.scale(_name, kp.hotspot.scale(_name) + 0.1);
                }
                else {
                    kp.hotspot.scale(_name, kp.hotspot.scale(_name) - 0.1);
                }
            }

        </script>
    </div>
</body>
</html>
