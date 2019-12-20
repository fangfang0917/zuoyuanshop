<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/19
 * Time: 9:59
 */

namespace app\index\controller;

use app\index\Base;
use think\Session;
use think\Config;

class User extends Base
{
    public function index()
    {
        return $this->view->fetch();
    }

    public function uppass()
    {
        if ($this->request->isAjax()) {
            $data = $this->request->param();
            $res = Db('user')->where(array('pass'=>md5($data['oldpass']),'id'=>session('USERID')))->find();
            if($res){
                Db('user')->where(array('id'=>session('USERID')))->update(array('pass'=>md5($data['newpass'])));
                Session::delete('USERID');
                return return_json(1,'修改成功!前往登录',Config::get('ajaxUrl')['login']);

            }else{
                return return_json(0,'原密码不正确','');
            }
        } else {
            $this->view->assign('action', Config::get('ajaxUrl')['uppass']);
            return $this->view->fetch();
        }
    }

    public function uprealname()
    {
        if ($this->request->isAjax()) {
            $data = $this ->request->param();
            db('user')->where(array('id'=>Session::get('USERID')))->update(array('realname'=>$data['realname']));
            return return_json(1,'修改成功',Config::get('ajaxUrl')['user']);
        } else {
            $this->view->assign('action', Config::get('ajaxUrl')['uprealname']);
            return $this->view->fetch();
        }
    }
}