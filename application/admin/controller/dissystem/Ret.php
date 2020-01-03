<?php
namespace app\admin\controller\dissystem;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Ret extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    protected static $isdelete = false;

    public function index()
    {
        if($this->request->isAjax()){
            $data = $this ->request ->param();
            $arr = array(
                'key' =>'levelSys',
                'val' =>json_encode($data)
            );
            Db('sys')->where(array('key'=>'levelSys'))->delete();
            db('sys')->insert($arr);
            return ajax_return_adv('操作成功','','','',url('dissystem.ret/index'));
        }else{

            $vo = Db('sys')->where(array('key'=>'levelSys'))->value('val');
            $this ->view->assign('vo',json_decode($vo,true));
            return $this ->view->fetch();
        }
    }

}
