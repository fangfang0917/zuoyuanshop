<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/27
 * Time: 15:01
 */

namespace app\index\controller;

use app\index\Base;
use think\Session;

class Buy extends Base
{
    public function index()
    {
        $data = '';
        if (Session::has('cartData')) {
            $data = Session::get('cartData');
            $data = json_decode($data, true);
        }
        $ids = [];
        $arr = $data['data'];
        foreach ($arr as $k => $v) {
            array_push($ids, $v['cartid']);
        }
        $cartData = $this->pageDate($ids);
        $this->view->assign('data', $cartData['data']);
        $this->view->assign('totalprice', $cartData['totalprice']);
        $this->view->assign('totalnum', $cartData['totalnum']);
        $userAdd = db('address')->where(array('userId' => Session::get('USERID'), 'type' => 1))->find();
        $this->view->assign('userAddr', $userAdd);
        $this->view->assign('addOrder', url('buy/addOrder'));
        return $this->view->fetch();
    }

    public function pageDate($ids)
    {
        $map = [];
        $map['c.id'] = ['in', $ids];
        $map['c.userID'] = $this->userInfo['id'];
        $list = Db('cart')->alias('c')->join('goods g', 'c.goodsId = g.id')
            ->field(array('g.name', 'g.thumb', 'c.num', 'c.price', 'g.url', 'c.skuId', 'c.id', 'c.totalprice', 'c.goodsId'))
            ->where($map)->select();
        $num = 0;
        $price = 0;
        foreach ($list as $k => $v) {
            $num = $num + $v['num'];
            $price = $price + $v['totalprice'];
            if ($v['skuId'] != 0) {
                $list[$k]['attrname'] = getAttrKeyName($v['skuId']);

            } else {
                $list[$k]['attrname'] = '';
            }
        }

        return array('data' => $list, 'totalnum' => $num, 'totalprice' => $price);
    }


    public function addOrder()
    {
        $arrData = $this->request->param();
        $data = '';
        if (Session::has('cartData')) {
            $data = Session::get('cartData');
            $data = json_decode($data, true);
        }
        $ids = [];
        $arr = $data['data'];
        foreach ($arr as $k => $v) {
            array_push($ids, $v['cartid']);
        }
        $cartData = $this->pageDate($ids);
        $arrData['orderNo'] = time();
        $arrData['userId'] = Session::get('USERID');
        $arrData['createTime'] = time();
        $arrData['payType'] = 0;
        $arrData['orderType'] = 0;
        $id = DB('order')->insertGetId($arrData);
        Db('cart')->where(array('id'=>['in',$ids]))->delete();
        $this->addOrderInfo($id, $cartData['data']);
        Session::delete('cartData');
        return return_json(1, '正在前往付款', url('buy/pay',array('id'=>$id)));
    }

    public function addOrderInfo($id, $data)
    {
        $arr = [];
        foreach ($data as $k => $v) {
            $arr[$k]['orderId'] = $id;
            $arr[$k]['goodsId'] = $v['goodsId'];
            $arr[$k]['price'] = $v['totalprice'];
            $arr[$k]['num'] = $v['num'];
            $arr[$k]['skuId'] = $v['skuId'];
        }
        db('orderInfo')->insertAll($arr);
    }

    public function pay(){
        $id = $this ->request->param('id');
        $vo = Db('order')->where(array('id'=>$id))->find();
        $this->view->assign('vo',$vo);
        $this->view->assign('user',$this ->userInfo);
        $this->view->assign('paySuccUrl',url('buy/paySucc',array('id'=>$id)));
        return $this->view->fetch();
    }


    public function paySucc()
    {
        $id = $this->request->param('id');
        $data = $this->request->param();
        $map['id'] = $id;
        $order = Db('order')->where($map)->find();
        if ($order['payType'] == 0) {
            db('order')->where($map)->update(array('payType' => 1));
            db('user')->where(array('id' => Session::get('USERID')))->setDec('amount', $data['price']);
            return return_json(1, '购买成功!前往订单', url('order/index'));
        }else{
            return return_json(0, '订单已支付!前往订单', url('order/index'));
        }

    }

}