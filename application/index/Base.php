<?php
/**
 *
 */
namespace app\index;

use think\Session;
use think\Controller;
use think\response\Redirect;

class Base extends Controller{
    public function _initialize(){

        parent::_initialize();

        $uid =session('USERID');
        if($uid === null){
            $this ->NotLogin();
        }
        //获取当前的控制器
        $this->view->assign('Controller',request()->controller());
        //获取当前的方法
        $this->view->assign('Action',request()->action());

    }
    public function NotLogin(){
        $this->redirect('login/index','请先登录后操作');
    }
}