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

                    <!-- 内容列表 pan_page_info_list -->
                    <!-- 有个添加按钮，可以添加内容，用弹出DIV pan_page_info_add  -->
                    <!-- 有个删除按钮，可以删除内容的一部分 pan_page_info_del  -->
                    <!-- 拖动内容时可以排序 pan_page_info_order  -->

                    <!-- 随便添加测试 -->
                    <button type="button" class="btn btn-primary" onclick="modal_def('添加网页','page_add.html?call=page_addend')">添另网页测试</button>

                </div>
            </section>
        </div>

        <script>


            function page_addend(result)
            {
                alert("添加完成！");
            }

            ajax_user("pan_page_info_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 1, pageId: $.getUrlParam("pageId") });
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
