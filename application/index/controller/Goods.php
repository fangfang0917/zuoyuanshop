<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/18
 * Time: 9:52
 */

namespace app\index\controller;

use app\index\Base;

class Goods extends Base
{
    public function detail()
    {
        $id = $this->request->param('id');
        $map = [];
        $map['id'] = $id;
        $show = Db('goods')->where($map)->find();
        $this->view->assign('show', $show);
        return $this->view->fetch();
    }
}