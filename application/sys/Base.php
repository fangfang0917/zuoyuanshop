<?php
/**
 *
 */
namespace app\sys;

use think\Config;
use think\Session;
use think\Controller;
use think\response\Redirect;

class Base extends Controller{
    public $WxConifg,$WX,$jsToken,$jsonConfig,$accToken;
    public function _initialize(){
        parent::_initialize();
        //获取当前的控制器
        include_once ROOT_PATH . 'public' . DS . 'wx' . DS . 'WeiXinFun.class.php';
        $this->WxConifg = Config::get('WXCONFIG');
        $this->WX = new \WeiXinFun($this->WxConifg); //配置微信
        //请求令牌
        $this->accToken = $this->WX->getAccessToken();
        //jsApI令牌curPageURL
        $this->jsToken = $this->WX->getJsToken();
        $this->view->assign('Controller',request()->controller());
        //获取当前的方法
        $this->view->assign('Action',request()->action());
        $this ->view->assign('NOTSHOWFOOTER',Config::get('NOTSHOWFOOTER'));
        if(Session::has('WXAUTH') != true){
              $this->NotLogin();
        }
    }

    public function NotLogin(){

    }
}