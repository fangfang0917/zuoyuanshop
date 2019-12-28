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
     public function index(){
         $data = '';
         if(Session::has('cartData')){
             $data = Session::get('cartData');
             $data = json_decode($data,true);
         }
         $this ->view->assign('data',$data);
         return $this->view->fetch();
     }
}