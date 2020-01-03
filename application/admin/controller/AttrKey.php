<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class AttrKey extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected function filter(&$map)
    {
        if ($this->request->param("attr_key_id")) {
            $map['attr_key_id'] = ["like", "%" . $this->request->param("attr_key_id") . "%"];
        }
        if ($this->request->param("attr_name")) {
            $map['name'] = ["like", "%" . $this->request->param("name") . "%"];
        }
    }


}
