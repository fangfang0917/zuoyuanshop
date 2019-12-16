<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:77:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\register\index.html";i:1576481716;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1576479897;}*/ ?>
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


<div class="login clearfloat box-s">
    <h3>会员注册</h3>
    <div class="list clearfloat">
        <ul>
            <li class="ra3">
                <p class="fl clearfloat">
                    <span class="opa5"></span>
                    <i class="iconfont icon-yonghuming"></i>
                </p>
                <div class="nr clearfloat fl">
                    <span class="opa3"></span>
                    <input type="text" name="username" id="" value="" placeholder="用户名(手机号)" />
                </div>
            </li>
            <li class="ra3">
                <p class="fl clearfloat">
                    <span class="opa5"></span>
                    <i class="iconfont icon-mima"></i>
                </p>
                <div class="nr clearfloat fl">
                    <span class="opa3"></span>
                    <input type="text" name="pass" id="" value="" placeholder="登录密码" />
                </div>
            </li>
            <!--<li class="ra3">-->
                <!--<p class="fl clearfloat">-->
                    <!--<span class="opa5"></span>-->
                    <!--<i class="iconfont icon-shouji"></i>-->
                <!--</p>-->
                <!--<div class="nr clearfloat fl">-->
                    <!--<span class="opa3"></span>-->
                    <!--<input type="text" name="" id="" value="" placeholder="联系电话" />-->
                <!--</div>-->
            <!--</li>-->
            <!--<li class="ra3">-->
                <!--<p class="fl clearfloat">-->
                    <!--<span class="opa5"></span>-->
                    <!--<i class="iconfont icon-shenfenzheng"></i>-->
                <!--</p>-->
                <!--<div class="nr clearfloat fl">-->
                    <!--<span class="opa3"></span>-->
                    <!--<input type="text" name="" id="" value="" placeholder="身份证号" />-->
                <!--</div>-->
            <!--</li>-->
            <!--<li class="ra3">-->
                <!--<p class="fl clearfloat">-->
                    <!--<span class="opa5"></span>-->
                    <!--<i class="iconfont icon-tuijianrenyaoqing"></i>-->
                <!--</p>-->
                <!--<div class="nr clearfloat fl">-->
                    <!--<span class="opa3"></span>-->
                    <!--<input type="text" name="" id="" value="" placeholder="推荐人账户" />-->
                <!--</div>-->
            <!--</li>-->
            <!--<li class="ra3">-->
                <!--<p class="fl clearfloat">-->
                    <!--<span class="opa5"></span>-->
                    <!--<i class="iconfont icon-yanzhengma"></i>-->
                <!--</p>-->
                <!--<div class="nr nrtwo clearfloat fl">-->
                    <!--<span class="opa3"></span>-->
                    <!--<input type="text" name="" id="" value="" placeholder="验证码" />-->
                    <!--<samp class="db fr">0212</samp>-->
                <!--</div>-->
            <!--</li>-->
        </ul>
    </div>
    <div class="login-btn">
        <a href="javascript:;" _login  data-ajax-url="<?php echo $ajaxUrl; ?>">
            注册
        </a>
    </div>
    <div class="mima mimaone clearfloat">
        <ul>
            <li class="fr">
                <a href="<?php echo url('login/index'); ?>">立即登录</a>
            </li>
        </ul>
    </div>
</div>


</body>
<script src="__STATIC__/js/comm.js?v=<?php echo time(); ?>" type="text/javascript"></script>



</html>