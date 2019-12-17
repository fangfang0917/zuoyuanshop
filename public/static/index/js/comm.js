$(function () {
    var banner = new Swiper('.banner',{
        autoplay: 5000,
        pagination : '.swiper-pagination',
        paginationClickable: true,
        lazyLoading : true,
        loop:true
    });

    $('a.slide-menu').on('click', function(e){
        var wh = $('div.wrapper').height();
        $('div.slide-mask').css('height', wh).show();
        $('aside.slide-wrapper').css('height', wh).addClass('moved');
    });

    $('div.slide-mask').on('click', function(){
        $('div.slide-mask').hide();
        $('aside.slide-wrapper').removeClass('moved');
    });


});





function _ajax(url,data,callback,type,dataType,) {
    var type  =  type ? type : 'post' ;
    var dataType  =  dataType ? dataType : 'json' ;
    if(jQuery.isFunction(callback)){
        var succ = callback;
    }else{
        console.error('is not function');
        return false;
    }
    
     $.ajax({
         url:url,
         type:type,
         data:data,
         datatype:dataType,
         success:succ,
         error:function (e) {
             console.log(e);
         }
     })
}



function _msg(json, close) {
    var title = json.title ? json.title : false;
    var time = json.time ? json.time : 2000;
    var offset = json.offset ? json.offset : 'auto';
    layer.msg(title, {
        time: time,
        shade: 0,
        offset: offset,
        anim: parseInt(5 * Math.random() + 1),
        tips: [2, '#000000']
    }, function () {
        if (jQuery.isFunction(close)) {
            return close(close);
        }
    });
}


$('[_but]').click(function () {
    var url = $(this).attr('data-ajax-url');
    console.log(url);
})



$('[_login]').click(function () {
    var url = $(this).attr('data-ajax-url');
    var name = $('[name=username]').val();
    var pass = $('[name=pass]').val();
    var data = {username:name,pass:pass};
    _ajax(url,data,function (e) {
        console.log(e);
        if(e.status == 1){
            _msg({title:e.msg,time:1000},function () {
               location.href = e.url;
            })
        }else{
            _msg({title:e.msg,time:1000});
        }

    })
})


$('.autoplay').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
});




