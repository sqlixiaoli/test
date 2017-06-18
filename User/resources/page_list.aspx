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
                    <button type="button" class="btn btn-primary col-md-offset-10 col-sm-offset-0 col-xs-offset-0">添加</button>
                    <div class="box">
                         <div class="box-body">
                         <table class="table table-bordered">
                              <tbody>
                                  <tr>
                                      <th>标题</th>
                                      <th>更新时间</th>
                                      <th>操作</th>
                                  </tr>
                                  <tr v-if="!!list.data && list.data.length > 0 && !loading" v-for="item in list.data">
                                      <td>{{item.title}}</td>
                                      <td>{{item.datetime}}</td>
                                      <td class="text-center">
                                          <button type="button" class="btn btn-info btn-sm">編輯</button>
                                          <button type="button" class="btn btn-info btn-sm">刪除</button>
                                      </td>
                                  </tr>
                                  <tr v-if="(!list.data || list.data.length <= 0) && !loading"><td class="text-center">没有数据</td></tr>
                                <!--  <tr v-if="!!loading"><td class="text-center">正在加载中...</td></tr>-->
                              </tbody>
                         </table>
                         </div>
                         <div class="box-footer clearfix" v-if="!loading && Math.ceil(list.total/list.prepage) > 1">
                             <ul class="pagination pagination-sm no-margin pull-right">
                                  <li v-on:click="setPage(page - 1)">«</li>
                                  <li v-for="item in Math.ceil(list.total/list.prepage)" v-on:click="getList(item)">
                                       {{item}}
                                  </li>
                                  <li v-on:click="setPage(page + 1)">»</li>
                             </ul>
                          </div>
                     </div>
                </div>

            </section>
        </div>

        <script>
            var vm = new Vue({
               el:"#vue-content",
               loading: false,
               list: {},
               page: 1, //  当前要请求第几页
               mounted: function() {
                   this.getList();
               },
               methods: {
                   setPage: function(page) {
                       if(!(page <= 0 || page > Math.ceil(this.list.total/this.list.prepage))) {
                           this.page = page;
                           this.getList();
                       }
                   },
                   getList: function() {
                       ajax_user("pan_page_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 1, page: this.page, pageType:1});
                   }
               }
            });
            function fun_list(result) {
                vm.list = {};
                vm.list = result.data.list;
                vm.loading = false;
            }
            function fun_load(data) {
               // alert("开始加载");
                vm.loading = true;
            }
        </script>

        <!--#include virtual="/User/menu_button.html" -->

    </div>
</body>
</html>
