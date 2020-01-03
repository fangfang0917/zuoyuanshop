<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/17
 * Time: 17:37
 */

namespace app\index\traits\controller;

use think\Config;

trait Controller
{
    public function Getlist(){
        $D = $this ->request->param('D');
        $page = $this ->request->param('page');
        $num = Config::get('page_num')[$D];
        $map = [];
        $url = '';
        if($this ->request->param('cid')){
            $map['cid'] = $this ->request->param('cid');
        }
        if($this ->request->param('posid')){
            $map['posid'] = $this->request->param('posid');
        }

        $list = Db($D)->where($map)->limit($page*$num,$page)->select();
        if ($D == 'goods') {
            $url = url('goods/detail');
        }
        return return_json(1, '获取成功', $url, $list);
    }


    public function Map($where){
        $map = [];
        foreach($where as $k=>$v){
            $map[$k] = $v;
        }
        return $map;
    }
}