<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:74:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\order\index.html";i:1576726167;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1577412155;}*/ ?>
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
    <p>全部订单</p>
</header>
<div id="main" class="mui-clearfix">
    <div class="order-top clearfloat">
        <ul>
            <li class="clearfloat cur"><a href="order.html">全部</a></li>
            <li class="clearfloat"><a href="#">待付款</a></li>
            <li class="clearfloat"><a href="#">待发货</a></li>
            <li class="clearfloat"><a href="re-order.html">待收货</a></li>
            <li class="clearfloat"><a href="#">待评价</a></li>
        </ul>
    </div>
    <div class="order-list clearfloat">
        <p class="ordernum box-s">
            订单  123456789000
            <span>待付款</span>
        </p>
        <div class="list clearfloat fl box-s">
            <a href="detail.html">
                <div class="tu fl clearfloat">
                    <img src="upload/21.jpg"/>
                </div>
                <div class="middle clearfloat fl">
                    <p class="tit">野山茶油5L 纯野山茶籽油</p>
                    <p class="fu-tit">月销2000 领券减10元 店长推荐 3月压榨</p>
                    <p class="price clearfloat">
                        <span class="xprice fl">¥299.00</span>
                        <span class="yprice fl">¥308</span>
                        <span class="shu">×1</span>
                    </p>
                </div>
            </a>
        </div>
        <div class="list clearfloat fl box-s">
            <a href="detail.html">
                <div class="tu fl clearfloat">
                    <img src="upload/21.jpg"/>
                </div>
                <div class="middle clearfloat fl">
                    <p class="tit">野山茶油5L 纯野山茶籽油</p>
                    <p class="fu-tit">月销2000 领券减10元 店长推荐 3月压榨</p>
                    <p class="price clearfloat">
                        <span class="xprice fl">¥299.00</span>
                        <span class="yprice fl">¥308</span>
                        <span class="shu">×1</span>
                    </p>
                </div>
            </a>
        </div>
        <a href="#" class="gopay-btn fr">
            立即支付
        </a>
    </div>
    <style type="text/css">
        .more-btn{width: 25%; padding: 3% 0; text-align: center; background-color: #00CC7D; color: #fff; font-size: .5rem; margin: 5% auto;}
    </style>
    <a href="#" class="more-btn db ra5">更多</a>
</div>
<div id="ajax-data" data-action="<?php echo $action; ?>"></div>

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



</html>