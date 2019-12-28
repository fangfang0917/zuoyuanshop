<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:75:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\goods\detail.html";i:1577426349;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1577412155;}*/ ?>
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
        <ul>
            <li class="cur"><a href="#">商品</a></li>
            <li><a href="#">详情</a></li>
            <li><a href="#">评价</a></li>
        </ul>
    </div>
    <a class="btn" href="#">
        <i class="iconfont icon-gouwuche"></i>
        <span>2</span>
    </a>
</header>
<!--header end-->
<div class="warp warptwo clearfloat">
    <div class="detail clearfloat">
        <!--banner star-->
        <div class="banner swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><a href="javascript:void(0)"><img class="swiper-lazy"
                                                                            data-src="<?php echo $show['thumb']; ?>" alt=""></a>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
        <!--banner end-->
        <div class="top clearfloat box-s">
            <div class="shang clearfloat">
                <div class="zuo clearfloat fl over2 box-s">
                    <?php echo $show['name']; ?>
                </div>
                <!--<div class="you clearfloat fr">-->
                <!--<i class="iconfont icon-fenxiang"></i>-->
                <!--<p>分享</p>-->
                <!--</div>-->
            </div>
            <div class="xia clearfloat">
                <p class="jifen fl box-s"><samp><?php echo $show['int']; ?></samp>积分</p>
                <span class="fr">销量<?php echo $show['num']; ?>件</span>
            </div>
        </div>
        <div class="middle clearfloat box-s">
            <a href="#">
                <span class="fl">商品详情</span>
                <i class="iconfont icon-jiantou1 fr"></i>
            </a>
        </div>
        <div><?php echo $show['content']; ?></div>
        <!--<div class="middle clearfloat box-s">-->
        <!--<a href="#">-->
        <!--<span class="fl">商品评价</span>-->
        <!--<i class="iconfont icon-jiantou1 fr"></i>-->
        <!--</a>-->
        <!--</div>-->
        <!--<div class="goods=comment"><?php echo isset($show['content']) ? $show['content'] :  ''; ?></div>-->
    </div>
</div>


<div class="footerone clearfloat">
    <div class="left clearfloat fl">
        <ul>
            <li>
                <a href="#">
                    <i class="iconfont icon-shangcheng"></i>
                    <p>商城</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="iconfont icon-kefu1"></i>
                    <p>客服</p>
                </a>
            </li>
        </ul>
    </div>
    <div class="right clearfloat fl">
        <span class="btn fl" onClick="toshare()">加入购物车</span>
        <a href="javascript:;" class="btn btnone fl" onClick="toshare()">立即购买</a>
    </div>
</div>
<!--footerone end-->

<!--这里是弹出购物车内容-->
<div class="am-share">
    <div class="am-share-footer">
        <button class="share_btn"><img src="__STATIC__/img/chahao.png"/></button>
    </div>
    <div class="am-share-sns box-s">
        <div class="sdetail clearfloat">
            <div class="top clearfloat">
                <div class="tu clearfloat fl">
                    <span></span>
                    <img src="<?php echo $show['thumb']; ?>"/>
                </div>
                <div class="you clearfloat fl">
                    <p class="tit"><?php echo $show['name']; ?></p>
                    <span class="goodsInt "><?php echo $show['int']; ?>积分</span>
                </div>
            </div>
            <?php if(is_array($class) || $class instanceof \think\Collection || $class instanceof \think\Paginator): $i = 0; $__LIST__ = $class;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;?>
            <div class="middle clearfloat attrkey">
                <p><?php echo $r['name']; ?></p>
                <div class="xia clearfloat">
                    <ul>
                        <?php if(is_array($r["attrVal"]) || $r["attrVal"] instanceof \think\Collection || $r["attrVal"] instanceof \think\Paginator): $i = 0; $__LIST__ = $r["attrVal"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rr): $mod = ($i % 2 );++$i;?>
                        <li class="ra3" _setattr  dataAttrValId="<?php echo $rr['id']; ?>" dataAttrKeyId="<?php echo $rr['attr_key_id']; ?>"><?php echo $rr['name']; ?></li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </div>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <div id="goodsId" dataGoodsId="<?php echo $show['id']; ?>"></div>
            <div class="bottom clearfloat">
                <p class="fl">购买数量</p>
                <div class="you clearfloat fr">
                    <ul>
                        <li><img src="__STATIC__/img/jian.jpg" onclick="jianNum(this)"/></li>
                        <li class="num">1</li>
                        <li><img src="__STATIC__/img/jia.jpg" onclick="addNum(this)"/></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <a href="javascript:;" class="shop-btn db" _buy addCartUrl="<?php echo $addCartUrl; ?>">确定</a>
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

<script src="__STATIC__/js/buy.js?v=<?php echo time(); ?>"></script>


</html>