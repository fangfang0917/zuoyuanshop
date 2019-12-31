<?php
namespace app\index\controller;

use think\Config;
use think\Controller;
use think\response\Redirect;

class Login extends Controller
{
    public function _initialize(){
        $uid = session('uid');
        if($uid != null){
           $this->redirect('Index/index','已登录');
        }
        $this->view->assign('Controller',request()->controller());
        $this->view->assign('Action',request()->action());
        $this ->view->assign('NOTSHOWFOOTER',Config::get('NOTSHOWFOOTER'));
    }
    public function index(){
        $this->view->assign('ajaxUrl',Config::get('ajaxUrl')['checklogin']);
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
       Db('user')->where(array('id'=>$userInfo['id']))->data(array('lastlogintime'=>time()))->update();
       return  return_json(1,'登录成功!',Config::get('ajaxUrl')['index']);
    }
}