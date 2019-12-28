<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:78:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\user\addressadd.html";i:1577439162;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1577412155;}*/ ?>
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
    
<style>
    .wheel-scroll.wheel-scroll-hook {
        margin: 0;
        padding: 0;
    }
    .picker .picker-panel .picker-choose .confirm{
        right: -4.5rem!important;
    }
</style>


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
    <p>添加新地址</p>
    <span class="fr baocun" _addressBaocun>保存</span>
</header>
<div id="main" class="mui-clearfix add-address">
    <div class="plist clearfloat data">
        <input type="hidden" name='id' value="<?php echo isset($vo['id']) ? $vo['id'] :  ''; ?>">
        <ul>
            <li class="clearfloat">
                <a href="#">
                    <p class="fl">收货人</p>
                    <input type="text" class="fl shuru" name="realname" value="<?php echo isset($vo['realname']) ? $vo['realname'] :  ''; ?>" placeholder="收件人" />
                </a>
            </li>
            <li class="clearfloat">
                <a href="#">
                    <p class="fl">联系电话</p>
                    <input type="text" class="fl shuru" name="phone" value="<?php echo isset($vo['phone']) ? $vo['phone'] :  ''; ?>" placeholder="联系电话" />

                </a>
            </li>
            <li class="clearfloat">
                <a href="#">
                    <p class="fl">所在地区</p>
                    <input type="text" class="fl shuru" id="picker" name="address" readonly value="<?php echo isset($vo['address']) ? $vo['address'] :  ''; ?>" placeholder="点击选择地区" />

                </a>
            </li>
        </ul>
    </div>
    <textarea name="addressshow" rows="4" cols="" placeholder="请填写详细地址，不少于5个字" class="textare box-s"><?php echo isset($vo['addressshow']) ? $vo['addressshow'] :  ''; ?></textarea>
    <div class="address-btn clearfloat">
        <span class="szwmr fl">设为默认</span>
        <a href="#" class="toggle <?php if(isset($vo)): if($vo['type'] ==  1): ?>toggle--off<?php else: ?>toggle--on<?php endif; else: ?>toggle--on<?php endif; ?> fr"></a>
    </div>
</div>


<div id="setAddress" ajaxUrl="<?php echo url('user/addressadd'); ?>"></div>
<div id="callUrl" ajaxUrl="<?php echo url('user/address'); ?>"></div>

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

<script src="__STATIC__/js/sanji/picker.min.js?v=<?php echo time(); ?>"></script>
<script src="__STATIC__/js/sanji/city.js?v=<?php echo time(); ?>"></script>
<script src="__STATIC__/js/sanji/index.js?v=<?php echo time(); ?>"></script>



<script>
    $(function () {
        $('.toggle').click(function(e){

            var toggle = this;

            e.preventDefault();

            $(toggle).toggleClass('toggle--on').toggleClass('toggle--off').addClass('toggle--moving');

            setTimeout(function(){
                $(toggle).removeClass('toggle--moving');
            }, 200)

        });
    })

</script>


</html>