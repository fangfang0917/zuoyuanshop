<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:74:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\login\index.html";i:1576481678;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1576479897;}*/ ?>
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
			<h3>会员登录</h3>
			<div class="list clearfloat">
				<ul>
					<li class="ra3">
						<p class="fl clearfloat">
							<span class="opa5"></span>
							<i class="iconfont icon-yonghuming"></i>
						</p>
						<div class="nr clearfloat fl">
							<span class="opa3"></span>
							<input type="text" name="username" id="" value="" placeholder="用户姓名" />
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
			<div class="mima clearfloat">
				<ul>
					<li class="fl">
						<div class="xuan clearfloat fl">
		    				<div class="radiofour" > 
							    <label>
							        <input type="checkbox" name="" value="" />
							        <div class="option"></div>
							        <span class="opt-text">记住密码</span>
							    </label>
							</div>
		    			</div>
					</li>
					<li class="fr">
						<a href="verification.html">找回密码？</a>
					</li>
				</ul>
			</div>
			<div class="login-btn">
				<a href="javascript:;" _login data-ajax-url="<?php echo $ajaxUrl; ?>">
					登录
				</a>
				<a href="<?php echo url('Register/index'); ?>" class="btn">
					<span class="opa5"></span>
					<samp>注册</samp>
				</a>
			</div>
		</div>


</body>
<script src="__STATIC__/js/comm.js?v=<?php echo time(); ?>" type="text/javascript"></script>



</html>