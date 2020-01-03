<?php
namespace app\admin\controller\shop;

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
    public function index(){


        $model = $this->getModel('AttrKey');
        // 列表过滤器，生成查询Map对象
        $map = $this->search($model, [$this->fieldIsDelete => $this::$isdelete]);

        // 特殊过滤器，后缀是方法名的
        $actionFilter = 'filter' . $this->request->action();

        if (method_exists($this, $actionFilter)) {
            $this->$actionFilter($map);
        }

        // 自定义过滤器
        if (method_exists($this, 'filter')) {
            $this->filter($map);
        }

        $this->datalist($model, $map);

        return $this->view->fetch();
    }

}