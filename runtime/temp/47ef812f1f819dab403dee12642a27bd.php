<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:74:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\order\index.html";i:1577693617;s:76:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\template\base.html";i:1576807343;s:87:"D:\phpstudy_pro\WWW\shop\public/../application/admin\view\template\javascript_vars.html";i:1488899632;}*/ ?>
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
        <input type="text" class="input-text" style="width:250px" placeholder="订单号" name="orderNo" value="<?php echo \think\Request::instance()->param('orderNo'); ?>" >
        <input type="text" class="input-text" style="width:250px" placeholder="用户" name="userId" value="<?php echo \think\Request::instance()->param('userId'); ?>" >
        <input type="text" class="input-text" style="width:250px" placeholder="创建时间" name="createTime" value="<?php echo \think\Request::instance()->param('createTime'); ?>" >
        <input type="text" class="input-text" style="width:250px" placeholder="支付状态" name="payType" value="<?php echo \think\Request::instance()->param('payType'); ?>" >
        <input type="text" class="input-text" style="width:250px" placeholder="订单状态" name="orderType" value="<?php echo \think\Request::instance()->param('orderType'); ?>" >
        <button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
    </form>
    <div class="cl pd-5 bg-1 bk-gray">
        <span class="l">
            <!--<?php if (\Rbac::AccessCheck('add')) : ?><a class="btn btn-primary radius mr-5" href="javascript:;" onclick="layer_open('添加','<?php echo \think\Url::build('add', []); ?>')"><i class="Hui-iconfont">&#xe600;</i> 添加</a><?php endif; ?>-->
        </span>
        <span class="r pt-5 pr-5">
            共有数据 ：<strong><?php echo isset($count) ? $count :  '0'; ?></strong> 条
        </span>
    </div>
    <table class="table table-border table-bordered table-hover table-bg mt-20">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox"></th>
            <th width="">Id</th>
            <th width="">订单号</th>
            <th width="">用户</th>
            <th width="">购买总数量</th>
            <th width="">购买总金额</th>
            <th width="">创建时间</th>
            <th width="">支付状态</th>
            <th width="">订单状态</th>
            <th width="">快递单号</th>
            <th width="">用户备注</th>
            <th width="">发货时间</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr class="text-c">
            <td><input type="checkbox" name="id[]" value="<?php echo $vo['id']; ?>"></td>
            <td><?php echo high_light($vo['id'],\think\Request::instance()->param('id')); ?></td>
            <td><?php echo high_light($vo['orderNo'],\think\Request::instance()->param('orderNo')); ?></td>
            <td><?php echo gettableval('user','realname',$vo['userId']); ?></td>
            <td><?php echo $vo['totalNum']; ?></td>
            <td><?php echo $vo['totalMoney']; ?></td>
            <td><?php echo high_light($vo['createTime'],\think\Request::instance()->param('createTime')); ?></td>
            <td><?php echo authPay($vo['payType']); ?></td>
            <td><?php echo authOrder($vo['payType'],$vo['orderType']); ?></td>
            <td><?php echo isset($vo['kdNo']) ? $vo['kdNo'] :  '--'; ?></td>
            <td><?php echo strlen($vo['remarks'])> 0 ? $vo['remarks'] : '--'; ?></td>
            <td><?php echo isset($vo['kdTime']) ? $vo['kdTime'] :  '--'; ?></td>
            <td class="f-14">
                <!--<?php if (\Rbac::AccessCheck('edit')) : ?> <a title="编辑" href="javascript:;" onclick="layer_open('编辑','<?php echo \think\Url::build('edit', ['id' => $vo["id"], ]); ?>')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><?php endif; ?>-->
                <a title="编辑" href="javascript:;" onclick="layer_open('发货','<?php echo url('order/edit',array('id'=>$vo['id'])); ?>')" style="text-decoration:none" class="ml-5">查看</a>
                <?php if (\Rbac::AccessCheck('deleteforever')) : ?> <a href="javascript:;" onclick="del_forever(this,'<?php echo $vo['id']; ?>','<?php echo \think\Url::build('deleteforever', []); ?>')" class="label label-danger radius ml-5">彻底删除</a><?php endif; ?>
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

</body>
</html>