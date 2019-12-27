$(function () {
	var page = 0;//页码数
	// dropload函数接口设置
	$('.warp').dropload({
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
			var url = $('#ajaxGetDateUrl').attr('ajaxUrl');
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
						if(page == 0){
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
					for(var i=0;i<list.length;i++){

					html +=' <div class="list clearfloat fl">\n' +
						'            <div class="xuan clearfloat fl">\n' +
						'                <div class="radio" >\n' +
						'                    <label>\n' +
						'                        <input type="checkbox" name="sex" value="" />\n' +
						'                        <div class="option"></div>\n' +
						'                    </label>\n' +
						'                </div>\n' +
						'            </div>\n' +
						'            <a href="javascipt:;">\n' +
						'                <div class="tu clearfloat fl">\n' +
						'                    <span></span>\n' +
						'                   <a href="'+list[i].url+'"><img src="'+list[i].thumb+'"/></a>\n' +
						'                </div>\n' +
						'                <div class="right clearfloat fl">\n' +
						'                    <p class="tit over"><a href="'+list[i].url+'" style="color:#999">'+list[i].name+'</a></p>\n' +
						'                    <p class="fu-tit over">'+list[i].attrname+'</p>\n' +
						'                    <p class="jifen over">'+list[i].price+'积分</p>\n' +
						'                    <div class="bottom clearfloat">\n' +
						'                        <div class="zuo clearfloat fl">\n' +
						'                            <ul>\n' +
						'                                <li><img src="/public/static/index/img/jian.png" _reduce/></li>\n' +
						'                                <li class="num">'+list[i].num+'</li>\n' +
						'                                <li><img src="/public/static/index/img/jia.png" _add/></li>\n' +
						'                            </ul>\n' +
						'                        </div>\n' +
						'                        <i class="iconfont icon-lajixiang fr"></i>\n' +
						'                    </div>\n' +
						'                </div>\n' +
						'            </a>\n' +
						'        </div>'
					}
					// 加载 插入到原有 DOM 之后
					$('.shopcar').append(html);
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

