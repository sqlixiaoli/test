﻿<%@ Page Language="C#" %>

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
                <h1><a :href="'project_view.aspx?id='+project.id">{{project.projectName}}<small></a> > 图片管理</small></h1>
            </section>
            <section class="content">

                <div class="row">
                    <div class="col-md-8">
                        <!-- Horizontal Form -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">默认分组</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body form-horizontal" id="vue-project-image-list">

                                <div class="col-md-3">
                                    <div class="box box-widget widget-user" id="vue-project-info1">
                                        <!-- Add the bg color to the header using any of the bg-* classes -->
                                        <a :href="'project_image_add.aspx?projectid='+project.id">
                                            <div class="widget-user-header bg-black" style="background: url('') center center; height: 200px; cursor: pointer">
                                                <h3 class="widget-user-username">添加一个新场景</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <div class="col-md-3" v-for="item in list.data">
                                    <div class="box box-widget widget-user">
                                        <!-- Add the bg color to the header using any of the bg-* classes -->
                                       <a :href="'project_image_view.aspx?id='+item.id">
                                            <div class="widget-user-header bg-black" style="background: url('') center center; height: 200px; cursor: pointer">
                                                <h3 class="widget-user-username">{{item.imgTitle}}</h3>
                                                <h5 class="widget-user-desc">状态</h5>
                                            </div>
                                        </a>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="info-box bg-yellow">

                            <span class="info-box-icon"><i class="fa fa-image"></i></span>
                            <div class="info-box-content">
                                <h4>默认分组</h4>
                                <span class="info-box-number">1<small>P</small></span>
                            </div>

                            <!-- /.info-box-content -->
                        </div>

                        <div class="info-box bg-aqua">
                            <span class="info-box-icon"><i class="fa fa-image"></i></span>
                            <div class="info-box-content">
                                <h4>测试分组1 <a href="project_view.aspx?id=0">
                                    <button type="button" class="btn btn-box-tool"><i class="fa fa-edit"></i></button>
                                </a></h4>
                                <span class="info-box-number">1<small>P</small></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>


                        <div class="info-box bg-green">
                            <span class="info-box-icon"><i class="fa fa-plus-square"></i></span>
                            <div class="info-box-content">
                                <h4>添加新分组</h4>
                            </div>
                            <!-- /.info-box-content -->
                        </div>

                    </div>
                </div>
            </section>
        </div>

        <!--#include virtual="/User/menu_button.html" -->

        <script>

            ajax_user("project_image_list", { callback: 'fun_project', btnfun: 'fun_load', showdata:0, projectid: $.getUrlParam("projectid") });

            function fun_project(result) {

                var vm = new Vue({
                    el: "#vue-project-info",
                    data: result.data
                });

                var vm = new Vue({
                    el: "#vue-project-info1",
                    data: result.data
                });

                var vm = new Vue({
                    el: "#vue-project-image-list",
                    data: result.data
                });

            }

            function fun_load(data) {
                //alert("开始加载");
            }

        </script>

    </div>
</body>
</html>
