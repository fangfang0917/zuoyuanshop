<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:74:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\index\index.html";i:1576488944;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\base.html";i:1576483021;s:78:"D:\phpstudy_pro\WWW\shop\public/../application/index\view\template\banner.html";i:1576489143;}*/ ?>
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
<div class="slide-mask"></div>
<aside class="slide-wrapper">
    <div>
        <ul>
            <li><a href="list.html">家居家纺</a></li>
            <li><a href="list.html">3C数码</a></li>
            <li><a href="list.html">家用电器</a></li>
            <li><a href="list.html">厨房小电</a></li>
            <li><a href="list.html">零食小吃</a></li>
            <li><a href="list.html">酒水饮料</a></li>
            <li><a href="list.html">个护健康</a></li>
            <li><a href="list.html">生活电器</a></li>
            <li><a href="list.html">服饰</a></li>
            <li><a href="list.html">五金家装</a></li>
        </ul>
    </div>
</aside>

<div id="main" class="clearfloat warp">
    <div class="mui-content">
        
<!--banner开始-->
<div class="banner swiper-container">
    <div class="swiper-wrapper">
        <?php $_result=banner(1);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;?>
        <div class="swiper-slide"><a href="javascript:void(0)"><img class="swiper-lazy" data-src="<?php echo $r['banner']; ?>" alt=""></a></div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
