<?php
/**
 * tpAdmin [a web admin based ThinkPHP5]
 *
 * @author    yuan1994 <tianpian0805@gmail.com>
 * @link      http://tpadmin.yuan1994.com/
 * @copyright 2016 yuan1994 all rights reserved.
 * @license   http://www.apache.org/licenses/LICENSE-2.0
 */

use \think\Request;

$basename = Request::instance()->root();
if (pathinfo($basename, PATHINFO_EXTENSION) == 'php') {
    $basename = dirname($basename);
}

return [
    // 模板参数替换
    'view_replace_str' => [
        '__ROOT__'   => $basename,
        '__STATIC__' => $basename . '/static/index',
        '__LIB__'    => $basename . '/static/index/lib',
    ],
    'page_num'=>[
        'goods'=>10,
        'cart'=>10,
        'addr' =>10,
        'order' =>10
    ],
    'ajaxUrl'=>[
        'index'=>url('index/index'),
        'user'=>url('user/index'),
        'login'=>url('login/index'),
        'order'=>url('order/getList'),
        'checklogin'=>url('login/checklogin'),
        'checkregister'=>url('register/checkregister'),
        'uppass' => url('user/uppass'),
        'uprealname' => url('user/uprealname'),
    ]
    ,'NOTSHOWFOOTER' =>['order']
];
