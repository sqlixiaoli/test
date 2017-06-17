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
                <h1>网页管理<small>0</small></h1>
            </section>
            <section class="content" id="vue-content">
                                
                <div class="row">                     

                    <!-- todo 列表页 pan_page_list 仅显示标题和更新时间，其它可以不显示 ，后面做个编辑按钮，DIV，pan_page_edit  -->
                    <!-- todo 还需要有一个添加按钮，添加弹出DIV pan_page_add  -->
                    <a href="page_view.aspx?pageId=0">网页内容页</a>

                </div>
            </section>
        </div>

        <script>
            ajax_user("pan_page_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 1, page: 1, pageType:1});
            function fun_list(result) {
              //var vm = new Vue({
              //  el:"#vue-content",
              //  data:result.data
              //});  
            }

            function fun_load(data) {
                //alert("开始加载");
            }

        </script>

        <!--#include virtual="/User/menu_button.html" -->

    </div>
</body>
</html>
