<?php
/**
 *
 */
namespace app\index;

use think\Config;
use think\Session;
use think\Controller;
use think\response\Redirect;

class Base extends Controller{
    protected $userInfo;
    public function _initialize(){

        parent::_initialize();

        $uid =Session::get('USERID');
        if($uid === null){
            $this ->NotLogin();
        }
        //获取当前的控制器
        $this->view->assign('Controller',request()->controller());
        //获取当前的方法
        $this->view->assign('Action',request()->action());
        $this ->userInfo = Db('user')->where(array('id'=>$uid))->find();
        $this ->view->assign('userInfo',$this->userInfo);
        $this ->view->assign('NOTSHOWFOOTER',Config::get('NOTSHOWFOOTER'));
    }
    public function NotLogin(){
        $this->redirect('login/index','请先登录后操作');
    }
}