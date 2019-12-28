$(function () {
    var page = 0;//页码数
    // dropload函数接口设置
    $('.main').dropload({
        scrollArea: window,
        // 下拉刷新模块显示内容
        autoLoad: true,
        distance: 50,
        domUp: {
            domClass: 'dropload-up',
            // 下拉过程显示内容
            domRefresh: '<div class="dropload-refresh">↓下拉刷新</div>',
            // 下拉到一定程度显示提示内容
            domUpdate: '<div class="dropload-update">↑释放更新</div>',
            // 释放后显示内容
            domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>'
        },
        domDown: {
            domClass: 'dropload-down',
            // 滑动到底部显示内容
            domRefresh: '<div class="dropload-refresh">↑上拉加载更多</div>',
            // 内容加载过程中显示内容
            domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
            // 没有更多内容-显示提示
            domNoData: '<div class="dropload-noData"></div>'
        },
        loadDownFn: function (me) {
            var url = $('#getAddress').attr('ajaxUrl');
            $.ajax({
                type: 'post',
                url: url,
                data: {
                    page: page,
                },
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    if (data.data.length <= 0) {
                        // 再往下已经没有数据
                        // 锁定
                        me.lock();
                        // 显示无数据
                        me.noData();
                        me.resetload();
                        return false;
                    }
                    var html = '';
                    var list = data.data;
                    for (var i = 0; i < list.length; i++) {
                        html += ' <div class="addlist clearfloat">\n' +
                            '        <div class="top clearfloat box-s">\n' +
                            '            <ul>\n' +
                            '                <li>\n' +
                            '                    <span class="fl">'+list[i].realname+'</span>\n' +
                            '                    <span class="fr">'+list[i].phone+'</span>\n' +
                            '                </li>\n' +
                            '                <li>\n'
                             +list[i].address+''+list[i].addressshow+
                            '                </li>\n' +
                            '            </ul>\n' +
                            '        </div>\n' +
                            '        <div class="bottom clearfloat box-s">\n' +
                            '            <section class="shopcar clearfloat">\n' +
                            '                <div class="radio fl">\n' +
                            '                    <label>\n' +
                            '                        <input type="radio" name="addr" value="" onclick="def('+list[i].id+')">\n' +
                            '                        <div class="option"></div>\n' +
                            '                        <span class="mradd smradd fl">设为默认</span>\n' +
                            '                    </label>\n' +
                            '                </div>\n' +
                            '                <div class="right fr clearfloat">\n' +
                            '                    <a href="javascript:;" class="fr"  onclick="deladdr(this)" dataID="'+list[i].id+'"  dataUrl="'+data.url+'">\n' +
                            '                        <i class="iconfont icon-lajixiang"></i>\n' +
                            '                        删除\n' +
                            '                    </a>\n' +
                            '                    <a href="javascript:;" class="fr" onclick="editaddr('+list[i].id+')">\n' +
                            '                        <i class="iconfont icon-shouji"></i>\n' +
                            '                        编辑\n' +
                            '                    </a>\n' +
                            '                </div>\n' +
                            '            </section>\n' +
                            '        </div>\n' +
                            '    </div>'
                    }
                    // 加载 插入到原有 DOM 之后
                    $('.listaddr').append(html);
                    page++; // 每次请求，页码加1
                    // 每次数据加载完，必须重置
                    me.resetload();

                },
                // 加载出错
                error: function (xhr, type) {
                    // alert('Ajax error!');
                    console.log(xhr);
                    // 即使加载出错，也得重置
                    me.resetload();
                }
            });
        },
        threshold: 50 // 什么作用???
    });
})

function  deladdr(even){
    var id= $(even).attr('dataID');
    var url= $(even).attr('dataUrl');
    _ajax(url,{id:id},function (e) {
        console.log(e);
        if(e.status == 1){
            _msg({title:e.msg,time:1000},function () {
                $(even).parents('.addlist').remove();
            })
        }else{
            _msg({title:e.msg,time:1000})
        }
    })
}


function editaddr(id) {
    var url = $('#editAddress').attr('ajaxUrl');
    location.href = url+'?id='+id;
}


function def(id) {
    console.log(id)
    _ajax(url,data,function (e) {
        console.log();
    })
}