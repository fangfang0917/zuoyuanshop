<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/17
 * Time: 17:37
 */

namespace app\index\traits\controller;

use think\Db;
use think\Loader;
use think\exception\HttpException;
use think\Config;

trait Controller
{
    public function Getlist(){
        $D = $this ->request->param('D');
        $page = $this ->request->param('page');
        $num = Config::get('page_num')[$D];
        $map = [];
        if($this ->request->param('where')){
            $map = $this ->Map($this ->request->param('where'));
        }
        $list = Db($D)->where($map)->limit($page*$num,$page)->select();
        return return_json(1,'获取成功','',$list);
    }


    public function Map($where){
        $map = [];
        foreach($where as $k=>$v){
            $map[$k] = $v;
        }
        return $map;
    }
}