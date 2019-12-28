function toshare(){
    $(".am-share").addClass("am-modal-active");
    if($(".sharebg").length>0){
        $(".sharebg").addClass("sharebg-active");
    }else{
        $("body").append('<div class="sharebg"></div>');
        $(".sharebg").addClass("sharebg-active");
    }
    $(".sharebg-active,.share_btn").click(function(){
        $(".am-share").removeClass("am-modal-active");
        setTimeout(function(){
            $(".sharebg-active").removeClass("sharebg-active");
            $(".sharebg").remove();
        },300);
    })
}


$("[_setattr]").click(function () {
    var that = $(this);
    var index = that.index();
    var KeyId = that.attr('dataAttrKeyId');
    var ValId = that.attr('dataAttrValId');
    that.addClass('cur').siblings('li').removeClass('cur');
})


$('[_buy]').click(function () {
    var len = $('.attrkey .cur').length;
    var attrkeylen = $('.attrkey').length;
    var num = $('.num').text();
    var goods_id = $('#goodsId').attr('dataGoodsId');
    var url = $(this).attr('addCartUrl');
    if (len < attrkeylen) {
        _msg({title:'请选择规格',time:1000})
    }
    var  strattr = new Array();
    for(var i=0;i<len;i++){
        strattr.push($('.attrkey .cur').eq(i).attr('dataAttrValId'));
    }

    var data = {attr_symbol_path:strattr,num:num,goods_id};
    _ajax(url,data,function (e) {
        if(e.status == 1){
            location.href = e.url;
        }
    })
})