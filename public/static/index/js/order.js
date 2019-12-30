$(function () {
    var page = 0;//页码数
    // dropload函数接口设置

    var itemIndex = 0;
    var tabLoadEndArray = ['00','11','12','13','14'];
    var tabEndArray = [false, false,false,false,false];
    var pageing = [0,0,0,0,0];

    var dropload =$('#main').dropload({
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
            var url = $('#ajaxGetList').attr('ajaxUrl');
            $.ajax({
                type: 'post',
                url: url,
                data: {
                    page: pageing[itemIndex],
                    ordertype: tabLoadEndArray[itemIndex]

                },
                dataType: 'json',
                success: function (data) {

                    console.log(data);
                    if (data.data.length <= 0) {
                        // 再往下已经没有数据
                        if (pageing[itemIndex] == 0) {
                            $('.order-list').eq(itemIndex).children('.empty').show();
                        }
                        tabEndArray[itemIndex] = false;
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
                        if (list[i].payType == 1) {
                            if (list[i].orderType == 0) {
                                var payhtml = '<span>待发货</span>';
                                var ButHtml = '';
                            }else if(list[i].orderType == 1) {
                                var payhtml = '<span>已发货</span>';
                                var ButHtml = '<a href="javascript:;" class="gopay-btn fr">查看物流</a><a href="javascript:;" class="gopay-btn fr" onclick="take(\'+list[i].id+\')">确认收货</a></div>';
                            }else if(list[i].orderType == 2) {
                                var payhtml = '<span>待评价</span>';
                                var ButHtml = '<a href="javascript:;" class="gopay-btn fr">去评价</a></div>';
                            }
                        } else {
                            var payhtml = '<span>待付款</span>';
                            var ButHtml = '<a href="javascript:;" class="gopay-btn fr" onclick="qpay('+list[i].id+')">立即支付</a></div>';
                        }
                            html += '<div class="order-list clearfloat">\n' +
                                '            <p class="ordernum box-s">\n' +
                                '                订单  ' + list[i].orderNo + '\n' + payhtml+
                                '            </p>\n';
                        var jhtml = '';
                        var listt = list[i].goodsList;
                        for (var j = 0; j < listt.length; j++) {
                            jhtml += '<div class="list clearfloat fl box-s">\n' +
                                '                <a href="' + listt[j].url + '">\n' +
                                '                    <div class="tu fl clearfloat">\n' +
                                '                        <img src="' + listt[j].thumb + '"/>\n' +
                                '                    </div>\n' +
                                '                    <div class="middle clearfloat fl">\n' +
                                '                        <p class="tit">' + listt[j].name + '</p>\n' +
                                '                        <p class="price clearfloat">\n' +
                                '                            <span class="xprice fl">' + listt[j].price + '</span>\n' +
                                '                            <span class="shu">×' + listt[j].num + '</span>\n' +
                                '                        </p>\n' +
                                '                    </div>\n' +
                                '                </a>\n' +
                                '            </div>';
                        }
                        html = html + jhtml + ButHtml;
                    }
                    tabEndArray[itemIndex] = true;
                    // 加载 插入到原有 DOM 之后
                    $('.main').eq(itemIndex).show().siblings('.main').hide();
                    $('.main').eq(itemIndex).append(html);
                    pageing[itemIndex]++; // 每次请求，页码加1
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


    $('#nav li').click(function () {
        var that = $(this);
        itemIndex = that.index();
        that.addClass('cur').siblings().removeClass('cur')
        $('.main').eq(itemIndex).show().siblings('.main').hide();
        if (tabEndArray[itemIndex]) {
            dropload.lock('down');
            dropload.noData();
        } else {
            dropload.unlock();
            dropload.noData(false);
        }
        dropload.resetload();
    })
})



function take(id) {
    _ajax("/public/index.php/index/order/take",{id:id},function (e) {
        console.log(e);
        if(e.status == 1){
       _msg({title:e.msg,time:1000},function () {
           location.reload();
       })
        }else{
            _msg({title:e.msg,title:1000})
        }
    })
}



function qpay(id) {
    var url= $('#buyUrl').attr('ajaxUrl');
    location.href = url+'?id='+id;
}