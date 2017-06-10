<%@ Page Language="C#" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录平台</title>
    <!--#include virtual="head.html" -->   
</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="/"><b>Yun</b>TU</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">登录平台</p>

            <form action="login" method="post">

                <input type="hidden" name="callback" value="fun_Login" />
                <input type="hidden" name="btnfun" value="fun_load" />
                <input type="hidden" name="showdata" value="0" />

                <div class="form-group has-feedback">
                    <input name="username" type="text" class="form-control" placeholder="手机">
                    <span class="glyphicon glyphicon-phone  form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input name="password" type="password" class="form-control" placeholder="密码">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <input type="checkbox"> 记住密码
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="button" class="btn btn-primary btn-block btn-flat submit_user">登录</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>
            <!-- /.social-auth-links -->

        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->
    <!-- jQuery 2.2.3 -->
    <script src="/style/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/style/bootstrap/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="/style/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });

        function fun_Login(data)
        {          
            if (data.status == "OK")
            {
                location.href = "Panoramic/project_list.aspx?status=-1";
            }
            else
                alert(data.statusMsg);
        }

        function fun_load(data)
        {
            //alert("fun_load");
        }

        user_submit();
    </script>
</body>
</html>
