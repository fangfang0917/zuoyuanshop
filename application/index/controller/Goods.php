<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/18
 * Time: 9:52
 */

namespace app\index\controller;

use app\index\Base;

class Goods extends Base
{
    public function detail()
    {
        $id = $this->request->param('id');
        $map = [];
        $map['id'] = $id;
        $show = Db('goods')->where($map)->find();
        $show['content'] = htmlspecialchars_decode($show['content']);

        $comment = $this ->getComment($show['id']);
        $class = $this->getAttr($show);
        $this->view->assign('show', $show);
        $this->view->assign('class', $class);
        $this->view->assign('commentList', $comment);
        $this->view->assign('addCartUrl', url('Cart/Add'));
        return $this->view->fetch();
    }

    public function getAttr($show)
    {
        $goodsSku = Db('goods_sku')->where(array('goods_id' => $show['id']))->select();
        $class= [];
        if (count($goodsSku) > 0) {
            $ids = [];
            foreach ($goodsSku as $k => $v) {
                if (strlen($v['attr_symbol_path']) > 1) {
                    $aa = explode(',', $v['attr_symbol_path']);
                    $ids = array_merge($ids, $aa);
                } else {
                    array_push($ids, $v['attr_symbol_path']);
                }
            }

            $class = Db('attr_key')->where(array('cid' => $show['cid']))->select();
            foreach ($class as $k => $v) {
                $class[$k]['attrVal'] = DB('attr_val')->where(array('id' => ['in', $ids],'attr_key_id'=>$v['id']))->select();
            }
        }
        return $class;
    }

    public function getComment($goodsid){
        $map['gc.goodsId'] = $goodsid;
        $list = DB('goodsComment')->alias('gc')->join('user u','gc.userId = u.id')->where($map)
            ->field(array('u.realname','u.header','gc.content','gc.createtime'))->select();
        return $list;
    }
}