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
                     <div class="col-md-12">
                    <!-- todo 列表页 pan_page_list 仅显示标题和更新时间，其它可以不显示 ，后面做个编辑按钮，DIV，pan_page_edit  -->
                    <!-- todo 还需要有一个添加按钮，添加弹出DIV pan_page_add  -->
                    <div class="box box-info">
                         <div class="box-header with-border">
                             <h3 class="box-title">网页列表</h3>
                             <div class="box-tools pull-right">
                                 <a class="btn btn-success" href="page_view.aspx?pageId=0">网页内容页</a>
                                 <button type="button" class="btn btn-primary"
                                     onclick="modal_def('添加网页','page_add.html?call=page_addend')">添加</button>
                             </div>
                         </div>
                         <div class="box-body">
                         <table class="table table-bordered">
                              <tbody>
                                  <tr>
                                      <th>标题</th>
                                      <th class="text-center" width="150">更新时间</th>
                                      <th class="text-center" width="180">操作</th>
                                  </tr>
                                  <tr v-if="!!list.data && list.data.length > 0 && !loading" v-for="(item, index) in list.data">
                                      <td>{{item.pageTitle}}</td>
                                      <td class="text-center">{{item.timeUp}}</td>
                                      <td class="text-center">
                                          <a class="btn btn-info btn-sm" :href="'/User/resources/page_view.aspx?pageId=' + item.id">编辑</a>
                                          <button type="button" class="btn btn-danger btn-sm" v-on:click="del(index, item)">刪除</button>
                                      </td>
                                  </tr>
                                  <tr v-if="(!list.data || list.data.length <= 0) && !loading"><td class="text-center">没有数据</td></tr>
                              </tbody>
                         </table>
                         </div>
                         <div class="box-footer clearfix" v-if="!loading && Math.ceil(list.total/list.prepage) > 1">
                             <ul class="pagination pagination-sm no-margin pull-right">
                                  <li v-on:click="setPage(page - 1)"><a href="javascript:void(0)">«</a></li>
                                  <li v-for="item in Math.ceil(list.total/list.prepage)" v-on:click="setPage(item)">
                                       <a href="javascript:void(0)">{{item}}</a>
                                  </li>
                                  <li v-on:click="setPage(page + 1)"><a href="javascript:void(0);">»</a></li>
                             </ul>
                          </div>
                     </div>
                </div>
                </div>

            </section>
        </div>

        <script>
            var vm = new Vue({
               el:"#vue-content",
               data: function() {
                   return {
                       loading: false,
                       list: {},
                       page: 1, //  当前要请求第几页
                       deleteInfo: {}  //  当前要删除的网页 信息
                   }
               },
               mounted: function() {
                   ajax_user("pan_page_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 0, page: this.page, pageType:1});
               },
               methods: {
                   setPage: function(page) {
                       if(!(page <= 0 || page > Math.ceil(this.list.total/this.list.prepage))) {
                           this.page = page;
                           ajax_user("pan_page_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 0, page: this.page, pageType:1});
                       }
                   },
                   del: function(index, item) {
                       this.deleteInfo = item;
                       modal_mutual('提示','确定要删除 "'+item.pageTitle+'" 网页吗？',"cal_fun_del","modal_box_hide");
                   }
               }
            });

            function cal_fun_del() {
                ajax_user("pan_page_del", { callback: 'fun_del_success', btnfun: 'fun_load_del', showdata: 0, id: vm.deleteInfo.id, pageType: 1 });
            }
            function fun_del_success(result) {
                loading_hide();
                modal_msg("删除成功",2, "");  // 刷新页面
            }
            function fun_list(result) {
                vm.list = {};
                vm.list = result.data.list;
                vm.loading = false;
                loading_hide();
            }
            function fun_load_del(data) {
                 loading("正在删除……");
            }
            function fun_load(data) {
                vm.loading = true;
                loading("正在加载……");
            }
            function page_addend(result)
            {
                modal_msg("添加完成",2, "/User/resources/page_view.aspx?pageId=" +result.data.id);
            }
        </script>

        <!--#include virtual="/User/menu_button.html" -->

    </div>
</body>
</html>
