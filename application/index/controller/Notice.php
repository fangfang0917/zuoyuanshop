<?php

namespace app\index\controller;

use app\index\Base;
use think\Config;

class Notice extends Base
{
    use \app\index\traits\controller\Controller;

    public function index()
    {
        return $this->view->fetch();
    }

    public function getList()
    {
        $page = $this->request->param('page');
        $num = Config::get('page_num')['notice'];
        $list = DB('notice')->where(array('status' => 1))->limit($page * $num, $page)->select();
        $this->view->assign('list', $list);
        return $this->view->fetch();
    }

    public function detail()
    {
        $id = $this->request->param('id');
        $vo = Db('notice')->where(array('id'=>$id))->find();
        $this ->view->assign('r',$vo);
        return $this->view->fetch();
    }
}