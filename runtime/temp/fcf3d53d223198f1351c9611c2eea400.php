<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:72:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\buy\index.html";i:1577430738;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1577412155;}*/ ?>
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
        确认订单
    </div>
</header>
<!--header end-->

<div class="warp warptwo clearfloat">
    <div class="confirm clearfloat">
        <div class="add clearfloat box-s">
            <a href="choice-address.html">
                <div class="left clearfloat fl">
                    <i class="iconfont icon-dizhi1"></i>
                </div>
                <div class="middle clearfloat fl">
                    <p class="tit">
                        收货人：王小王&nbsp;&nbsp;&nbsp;&nbsp;15806976589
                    </p>
                    <p class="fu-tit over2">
                        收货地址：安徽省合肥市高新区长江西路拓基城市广场金座A2002
                    </p>
                </div>
                <div class="left clearfloat fr">
                    <i class="iconfont icon-jiantou1"></i>
                </div>
            </a>
        </div>
        <div class="lie clearfloat">
            <a href="detail.html">
                <div class="tu clearfloat fl">
                    <img src="upload/19.jpg"/>
                </div>
            </a>
            <div class="right clearfloat fl">
                <a href="detail.html">
                    <p class="tit over">小米Max全网通4G大屏智能手机</p>
                    <p class="fu-tit">颜色：金色  内存：1287G</p>
                </a>
                <div class="xia clearfloat">
                    <a href="detail.html">
                        <p class="jifen fl over">2998购物币+700积分</p>
                    </a>
                    <span class="fr db">×1</span>
                </div>
            </div>
        </div>
        <div class="gmshu clearfloat box-s fl">
            <div class="gcontent clearfloat">
                <p class="fl">购买数量</p>
                <div class="you clearfloat fr">
                    <ul>
                        <li><img src="img/jian.jpg"/></li>
                        <li>1</li>
                        <li><img src="img/jia.jpg"/></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="gmshu gmshutwo clearfloat box-s fl">
            <div class="gcontent clearfloat">
                <p class="fl">配送方式</p>
                <div class="you clearfloat fr">
                    <span>快递 免邮</span>
                    <i class="iconfont icon-jiantou1"></i>
                </div>
            </div>
        </div>
        <div class="gmshu gmshutwo clearfloat box-s fl">
            <div class="gcontent clearfloat">
                <p class="fl">发票信息</p>
                <div class="you clearfloat fr">
                    <div class="xuan clearfloat">
                        <div class="radiotwo" >
                            <label>
                                <input type="radio" name="fapiao" value="" />
                                <div class="option"></div>
                                <span class="opt-text">需要发票</span>
                            </label>
                        </div>
                    </div>
                    <div class="xuan clearfloat">
                        <div class="radiotwo" >
                            <label>
                                <input type="radio" name="fapiao" value="" />
                                <div class="option"></div>
                                <span class="opt-text">不需要发票</span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="gmshu gmshuthree clearfloat box-s fl">
            <div class="gcontent clearfloat">
                <p class="fl">买家留言</p>
                <div class="you clearfloat fl">
                    <input type="text" name="" id="" value="" class="text" placeholder="选填 对本次交易需求给商家留言" />
                </div>
            </div>
        </div>
        <div class="gmshu clearfloat box-s fl">
            <p class="fr">共1件商品   合计<samp>￥2998</samp></p>
        </div>
        <div class="integral clearfloat fl box-s">
            <div class="zuo clearfloat fl">
                积分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;可用积分2446
            </div>
            <div class="you clearfloat fr">
                <div class="xuan clearfloat">
                    <div class="radiothree" >
                        <label>
                            <input type="checkbox" name="fapiao" value="" />
                            <div class="option"></div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--settlement star-->
<div class="settlement clearfloat">
    <div class="zuo clearfloat fl box-s">
        共<span>1</span>件  总金额：<span>￥2998</span>
    </div>
    <a href="submit-order.html" class="fl db">
        提交订单
    </a>
</div>
<!--settlement end-->


<div id="BuyUrl" ajaxUrl=""></div>

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