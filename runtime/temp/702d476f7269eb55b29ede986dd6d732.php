<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:72:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\order\str.html";i:1577699899;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1577412155;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <script src="__STATIC__/js/rem.js?v=<?php echo time(); ?>"></script>
    <script src="__STATIC__/js/jquery.min.js?v=<?php echo time(); ?>" type="text/javascript"></script>
    <script src="__STATIC__/js/layer/2.4/layer.js?v=<?php echo time(); ?>" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/base.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/page.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/all.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/mui.min.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/loaders.min.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/loading.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/slick/slick.css?v=<?php echo time(); ?>"/>
    
    
<script type="text/javascript">
	$(window).load(function(){
		$(".loading").addClass("loader-chanage")
		$(".loading").fadeOut(300)
	})
</script>
</head>
<!--loading页开始-->
<div class="loading">
	<div class="loader">
        <div class="loader-inner pacman">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
	</div>
</div>
<!--loading页结束-->


<header class="mui-bar mui-bar-nav report-header box-s" id="header">
    <a href="javascript:history.go(-1)"><i class="iconfont icon-fanhui fl"></i></a>
    <p>收货评价</p>
</header>
<div id="main" class="mui-clearfix">
    <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;?>
    <div class="assess clearfloat">
        <div class="goodsId" dataGoodsId="<?php echo $r['id']; ?>"></div>
        <div class="top clearfloat box-s">
            <div class="tu fl clearfloat">
                <img src="<?php echo $r['thumb']; ?>"/>
            </div>
            <div class="pinfen fl clearfloat">
                <p class="tit"><?php echo $r['name']; ?></p>
                <div class="assess-right">
                    <img onclick="level(1)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(2)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(3)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(4)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(5)" src="__STATIC__/img/detail-iocn001.png"/>
                </div>
            </div>
        </div>
        <textarea rows="4" name="content" placeholder="请写下对宝贝的感受吧，对他人帮助很大哦" ></textarea>
        <div class="bottom clearfloat box-s fl">
            <p class="ztpinfen">整体评分</p>
            <ul>
                <li>
                    物流速度评价
                </li>
                <li class="assess-right">
                    <img onclick="level(1)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(2)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(3)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(4)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(5)" src="__STATIC__/img/detail-iocn001.png"/>
                </li>
            </ul>
            <ul>
                <li>
                    服务质量评价
                </li>
                <li class="assess-right">
                    <img onclick="level(1)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(2)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(3)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(4)" src="__STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(5)" src="__STATIC__/img/detail-iocn001.png"/>
                </li>
            </ul>
            <ul>
                <li>
                    配送员满意度
                </li>
                <li class="assess-right">
                    <img onclick="level(1)" src=" __STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(2)" src=" __STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(3)" src=" __STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(4)" src=" __STATIC__/img/detail-iocn001.png"/>
                    <img onclick="level(5)" src=" __STATIC__/img/detail-iocn001.png"/>
                </li>
            </ul>
        </div>
    </div>
    <?php endforeach; endif; else: echo "" ;endif; ?>
    <a href='javascript:;' class="address-add fl ra3"   _setGoodsCommont>
        提交
    </a>
</div>
<div id="setgoodscomment" ajaxUrl="<?php echo url('order/setgoodsComment'); ?>"></div>

<!--footer star-->
<?php if(!in_array($Controller,$NOTSHOWFOOTER)): ?>
<footer class="page-footer fixed-footer" id="footer">
    <ul>
        <li <?php if($Controller == 'Index'): ?>class="active" <?php endif; ?>>
            <a href="<?php echo url('index/index'); ?>">
                <i class="iconfont icon-shouye"></i>
                <p>首页</p>
            </a>
        </li>
        <li <?php if($Controller == 'Category'): ?>class="active" <?php endif; ?>>

        <a href="<?php echo url('category/index'); ?>">
                <i class="iconfont icon-icon04"></i>
                <p>分类</p>
            </a>
        </li>
        <li <?php if($Controller == 'Shopcar'): ?>class="active" <?php endif; ?>>

        <a href="<?php echo url('cart/index'); ?>">
                <i class="iconfont icon-gouwuche"></i>
                <p>购物车</p>
            </a>
        </li>
        <li <?php if($Controller == 'User'): ?>class="active" <?php endif; ?>>

        <a href="<?php echo url('user/index'); ?>">
                <i class="iconfont icon-yonghuming"></i>
                <p>我的</p>
            </a>
        </li>
    </ul>
</footer>
<?php endif; ?>
<!--footer end-->
</body>
<script type="text/javascript" src="__STATIC__/js/jquery-1.8.3.min.js?v=<?php echo time(); ?>" ></script>
<!--<script src="__STATIC__/js/others.js?v=<?php echo time(); ?>"></script>-->
<script type="text/javascript" src="__STATIC__/js/hmt.js?v=<?php echo time(); ?>" ></script>
<script src="__STATIC__/slick/slick.js?v=<?php echo time(); ?>" type="text/javascript" ></script>
<script src="__STATIC__/js/comm.js?v=<?php echo time(); ?>" type="text/javascript"></script>
<!--插件start-->
<!--swiper-->
<link rel="stylesheet" href="__STATIC__/css/swiper.min.css?v=<?php echo time(); ?>">
<script src="__STATIC__/js/swiper.jquery.min.js?v=<?php echo time(); ?>"></script>
<!--下拉-->
<link href="__STATIC__/css/dropload.css?v=<?php echo time(); ?>" rel="stylesheet" type="text/css"/>
<script src="__STATIC__/js/dropload.js?v=<?php echo time(); ?>"></script>
<!--插件end-->

<script>
    function level(s)
    {
        var str = '';
        var k = 6-s;
        for(i=1;i<s+1;i++)			{
            str += "<img onclick='level("+i+")' src='__STATIC__/img/detail-iocn01.png'/>";
        }
        for(j=1;j<k;j++)
        {
            var d=j+s
            str += "<img onclick='level("+d+")' src='__STATIC__/img/detail-iocn001.png'/>";
        }
        console.log(str);
        $('.assess-right').html(str);
    }


    $('[_setGoodsCommont]').click(function () {
        var len = $('.assess').length;
        var arr = [];
        var url = $('#setgoodscomment').attr('ajaxUrl');
        for(var i=0;i<len;i++){
            if($('[name=content]').eq(i).val() == ''){
                _msg({title:'请填写评论',time:1000})
                return false;
            }
            arr.push({goodsId:$('.goodsId').eq(i).attr('dataGoodsId'),content:$('[name=content]').eq(i).val()})
        }
        console.log(len);
        console.log(arr);
        _ajax(url,arr,function (e) {
            console.log(e)
            if(e.status == 1){
                _msg({title:e.msg,time:1000},function () {
                    location.href= e.url;
                })
            }else{
                _msg({title:e.msg,time:1000})
            }
        })
    })



</script>


</html>