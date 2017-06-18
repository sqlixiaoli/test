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
                                          <button type="button" class="btn btn-info btn-sm" v-on:click="edit(item)">编辑</button>
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
                       editInfo: {},  //  保存正在编辑的某一项数据
                       deleteIndex: 0  //  要删除的数据的索引
                   }
               },
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
                       ajax_user("pan_page_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 0, page: this.page, pageType:1});
                   },
                   del: function(index, item) {
                       this.deleteIndex = index;
                       ajax_user("pan_page_del", { callback: 'fun_del', btnfun: 'fun_load', showdata: 0, id: item.id, pageType:1});
                   },
                   edit: function(item) {
                       this.editInfo = item;
                       modal_def('编辑网页','page_edit.html?call=page_editend');
                   }
               }
            });
            //  编辑时更新模态窗的数据
             $(document).on('shown.bs.modal', '#modal_box', function () {
                 $('#pan_page_edit').find('input[name="pageTitle"]').val(vm.editInfo.pageTitle).end().find('input[name="id"]').val(vm.editInfo.id);
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
            function page_addend(result)
            {
               alert("添加完成！");
               setTimeout(function() {
                   window.location.reload();
               }, 1000);
            }
            function fun_del(result) {
                vm.list.data.splice(vm.deleteIndex, 1);
                vm.list.total --;
                vm.loading = false;
                alert('删除成功');
            }
            function page_editend(result)
            {
                vm.editInfo = {};
                 setTimeout(function() {
                     window.location.reload();
                 }, 1000);
                alert("编辑完成！");
            }
        </script>

        <!--#include virtual="/User/menu_button.html" -->

    </div>
</body>
</html>
