<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:73:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\goods\edit.html";i:1576571657;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\template\base.html";i:1488899632;s:87:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\template\javascript_vars.html";i:1488899632;}*/ ?>
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
    <script type="text/javascript" src="__LIB__/html5.js"></script>
    <script type="text/javascript" src="__LIB__/respond.min.js"></script>
    <script type="text/javascript" src="__LIB__/PIE_IE678.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/app.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css"/>
    
    <!--[if IE 6]>
    <script type="text/javascript" src="__LIB__/DD_belatedPNG_0.0.8a-min.js"></script>
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

<nav class="breadcrumb">
    <div id="nav-title"></div>
    <a class="btn btn-success radius r btn-refresh" style="line-height:1.6em;margin-top:3px" href="javascript:;" title="刷新"><i class="Hui-iconfont"></i></a>
</nav>


<div class="page-container">
    <form class="form form-horizontal" id="form" method="post" action="<?php echo \think\Request::instance()->baseUrl(); ?>">
        <input type="hidden" name="id" value="<?php echo isset($vo['id']) ? $vo['id'] :  ''; ?>">
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>所属分类：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <div class="select-box" style="width:250px">
                    <?php if(isset($vo)): ?>
                    <?php echo GetGoodsC($vo['cid']); else: ?>
                    <?php echo GetGoodsC(); endif; ?>
                </div>
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>所属分类：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <div class="select-box" style="width:250px">
                    <?php if(isset($vo)): ?>
                    <?php echo GetPos($vo['posid']); else: ?>
                    <?php echo GetGoodsC(); endif; ?>
                </div>
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>商品名：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" placeholder="商品名" name="name" value="<?php echo isset($vo['name']) ? $vo['name'] :  ''; ?>"  datatype="*" nullmsg="请填写商品名">
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>缩略图：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" id="upload" name="thumb" placeholder="请点击后面的上传按钮" datatype="*"
                       nullmsg="请填写图片url" style="width: 70%"   value="<?php echo isset($vo['thumb']) ? $vo['thumb'] :  ''; ?>">
                <button type="button" class="btn btn-primary radius"
                        onclick="layer_open('文件上传','<?php echo \think\Url::build('Upload/index', ['id' => 'upload']); ?>')">
                    上传
                </button>
                <a onclick="$('#img').attr('src', $('#upload').val());$('#img').show()" type="button" class="btn btn-success radius"
                   data-lightbox="preview">预览</a>
                <img id="img" src="<?php echo isset($vo['thumb']) ? $vo['thumb'] :  ''; ?>" alt="" <?php if(isset($vo)): ?>style="display:block;width:100%"<?php else: ?>style="display:none;width:100%"<?php endif; ?>>
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>描述：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <textarea class="textarea" placeholder="" name="description" onKeyUp="textarealength(this, 100)" datatype="*" nullmsg="请填写描述"><?php echo isset($vo['description']) ? $vo['description'] :  ''; ?></textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>详情：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" placeholder="详情" name="content" value="<?php echo isset($vo['content']) ? $vo['content'] :  ''; ?>"  datatype="*" nullmsg="请添加详情">
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>积分：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="number" class="input-text" placeholder="积分" name="int" value="<?php echo isset($vo['int']) ? $vo['int'] :  ''; ?>"  datatype="*" nullmsg="请填写积分">
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl" hidden>
            <label class="form-label col-xs-3 col-sm-3">创建时间：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="hidden" class="input-text" placeholder="创建时间" name="createtime" value="<?php echo isset($vo['createtime']) ? $vo['createtime'] :  time(); ?>" >
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>库存：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="number" class="input-text" placeholder="库存" name="stock" value="<?php echo isset($vo['stock']) ? $vo['stock'] :  ''; ?>"  datatype="*" nullmsg="请填写库存">
            </div>
            <div class="col-xs-3 col-sm-3"></div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button type="submit" class="btn btn-primary radius">&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
                <button type="button" class="btn btn-default radius ml-20" onClick="layer_close();">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="__LIB__/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="__STATIC__/js/app.js"></script>
<script type="text/javascript" src="__LIB__/icheck/jquery.icheck.min.js"></script>

<script type="text/javascript" src="__LIB__/Validform/5.3.2/Validform.min.js"></script>
<script>
    $(function () {
        $("[name='cid']").find("[value='<?php echo isset($vo['cid']) ? $vo['cid'] :  ''; ?>']").attr("selected", true);

        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form").Validform({
            tiptype: 2,
            ajaxPost: true,
            showAllError: true,
            callback: function (ret){
                ajax_progress(ret);
            }
        });
    })
</script>

</body>
</html>