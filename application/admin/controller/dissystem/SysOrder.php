<?php
namespace app\admin\controller\shop;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class SysOrder extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected static $isdelete = false;

    protected function filter(&$map)
    {
        if ($this->request->param("id")) {
            $map['id'] = ["like", "%" . $this->request->param("id") . "%"];
        }
        if ($this->request->param("userId")) {
            $map['userId'] = ["like", "%" . $this->request->param("userId") . "%"];
        }
        if ($this->request->param("type")) {
            $map['type'] = ["like", "%" . $this->request->param("type") . "%"];
        }
    }
}
