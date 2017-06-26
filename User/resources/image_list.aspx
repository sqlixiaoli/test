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
                <h1>贴图管理<small>0</small></h1>
            </section>
            <section class="content" id="vue-content">

                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">贴图列表</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-primary" onclick="modal_def('添加贴图','image_add.html')"> 添加</button>
                                </div>
                            </div>
                            <div class="box-body">

                                <div class="somo_imgbox">
                                    <div class="image" v-for="(item, index) in list" :key="index">
                                        <div class="item">
                                            <img :src="item.imgFile" />
                                            <h3 class="clearfix">
                                                {{item.imgTitle}}
                                                 <span class="fa fa-edit pull-right" @click="edit(item, index)" role="button"></span>
                                            </h3>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </div>

        <script src="/style/user/js/page.js"></script>
        <script>
           var vm = new Vue({
               el: '#vue-content',
               data: function() {
                   return {
                       list: [],
                       editIndex:　''
                   }
               },
               mounted: function() {
                   ajax_user('resources_image_list', {callback: 'fun_get_list', imgType: 1});
               },
               methods: {
                   edit: function(item, index) {
                       this.editIndex = index;
                       modal_def('编辑贴图','image_edit.html?call=fun_edit_end&id=' + item.id + '&imgFile=' +item.imgFile+ '&imgTitle=' + item.imgTitle);
                   }
               }
           });
           function fun_get_list(result) {
               vm.list = [];
               if(result.status.toString().toLocaleLowerCase() === 'ok') {
                   vm.list = result.data.list.data;
                   vm.total = parseInt(result.data.list.total);
                   vm.prepage = parseInt(result.data.list.prepage) || 1;
               }
           }
           function fun_edit_end(result) {
               vm.list.splice(vm.editIndex, 1, result.data.info);
               vm.editIndex = '';
           }
        </script>

        <!--#include virtual="/User/menu_button.html" -->

    </div>
</body>
</html>
