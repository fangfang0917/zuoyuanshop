<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/17
 * Time: 17:06
 */

namespace app\index\controller;
use app\index\Base;
use think\Config;

class Category extends Base
{
    use \app\index\traits\controller\Controller;
    public function index()
    {

        return $this ->view->fetch();
    }


    public function goodslist(){
        return $this  ->view->fetch();
    }

    public function listPage(){
        $page = $this ->request->param('page');
        $id = $this ->request->param('id');
        $num = Config::get('page_num')['goods'];
        $list = Db()->where($map)->limit($page*$num,$num)->select();
    }
}
