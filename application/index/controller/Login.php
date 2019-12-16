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
        $this->view->assign('ajaxUrl',url('login/checklogin'));
        return $this ->view->fetch();
    }

    public function checklogin(){
       $data =  $this ->request->param();
        AuthUserParam($data);
        if(AuthUser($data['username'])){
            return return_json(0,'用户不存在!请前往注册');
        }
       $userInfo = DB('user')->where(array('username'=>$data['username'],'pass'=>md5($data['pass'])))->find();
       if(!$userInfo){
           return return_json(0,'用户名或密码错误!');
       }
       session('USERID',$userInfo['id']);
       return  return_json(1,'登录成功!',url('index/index'));
    }
}