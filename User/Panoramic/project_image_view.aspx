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
                <h1><a :href="'project_view.aspx?id='+project.id">{{project.projectName}}</a>  > <a :href="'project_image_list.aspx?projectid='+info.id">场景管理</a> <small> > {{info.imgTitle}}</small></h1>
            </section>
            <section class="content">

                <div class="row">
                    <div class="col-md-10" id="vue-project-info1">
                        <!-- Horizontal Form -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">场景管理【{{info.imgTitle}}】</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body form-horizontal" id="vue-project-image-list">
                                <iframe :src="'/User/PAN/edit_scene.aspx?id='+info.id" style="width:100%; height:700px;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2">
                         <div class="box box-primary">
            <div class="box-header">
              <i class="fa fa-edit"></i>

              <h3 class="box-title">操作</h3>
            </div>
                              <div class="box-body pad table-responsive">

                                  <button type="button" class="btn btn-block btn-primary btn-lg" onclick="set_scene_now_address()">设置为初始位置</button>                                


                                  <button type="button" class="btn btn-block btn-primary btn-lg">Primary</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg">Primary</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg">Primary</button>
                                  <button type="button" class="btn btn-block btn-primary btn-lg">Primary</button>

                              </div>

                             <div style="display:none">
                                 <input type="hidden" id="scene_h" value="0" />
                                  <input type="hidden" id="scene_v" value="0" />
                                  <input type="hidden" id="scene_f" value="0" />
                             </div>

                             </div>

                    </div>
                </div>
            </section>
        </div>

        <!--#include virtual="/User/menu_button.html" -->

        <script>

            ajax_user("project_image_get", { callback: 'fun_info', btnfun: 'fun_load', showdata: 0, id: $.getUrlParam("id") });

            function fun_info(result) {

                var vm = new Vue({
                    el: "#vue-project-info",
                    data: result.data
                });

                var vm = new Vue({
                    el: "#vue-project-info1",
                    data: result.data
                });
            }

            function fun_load(data) {
                //alert("开始加载");
            }

            //设置当前位置
            function set_scene_now_address()
            {
                ajax_user("project_image_edit", { callback: 'fun_set_now_address', showdata: 0, id: $.getUrlParam("id"), hlookat: $("#scene_h").val(), vlookat: $("#scene_v").val(), fov: $("#scene_f").val() });
            }
            function fun_set_now_address(result)
            {
                alert("设置成功！");
            }
            function pan_scene_now_address(h, v, f) {
                $("#scene_h").val(h);
                $("#scene_v").val(v);
                $("#scene_f").val(f);
            }



        </script>

    </div>
</body>
</html>
