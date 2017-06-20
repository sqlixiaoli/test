<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>云图 | Yun-TU</title>

    <!--#include virtual="/User/head.html" -->

    <link rel="stylesheet" href="../../style/user/css/defined-editor.css">
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

                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border clearfix">
                            <div class="pull-right">
                                <button type="button" class="btn btn-primary"
                                        onclick="modal_def('添加网页','page_add.html?call=page_addend')">添加网页</button>
                            </div>
                        </div>
                        <div class="box-body editor-content">
                            <header class="page-title">
                                <span v-if="!isEditTitle">{{pageTitle}}</span>
                                <input type="text" v-if="isEditTitle" v-model="pageTitle" placeholder="请输入网页标题" />
                                <span class="fa fa-edit" v-on:click="isEditTitle = true" v-if="!isEditTitle" role="button"></span>
                                <span class="fa fa-floppy-o" v-on:click="isEditTitle = false" v-if="isEditTitle" role="button"></span>
                                <div class="tool">
                                    <span class="fa fa-image" v-on:click="insert(-1, 10)" role="button"></span>
                                    <span class="fa fa-file-text-o" v-on:click="insert(-1, 0)" role="button"></span>
                                    <span class="fa" v-on:click="insert(-1, 1)" role="button">H1</span>
                                    <span class="fa" v-on:click="insert(-1, 2)" role="button">H2</span>
                                </div>
                            </header>
                            <article class="html-body">
                                <draggable :list="list">
                                    <transition-group name="list-complete">
                                        <div class="area" v-for="(item, index) in list" :key="index" v-if="list.length > 0">
                                            <div v-if="item.type == 1">
                                                <div class="title-l1" v-if="!item.isEdit">{{item.inputInfo}}</div>
                                                <input class="title-l1" type="text" placeholder="请输入标题一" v-if="item.isEdit"
                                                       v-model="item.inputInfo" />
                                            </div>
                                            <div v-if="item.type == 2">
                                                <div class="title-l2" v-if="!item.isEdit">{{item.inputInfo}}</div>
                                                <input class="title-l2" type="text" placeholder="请输入标题二" v-if="item.isEdit"
                                                       v-model="item.inputInfo" />
                                            </div>
                                            <div v-if="item.type == 0">
                                                <div class="desc" v-if="!item.isEdit">{{item.inputInfo}}</div>
                                                <textarea class="desc" placeholder="请输入内容" cols="30" rows="10" v-if="item.isEdit"
                                                          v-model="item.inputInfo"></textarea>
                                            </div>
                                            <div v-if="item.type == 10">
                                                <div>
                                                    <img src="" alt="" class="img" />
                                                </div>
                                                <div class="img-upload" role="button">
                                                    <input type="file" v-model="item.inputInfo" />
                                                    <span class="icon-add"></span>
                                                    <span>请选择图片上传</span>
                                                </div>
                                            </div>
                                            <div class="tool">
                                                <span class="fa fa-floppy-o" v-on:click="save(item, index)" v-if="item.isEdit" role="button"></span>
                                                <span class="fa fa-edit" v-on:click="item.isEdit = true" v-if="!item.isEdit" role="button"></span>
                                                <span class="fa fa-trash" v-on:click="del(item, index)" role="button"></span>
                                                <span class="fa fa-image" v-on:click="insert(index, 10)" role="button"></span>
                                                <span class="fa fa-file-text-o" v-on:click="insert(index, 0)" role="button"></span>
                                                <span class="fa" v-on:click="insert(index, 1)" role="button">H1</span>
                                                <span class="fa" v-on:click="insert(index, 2)" role="button">H2</span>
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
                    isEditTitle: false,
                    pageTitle: '页面标题',
                    list: []
                }
            },
            mounted: function() {
                this.getContent();
            },
            methods: {
                getContent: function() {
                    ajax_user("pan_page_info_list", { callback: 'fun_list', btnfun: 'fun_load', showdata: 0, pageId: $.getUrlParam("pageId") });
                },
                save: function(item, index) {
                    item.isEdit = false;
                    ajax_user("pan_page_info_add", {callback: 'fun_add', btnfun: 'fun_load', showdata: 0 , pageId: $.getUrlParam("pageId"), infoType: item.type, info: item.inputInfo, orderBy: ''});
                },
                insert: function(index, type) {
                    var self = this;
                    self.list.splice(index+1, 0, {
                        isEdit: true,
                        type: type
                    });
                },
                del: function(item, index) {
                    var self = this;
                    self.list.splice(index, 1);
                    ajax_user("pan_page_info_del", {callback: 'fun_del', btnfun: 'fun_load', showdata: 0 , id: item.id});
                },
                onUpdate: function (event) {
                    this.list.splice(event.newIndex, 0, this.list.splice(event.oldIndex, 1)[0])
                }
            }
        });
        function page_addend(result)
        {
            alert("添加完成！");
        }
        function fun_list(result) {
            vm.list = [];
            var list = result.data.list.data;
            for(var key in list) {
                list[key].isEdit = false;
                list[key].inputInfo = '';
            }
            vm.list = list;
        }
        function fun_load(data) {
            //alert("开始加载");
        }
        function fun_add(data) {}
        function fun_del(data) {}
    </script>

    <!--#include virtual="/User/menu_button.html" -->

</div>
</body>
</html>
