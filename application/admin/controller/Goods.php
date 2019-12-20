<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Session;

class Goods extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected function filter(&$map)
    {
        if ($this->request->param("id")) {
            $map['id'] = ["like", "%" . $this->request->param("id") . "%"];
        }
        if ($this->request->param("name")) {
            $map['name'] = ["like", "%" . $this->request->param("name") . "%"];
        }
        if ($this->request->param("int")) {
            $map['int'] = ["like", "%" . $this->request->param("int") . "%"];
        }
        if ($this->request->param("stock")) {
            $map['stock'] = ["like", "%" . $this->request->param("stock") . "%"];
        }
    }

    public function getattr(){
        $cid = $this->request->param('cid');
        $classify = Db('AttrKey')->where(array('cid'=>$cid))->select();
        foreach($classify as $k=>$v){
            $classify[$k]['attrval'] = Db('AttrVal')->where(array('attr_key_id'=>$v['id']))->select();
        }
//        dump($classify);
//        dump($cid);
        $this ->view->assign('classify',$classify);
        $this ->view->assign('arr',json_encode([]));
        return $this->view->fetch();
    }


    public function setsession(){
        $data = $this ->request->param();
        Session::set('goodsAttr',$data['arr']);
        return json(array('state'=>1,'msg'=>'添加成功!'));
    }
}
