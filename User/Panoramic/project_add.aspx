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
                <h1>新建项目</h1>
            </section>

            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-warning  with-border">
                            <div class="box-header">
                                <h3 class="box-title">基本信息</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body form-horizontal">

                                <form action="project_add" method="post">
                                    <input type="hidden" name="callback" value="fun_post" />
                                    <input type="hidden" name="btnfun" value="fun_load" />
                                    <input type="hidden" name="showdata" value="0" />

                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">项目名称</label>
                                        <div class="col-sm-6">
                                            <input name="projectName" class="form-control" placeholder="请输入项目名称 ..." type="text">
                                        </div>
                                        <span class="help-block col-sm-4">*项目名称长度不能超过15个字符</span>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-block btn-flat submit_user">提交</button>
                                    </div>
                                </form>

                                <script>
                                    function fun_post(data) {
                                        loading_hide();
                                        if (data.status == "OK") {
                                            location.href = "Panoramic/project_list.aspx?status=-1";
                                        }
                                        else {
                                            modal_msg(data.statusMsg, 2);
                                        }
                                    }

                                    function fun_load(data) {
                                        loading();
                                    }
                                </script>

                            </div>
                            <!-- /.box-body -->
                        </div>

                    </div>
                </div>
            </section>
        </div>

        <!--#include virtual="/User/menu_button.html" -->
    </div>
</body>
</html>
