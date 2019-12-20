<?php
namespace app\index\controller;


use think\Config;
use think\Controller;
use think\response\Redirect;
class Register extends Controller
{

    public function _initialize(){
        $this->view->assign('Controller',request()->controller());
        $this->view->assign('Action',request()->action());
        $this ->view->assign('NOTSHOWFOOTER',Config::get('NOTSHOWFOOTER'));
    }
    public function index(){
        $this ->view->assign('ajaxUrl',Config::get('ajaxUrl')['checkregister']);
        return $this->view->fetch();
    }

    public function checkregister(){
        $data = $this->request->param();
        AuthUserParam($data);
        if(AuthUser($data['username']) == false){
           return return_json(0,'账号已存在!请前往登录');
        }
        $data['pass'] = Md5($data['pass']);
        $data['createTime'] = time();
        Db('user')->insert($data);
        return return_json(1,'注册成功!前往登录',Config::get('ajaxUrl')['login']);
    }
}