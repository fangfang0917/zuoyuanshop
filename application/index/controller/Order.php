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

class Order extends  Base
{
  public function index(){
      $this ->view->assign('action',Config::get('ajaxUrl')['order']);
      return $this ->view->fetch();
  }
}