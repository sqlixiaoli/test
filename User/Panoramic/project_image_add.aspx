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
                  <h1><a :href="'project_view.aspx?id='+info.id">{{info.projectName}}</a> > <a :href="'project_image_list.aspx?projectid='+info.id">图片管理</a> <small> > 添加场景</small></h1>
            </section>
            <section class="content">

                <div class="row">

                    <div class="col-md-12">

                        <form action="project_image_add" method="post">

                            <input type="hidden" name="callback" value="fun_add" />
                            <input type="hidden" name="btnfun" value="fun_load" />
                            <input type="hidden" name="showdata" value="1" />

                            <div class="box box-warning  with-border">
                                <div class="box-header">
                                    <h3 class="box-title">场景信息</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body form-horizontal">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">场景名称</label>
                                        <div class="col-sm-6">
                                            <input name="title" class="form-control" placeholder="请输入场景名称 ..." type="text">
                                        </div>
                                        <span class="help-block col-sm-4">*场景名称长度不能超过15个字符</span>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">场景类型</label>
                                        <div class="col-sm-6">
                                            <select class="form-control" name="imgtype">
                                                <option value="0">全景图</option>
                                                <option value="1">平面图</option>
                                            </select>
                                        </div>
                                        <span class="help-block col-sm-4"></span>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">所属分组</label>
                                        <div class="col-sm-6">
                                            <select class="form-control" name="groupId">
                                                <option value="0">默认分组</option>
                                            </select>
                                        </div>
                                        <span class="help-block col-sm-4"></span>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">上传图片</label>
                                        <div class="col-sm-6">
                                        </div>
                                        <span class="help-block col-sm-4"></span>
                                    </div>

                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary submit_user">添加</button>                                         
                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>
                        </form>
                    </div>

                </div>
            </section>
        </div>

        <!--#include virtual="/User/menu_button.html" -->

        <script>

            ajax_user("project_get", { callback: 'fun_project', btnfun: 'fun_load', showdata: 0, id: $.getUrlParam("projectid") });

            function fun_project(result) {
                var vm = new Vue({
                    el: "#vue-project-info",
                    data: result.data
                });
            }

            function fun_load(data) {
                //alert("开始加载");
            }

            function fun_add(result)
            { }

        </script>

    </div>
</body>
</html>