</div>
<!--banner结束-->

        <!--第一栏分类开始-->
        <div class="cation clearfloat box-s">
            <ul>
                <li>
                    <a href="#">
                        <img src="__STATIC__/img/icon1.png"/>
                        <p>报单专区</p>
                    </a>
                </li>
                <li>
                    <a href="lianmeng.html">
                        <img src="__STATIC__/img/icon2.png"/>
                        <p>联盟商家</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="__STATIC__/img/icon3.png"/>
                        <p>猜你喜欢</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="__STATIC__/img/icon4.png"/>
                        <p>热门商品</p>
                    </a>
                </li>
            </ul>
        </div>
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

        <!--boutique star-->
        <div class="boutique clearfloat box-s">
            <div class="boutit clearfloat">
                <span></span>
                <samp>精品任选</samp>
            </div>
            <div class="content clearfloat">
                <ul>
                    <li>
                        <a href="#">
                            <img src="__STATIC__/upload/1.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="__STATIC__/upload/2.jpg"/>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--boutique end-->

        <!--seller star-->
        <div class="seller clearfloat">
            <div class="boutit clearfloat">
                <span></span>
                <samp>热卖推荐</samp>
            </div>
            <div class="content clearfloat">
                <div class="left clearfloat fl">
                    <a href="detail.html">
                        <div class="top clearfloat box-s">
                            <p class="tit over">天天特惠</p>
                            <span class="over db">每天10点 爆款抢不停</span>
                        </div>
                        <div class="tu">
                            <img src="__STATIC__/upload/3.jpg"/>
                        </div>
                    </a>
                </div>
                <div class="right clearfloat fr">
                    <div class="top clearfloat fl">
                        <a href="detail.html">
                            <div class="zuo clearfloat fl box-s">
                                <p class="tit over">酒水饮料</p>
                                <span class="over db">炫彩预调鸡尾酒</span>
                            </div>
                            <div class="tu clearfloat fr">
                                <span></span>
                                <img src="__STATIC__/upload/4.jpg"/>
                            </div>
                        </a>
                    </div>
                    <div class="top clearfloat fl">
                        <a href="detail.html">
                            <div class="zuo clearfloat fl box-s">
                                <p class="tit over">酒水饮料</p>
                                <span class="over db">炫彩预调鸡尾酒</span>
                            </div>
                            <div class="tu clearfloat fr">
                                <span></span>
                                <img src="__STATIC__/upload/4.jpg"/>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--seller end-->

        <!--onnew star-->
        <div class="onnew clearfloat">
            <div class="boutit clearfloat">
                <span></span>
                <samp>每周上新</samp>
            </div>
            <div class="content clearfloat">
                <div class="top clearfloat">
                    <div class="list clearfloat fl box-s">
                        <a href="detail.html">
                            <div class="zuo clearfloat fl box-s">
                                <p class="tit over">电器数码</p>
                                <span class="over db">大屏就是小米max</span>
                            </div>
                            <div class="tu clearfloat fr">
                                <span></span>
                                <img src="__STATIC__/upload/6.jpg"/>
                            </div>
                        </a>
                    </div>
                    <div class="list clearfloat fl box-s">
                        <a href="detail.html">
                            <div class="zuo clearfloat fl box-s">
                                <p class="tit over">电器数码</p>
                                <span class="over db">大屏就是小米max</span>
                            </div>
                            <div class="tu clearfloat fr">
                                <span></span>
                                <img src="__STATIC__/upload/6.jpg"/>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="bottom clearfloat">
                    <div class="list clearfloat fl">
                        <a href="detail.html">
                            <div class="shang clearfloat fl box-s">
                                <p class="tit over">一起玩耍</p>
                                <span class="over db">一款贱贱的ted熊</span>
                            </div>
                            <div class="tu clearfloat fr">
                                <span></span>
                                <img src="__STATIC__/upload/7.jpg"/>
                            </div>
                        </a>
                    </div>
                    <div class="list clearfloat fl">
                        <a href="detail.html">
                            <div class="shang clearfloat fl box-s">
                                <p class="tit over">一起玩耍</p>
                                <span class="over db">一款贱贱的ted熊</span>
                            </div>
                            <div class="tu clearfloat fr">
                                <span></span>
                                <img src="__STATIC__/upload/7.jpg"/>
                            </div>
                        </a>
                    </div>
                    <div class="list clearfloat fl">
                        <a href="detail.html">
                            <div class="shang clearfloat fl box-s">
                                <p class="tit over">一起玩耍</p>
                                <span class="over db">一款贱贱的ted熊</span>
                            </div>
                            <div class="tu clearfloat fr">
                                <span></span>
                                <img src="__STATIC__/upload/7.jpg"/>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--onnew end-->



        <!--like star-->
        <div class="like clearfloat box-s">
            <div class="boutit clearfloat">
                <span></span>
                <samp>猜你喜欢</samp>
            </div>
            <div class="content clearfloat">
                <div class="list clearfloat fl">
                    <a href="detail.html">
                        <div class="tu clearfloat">
                            <img src="__STATIC__/upload/9.jpg"/>
                        </div>
                        <div class="bottom clearfloat box-s">
                            <p class="over">休闲运动男女鞋春夏秋冬款</p>
                            <span>¥108.00</span>
                        </div>
                    </a>
                </div>
                <div class="list clearfloat fl">
                    <a href="detail.html">
                        <div class="tu clearfloat">
                            <img src="__STATIC__/upload/9.jpg"/>
                        </div>
                        <div class="bottom clearfloat box-s">
                            <p class="over">休闲运动男女鞋春夏秋冬款</p>
                            <span>¥108.00</span>
                        </div>
                    </a>
                </div>
                <div class="list clearfloat fl">
                    <a href="detail.html">
                        <div class="tu clearfloat">
                            <img src="__STATIC__/upload/9.jpg"/>
                        </div>
                        <div class="bottom clearfloat box-s">
                            <p class="over">休闲运动男女鞋春夏秋冬款</p>
                            <span>¥108.00</span>
                        </div>
                    </a>
                </div>
                <div class="list clearfloat fl">
                    <a href="detail.html">
                        <div class="tu clearfloat">
                            <img src="__STATIC__/upload/9.jpg"/>
                        </div>
                        <div class="bottom clearfloat box-s">
                            <p class="over">休闲运动男女鞋春夏秋冬款</p>
                            <span>¥108.00</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!--like end-->
    </div
</div>
<!--footer star-->
<footer class="page-footer fixed-footer" id="footer">
    <ul>
        <li class="active">
            <a href="index.html">
                <i class="iconfont icon-shouye"></i>
                <p>首页</p>
            </a>
        </li>
        <li>
            <a href="cation.html">
                <i class="iconfont icon-icon04"></i>
                <p>分类</p>
            </a>
        </li>
        <li>
            <a href="shopcar.html">
                <i class="iconfont icon-gouwuche"></i>
                <p>购物车</p>
            </a>
        </li>
        <li>
            <a href="login.html">
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