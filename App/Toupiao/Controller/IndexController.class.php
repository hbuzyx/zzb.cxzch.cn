<?phpnamespace Toupiao\Controller;class IndexController extends MobileCommonController{    //远程远教首页    public function index()    {        $datas = M('product')->where(array('status' => 1))->select();//        $info = M('product')->where(array('status' => 1))->Field('id,title,piao')->order('piao desc')->select();        $this->assign('info', $info);        $this->assign('lists', $datas);        $this->display();    }    public function detail()    {        $id = I('get.id');        $info = M('product')->where(array('id' => $id))->find();        $this->assign('info', $info);        $this->assign('title', C('CFG_WEBNAME'));        $this->display('image-detail');    }    public function result2()    {        $preLogModel = M('toupiao_log');        $num_piao =$preLogModel ->count();        $this->assign('piao', $num_piao);        $proModel = M('product');        $count      = $proModel->where(array('status' => 1))->count();// 查询满足要求的总记录数        $Page       = new \Think\Page($count,5);// 实例化分页类 传入总记录数和每页显示的记录数(25)        $show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性        $info = $proModel->where(array('status' => 1))->Field('id,title,piao')->order('piao desc')->limit($Page->firstRow.','.$Page->listRows)->select();        foreach ($info as $key => $item){            $info[$key]['baifenbi'] = round($item['piao']/$num_piao*100)."%";        }        $this->assign('page',$show);// 赋值分页输出        $this->assign('info', $info);        $num_ren =$preLogModel->count();//        echo $num_ren;die;        $this->assign('ren', $num_ren);        $this->assign('title', C('CFG_WEBNAME'));        $this->display('result');    }    public function toupiao()    {        $id = I('id');        $ip = get_client_ip();        $preLogModel = M('toupiao_log');        $num =$preLogModel ->where(array('ip' => $ip))->count();        if($num){            $yes = false;            $msg = '已经投过票了';        }else{            try{                $proModel = M('product');                $yes = $proModel->where(array('id' => $id))->setInc('piao');                $proModel->where(array('id' => $id))->setField(['ip'=>$ip]);                $preLogModel ->add(['ip'=>$ip,'product_id'=>$id,'create_time'=>date('Y-m-d H:i:s',time())]);            }catch (Exception $e){                $msg = $e->getMessage();            }            $msg = '投票成功';        }        if($yes){            $this->ajaxReturn(['status'=>1,'msg'=>$msg],JSON);        }else{            $this->ajaxReturn(['status'=>0,'msg'=>$msg],JSON);        }    }}