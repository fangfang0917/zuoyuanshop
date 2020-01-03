$(function () {
    var page = 0;//页码数
    // dropload函数接口设置
    $('.like').dropload({
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
            var url = $('#ajax-url').attr('data-ajax-url');
            var posid = $('#ajax-url').attr('data-ajax-posid');
            var action = $('#ajax-url').attr('data-ajax-action');
            var data = { page: page, D: action,posid:posid};
            _ajax(url, data, function (data) {
                if (data.data.length <= 0) {
                    // 再往下已经没有数据
                    if (page == 0) {
                        $('.empty').show();
                    }
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
                    html += " <div class='list clearfloat fl'>" +
                                " <a href='"+data.url+"?id="+list[i].id+"'>" +
                                "    <div class='tu clearfloat'>" +
                                "       <img src='"+list[i].thumb+"'/>" +
                                "    </div>" +
                                "    <div class='bottom clearfloat box-s'>" +
                                "       <p class='over'>"+list[i].name+"</p>" +
                                "       <span>"+list[i].int+"</span>" +
                                "    </div>" +
                                "</a>" +
                            "</div>";
                }
                // 加载 插入到原有 DOM 之后
                $('.content').append(html);
                page++; // 每次请求，页码加1
                // 每次数据加载完，必须重置
                me.resetload();
            });
        },
        threshold: 50 // 什么作用???
    });
});