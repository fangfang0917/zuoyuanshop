<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:70:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\buy\pay.html";i:1577677308;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1577412155;}*/ ?>
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
    <p>提交订单</p>
</header>
<div id="main" class="mui-clearfix contaniner sorder">
    <div class="warning clearfloat box-s">
        提示：请在24小时内完成在线支付，逾期将视为订单无效
    </div>
    <div class="odernum clearfloat">
        <ul>
            <li>您的订单号：<?php echo $vo['orderNo']; ?></li>
            <li>应付金额：<span id="price" dataPrice="<?php echo $vo['totalMoney']; ?>"><?php echo $vo['totalMoney']; ?></span></li>
        </ul>
    </div>
    <div class="pay-method clearfloat">
        <ul>
            <li >可用积分:<span id="useInt" dataUseInt="<?php echo $user['amount']; ?>"><?php echo $user['amount']; ?></span> </li>
        </ul>
    </div>
    <!--<div class="pay-method clearfloat">-->
        <!--<ul>-->
            <!--<li>请选择支付方式</li>-->
        <!--</ul>-->
    <!--</div>-->
    <!--<div class="addlist clearfloat">-->
        <!--<div class="bottom clearfloat box-s">-->
            <!--<section class="shopcar clearfloat">-->
                <!--<div class="radio radiosss fr">-->
                    <!--<label>-->
                        <!--<input type="radio" name="sex" value="">-->
                        <!--<div class="option"></div>-->
                    <!--</label>-->
                <!--</div>-->
                <!--<div class="sorder-list clearfloat fl">-->
                    <!--<i class="iconfont icon-weixinzhifu fl"></i>-->
                    <!--<div class="zuo fl">-->
                        <!--<p class="tit">微信支付</p>-->
                        <!--<p class="fu-tit">亿万用户的选择，更快更安全</p>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</section>-->
        <!--</div>-->
        <!--<div class="bottom clearfloat box-s">-->
            <!--<section class="shopcar clearfloat">-->
                <!--<div class="radio radiosss fr">-->
                    <!--<label>-->
                        <!--<input type="radio" name="sex" value="">-->
                        <!--<div class="option"></div>-->
                    <!--</label>-->
                <!--</div>-->
                <!--<div class="sorder-list clearfloat fl">-->
                    <!--<i class="iconfont icon-zhifubao fl"></i>-->
                    <!--<div class="zuo fl">-->
                        <!--<p class="tit">支付宝</p>-->
                        <!--<p class="fu-tit">客户端支持最便捷！可银行卡支付！</p>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</section>-->
        <!--</div>-->
        <!--<div class="bottom clearfloat box-s">-->
            <!--<section class="shopcar clearfloat">-->
                <!--<div class="radio fr">-->
                    <!--<label>-->
                        <!--<input type="radio" name="sex" value="">-->
                        <!--<div class="option"></div>-->
                    <!--</label>-->
                <!--</div>-->
                <!--<div class="sorder-list clearfloat fl">-->
                    <!--<i class="iconfont icon-yinxingqia fl"></i>-->
                    <!--<div class="zuo fl">-->
                        <!--<p class="tit">银行卡</p>-->
                        <!--<p class="fu-tit">需要先开通网银</p>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</section>-->
        <!--</div>-->
    <!--</div>-->
    <a href="#" class="address-add fl" _paySucc>
        确认支付
    </a>
</div>
<div id="paySuccUrl" ajaxUrl="<?php echo $paySuccUrl; ?>"></div>

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

<script src="__STATIC__/js/buy.js?v=<?php echo time(); ?>"></script>


</html>