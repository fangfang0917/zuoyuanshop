<?php
/**
 * Created by PhpStorm.
 * User: zywl-1603
 * Date: 2020/1/3
 * Time: 17:48
 */

namespace app\sys\controller;

use app\sys\Base;

class Index extends Base
{
    public function index()
    {
        return $this->view->fetch();
    }
}