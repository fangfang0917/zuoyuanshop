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
        console.log(e);
    })
})