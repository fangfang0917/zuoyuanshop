<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:73:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\cart\index.html";i:1577413548;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1577412155;}*/ ?>
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


<!--header star-->
<header class="mui-bar mui-bar-nav" id="header">
    <a class="btn" href="javascript:history.go(-1)">
        <i class="iconfont icon-fanhui"></i>
    </a>
    <div class="top-sch-box top-sch-boxtwo flex-col">
        购物车
    </div>
    <a class="btn" href="#">
        <i class="iconfont icon-lajixiang"></i>
    </a>
</header>
<!--header end-->

<div class="warp warptwo clearfloat">
    <div class="shopcar clearfloat">
        <!--<div class="list clearfloat fl">-->
            <!--<div class="xuan clearfloat fl">-->
                <!--<div class="radio" >-->
                    <!--<label>-->
                        <!--<input type="checkbox" name="sex" value="" />-->
                        <!--<div class="option"></div>-->
                    <!--</label>-->
                <!--</div>-->
            <!--</div>-->
            <!--<a href="#">-->
                <!--<div class="tu clearfloat fl">-->
                    <!--<span></span>-->
                    <!--<img src="upload/19.jpg"/>-->
                <!--</div>-->
                <!--<div class="right clearfloat fl">-->
                    <!--<p class="tit over">小米Max全网通4G大屏智能手机</p>-->
                    <!--<p class="fu-tit over">颜色：金色  内存：1287G</p>-->
                    <!--<p class="jifen over">2998购物币+700积分</p>-->
                    <!--<div class="bottom clearfloat">-->
                        <!--<div class="zuo clearfloat fl">-->
                            <!--<ul>-->
                                <!--<li><img src="img/jian.png"/></li>-->
                                <!--<li>2</li>-->
                                <!--<li><img src="img/jia.png"/></li>-->
                            <!--</ul>-->
                        <!--</div>-->
                        <!--<i class="iconfont icon-lajixiang fr"></i>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</a>-->
        <!--</div>-->
    </div>
</div>

<!--settlement star-->
<div class="settlement clearfloat">
    <div class="zuo clearfloat fl box-s">
        合计：<span>￥1420</span>
    </div>
    <a href="#" class="fl db">
        立即结算
    </a>
</div>
<!--settlement end-->
<div id="ajaxGetDateUrl" ajaxUrl="<?php echo $ajaxUrl; ?>"></div>

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

<script src="__STATIC__/js/shopcar.js?v=<?php echo time(); ?>"></script>


</html>