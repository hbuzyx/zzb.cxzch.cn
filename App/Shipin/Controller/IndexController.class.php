<?phpnamespace Shipin\Controller;class IndexController extends MobileCommonController{    //远程远教首页    public function index()    {        $ids = M('category')->where(array('pid' => 58))->Field('id,name')->select();        $this->assign('ids', $ids);        $datas = M('category')            ->join('my_soft soft on my_category.id=soft.cid')            ->field("my_category.id cat_id,soft.id,soft.title,soft.litpic,soft.downlink,soft.description")//需要显示的字段            ->where(array('my_category.pid' => 58))            ->select();        $this->assign('lists', $datas);        $this->display();    }    public function detail()    {        $id = I('get.id');        $info = M('soft')->where(array('id' => $id))->find();        $this->assign('info', $info);        $this->assign('title', C('CFG_WEBNAME'));        $this->display('video-detail');    }    public function login()    {        $username = I('username', '', 'htmlspecialchars,trim');        $password = md5(I('password', '', 'htmlspecialchars,trim'));        $info = M('member')->where(array('username' => $username))->find();        if($info){            if($info['password'] == $password){                session('id',$info['id']);                session('name',$info['username']);                session('IsLogin',1);                $this->ajaxReturn(['status'=>1,'msg'=>'登陆成功'],JSON);            }else{                $this->ajaxReturn(['status'=>0,'msg'=>'密码错误'],JSON);            }        }else{            $this->ajaxReturn(['status'=>0,'msg'=>'用户名不存在'],JSON);        }    }    public function logout()    {        session(null);        $this->ajaxReturn(['status'=>1,'msg'=>'退出登陆成功'],JSON);    }    public function zhuce()    {        $data['username'] = I('username', '', 'htmlspecialchars,trim');        $data['password'] = md5(I('password', '', 'htmlspecialchars,trim'));        $info = M('member')->where(array('username' => $data['username']))->find();        if(empty($info)){            session(null);            $data['regtime'] = time();            if ($id = M('member')->add($data)) {                $this->ajaxReturn(['status' => 1, 'msg' => '注册成功'], JSON);            }else{                $this->ajaxReturn(['status'=>0,'msg'=>'注册失败'],JSON);            }        }else{            $this->ajaxReturn(['status'=>0,'msg'=>'手机号已存在'],JSON);        }    }}