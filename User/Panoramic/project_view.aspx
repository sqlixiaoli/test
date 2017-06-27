<%@ Page Language="C#" %>

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
                <h1>{{info.projectName}}</h1>
                <ol class="breadcrumb">
                    <li><a href="/User/Panoramic/project_list.aspx?status=-1"><i class="fa fa-bars"></i>我的项目</a></li>
                    <li class="active">项目管理</li>
                </ol>
            </section>

            <section class="content somo_content">

                <div class="somo_box col-md-12">
                    <div class="title">
                        <h3>项目信息</h3>
                        <ol></ol>
                        <div style="clear: both"></div>
                    </div>
                    <div class="boxinfo">
                        <div class="lt p10" style="width: 320px;">
                            <img src="/style/dist/img/photo1.png" style="width: 300px; height: 200px; margin-bottom: 10px;" />
                            <button type="button" class="btn btn-block btn-primary btn-lg">全景图管理</button>
                        </div>
                        <div class="lt col-md-9">
                            <table class="tab_add">
                                <tr>
                                    <td class="name" style="width: 100px;">公司名称：</td>
                                    <td>拼床广告策划邮箱公司</td>
                                </tr>
                                <tr>
                                    <td class="name">联系电话：</td>
                                    <td>15038333658</td>       
                                </tr>
                                <tr>
                                    <td class="name">联系地址：</td>
                                    <td>河南省郑州市中原区电厂路大学科技园东区18号楼B座12层</td>
                                </tr>
                                <tr>
                                    <td class="name">官方网址：</td>
                                    <td>http://www.baidu.com</td>
                                </tr>
                                <tr>
                                    <td class="name">当前状态：</td>
                                    <td>下线 </td>
                                </tr>
                            </table>
                        </div>
                        <div class="cl"></div>
                    </div>

                </div>


                <div class="somo_box col-md-3">
                    <div class="title">
                        <h3>项目管理</h3>
                        <ol></ol>
                        <div style="clear: both"></div>
                    </div>
                    <div class="boxinfo p10">

                        <table class="tab_add">
                            <tr>
                                <td class="name" style="width: 100px;">统计数据：</td>
                                <td>显示</td>
                            </tr>
                            <tr>
                                <td class="name">联系电弧：</td>
                                <td>显示</td>
                            </tr>
                            <tr>
                                <td class="name">二维码：</td>
                                <td>显示</td>
                            </tr>
                            <tr>
                                <td class="name">官方网址：</td>
                                <td>显示</td>
                            </tr>
                            <tr>
                                <td class="name">评论：</td>
                                <td>开启</td>
                            </tr>
                            <tr>
                                <td class="name">自动旋转：</td>
                                <td>开启</td>
                            </tr>
                            <tr>
                                <td class="name">背景音乐：</td>
                                <td>开启</td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="somo_box">
                        <div class="title">
                            <h3>项目设置</h3>
                            <ol></ol>
                            <div style="clear: both"></div>
                        </div>
                        <div class="boxinfo p10">

                            <table class="tab_add">

                                <tr>
                                    <td style="width:50%">项目LOGO</td>
                                    <td style="width:50%">二维码</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="http://developer.baidu.com/map/static/img/js_fn4.jpg" style="width: 100%;" /></td>
                                    <td>
                                        <img src="https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1062989499,1682648318&fm=58" style="width: 100%;" /></td>
                                </tr>
                               
                                <tr>
                                    <td colspan="2">百度地图</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <img src="http://developer.baidu.com/map/static/img/js_fn4.jpg" style="width: 100%;" /></td>
                                </tr>


                            </table>

                        </div>
                    </div>
                </div>

                <div class="somo_box col-md-3">
                    <div class="title">
                        <h3>统计数据</h3>
                        <ol></ol>
                        <div style="clear: both"></div>
                    </div>
                    <div class="boxinfo p10">

                        <!-- Info Boxes Style 2 -->
                        <div class="info-box bg-yellow">
                            <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Inventory</span>
                                <span class="info-box-number">5,200</span>

                                <div class="progress">
                                    <div class="progress-bar" style="width: 50%"></div>
                                </div>
                                <span class="progress-description">50% Increase in 30 Days
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                        <div class="info-box bg-green">
                            <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Mentions</span>
                                <span class="info-box-number">92,050</span>

                                <div class="progress">
                                    <div class="progress-bar" style="width: 20%"></div>
                                </div>
                                <span class="progress-description">20% Increase in 30 Days
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                        <div class="info-box bg-red">
                            <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Downloads</span>
                                <span class="info-box-number">114,381</span>

                                <div class="progress">
                                    <div class="progress-bar" style="width: 70%"></div>
                                </div>
                                <span class="progress-description">70% Increase in 30 Days
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                        <div class="info-box bg-aqua">
                            <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Direct Messages</span>
                                <span class="info-box-number">163,921</span>

                                <div class="progress">
                                    <div class="progress-bar" style="width: 40%"></div>
                                </div>
                                <span class="progress-description">40% Increase in 30 Days
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>

                        <!-- /.info-box -->

                    </div>
                </div>

                <div class=" col-md-3">
                    <div class="somo_box">
                        <div class="title">
                            <h3>项目资源库</h3>
                            <ol></ol>
                            <div style="clear: both"></div>
                        </div>
                        <div class="boxinfo p10">
                            <button type="button" class="btn btn-block btn-primary btn-lg">网页管理</button>
                            <button type="button" class="btn btn-block btn-primary btn-lg">贴图管理</button>
                            <button type="button" class="btn btn-block btn-primary btn-lg">画册管理</button>
                            <button type="button" class="btn btn-block btn-primary btn-lg">视频管理</button>
                            <button type="button" class="btn btn-block btn-primary btn-lg">3D立体动画</button>
                            <button type="button" class="btn btn-block btn-primary btn-lg">产品管理</button>
                        </div>
                    </div>
                </div>

                <div class="cl"></div>
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
