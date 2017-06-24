<%@ page language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>云图 | Yun-TU</title>
    <!--#include virtual="/User/head.html" -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper" id="vue-projetc_view-content">

        <!--#include virtual="/User/menu_left.html" -->

        <div class="content-wrapper">
            <section class="content-header">
                <h1>{{info.projectName}}<small>0</small></h1>
            </section>
            <section class="content">

                <!-- Info boxes -->
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-aqua"><i class="fa fa-files-o"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">场景数量</span>
                                <span class="info-box-number">0<small></small></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-red"><i class="fa fa-television"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">浏览数</span>
                                <span class="info-box-number">0</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->

                    <!-- fix for small devices only -->
                    <div class="clearfix visible-sm-block"></div>

                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-green"><i class="fa fa-thumbs-o-up"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">点赞次数</span>
                                <span class="info-box-number">0</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">评论</span>
                                <span class="info-box-number">0</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->




                <div class="row">
                    <div class="col-md-8">
                        <!-- Horizontal Form -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">项目基本信息</h3>
                                <div class="box-tools pull-right">
                                    <a href="project_view.aspx?id=0">
                                        <button type="button" class="btn btn-box-tool"><i class="fa fa-edit"></i></button>
                                    </a>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目名称：</label>
                                    <p class="col-sm-10 control-label" style="text-align: left">
                                        <a :href="'/pan/'+info.uuid+'.html'" target="_blank">{{info.projectName}}</a>                       
                                            <button type="button" @click="editProjectName(info.projectName)" class="btn btn-box-tool"><i class="fa fa-edit"></i></button>
                                    
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目状态：</label>
                                    <p class="col-sm-10 control-label" style="text-align: left">{{info.statusView}}</p>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">公司名称：</label>
                                    <p class="col-sm-10 control-label" style="text-align: left"></p>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">联系电话：</label>
                                    <p class="col-sm-10 control-label" style="text-align: left"></p>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">地址：</label>
                                    <p class="col-sm-10 control-label" style="text-align: left"></p>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">网址：</label>
                                    <p class="col-sm-10 control-label" style="text-align: left"></p>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">微信二维码：</label>
                                    <p class="col-sm-10 control-label" style="text-align: left"></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="info-box bg-yellow">

                            <span class="info-box-icon"><i class="fa fa-image"></i></span>
                            <div class="info-box-content">
                                <a :href="'project_image_list.aspx?projectid='+info.id">
                                    <h4>全景图片管理</h4>
                                    <span class="info-box-number">1<small>P</small></span>
                                </a>
                            </div>

                            <!-- /.info-box-content -->
                        </div>

                        <div class="info-box bg-aqua">
                            <span class="info-box-icon"><i class="fa fa-image"></i></span>
                            <div class="info-box-content">
                                <h4>热点管理</h4>
                                <span class="product-description">不显示</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>


                        <div class="info-box bg-green">
                            <span class="info-box-icon"><i class="fa fa-image"></i></span>
                            <div class="info-box-content">
                                <h4>项目材料库</h4>
                                <span class="info-box-number">1<small>P</small></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>

                    </div>
                </div>
            </section>
        </div>        
    </div>

    <script>
            ajax_user("project_get", { callback: 'fun_list', btnfun: 'fun_load', showdata: 0, id: $.getUrlParam("id"), user: 1 });
            function fun_list(result) {

                var vm = new Vue({
                    el: "#vue-projetc_view-content",
                    data: result.data,
                    methods: {
                        editProjectName: function (projetcName) {
                            editBox("项目名称", "input", function (data) { alert(data) }, projetcName);
                        }
                    }
                });

                loading_hide();

            }

            function fun_load(data) {
                //alert("开始加载");
                loading();
            }

        </script>
        <!--#include virtual="/User/menu_button.html" -->
</body>
</html>
