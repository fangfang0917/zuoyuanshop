<?php
namespace app\index\controller;

use think\Controller;
use think\response\Redirect;

class Login extends Controller
{
    public function _initialize(){
        $uid = session('uid');
        if($uid != null){
           $this->redirect('Index/index','已登录');
        }
    }
    public function index(){
        return $this ->view->fetch();
    }
}