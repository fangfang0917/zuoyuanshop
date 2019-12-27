$(function () {
    /**
     * banner轮播
     */
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

    /**
     * 加数量
     */
    $('[_add]').on('click',function () {
        var that = $(this).parent('li');
        var num = that.prev().text();
        that.prev().text(parseInt(num)+1);
    })

    /**
     * 减数量
     */
    $('[_reduce]').on('click',function () {
        var that = $(this).parent('li');
        var num = that.next().text();
        if(num >1){
            that.next().text(parseInt(num)-1);
        }
    })
});


/**
 * 提交ajax
 * @param url
 * @param data
 * @param callback
 * @param type
 * @param dataType
 * @returns {boolean}
 * @private
 */
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


/**
 * 提示
 * @param json
 * @param close
 * @private
 */
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


/**
 * 登录
 */
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

/**
 * 修改密码
 */
$('[_btnuppass]').click(function () {
    var newpass = $('[name=newPass]').val();
    var oldpass = $('[name=oldPass]').val();
    var data = {newpass:newpass,oldpass:oldpass};
    var url = $('#ajax-data').attr('ajax-action');
    if(newpass.length <6){
        _msg({title:'请填写6-10位密码',time:1000},function () {
            return false;
        })
    }
    _ajax(url,data,function (e) {
        console.log(e);
        if(e.status == 1){
            _msg({title:e.msg,time:1000},function () {
                 location.href = e.url;
            })
        }else{
            _msg({title:e.msg,time:1000},function () {
                location.reload();

            })
        }
    })
})


/**
 * 修改用户昵称
 */
$('[_btnuprealname]').click(function () {
    var realname = $('[name=realname]').val();
    var data = {realname:realname};
    var url = $('#ajax-data').attr('ajax-action');
    if(realname.length <6 || realname.length >12){
        _msg({title:'请填写6-12位汉字',time:1000})
        return false;
    }
    var res=/^[\u4e00-\u9fa5]+$/;
    if(!res.test(realname)) {
        _msg({title:'格式不正确,请填写6-12位汉字',time:1000})
        return false;
    }
        _ajax(url,data,function (e) {
        console.log(e);
        if(e.status == 1){
            _msg({title:e.msg,time:1000},function () {
                location.href = e.url;
            })
        }else{
            _msg({title:e.msg,time:1000},function () {
                location.reload();
            })
        }
    })
})

