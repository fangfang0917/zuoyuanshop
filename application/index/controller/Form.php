<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/31
 * Time: 15:36
 */

namespace app\index\controller;

use app\index\Base;

class Form extends Base
{
    public function index(){
        
        return $this ->view->fetch();
    }

    public function getlist(){
       $title = $this ->request->param('title');
       $map['name'] = ['like','%'.$title.'%'];
       $list = Db('goods')->where($map)->select();
       return return_json(1,'获取成功','',$list);
    }
}