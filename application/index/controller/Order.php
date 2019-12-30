<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/19
 * Time: 11:33
 */

namespace app\index\controller;

use app\index\Base;
use think\Config;
use think\Session;

class Order extends Base
{
    public function index()
    {
        $this->view->assign('action', Config::get('ajaxUrl')['order']);
        return $this->view->fetch();
    }

    public function getList()
    {
        $map = [];
        $page = $this->request->param('page');
        if ($this->request->param('ordertype')) {
            $orderType = $this->request->param('ordertype');
            if ($orderType == 11) {
                $map['orderType'] = 0;
                $map['payType'] = 0;
            } else if ($orderType == 12) {
                $map['payType'] = 1;
                $map['orderType'] = 0;
            } else if ($orderType == 13) {
                $map['payType'] = 1;
                $map['orderType'] = 1;
            } else if ($orderType == 14) {
                $map['payType'] = 1;
                $map['orderType'] = 2;
            }

        }
        $map['userId'] = Session::get("USERID");
        $num = Config::get('page_num')['order'];
        $list = Db('order')->where($map)->limit($page * $num, $page)->select();
        $list = $this->getGoods($list);
        return return_json(1, '获取成功!', '', $list);
    }

    public function getGoods($list)
    {
        foreach ($list as $k => $value) {
            $map['orderId'] = $value['id'];
            $list[$k]['goodsList'] = Db('orderInfo')->alias('o')->join('goods g', 'o.goodsId = g.id')
                ->where($map)->field(array('o.price', 'o.num', 'g.url', 'g.name', 'g.thumb', 'o.skuId'))->select();
        }
        return $list;
    }


    public function take()
    {
        $id = $this->request->param('id');
        $res = Db('order')->where(array('id' => $id))->update(array('orderType' => 2));
        if ($res) {
            return return_json(1, '收货成功');
        } else {
            return return_json(0, '网络错误!请重试');
        }
    }

    public function str()
    {
        $id = $this->request->param('id');
        $list = Db('orderInfo')->alias('oi')->join('goods g', 'oi.goodsId = g.id')->where(array('orderId' => $id))
            ->field(array('g.name', 'g.thumb', 'g.id'))->select();
        $this->view->assign('list', $list);
        return $this->view->fetch();
    }

    public function setgoodsComment()
    {
        $arr = $this->request->param();
        dump($arr);
        foreach ($arr as $k => $v) {
            $data[$k]['userId'] = Session::get('USERID');
            $data[$k]['createtime'] = time();
            $data[$k]['goodsId'] =$v['goodsId'];
            $data[$k]['content'] =$v['content'];
        }

        $r = Db('goodsComment')->insertAll($data);
        if ($r) {
            return return_json(1, '评论成功', url('order/index'));
        } else {
            return return_json(0, '网络错误!请重试', url('order/index'));
        }
    }
}