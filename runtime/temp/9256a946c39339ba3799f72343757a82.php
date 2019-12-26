<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:74:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\index\index.html";i:1576804995;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1576726346;s:80:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\leftmenu.html";i:1576573369;s:78:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\banner.html";i:1576490149;}*/ ?>
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


<!-- 侧边导航 -->
<!-- 侧边导航 -->
<div class="slide-mask"></div>
<aside class="slide-wrapper">
    <div>
        <ul>
            <?php $_result=getlist('GoodsClassify');if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;?>
               <li><a href="<?php echo url('category/list',array('id'=>$r['id'])); ?>"><?php echo $r['name']; ?></a></li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div>
</aside>
<div id="main" class="clearfloat warp">
    <div class="mui-content">
        
<!--banner开始-->
<div class="banner swiper-container">
    <div class="swiper-wrapper">
        <?php $_result=banner(1);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;?>
        <div class="swiper-slide"><a href="<?php echo isset($r['url']) ? $r['url'] :  'javascript:;'; ?>"><img class="swiper-lazy" data-src="<?php echo $r['banner']; ?>" alt=""></a></div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
</div>
<!--banner结束-->

        <!--第一栏分类开始-->

        <!--第一栏分类结束-->
        <!--滚动公告开始-->
        <div class="notice clearfloat box-s">
            <p class="tit clearfloat fl">利民公告：</p>
            <div class="left fl clearfloat box-s">
                <div class="slider autoplay">
                    <div>这里是新闻资讯内容可以手滑滚动</div>
                    <div>这里是新闻资讯内容可以手滑滚动</div>
                    <div>这里是新闻资讯内容可以手滑滚动</div>
                    <div>这里是新闻资讯内容可以手滑滚动</div>
                    <div>这里是新闻资讯内容可以手滑滚动</div>
                    <div>这里是新闻资讯内容可以手滑滚动</div>
                </div>
            </div>
            <a href="#" class="nmore clearfloat fr">更多</a>
        </div>
        <!--滚动公告结束-->
        <!--like star-->
        <div class="like clearfloat box-s">
            <div class="boutit clearfloat">
                <span></span>
                <samp>商品列表</samp>
            </div>
            <div class="content clearfloat">

            </div>
        </div>
        <!--like end-->
    </div>
</div>


<div id="ajax-url" data-ajax-url="<?php echo url('index/Getlist'); ?>" data-ajax-posid="1" data-ajax-action="goods"></div>

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

<script src="__STATIC__/js/index.js?v=<?php echo time(); ?>" type="text/javascript"></script>


</html>