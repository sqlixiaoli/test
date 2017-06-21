<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>云图 | Yun-TU</title>

    <!--#include virtual="/User/head.html" -->

    <link rel="stylesheet" href="../../style/user/css/defined-editor.css">



    <style>
    .main-sidebar, .main-header, .main-footer {
    display: none !important;
    }
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <!--#include virtual="/User/menu_left.html" -->



    <div class="content-wrapper">
<!--
        <section class="content-header">
            <h1>网页管理<small>0</small></h1>
        </section>-->
        <section class="content" id="vue-content">
            <div class="row">
                <!-- 内容列表 pan_page_info_list -->
                <!-- 有个添加按钮，可以添加内容，用弹出DIV pan_page_info_add  -->
                <!-- 有个删除按钮，可以删除内容的一部分 pan_page_info_del  -->
                <!-- 拖动内容时可以排序 pan_page_info_order  -->

                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border clearfix">
                            <div class="pull-right">
                                <button type="button" class="btn btn-primary" onclick="modal_def('添加网页','page_add.html?call=page_addend')">添加网页</button>
                            </div>
                        </div>
                        <div class="box-body editor-content">
                            <header class="page-title">
                                <span>{{pageTitle}}</span>
                                <span class="fa fa-edit" role="button"
                                      v-on:click="modal_def('编辑网页标题', 'page_edit.html?call=page_edit_pageTitle&pageTitle='+pageTitle)"></span>
                                <div class="tool">
                                    <span class="fa fa-image"
                                          v-on:click="modal_def('插入图片','page_add_info.html?call=page_add_info_end&infoType=10&orderBy='+(minOrderBy-1))" role="button"></span>
                                    <span class="fa fa-file-text-o"
                                          v-on:click="modal_def('添加内容','page_add_info.html?call=page_add_info_end&infoType=0&orderBy='+(minOrderBy-1))" role="button"></span>
                                    <span class="fa"
                                          v-on:click="modal_def('添加标题一','page_add_info.html?call=page_add_info_end&infoType=1&orderBy='+(minOrderBy-1))" role="button">H1</span>
                                    <span class="fa"
                                          v-on:click="modal_def('添加标题二','page_add_info.html?call=page_add_info_end&infoType=2&orderBy='+(minOrderBy-1))" role="button">H2</span>
                                </div>
                            </header>
                            <article class="html-body">
                                <draggable :list="list">
                                    <transition-group name="list-complete">
                                        <div class="area" v-for="(item, index) in list" :key="index" v-if="list.length > 0">
                                            <div v-if="item.infoType == 1" class="title-l1">{{item.inputInfo}}</div>
                                            <div v-if="item.infoType == 2" class="title-l2">{{item.inputInfo}}</div>
                                            <div v-if="item.infoType == 0" class="desc">{{item.inputInfo}}</div>
                                            <img v-if="item.infoType == 10" :src="item.filepath" alt="" class="img" />
                                            <div class="tool">
                                                <span class="fa fa-edit" role="button"
                                                      v-on:click="modal_def('修改', 'page_edit_info.html?call=page_edit_info_end&infoType=' +item.infoType+ '&orderBy='+(maxOrderBy+1))"></span>
                                                <span class="fa fa-trash"
                                                      v-on:click="del(item, index)" role="button"></span>
                                                <span class="fa fa-image"
                                                      v-on:click="modal_def('插入图片','page_add_info.html?call=page_add_info_end&infoType=10&orderBy='+(maxOrderBy+1))" role="button"></span>
                                                <span class="fa fa-file-text-o"
                                                      v-on:click="modal_def('添加内容','page_add_info.html?call=page_add_info_end&infoType=0&orderBy='+(maxOrderBy+1))" role="button"></span>
                                                <span class="fa"
                                                      v-on:click="modal_def('添加标题一','page_add_info.html?call=page_add_info_end&infoType=1&orderBy='+(maxOrderBy+1))" role="button">H1</span>
                                                <span class="fa"
                                                      v-on:click="modal_def('添加标题二','page_add_info.html?call=page_add_info_end&infoType=2&orderBy='+(maxOrderBy+1))" role="button">H2</span>
                                            </div>
                                        </div>
                                    </transition-group>
                                </draggable>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script>
        var vm = new Vue({
            el: '#vue-content',
            data: function() {
                return {
                    pageTitle: '页面标题',
                    list: [],
                    deleteInfo: {deleteIndex: ''},
                    minOrderBy: 0,  // 基于 orderBy
                    maxOrderBy: 1   // 基于 orderBy
                }
            },
            mounted: function() {
                ajax_user("pan_page_info_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 0, pageId: $.getUrlParam("pageId") });
            },
            methods: {
                modal_def: function(title, url){  // 中转一下 modal_def 方法
                    modal_def(title, url);
                },
                del: function(item, index) {
                    item.deleteIndex = index;
                    this.deleteInfo = item;
                    modal_mutual("提示","确定要删除吗？","call_fun_del","modal_box_hide");
                }
            }
        });
        function page_addend(result){  //  添加新网页
            modal_msg("添加完成");
        }
        function fun_list(result) {  //  获取到内容列表
            vm.list = [];
            vm.list = result.data.list.data;
            for(var key in vm.list) {
                vm.minOrderBy = Math.min(vm.minOrderBy, vm.list[key].orderBy);
                vm.maxOrderBy = Math.max(vm.maxOrderBy, vm.list[key].orderBy);
            }
            loading_hide();
        }
        function fun_load(data) {  //  加载前
            loading('正在加载中...');
        }
        function call_fun_del(data) {  //  确定删除
            ajax_user("pan_page_info_del", {callback: 'fun_del_end', btnfun: 'fun_load', showdata: 0 , id: vm.deleteInfo.id});
        }
        function fun_del_end(result) {  //  删除完成
            if(result.status === 'ok') {
                vm.list.splice(vm.deleteInfo.deleteIndex, 1);
                vm.deleteInfo = {};
                modal_msg('删除完成');
            }else {
                modal_msg(result.statusMsg);
            }

        }


        function page_edit_pageTitle(data) {  //  编辑 页面标题 完成
            vm.pageTitle = data.data.info.pageTitle;
        }

        function page_add_info_end(result) {  //  添加 图片、标题一、标题二、内容  完成
            //  更新列表，  更新orderby
        }


        function page_edit_info_end(result) {//  编辑  图片、标题一、标题二、内容  完成

        }
    </script>

    <!--#include virtual="/User/menu_button.html" -->

</div>
</body>
</html>
