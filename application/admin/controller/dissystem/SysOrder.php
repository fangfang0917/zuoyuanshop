<?php
namespace app\admin\controller\dissystem;

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
            $map['userId'] = $this->request->param("userId");
        }
        if ($this->request->param("type")) {
            if($this ->request->param('type') != 6) {
                $map['type'] = $this->request->param("type");
            }
        }
    }
    public function index()
    {
        $map = [];
        $model = $this->getModel('SysOrder');
        if ($this->request->param("id")) {
            $map['id'] = ["like", "%" . $this->request->param("id") . "%"];
        }
        if ($this->request->param("userId")) {
            $map['userId'] = $this->request->param("userId");
        }
        if ($this->request->param("type")) {
                $map['type'] = $this->request->param("type");
        }

        $this->datalist($model, $map);

        return $this->view->fetch();
    }

    public function edit()
    {
        if($this ->request->isAjax()){
            $data = $this->request->except(['id']);
            $id = $this->request->param('id');
            if($data['type'] == 4){
                if($data['remarks'] == ''){
                    return ajax_return_adv_error('请填写备注');
                }
            }
            $type = Db('SysOrder')->where(array('id'=>$id))->value('type');
            if($data['type'] <= $type){
                return ajax_return_adv_error('状无法回溯');
            }
            Db('SysOrder')->where(array('id'=>$id))->data($data)->update();
            return ajax_return_adv('提交成功!!!!');
        }else{
            $id = $this ->request->param('id');
            $vo = Db('SysOrder')->where(array('id'=>$id))->find();
            $this->view->assign('vo',$vo);
            return $this ->view->fetch();
        }
    }
}
