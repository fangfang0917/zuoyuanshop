<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/26
 * Time: 16:07
 */

namespace app\index\controller;

use app\index\Base;

class Cart extends Base
{
    public function add()
    {
        $data = $this->request->param();
        //获取价格
        if($this->request->param('attr_symbol_path')){
          $price =  getint($data['attr_symbol_path']);
        }else{
            $price = gettableval('goods','int',$data['goods_id']);
        }

        $arrData = array(
            'userID' => $this->userInfo['id'],
            'goodsId'=>$data['goods_id'],
            'createTime' =>time(),
            'num' =>$data['num'],
            'price' =>$price,
        );
        dump($data);
    }
}