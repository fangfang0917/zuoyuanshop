<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:77:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\category\index.html";i:1576631184;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1576574044;s:78:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\header.html";i:1576573339;}*/ ?>
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
    <a class="btn slide-menu" href="#">
        <i class="iconfont icon-iconfontcaidan"></i>
    </a>
    <div class="top-sch-box flex-col">
        <div class="centerflex">
            <i class="fdj iconfont icon-sousuo"></i>
            <input type="text" name="" id="" value="" class="sch-txt" placeholder="输入您要搜索的商品" />
        </div>
    </div>
    <a class="btn" href="#">
        <i class="iconfont icon-erweima"></i>
    </a>
</header>
<!--header end-->

<div class="warp clearfloat">
    <!--cation star-->
    <div class="cations clearfloat">
        <?php $_result=getlist('GoodsClassify');if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;?>


        <div class="list clearfloat fl">
            <a href="<?php echo url('category/goodslist', array('id' => $r['id'])); ?>">
                <p class="tit over box-s"><?php echo $r['name']; ?></p>
                <div class="tu">
                    <img src="<?php echo $r['thumb']; ?>"/>
                </div>
            </a>
        </div>
        <?php endforeach; endif; else: echo "" ;endif; ?>

    </div>
    <!--cation end-->
</div>

<!--footer star-->
<footer class="page-footer fixed-footer" id="footer">
    <!--<?php dump($Controller);?>-->
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

        <a href="<?php echo url('shopcar/index'); ?>">
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
<!--footer end-->
</body>
<script type="text/javascript" src="__STATIC__/js/jquery-1.8.3.min.js?v=<?php echo time(); ?>" ></script>
<!--<script src="__STATIC__/js/others.js?v=<?php echo time(); ?>"></script>-->
<script type="text/javascript" src="__STATIC__/js/hmt.js?v=<?php echo time(); ?>" ></script>
<script src="__STATIC__/slick/slick.js?v=<?php echo time(); ?>" type="text/javascript" ></script>
<!--插件-->
<link rel="stylesheet" href="__STATIC__/css/swiper.min.css?v=<?php echo time(); ?>">
<script src="__STATIC__/js/swiper.jquery.min.js?v=<?php echo time(); ?>"></script>
<!--新闻资讯滚动-->
<script src="__STATIC__/js/comm.js?v=<?php echo time(); ?>" type="text/javascript"></script>



</html>