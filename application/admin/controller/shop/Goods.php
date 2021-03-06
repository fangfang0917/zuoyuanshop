<?php

namespace app\admin\controller\shop;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path'), EXT);

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
        if ($this->request->param("cid")) {
            $map['cid'] =  $this->request->param("cid");
        }
    }

    public function index(){


        $model = $this->getModel('goods');
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


    public function add()
    {
        if ($this->request->isAjax()) {
            $data = $this->request->param();
            $goodsId = DB('goods')->insertGetId($data);
            $url = url('index/goods/detail', array('id' => $goodsId));
            Db('goods')->where(array('id' => $goodsId))->update(array('url' => $url));
            if (Session::has('goodsAttr')) {
                $AttrArr = Session::get('goodsAttr');
                if (count($AttrArr) > 0) {
                    $Arr = [];
                    foreach ($AttrArr as $k => $v) {
                        $Arr[$k]['goods_id'] = $goodsId;
                        $Arr[$k]['attr_symbol_path'] = $v['attr_id'];
                        $Arr[$k]['price'] = $v['attr_price'];
                        $Arr[$k]['stock'] = $v['attr_gold'];
                    }
                    db('goods_sku')->insertAll($Arr);
                }
            }
            return ajax_return_adv('添加成功!!!!');
        } else {
            return $this->view->fetch('edit');
        }
    }

    public function edit()
    {
        if ($this->request->isAjax()) {
            $data = $this->request->except(['id']);
            $id = $this->request->param('id');
            DB('goods')->where(array('id' => $id))->update($data);
            $url = url('index/goods/detail', array('id' => $id));
            Db('goods')->where(array('id' => $id))->update(array('url' => $url));
            $this->setGoodsSku($id);
            return ajax_return_adv('修改成功!!!!');
        } else {
            $id = $this->request->param('id');
            $vo = Db('goods')->where(array('id' => $id))->find();
            $this->createAttr($vo['id']);
            $this->view->assign('vo', $vo);
            return $this->view->fetch();
        }
    }


    /**添加/修改规格
     * @return string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getattr()
    {
        $cid = $this->request->param('cid');
        $ids = [];
        $a = [];
        if (Session::has('attrArr')) {
            $a = Session::get('attrArr');
            foreach ($a as $k => $v) {
                if (strlen($v['attr_id']) > 1) {
                    $aa = explode(',', $v['attr_id']);
                    $ids = array_merge($ids, $aa);
                } else {
                    array_push($ids, $v['attr_id']);
                }

            }
        }
        $classify = Db('AttrKey')->where(array('cid' => $cid))->select();
        foreach ($classify as $k => $v) {
            $attrArr = Db('AttrVal')->where(array('attr_key_id' => $v['id']))->select();
            foreach ($attrArr as $kk => $vv) {
                if (in_array($vv['id'], $ids)) {
                    $attrArr[$kk]['checked'] = 1;
                } else {
                    $attrArr[$kk]['checked'] = 0;
                }
            }
            $classify[$k]['attrval'] = $attrArr;
        }
        $this->view->assign('classify', $classify);
        $this->view->assign('arr', json_encode($a));
        return $this->view->fetch();
    }

    /**添加修改规格时创建规格数据
     * @return \think\response\Json
     */
    public function setsession()
    {
        $data = $this->request->param();
        Session::set('goodsAttr', $data['arr']);
        return json(array('state' => 1, 'msg' => '添加成功!'));
    }

    /**
     * @param 修改时处理规格  生成json数据
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function createAttr($id)
    {
        $attr = Db('goods_sku')->where(array('goods_id' => $id))->select();
        $attrArr = [];
        foreach ($attr as $k => $v) {
            $attrArr[$v['attr_symbol_path']]['attr_id'] = $v['attr_symbol_path'];
            $attrArr[$v['attr_symbol_path']]['attr_price'] = $v['price'];
            $attrArr[$v['attr_symbol_path']]['attr_gold'] = $v['stock'];
        }
        Session::set('attrArr', $attrArr);
    }

    /**
     * 保存/修改商品的规格
     * @param $id
     * @throws \think\Exception
     * @throws \think\db\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function setGoodsSku($id)
    {
        if (Session::has('goodsAttr')) {
            $AttrArr = Session::get('goodsAttr');
            $Arr = [];
            if (count($AttrArr) > 0) {
                Db('goods_sku')->where(array('goods_id' => $id))->delete();
                foreach ($AttrArr as $k => $v) {
                    $Arr[$k]['goods_id'] = $id;
                    $Arr[$k]['attr_symbol_path'] = $v['attr_id'];
                    $Arr[$k]['price'] = $v['attr_price'];
                    $Arr[$k]['stock'] = $v['attr_gold'];
                }
                db('goods_sku')->insertAll($Arr);
            }
            Session::delete('goodsAttr');
        }

    }


    public function addgoodspic()
    {
        return $this->view->fetch();
    }

    public function getcomment(){
        $id = $this->request->param('id');
        $map['gc.goodsId'] = $id;
        $list = Db('goodsComment')->alias('gc')->join('user u','gc.userId = u.id')->where($map)
                ->field(array('u.realname','gc.content','gc.createtime','gc.id'))->paginate(10,false,['query'=>request()->param()]);
        $this->view->assign('list',$list);
        $this->view->assign('page',$list->render());
        $this->view->assign('count',$list->count());
        return  $this->view->fetch();
    }
}
