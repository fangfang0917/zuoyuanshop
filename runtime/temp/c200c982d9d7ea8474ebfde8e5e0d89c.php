<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:77:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\attr_val\index.html";i:1576651845;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\template\base.html";i:1576807343;s:87:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\template\javascript_vars.html";i:1488899632;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\attr_val\form.html";i:1576650858;s:74:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\attr_val\th.html";i:1576652729;s:74:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\attr_val\td.html";i:1576650875;}*/ ?>
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

<nav class="breadcrumb">
    <div id="nav-title"></div>
    <a class="btn btn-success radius r btn-refresh" style="line-height:1.6em;margin-top:3px" href="javascript:;" title="刷新"><i class="Hui-iconfont"></i></a>
</nav>


<div class="page-container">
    <form class="mb-20" method="get" action="<?php echo \think\Url::build(\think\Request::instance()->action()); ?>">
    <input type="text" class="input-text" style="width:250px" placeholder="Id" name="id" value="<?php echo \think\Request::instance()->param('id'); ?>" >
    <input type="text" class="input-text" style="width:250px" placeholder="规格属性名称" name="name" value="<?php echo \think\Request::instance()->param('name'); ?>" >
    <button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
</form>
    <div class="cl pd-5 bg-1 bk-gray">
        <span class="l">
            <a class="btn btn-primary radius mr-5" href="javascript:;" onclick="layer_open('添加','<?php echo url('attr_val/add'); ?>?kid=<?php echo $kid; ?>')"><i class="Hui-iconfont"></i> 添加</a>
            <?php if (\Rbac::AccessCheck('forbid')) : ?><a href="javascript:;" onclick="forbid_all('<?php echo \think\Url::build('forbid', []); ?>')" class="btn btn-warning radius mr-5"><i class="Hui-iconfont">&#xe631;</i> 禁用</a><?php endif; if (\Rbac::AccessCheck('resume')) : ?><a href="javascript:;" onclick="resume_all('<?php echo \think\Url::build('resume', []); ?>')" class="btn btn-success radius mr-5"><i class="Hui-iconfont">&#xe615;</i> 恢复</a><?php endif; ?>
            
        </span>
        <span class="r pt-5 pr-5">
            共有数据 ：<strong><?php echo isset($count) ? $count :  '0'; ?></strong> 条
        </span>
    </div>
    <table class="table table-border table-bordered table-hover table-bg mt-20">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox"></th>
<th width="100"><?php echo sort_by('Id','id'); ?></th>
<th width="150">规格属性名称</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr class="text-c">
            <td><input type="checkbox" name="id[]" value="<?php echo $vo['id']; ?>"></td>
<td><?php echo high_light($vo['id'],\think\Request::instance()->param('id')); ?></td>
<td><?php echo high_light($vo['name'],\think\Request::instance()->param('name')); ?></td>
            <td class="f-14">
                <?php echo show_status($vo['status'],$vo['id']); if (\Rbac::AccessCheck('deleteforever')) : ?><a href="javascript:;" onclick="del_forever_all('<?php echo \think\Url::build('deleteforever', []); ?>')" class="btn btn-danger radius mr-5"><i class="Hui-iconfont">&#xe6e2;</i> 彻底删除</a><?php endif; ?>
            </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
    </table>
    <div class="page-bootstrap"><?php echo isset($page) ? $page :  ''; ?></div>
</div>

<script type="text/javascript" src="__LIB__/jquery/1.9.1/jquery.min.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__STATIC__/h-ui/js/H-ui.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__STATIC__/h-ui.admin/js/H-ui.admin.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__STATIC__/js/app.js?v=<?php echo time(); ?>"></script>
<script type="text/javascript" src="__LIB__/icheck/jquery.icheck.min.js?v=<?php echo time(); ?>"></script>

<script>
    $(function () {
        $("[name='attr_key_id']").find("[value='<?php echo \think\Request::instance()->param('attr_key_id'); ?>']").attr("selected", true);
    })
</script>

</body>
</html>