<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:74:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\user\uppass.html";i:1576724644;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1576726346;}*/ ?>
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
<header class="mui-bar mui-bar1 mui-bar-nav mui-bar-nav1" id="header">
    <a class="btn" href="javascript:history.go(-1)">
        <i class="iconfont icon-fanhui"></i>
    </a>
    <div class="top-sch-box top-sch-boxtwo top-sch-boxthree flex-col">
        返回
    </div>
</header>
<!--header end-->

<div class="warp warpthree clearfloat">
    <div class="h-top h-toptwo clearfloat box-s">
        <p class="tu"><?php if(isEmpty($userInfo['header'])): ?>
            <img src="__STATIC__/img/touxiang.png"/>
            <?php else: ?>
            <img src="<?php echo $userInfo['header']; ?>"/>
            <?php endif; ?></p>
        <p class="nr"><?php echo !empty($userInfo['realname'])?$userInfo['realname'] : "未设置"; ?> <span></span></p>
    </div>
    <div class="apply recharge clearfloat">
        <div class="appxiugai clearfloat">
            <ul>
                <li class="ra3 fl">
                    <i class="iconfont icon-mima fl"></i>
                    <input type="text" name="newPass" id="" value="" placeholder="请输入新密码" />
                </li>
                <li class="ra3 fl">
                    <i class="iconfont icon-mima fl"></i>
                    <input type="text" name="oldPass" id="" value="" placeholder="确认输入原始密码" />
                </li>
            </ul>
        </div>
        <div class="xia clearfloat">
            <a href="javascript:;" class="db fl btn ra3" _btnuppass>确定</a>
            <a href="<?php echo url('user/index'); ?>" class="db fr btn ra3">取消</a>
        </div>
    </div>
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



</html>