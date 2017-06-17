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

            <section class="content-header">
                <h1>我的项目<small>0</small></h1>
            </section>
            <section class="content" id="vue-content">
                                
                <div class="row">                     

                    <div class="col-md-4" v-for="item in list.data">
                        <div class="box box-widget widget-user">
                            <!-- Add the bg color to the header using any of the bg-* classes -->
                            <a :href="'project_view.aspx?id='+item.id">
                                <div class="widget-user-header bg-black" style="background: url('/style/dist/img/photo1.png') center center; height: 200px; cursor: pointer">
                                    <h3 class="widget-user-username">{{item.projectName}}</h3>
                                    <h5 class="widget-user-desc"><span :class="'.project_statusView_'+item.statusView">{{item.statusView}}</span></h5>
                                </div>
                            </a>
                            <div class="box-footer">
                                <div class="row">
                                    <div class="col-sm-3 border-right">
                                        <div class="description-block">
                                            <h5 class="description-header">0</h5>
                                            <span class="description-text">场景数量</span>
                                        </div>
                                        <!-- /.description-block -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-sm-3 border-right">
                                        <div class="description-block">
                                            <h5 class="description-header">0</h5>
                                            <span class="description-text">浏览数</span>
                                        </div>
                                        <!-- /.description-block -->
                                    </div>

                                    <!-- /.col -->
                                    <div class="col-sm-3 border-right">
                                        <div class="description-block">
                                            <h5 class="description-header">0</h5>
                                            <span class="description-text">点赞次数</span>
                                        </div>
                                        <!-- /.description-block -->
                                    </div>

                                    <!-- /.col -->
                                    <div class="col-sm-3">
                                        <div class="description-block">
                                            <h5 class="description-header">0</h5>
                                            <span class="description-text">评论</span>
                                        </div>
                                        <!-- /.description-block -->
                                    </div>
                                    <!-- /.col -->
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                    </div>


                </div>
            </section>
        </div>

        <script>
            ajax_user("project_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 0, page: 1, status: $.getUrlParam("status")});
            function fun_list(result) {
              var vm = new Vue({
                el:"#vue-content",
                data:result.data
              });  
            }

            function fun_load(data) {
                //alert("开始加载");
            }

        </script>

        <!--#include virtual="/User/menu_button.html" -->

    </div>
</body>
</html>
