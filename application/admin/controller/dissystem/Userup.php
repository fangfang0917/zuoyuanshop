<?php
namespace app\admin\controller\dissystem;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Userup extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected static $isdelete = false;


    public function index(){

        $map = [];
        $model = $this->getModel('userup');
        if ($this->request->param("userId")) {
            $map['userId'] = $this->request->param("userId");
        }
        if ($this->request->param("type")) {
            $map['type'] = $this->request->param("type");
        }
        if ($this->request->param("level")) {
            $map['level'] = $this->request->param("level");
        }
        $this->datalist($model, $map);

        return $this->view->fetch();
    }
}
