<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Order extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected static $isdelete = false;

    protected function filter(&$map)
    {
        if ($this->request->param("id")) {
            $map['id'] = ["like", "%" . $this->request->param("id") . "%"];
        }
        if ($this->request->param("orderNo")) {
            $map['orderNo'] = ["like", "%" . $this->request->param("orderNo") . "%"];
        }
        if ($this->request->param("userId")) {
            $map['userId'] = ["like", "%" . $this->request->param("userId") . "%"];
        }
        if ($this->request->param("createTime")) {
            $map['createTime'] = ["like", "%" . $this->request->param("createTime") . "%"];
        }
        if ($this->request->param("payType")) {
            $map['payType'] = ["like", "%" . $this->request->param("payType") . "%"];
        }
        if ($this->request->param("orderType")) {
            $map['orderType'] = ["like", "%" . $this->request->param("orderType") . "%"];
        }
    }


    public  function edit(){
        if($this ->request->isAjax()){
            $data = $this->request->except(['id']);
            $id = $this ->request->param('id');
            $data['orderType'] = 1;
            $data['kdTime'] = time();
            db('order')->where(array('id'=>$id))->data($data)->update();
            return ajax_return_adv('发货成功');
        }else{
            $id = $this ->request->param('id');
            $vo = Db('order')->where(array('id'=>$id))->find();
            $list = $this ->getGoods($vo['id']);
            $this ->view->assign('vo',$vo);
            $this ->view->assign('list',$list);
            return $this->view->fetch();
        }
    }


    public  function getGoods($id){
        $map['orderId'] = $id;
        $list = Db('orderInfo')->alias('oi')->join('goods g','oi.goodsId = g.id')->where($map)
            ->field(array('oi.num','oi.price','g.name','g.thumb','g.int'))->select();
        return $list;
    }
}
