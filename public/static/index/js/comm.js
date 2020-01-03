$(function () {
    /**
     * banner轮播
     */
    var banner = new Swiper('.banner', {
        autoplay: 5000,
        pagination: '.swiper-pagination',
        paginationClickable: true,
        lazyLoading: true,
        loop: true
    });

    $('a.slide-menu').on('click', function (e) {
        var wh = $('div.wrapper').height();
        $('div.slide-mask').css('height', wh).show();
        $('aside.slide-wrapper').css('height', wh).addClass('moved');
    });

    $('div.slide-mask').on('click', function () {
        $('div.slide-mask').hide();
        $('aside.slide-wrapper').removeClass('moved');
    });

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
function _ajax(url, data, callback, type, dataType,) {
    var type = type ? type : 'post';
    var dataType = dataType ? dataType : 'json';
    if (jQuery.isFunction(callback)) {
        var succ = callback;
    } else {
        console.error('is not function');
        return false;
    }
    $.ajax({
        url: url,
        type: type,
        data: data,
        datatype: dataType,
        success: succ,
        error: function (e) {
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
    var data = {username: name, pass: pass};
    _ajax(url, data, function (e) {
        console.log(e);
        if (e.status == 1) {
            _msg({title: e.msg, time: 1000}, function () {
                location.href = e.url;
            })
        } else {
            _msg({title: e.msg, time: 1000});
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
    var data = {newpass: newpass, oldpass: oldpass};
    var url = $('#ajax-data').attr('ajax-action');
    if (newpass.length < 6) {
        _msg({title: '请填写6-10位密码', time: 1000}, function () {
            return false;
        })
    }
    _ajax(url, data, function (e) {
        console.log(e);
        if (e.status == 1) {
            _msg({title: e.msg, time: 1000}, function () {
                location.href = e.url;
            })
        } else {
            _msg({title: e.msg, time: 1000}, function () {
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
    var data = {realname: realname};
    var url = $('#ajax-data').attr('ajax-action');
    if (realname.length < 6 || realname.length > 12) {
        _msg({title: '请填写6-12位汉字', time: 1000})
        return false;
    }
    var res = /^[\u4e00-\u9fa5]+$/;
    if (!res.test(realname)) {
        _msg({title: '格式不正确,请填写6-12位汉字', time: 1000})
        return false;
    }
    _ajax(url, data, function (e) {
        console.log(e);
        if (e.status == 1) {
            _msg({title: e.msg, time: 1000}, function () {
                location.href = e.url;
            })
        } else {
            _msg({title: e.msg, time: 1000}, function () {
                location.reload();
            })
        }
    })
})


/**
 * 加数量
 */
function addNum(even) {
    var that = $(even).parent('li');
    var num = that.prev().text();
    var price = $(even).attr('GoodsPrice');
    var totalprice = $('#totalprice').text();
    that.prev().text(parseInt(num) + 1);
    var priceStr = (parseInt(parseInt(num) + 1) * price) + '.00';
    $(even).parents('div.list').find('p.jifen').text(priceStr);
    console.log($('[name=sex]').is(":checked").length);
    if ($(even).parents('div.list').find('[name=sex]').is(':checked')) {
        $('#totalprice').text(parseInt(totalprice) + parseInt(price));
    }


}

/**
 * 减数量
 */
function jianNum(even) {
    var that = $(even).parent('li');
    var num = that.next().text();
    var totalprice = $('#totalprice').text();
    var price = $(even).attr('GoodsPrice');
    if (num > 1) {
        that.next().text(parseInt(num) - 1);
        var priceStr = (parseInt(parseInt(num) - 1) * price) + '.00';
        $(even).parents('div.list').find('p.jifen').text(priceStr);
        if ($(even).parents('div.list').find('[name=sex]').is(':checked')) {
            $('#totalprice').text(parseInt(totalprice) - parseInt(price));
        }

    }

}

function aa(even) {
    var that = $(even);
    var price = that.parents('div.list').find('p.jifen').text();
    var totalprice = $('#totalprice').text();
    if (that.is(":checked")) {
        $('#totalprice').text(parseInt(totalprice) + parseInt(price));
    } else {
        $('#totalprice').text(parseInt(totalprice) - parseInt(price));
    }
}


/**
 * 保存/修改地址
 */
$('[_addressBaocun]').click(function () {
    var id = $('[name=id]').val();
    var realname = $('[name=realname]').val();
    var phone = $('[name=phone]').val();
    var address = $('[name=address]').val();
    var addressshow = $('[name=addressshow]').val();

    var callUrl = $('#callUrl').attr('ajaxUrl');
    if (id == '') {
        var url = $('#setAddress').attr('ajaxUrl');
    } else {
        var url = $('#editaddr').attr('ajaxUrl');
    }

    console.log(url);

    // return false;
    if (!(/^1[3456789]\d{9}$/.test(phone))) {
        _msg({title: '手机号码格式不正确', time: 1000})
        return false;
    }
    if (realname == '') {
        _msg({title: '请填写收件人', time: 1000})
        return false;
    }
    if (address == '') {
        _msg({title: '请选择所在地区', time: 1000})
        return false;
    }
    if (addressshow == '') {
        _msg({title: '请填写详细地址', time: 1000})
        return false;
    }
    if ($('.toggle--off').length > 0) {
        type = 1;
    } else {
        type = 0;
    }
    var data = {
        realname: realname, phone: phone, address: address,
        addressshow: addressshow, type: type, id: id
    }
    _ajax(url, data, function (e) {
        console.log(e)
        if (e.status == 1) {
            _msg({title: e.msg, time: 1000}, function () {
                location.href = e.url
            })
        } else {
            _msg({title: e.msg, time: 1000}, function () {

            })
        }
    })

})

$('[_outLogin]').click(function () {
    var url = $(this).attr('ajaxUrl');
    _ajax(url, {}, function (e) {
        if (e.status == 1) {
            _msg({title: e.msg, time: 1000}, function () {
                location.href = e.url;
            })
        } else {
            _msg({title: e.msg, time: 1000}, function () {
                location.reload();
            })
        }
    })
})


$('[_form]').click(function () {
    var url = $(this).attr('reUrl');
    location.href = url;
})

$("[name=formForm]").bind("input propertychange", function (event) {
    var that = $('[name=formForm]');
    var val = that.val();
    var url = $('#form').attr('ajaxUrl');
    var html = '';
    if (val != '') {
        _ajax(url, {title: val}, function (e) {
            if (e.status == 1) {
                var list = e.data;
                if (e.data.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        html += "<div class='lie clearfloat'>" +
                            "                <a href='" + list[i].url + "?id=" + list[i].id + "'>" +
                            "                    <div class='tu clearfloat fl'>" +
                            "                        <img src='" + list[i].thumb + "'/>" +
                            "                    </div>" +
                            "                </a>" +
                            "                <div class='right clearfloat fl'>" +
                            "                    <a href='" + list[i].url + "?id=" + list[i].id + "'>" +
                            "                        <p class='tit'>" + list[i].name + "</p>" +
                            "                    </a>" +
                            "                    <div class='xia clearfloat'>" +
                            "                        <a href='" + list[i].url + "?id=" + list[i].id + "'>" +
                            "                            <p class='jifen fl over'>" + list[i].int + "</p>" +
                            "                        </a>" +
                            "                        <span class='fr db'><img src='/public/static/index/img/jia.png'/></span>" +
                            "                    </div>" +
                            "                </div>" +
                            "            </div>";
                    }
                    $('.bottom').html(html);
                    $('.empty').hide();
                } else {
                    $('.bottom').html(html);
                    $('.empty').show();
                }
            } else {
                $('.bottom').html(html);
                $('.empty').show();
            }
        })
    }else{

        $('.bottom').html(html);
        $('.empty').show();
    }

})
;


