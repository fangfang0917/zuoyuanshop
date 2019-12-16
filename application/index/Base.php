<?php
namespace app\index;

use think\Session;
use think\Controller;
use think\response\Redirect;

class Base extends Controller{
    public function _initialize(){

        parent::_initialize();

        $uid =Session::get('USERID');
        if($uid === null){
            $this ->NotLogin();
        }else{
            $this->redirect('index/index/index');
        }
    }


    public function NotLogin(){
        $this->redirect('index/login/index','请先登录后操作');
    }
}