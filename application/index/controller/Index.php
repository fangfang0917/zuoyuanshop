<?php
namespace app\index\controller;

use app\index\Base;
use think\Config;

class Index extends Base
{
    use \app\index\traits\controller\Controller;
    public function index()
    {
        return $this ->view->fetch();
    }
}



