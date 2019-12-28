<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:73:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\user\index.html";i:1577431619;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1577412155;}*/ ?>
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

<div class="warp clearfloat">
    <div class="h-top clearfloat box-s">
        <div class="tu clearfloat fl">

            <img src="<?php echo !empty($userInfo['header'])?$userInfo['header'] : '__STATIC__/img/touxiang.png'; ?>"/>

        </div>
        <div class="content clearfloat fl">
            <p class="hname"><?php echo !empty($userInfo['realname'])?$userInfo['realname'] : "未设置"; ?></p>
            <p class="htel"><?php echo $userInfo['username']; ?></p>
            <!--<p class="hpthy">普通会员</p>-->
        </div>
        <!--<a href="#" class="btn db clearfloat fr ra3">签到</a>-->
    </div>
    <div class="cash clearfloat">
        <div class="shang clearfloat">
            <ul>
                <!--<li>-->
                    <!--<a href="#">-->
                        <!--<p>74.00</p>-->
                        <!--<span>现金余额</span>-->
                    <!--</a>-->
                <!--</li>-->
                <li>
                    <a href="#">
                        <p><?php echo $userInfo['amount']; ?></p>
                        <span>可用积分</span>
                    </a>
                </li>
                <!--<li>-->
                    <!--<a href="#">-->
                        <!--<p>104598</p>-->
                        <!--<span>待用积分</span>-->
                    <!--</a>-->
                <!--</li>-->
            </ul>
        </div>
        <!--<div class="shang xia clearfloat">-->
            <!--<ul>-->
                <!--<li>-->
                    <!--<a href="#">-->
                        <!--<p>31000</p>-->
                        <!--<span>商品兑换券</span>-->
                    <!--</a>-->
                <!--</li>-->
                <!--<li>-->
                    <!--<a href="#">-->
                        <!--<p>56179</p>-->
                        <!--<span>可倍增积分额值</span>-->
                    <!--</a>-->
                <!--</li>-->
            <!--</ul>-->
        <!--</div>-->
    </div>
    <!--<div class="cashlist clearfloat">-->
        <!--<ul>-->
            <!--<li class="box-s">-->
                <!--<a href="account.html">-->
                    <!--<p class="fl">现金账户管理</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <!--<li class="box-s">-->
                <!--<a href="recharge.html">-->
                    <!--<p class="fl">现金充值</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <!--<li class="box-s">-->
                <!--<a href="zhuanzhang.html">-->
                    <!--<p class="fl">现金转账</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
        <!--</ul>-->
    <!--</div>-->
    <!--<div class="cashlist clearfloat">-->
        <!--<ul>-->
            <!--<li class="box-s">-->
                <!--<a href="jfguanli.html">-->
                    <!--<p class="fl">可用积分管理</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <!--<li class="box-s">-->
                <!--<a href="jfguanli.html">-->
                    <!--<p class="fl">待用积分管理</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <!--<li class="box-s">-->
                <!--<a href="jfguanli.html">-->
                    <!--<p class="fl">业务奖励积分</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <!--<li class="box-s">-->
                <!--<a href="jfzhuanyong.html">-->
                    <!--<p class="fl">可用转待用</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <!--<li class="box-s">-->
                <!--<a href="jfzhuanzhang.html">-->
                    <!--<p class="fl">可用积分转账</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
        <!--</ul>-->
    <!--</div>-->
    <!--<div class="cashlist clearfloat">-->
        <!--<ul>-->
            <!--<li class="box-s">-->
                <!--<a href="spduihuan.html">-->
                    <!--<p class="fl">商品兑换券</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <!--<li class="box-s">-->
                <!--<a href="baodan.html">-->
                    <!--<p class="fl">报单商品券</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
        <!--</ul>-->
    <!--</div>-->
    <div class="cashlist clearfloat">
        <ul>
            <!--<li class="box-s">-->
                <!--<a href="sqlianmeng.html">-->
                    <!--<p class="fl">申请联盟商家</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <!--<li class="box-s">-->
                <!--<a href="sqyunying.html">-->
                    <!--<p class="fl">申请运营中心</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <li class="box-s">
                <a href="<?php echo url('order/index'); ?>">
                    <p class="fl">消费订单管理</p>
                    <i class="iconfont icon-jiantou1 fr"></i>
                </a>
            </li>
            <!--<li class="box-s">-->
                <!--<a href="friend.html">-->
                    <!--<p class="fl">我的好友</p>-->
                    <!--<i class="iconfont icon-jiantou1 fr"></i>-->
                <!--</a>-->
            <!--</li>-->
            <li class="box-s">
                <a href="<?php echo url('user/uppass'); ?>">
                    <p class="fl">修改密码</p>
                    <i class="iconfont icon-jiantou1 fr"></i>
                </a>
            </li>
            <li class="box-s">
                <a href="<?php echo url('user/uprealname'); ?>">
                    <p class="fl">修改姓名</p>
                    <i class="iconfont icon-jiantou1 fr"></i>
                </a>
            </li>
            <li class="box-s">
                <a href="<?php echo url('user/addr'); ?>">
                    <p class="fl">地址管理</p>
                    <i class="iconfont icon-jiantou1 fr"></i>
                </a>
            </li>
        </ul>
    </div>
    <a href="#" class="center-btn db ra3">退出登录</a>
</div>

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