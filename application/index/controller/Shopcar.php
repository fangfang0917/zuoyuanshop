<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2019/12/18
 * Time: 11:55
 */

namespace app\index\controller;

use app\index\Base;

class Shopcar extends Base
{
    public function index()
    {
        return $this->view->fetch();
    }
}