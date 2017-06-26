Vue.component('my-page', {
    template:
    ' <ul class="pagination pagination-sm no-margin pull-right" v-if="Math.ceil(total/prepage) > 1"> ' +
        '<li v-on:click="setPage(page - 1)"><a href="javascript:void(0)">«</a></li> ' +
        '<li v-for="item in Math.ceil(total/prepage)" v-on:click="setPage(item)"> ' +
             '<a href="javascript:void(0)">{{item}}</a> ' +
        '</li> ' +
        '<li v-on:click="setPage(page + 1)"><a href="javascript:void(0);">»</a></li> ' +
    '</ul>',
    props: {
        total: {  //  总共多少条数据
            type: Number,
            default: 1
        },
        prepage: {  //  每页多少条数据
            type: Number,
            default: 1
        }
    },
    methods: {
        setPage: function(page) {
            if(!(page <= 0 || page > Math.ceil(this.total/this.prepage))) {
                this.$parent.$emit('getPage', {
                    page: page
                });
            }
        }
    }
});