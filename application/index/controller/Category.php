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
        $id = $this->request->param('id');
        $this->view->assign('id', $id);
        return $this  ->view->fetch();
    }

}
