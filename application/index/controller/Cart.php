<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/26
 * Time: 16:07
 */

namespace app\index\controller;

use app\index\Base;
use think\Config;

class Cart extends Base
{
    public function index(){
        $this->view->assign('ajaxUrl',url('cart/pageDate'));
        return $this ->view->fetch();

    }

    public  function pageDate(){
        $page = $this ->request->param('page');
        $num = Config::get('page_num')['cart'];
        $list = Db('cart')->alias('c')->join('goods g','c.goodsId = g.id')
            ->field(array('g.name','g.thumb','c.num','c.price','g.url','c.skuId'))
            ->where(array('userId'=>$this->userInfo['id']))->limit($page*$num,$num)->select();
        foreach ($list as $k=>$v){
            $list[$k]['attrname'] = getAttrKeyName($v['skuId']);
        }

        return return_json(1,'获取成功','',$list);
    }
    public function add()
    {
        $data = $this->request->param();
        //获取价格
        if (isset($data['attr_symbol_path'])) {
            $goods_sku = getint($data['attr_symbol_path']);
            $res = Db('goods_sku')->where(array('attr_symbol_path' => $goods_sku))->find();
            $price = $res['price'];
            $skuId = $res['sku_id'];
        } else {
            $price = gettableval('goods', 'int', $data['goods_id']);
            $skuId = 0;
        }

        $arrData = array(
            'userID' => $this->userInfo['id'],
            'goodsId' => $data['goods_id'],
            'createTime' => time(),
            'num' => $data['num'],
            'price' => $price,
            'skuId' => $skuId,
        );
        DB('cart')->insert($arrData);
        return return_json(1,'添加成功',url('cart/index'));
    }
}