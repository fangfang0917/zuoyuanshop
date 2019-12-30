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


    public function addr(){
        $this ->view->assign('address',url('user/getaddress'));
        $this ->view->assign('editAddress',url('user/editAddress'));
        $this ->view->assign('defUrl',url('user/defSite'));
        return $this->view->fetch();
    }
    public function addressadd(){
        if($this->request->isAjax()){
            $data = $this ->request->param();
            $data['userId'] = $this->userInfo['id'];
            db('address')->insert($data);
            return return_json(1,'添加成功!',url('user/addr'));
        }else{
            return $this->view->fetch();
        }

    }

    public function editAddress(){
        if($this ->request->isAjax()){
            $data = $this ->request->except(['id']);
            $id = $this ->request->param('id');
            Db('address')->where(array('id'=>$id))->update($data);
            return return_json(1,'修改成功',url('user/addr'));
        }else{
            $id = $this->request->param('id');
            $vo = DB('address')->where(array('id'=>$id))->find();
            $this->view->assign('vo',$vo);
            return $this->view->fetch('addressadd');
        }
    }

    public function getaddress(){
        $page = $this->request->param('page');
        $num = Config::get('page_num')['addr'];
        $list = Db('address')->where(array('userId'=>$this->userInfo['id']))
            ->limit($page*$num,$page)->select();
        return return_json(1,'获取成功',url('user/deladdr'),$list);
    }

    public  function deladdr(){
        $id = $this ->request->param('id');
        $res = Db('address')->where(array('id'=>$id))->delete();
        if($res){
            return return_json(1,'删除成功');
        }else{
            return return_json(0,'网络错误!请重试');

        }
    }


    public function defSite(){
        $id = $this ->request->param('id');
        $map['id'] = ['in',$id];
        $mapp['id'] = ['not in',$id];
        Db('address')->where($mapp)->update(array('type'=>0));
        Db('address')->where($map)->update(array('type'=>1));
        return return_json(1,'设置成功');
    }
}