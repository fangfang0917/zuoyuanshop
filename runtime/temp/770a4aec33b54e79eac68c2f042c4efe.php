<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:76:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\goods\getattr.html";i:1577063654;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\template\base.html";i:1576807343;s:87:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\template\javascript_vars.html";i:1488899632;}*/ ?>
﻿<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title><?php echo \think\Config::get('site.title'); ?></title>
    <link rel="Bookmark" href="__ROOT__/favicon.ico" >
    <link rel="Shortcut Icon" href="__ROOT__/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="__LIB__/html5.js?v=<?php echo time(); ?>"></script>
    <script type="text/javascript" src="__LIB__/respond.min.js?v=<?php echo time(); ?>"></script>
    <script type="text/javascript" src="__LIB__/PIE_IE678.js?v=<?php echo time(); ?>"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui/css/H-ui.min.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/H-ui.admin.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/Hui-iconfont/1.0.7/iconfont.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/skin/default/skin.css?v=<?php echo time(); ?>" id="skin"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/style.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/app.css?v=<?php echo time(); ?>"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css?v=<?php echo time(); ?>"/>
    
<link rel="stylesheet" type="text/css" href="__STATIC__/css/sku_style.css"/>
<style>
    .nochecked{
        width: 80px;
        height: 40px;
        border-radius: 5px;
        background: #F0F0F0;
        outline: none;
        -webkit-appearance: none;

    }

    .ischecked{
        width: 80px;
        height: 40px;
        border-radius: 5px;
        background: #96CDCD;
        outline: none;
        -webkit-appearance: none;

    }

    .attr_font{
        position: absolute;
        width:80px;
        height:40px;
        z-index: 1;
        top: -10px;
        line-height: 40px;
        text-align: center;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .btns{
        width:100%;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        visibility: hidden;
    }
</style>

    <!--[if IE 6]>
    <script type="text/javascript" src="__LIB__/DD_belatedPNG_0.0.8a-min.js?v=<?php echo time(); ?>"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--定义JavaScript常量-->
<script>
    window.THINK_ROOT = '<?php echo \think\Request::instance()->root(); ?>';
    window.THINK_MODULE = '<?php echo \think\Url::build("/" . \think\Request::instance()->module(), "", false); ?>';
    window.THINK_CONTROLLER = '<?php echo \think\Url::build("___", "", false); ?>'.replace('/___', '');
</script>
</head>
<body>


<div class="page-container">

    <?php if($classify): foreach($classify as $k=>$v): ?>
    <ul class="SKU_TYPE">
        <li is_required='0' propid="<?php echo $v['id']; ?>" sku-type-name="<?php echo $v['name']; ?>"  style="text-align: right;width:100px;overflow: hidden;white-space:nowrap"><?php echo $v['name']; ?>：
        </li>
    </ul>
    <ul>
        <?php foreach($v['attrval'] as $kk=>$vv): ?>
        <li><label style="position: relative;"><input type="checkbox" <?php if($vv['checked'] == 1): ?> checked<?php endif; ?>  class="sku_value nochecked" propvalid="<?php echo $vv['id']; ?>"
            value="<?php echo $vv['name']; ?>" /><div class="attr_font"><?php echo $vv['name']; ?></div></label></li>
        <?php endforeach; ?>
    </ul>
    <div class="clear" style="height: 10px"></div>
    <?php endforeach; else: ?>

    请添加商品规格模板以及属性
    <?php endif; ?>
    <div id="skuTable"></div>
</div>
<div class="btns">
    <div class="btn btn-success radius mr-5" onclick="yusuan()">保存</div>
    <div class="btn btn-danger radius mr-5" onclick="clearAllAttr()">清空</div>
</div>

<script type="text/javascript" src="__LIB__/jquery/1.9.1/jquery.min.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__STATIC__/h-ui/js/H-ui.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__STATIC__/h-ui.admin/js/H-ui.admin.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__STATIC__/js/app.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__LIB__/icheck/jquery.icheck.min.js?v=<?php echo time(); ?>"></script>

<script type="text/javascript" src="__STATIC__/js/createSkuTable.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__STATIC__/js/customSku.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js"></script>
<script type="text/javascript" src="__STATIC__/js/getSetSkuVals.js?v=<?php echo time(); ?>"></script>
<script>
    $(function () {
        var str = <?php echo $arr; ?>;
        var e = $('input[type=checkbox]:checked').length;
        alreadySetSkuVals = str;
        if(e>0){
            qw();
        }

        //判断当前input是否被选中
        var boxes = $('input[type=checkbox]');
        var has_item = false;
        for(var i = 0,ilen = boxes.length; i < ilen ;i++){
            if($(boxes[i]).is(':checked')){
                $(boxes[i]).attr('class','sku_value ischecked');
                has_item = true;
            }else{
                $(boxes[i]).attr('class','sku_value nochecked');
            }
        }

        if(has_item){
            $('.btns').css('visibility','visible');
        }


        $('input[type=checkbox]').click(function(){
            var boxes = $('input[type=checkbox]');
            var has_item = false;
            for(var i = 0,ilen = boxes.length; i < ilen ;i++){
                if($(boxes[i]).is(':checked')){
                    $(boxes[i]).attr('class','sku_value ischecked');
                    has_item = true;
                }else{
                    $(boxes[i]).attr('class','sku_value nochecked');
                }
            }

            if(has_item){
                $('.btns').css('visibility','visible');
                $('#skuTable').show();
            }else{
                $('.btns').css('visibility','hidden');
                $('#skuTable').hide();
            }
        });
    })

    function yusuan() {
        alreadySetSkuVals = {};
        getAlreadySetSkuVals();
        var len =  $("tr[class*='sku_table_tr']").length;
        var arr = Object.keys(alreadySetSkuVals);
        console.log(arr);
        if(arr.length>0){
            if(arr.length == len) {
                $.post("<?php echo url('goods/setsession'); ?>", {arr: alreadySetSkuVals}, function (data) {
                    if (data.state == 1) {
                        layer.msg(data.msg, {icon: 6, time: 1000});
                        setInterval(function () {
                            window.parent.setattr();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                            layer_close()
                        }, 1000)
                    } else {
                        layer.msg(data.msg, {icon: 5, time: 1000});
                    }
                })
            }else{
                layer.msg('请填写价格或库存', {icon: 5, time: 1000});
            }

        }
    }

    function clearAllAttr() {
        postJSON("<?php echo url('AddGoodsAttr/deletesession'); ?>",{},function (data) {
            layer.msg(data.msg,{icon:6,time:1000});
            setInterval(function () {
                // window.parent.setattr();
                // var index = parent.layer.getFrameIndex(window.name);
                // parent.layer.close(index);
                // layer_close()
            },1000)
        })
    }
</script>

</body>
</html>