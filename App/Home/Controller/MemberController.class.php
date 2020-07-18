<?php

namespace Home\Controller;
use Common\Lib\Category;

class MemberController extends HomeCommonController
{

    public function _initialize()
    {
        $uid = intval(get_cookie('uid'));
        if (empty($uid)) {
            $this->redirect(MODULE_NAME . '/Public/login');
        }
		$map['status'] = 1;
		$searchkey = M('search')->where($map)->order('num DESC')->limit(8)->select();
		$this->assign('searchkey', $searchkey);
		
        $member = D('MemberView')->nofield('password,encrypt')->find($uid);
        if (!$member) {
            $this->error('请重新登录', U(MODULE_NAME . '/Public/login'));
        }
        $member['detail'] = M('memberdetail')->find($uid);
        if (empty($member['detail'])) {
            $member['detail'] = array(
                'realname' => '还没设置',
                'sex'      => '保密',
                'birthday' => '0000-00-00',
                'animal'   => '保密',
                'star'     => '保密',
                'province' => '保密',
                'area'     => '保密',
            );
        } else {
            $member['detail']['sex']    = $member['detail']['sex'] ? '女士' : '男士';
            $member['detail']['animal'] = get_item_value('animal', $member['detail']['animal']);
            $member['detail']['star']   = get_item_value('animal', $member['detail']['star']);
        }
		
		//自动升级会员组
		if($member['score'] > $member['rankend']){
			$gmap['id'] = array('gt',$member['groupid']);
			$upgroup = M('membergroup')->where($gmap)->order('id ASC')->find();
			M('member')->where("id=$uid")->setField('groupid',$upgroup['id']);
		}
		//dump($member);
		$this->assign('member', $member);
        $this->assign('uid', $uid);
		
    }

    public function index(){
		$uid = get_cookie('uid');
		$map['userid'] = $uid;
		//我的投稿
		$article = D2('ArcView', 'article')->nofield('content')->where($map)->order('id desc')->limit(5)->select();
		if($article){
			foreach ($article as $k => $v) {
				$article[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], false, '');
				$article[$k]['comment'] = get_comment($v['id'],$v['modelid']);
			}
		}
		//我的帖子
		$forum = D2('ArcView', 'forum')->nofield('content')->where($map)->order('id desc')->limit(5)->select();
		if($forum){
			foreach ($forum as $k => $v) {
				$forum[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], false, '');
				$forum[$k]['comment'] = get_forum_reply($v['id'],$v['modelid']);
			}
		}
		//我的评论
		$comment = D('CommentView')->where($map)->order('id desc')->limit(5)->select();
		//我的回复
		$reply = D('ForumReplyView')->where($map)->order('id desc')->limit(5)->select();
		//dump($comment);
		$this->assign('article', $article);
		$this->assign('forum', $forum);
		$this->assign('comment', $comment);
		$this->assign('reply', $reply);
        $this->assign('title', '会员中心');
        $this->display();
    }

    public function name(){
        $uid  = get_cookie('uid');
        $user = M('member')->find($uid);
        if (!$user) {
            $this->error('请重新登录', U(MODULE_NAME . '/Public/login'));
        }

        if (IS_POST) {
            $data['username'] = I('username', '', 'htmlspecialchars,trim');
            $data['id']       = $uid;
            if (empty($data['username'])) {
                $this->error('你还没有输入昵称！');
            }

            $notallowname = explode(',', C('CFG_MEMBER_NOTALLOW'));
            if (in_array($data['username'], $notallowname)) {
                $this->error('此昵称系统禁用，请重新更换一个！');
            }

            if (M('member')->save($data) !== false) {
                set_cookie(array('name' => 'username', 'value' => $data['username'], 'expire' => get_cookie('expire')));
                $this->success('修改成功', U(MODULE_NAME . '/Member/index'));
            } else {
                $this->error('修改昵称失败！');
            }
            exit();
        }

        $this->assign('user', $user);
        $this->assign('title', '修改昵称');
        $this->display();
    }
    public function password(){
        $uid = get_cookie('uid');
        if (IS_POST) {
            $oldpassword = I('oldpassword', '');
            $password    = I('password', '');
            $repassword  = I('repassword', '');
            if (empty($oldpassword)) {
                $this->error('请填写旧密码！');
            }
            if (empty($password)) {
                $this->error('请填写新密码！');
            }

            if ($password != $repassword) {
                $this->error('两次密码不一样，请重新填写！');
            }

            $self = M('member')->field(array('email', 'password', 'encrypt'))->where(array('id' => $uid))->find();
            if (!$self) {
                $this->error('用户不存在，请重新登录');
            }

            if (get_password($oldpassword, $self['encrypt']) != $self['password']) {
                $this->error('旧密码错误');
            }

            $passwordinfo = get_password($password);

            $data = array(
                'id'       => $uid,
                'password' => $passwordinfo['password'],
                'encrypt'  => $passwordinfo['encrypt'],
            );

            if (false !== M('member')->save($data)) {
                $this->success('修改密码成功', U(MODULE_NAME . '/Member/password'));
            } else {

                $this->error('修改密码失败');
            }
            exit();
        }

        $this->assign('title', '修改密码');
        $this->display();
    }
    public function avatar(){
		$uid = get_cookie('uid');
		$user = M('member')->find($uid);
		if (!$user) {
			$this->error('请重新登录',U(MODULE_NAME.'/Public/login'));
		}
		
		if (IS_POST) {
			$path = I('path', '', 'trim');
			$data['face'] = $path;
			$data['id'] = $uid;
			if (empty($data['face'])) {
				$this->error('请上传图片！');
			}

			if (M('member')->save($data) !== false) {
				//$this->success('保存成功',U('Member/avatar'));
				$this->redirect('Member/avatar');
			}else{
				$this->error('保存失败！');
			}
			exit();
		}
		$this->assign('user', $user);
		$this->assign('uid', $uid);
		$this->assign('title', '头像设置');
        $this->display();
    }
	
	public function saveavater(){
		$uid = intval(get_cookie('uid'));
		if (!$uid) {
			$this->error('请重新登录',U('Public/login'));
		}
		$rs = array();
		//上传切头像
		$input = file_get_contents('php://input');
		$data = explode('--------------------', $input);
		$url = './uploads/avatar';
		$file = '/'.$uid.'.jpg';
		if (!file_exists($url)){
			mkdir($url); 
		}
		@file_put_contents($url.$file, $data[0]);
		$rs['status'] = $url.$file;
		
		$this->ajaxReturn($rs);
	}
    public function person(){
        $uid = get_cookie('uid');
        if (IS_POST) {
            $data['realname'] = I('realname', '', 'htmlspecialchars,trim');
            $data['birthday'] = I('birthday', '0000-00-00');
            $data['sex']      = I('sex', 0, 'intval');
            $data['address']  = I('address', '');
            $data['tel']      = I('tel', '');
            $data['mobile']   = I('mobile', '');
            $data['qq']       = I('qq', '');
            $data['maxim']    = I('maxim', '');

            $data['userid']     = $uid;
            $data['updatetime'] = time();
            $new                = I('new', 0, 'intval');
            if (empty($data['realname'])) {
                $this->error('请输入姓名！');
            }

            $result = true;
            if ($new) {
                $result = M('memberdetail')->add($data);
            } else {
                $result = M('memberdetail')->save($data);
            }

            if (false !== $result) {
                $this->success('修改基本资料成功', U(MODULE_NAME . '/Member/person'));
            } else {

                $this->error('修改基本资料失败');
            }
            exit();
        }

        $userdetail = M('memberdetail')->where(array('userid' => $uid))->find();
        if (!$userdetail) {
            $userdetail = array(
                'uid'      => $uid,
                'email'    => get_cookie('email'),
                'realname' => '',
                'sex'      => 0,
                'birthday' => '1990-1-1',
                'address'  => '',
                'tel'      => '',
                'mobile'   => '',
                'qq'       => '',
                'maxim'    => '',
            );
            $userdetail['type'] = 1;
        } else {
            $userdetail['type'] = 0;
            $userdetail['uid']   = $uid;
            $userdetail['email'] = get_cookie('email');
        }
		//dump($userdetail);
        $this->assign('detail', $userdetail);
        $this->assign('title', '基本资料');
        $this->display();
    }
	public function email()
    {
        $this->assign('title', '邮箱验证');
        $this->display();
    }
	public function topic()
    {
		$uid = intval(get_cookie('uid'));
		//$map['status'] = 1;
		$map['userid'] = $uid;
        $count = D2('ArcView', 'topic')->where($map)->count();
		//设置显示的页数
		$thisPage = new \Common\Lib\Page($count, 15);
		$thisPage->rollPage = 3;
		$thisPage->setConfig('prev',"上一页");
		$thisPage->setConfig('next',"下一页");
		$thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
		$limit = $thisPage->firstRow . ',' . $thisPage->listRows;
		$page  = $thisPage->show();

		$vlist = D2('ArcView', 'topic')->nofield('content')->where($map)->order('id desc')->limit($limit)->select();
		if($vlist){
			foreach ($vlist as $k => $v) {
				if (isset($v['flag'])) {
					$_jumpflag = ($v['flag'] & B_JUMP) == B_JUMP ? true : false;
					$_jumpurl  = $v['jumpurl'];
				} else {
					$_jumpflag = false;
					$_jumpurl  = '';
				}
				$vlist[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], $_jumpflag, $_jumpurl);
				$type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);		
				$vlist[$k]['curl'] = get_url($type);
				$vlist[$k]['comment'] = get_comment($v['id'],$v['modelid']);
			}
		}
		//$list = M('topic')->where($map)->order('id DESC')->limit(15)->select();
		//dump($vlist);
		$this->assign('vlist', $vlist);
		$this->assign('page', $page);
        $this->assign('title', '我的话题');
        $this->display();
    }
	public function topic_add(){
		$cate = get_category(2);
        $cate = Category::getLevelOfModel(Category::toLevel($cate), 'topic');
		$cids = array();
		foreach($cate as $key=>$value){
			$cids[] = $value['id'];
		}
		//dump($cids);
		$map['tag_status'] = 1;
		//$map['typeid'] = array('in',$cids);
		$tags = M('tag')->where($map)->order('tag_click DESC')->limit(18)->select();
		$this->assign('tags', $tags);
		
        $this->assign('cate', $cate);
        $this->assign('flagtypelist', get_item('flagtype')); //文档属性
		$this->assign('title', '新增话题');
		$this->display('topic_edit');
	}
	public function topic_edit(){
		$id = I('id', 0, 'intval');
		$cate = get_category(2);
        $cate = Category::getLevelOfModel(Category::toLevel($cate), 'topic');

        $info = M('topic')->find($id);
        $info['content'] = $info['content']; //ueditor
		//dump($info);
		$map['tag_status'] = 1;
		$map['typeid'] = $info['cid'];
		$tags = M('tag')->where($map)->order('tag_click DESC')->limit(18)->select();
		$this->assign('tags', $tags);
		
        $this->assign('cate', $cate);
        $this->assign('info', $info);
        $this->assign('flagtypelist', get_item('flagtype')); //文档属性
		$this->assign('title', '编辑话题');
		$this->display();
	}
	public function topic_post(){
		$uid = get_cookie('uid');
		$username = get_cookie('username');
		
		$result['error'] = '';
		$result['tip'] = '';
		
		if(!$uid){
			$result['error'] = '-1';
		}
		if (!IS_AJAX) {
            //exit(0);
			$result['error'] = '非法注册！';
			$this->ajaxReturn($result);
        }
		$data['id'] = I('id', 0, 'intval');
		$data['cid'] = I('cid', 0, 'intval');
		$data['title'] = I('title', '', 'htmlspecialchars,trim');
		$data['content'] = I('content', '', '');
		$data['tag'] = I('tags', '', 'htmlspecialchars,trim');
		$data['status'] = 2;
		if(!$data['id']){
			$data['publishtime'] = time();
		}
		$data['updatetime']  = time();
		$data['userid']  = $uid;
		$data['author'] = $username;
		if (empty($data['description'])) {
            $data['description'] = str2sub(strip_tags($data['content']), 120);
        }
		
		if (empty($data['title'])) {
            //$this->error('标题不能为空');
			$result['error'] = '标题不能为空！';
			$this->ajaxReturn($result);
        }
		if (!$data['cid']) {
			$result['error'] = '请选择栏目！';
			$this->ajaxReturn($result);
        }
		
		if($data['tag']){
			$tags = explode(',',$data['tag']);
			if(count($tags) > 5){
				//$this->error('最多5个标签，用“,”分隔！');
				$result['error'] = '最多5个标签，用“,”分隔！';
				$this->ajaxReturn($result);
			}
			if(count($tags) > 0){
				foreach($tags as $k=>$val){
					$mp['tag_name'] = $val;
					$rs = M('tag')->where($mp)->find();
					if(!$rs){
						$r['tablename'] = 'topic';
						$r['tag_name'] = $val;
						$r['typeid'] = $data['cid'];
						$r['tag_sort'] = 1;
						$r['tag_status'] = 1;
						$r['posttime'] = time();
						$r['tag_click'] = 1;
						
						$where['status'] = 1;
						$where['tag'] = array('like','%'.$val.'%');
						$num = M('topic')->where($where)->count();
						$r['num'] = $num;
						
						M('tag')->add($r);
					}else{
						$where['status'] = 1;
						$where['tag'] = array('like','%'.$val.'%');
						$num = M('topic')->where($where)->count();
						$r['num'] = $num;
						$r['tag_click'] = $rs['tag_click']+1;
						M('tag')->where($mp)->save($r);
						//M('tag')->where($mp)->setInc('tag_click');
					}
				}
			}
		}
		$flags = I('flags', array(), 'intval');
		$pic   = $data['litpic'];
		//图片标志
        if (!empty($pic) && !in_array(B_PIC, $flags)) {
            $flags[] = B_PIC;
        }
        $data['flag'] = 0;
        foreach ($flags as $v) {
            $data['flag'] += $v;
        }
		//获取属于分类信息,得到modelid
        $selfCate = Category::getSelf(get_category(0), $data['cid']); //当前栏目信息
        $modelid  = $selfCate['modelid'];
		
		if(!$data['id']){
			M('member')->where(array('id' => $uid))->setInc('score',C('PUBLISH_SCORE'));  //增加积分
			//记录积分操作
			$log['uid'] = $user['id'];
			$log['scoreinfo'] = '+'.C('PUBLISH_SCORE');
			$log['type'] = 1;
			$log['addtime'] = time();
			$log['title'] = $data['title'];
			$log['descrip'] = '发表话题，积分+'.C('PUBLISH_SCORE');
			M('member_slog')->add($log);
			
			$status = M('topic')->add($data);
			$result['tip'] = '添加成功！积分+'.C('PUBLISH_SCORE');
		}else{
			$status = M('topic')->save($data);
			$result['tip'] = '编辑成功！';
		}
		if($status){
			$firstpic  = '';
			$attid_arr = get_att_content($data['content'], $firstpic, empty($pic)); //内容中的图片
			//更新上传附件表
			if (!empty($pic)) {
				$attid_arr = array_merge($attid_arr, get_att_attachment($pic, true));
			} else if (!empty($firstpic)) {
				//更新表字段
				$updata = array('id' => $id, 'litpic' => $firstpic);
				if (!in_array(B_PIC, $flags)) {
					$updata['flag'] = array('exp', 'flag+' . B_PIC);
				}
				M('topic')->save($updata);
			}
			//attachment index入库
			insert_att_index($attid_arr, $id, $modelid);

			//更新静态缓存
			del_cache_html('List/index_' . $data['cid'], false, 'list:index');
			del_cache_html('Index_index', false, 'index:index');
			del_cache_html('Show/index_*_' . $id, false, 'show:index'); //不太精确，会删除其他模块同id文档
			//Delete blog archive
			get_datelist($modelid, 2);
			$this->ajaxReturn($result);
		}else{
			$result['error'] = '编辑失败！';
			$this->ajaxReturn($result);
		}
		
	}
	public function topic_del(){
		$id = I('id', 0, 'intval');
		$uid = get_cookie('uid');
		if(!$uid){
			$this->error('非法操作！');
		}
		if($id){
			$map['id'] = $id;
			$map['userid'] = $uid;
			$info = M('topic')->where($map)->delete();
			if($info){
				$this->success('删除成功！', U('Member/topic'));
			}else{
				$this->error('删除失败！');
			}
		}else{
			$this->error('参数错误！');
		}
	}
	public function article(){
		$uid = intval(get_cookie('uid'));
		//$map['status'] = 1;
		$map['userid'] = $uid;
        $count = D2('ArcView', 'article')->where($map)->count();
		//设置显示的页数
		$thisPage = new \Common\Lib\Page($count, 15);
		$thisPage->rollPage = 3;
		$thisPage->setConfig('prev',"上一页");
		$thisPage->setConfig('next',"下一页");
		$thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
		$limit = $thisPage->firstRow . ',' . $thisPage->listRows;
		$page  = $thisPage->show();

		$vlist = D2('ArcView', 'article')->nofield('content')->where($map)->order('id desc')->limit($limit)->select();
		if($vlist){
			foreach ($vlist as $k => $v) {
				if (isset($v['flag'])) {
					$_jumpflag = ($v['flag'] & B_JUMP) == B_JUMP ? true : false;
					$_jumpurl  = $v['jumpurl'];
				} else {
					$_jumpflag = false;
					$_jumpurl  = '';
				}
				$vlist[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], $_jumpflag, $_jumpurl);
				$type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);		
				$vlist[$k]['curl'] = get_url($type);
				$vlist[$k]['comment'] = get_comment($v['id'],$v['modelid']);
			}
		}
		//$list = M('topic')->where($map)->order('id DESC')->limit(15)->select();
		//dump($vlist);
		$this->assign('vlist', $vlist);
		$this->assign('page', $page);
        $this->assign('title', '我的文章');
        $this->display();
    }
	public function article_add(){
		$cate = get_category(2);
        $cate = Category::getLevelOfModel(Category::toLevel($cate), 'article');
		$cids = array();
		foreach($cate as $key=>$value){
			$cids[] = $value['id'];
		}
		
		$map['tag_status'] = 1;
		$map['typeid'] = array('in',$cids);
		$tags = M('tag')->where($map)->order('tag_click DESC')->limit(18)->select();
		$this->assign('tags', $tags);
		//dump($cate);
        $this->assign('cate', $cate);
        $this->assign('flagtypelist', get_item('flagtype')); //文档属性
		$this->assign('title', '新增文章');
		$this->display('article_edit');
	}
	public function article_edit(){
		$id = I('id', 0, 'intval');
		$cate = get_category(2);
        $cate = Category::getLevelOfModel(Category::toLevel($cate), 'article');

        $info = M('article')->find($id);
		/*if($info['status'] != 2){
			$this->error('该状态下不允许编辑！');
		}*/
        $info['content'] = $info['content']; //ueditor
		//dump($info);
		$map['tag_status'] = 1;
		$map['typeid'] = $info['cid'];
		$tags = M('tag')->where($map)->order('tag_click DESC')->limit(18)->select();
		$this->assign('tags', $tags);
		
        $this->assign('cate', $cate);
        $this->assign('info', $info);
        $this->assign('flagtypelist', get_item('flagtype')); //文档属性
		$this->assign('title', '编辑文章');
		$this->display();
	}
	public function article_post(){
		$uid = get_cookie('uid');
		$username = get_cookie('username');
		
		$result['error'] = '';
		$result['tip'] = '';
		
		if(!$uid){
			$result['error'] = '-1';
		}
		if (!IS_AJAX) {
            //exit(0);
			$result['error'] = '非法注册！';
			$this->ajaxReturn($result);
        }
		$data = I('post.');
		$data['id'] = I('id', 0, 'intval');
		$data['cid'] = I('cid', 0, 'intval');
		$data['title'] = I('title', '', 'htmlspecialchars,trim');
		$data['content'] = I('content', '', '');
		$data['tag'] = I('tags', '', 'htmlspecialchars,trim');
		$data['status'] = 2;
		if(!$data['id']){
			$data['publishtime'] = time();
		}
		$data['updatetime']  = time();
		$data['userid']  = $uid;
		$data['author'] = $username;
		if (empty($data['description'])) {
            $data['description'] = str2sub(strip_tags($data['content']), 120);
        }
		
		if (empty($data['title'])) {
            //$this->error('标题不能为空');
			$result['error'] = '标题不能为空！';
			$this->ajaxReturn($result);
        }
		if (!$data['cid']) {
			$result['error'] = '请选择栏目！';
			$this->ajaxReturn($result);
        }
		
		if($data['tag']){
			$tags = explode(',',$data['tag']);
			if(count($tags) > 5){
				//$this->error('最多5个标签，用“,”分隔！');
				$result['error'] = '最多5个标签，用“,”分隔！';
				$this->ajaxReturn($result);
			}
			if(count($tags) > 0){
				foreach($tags as $k=>$val){
					$mp['tag_name'] = trim($val);
					$rs = M('tag')->where($mp)->find();
					if(empty($rs)){
						$r['tablename'] = 'article';
						$r['tag_name'] = $val;
						$r['typeid'] = $data['cid'];
						$r['tag_sort'] = 1;
						$r['tag_status'] = 1;
						$r['posttime'] = time();
						$r['tag_click'] = 1;
						
						$where['status'] = 1;
						$where['tag'] = array('like','%'.$val.'%');
						$num = M('article')->where($where)->count();
						$r['num'] = $num;
						
						M('tag')->add($r);
					}else{
						$where['status'] = 1;
						$where['tag'] = array('like','%'.$val.'%');
						$num = M('article')->where($where)->count();
						$r['num'] = $num;
						$r['tag_click'] = $rs['tag_click']+1;
						M('tag')->where($mp)->save($r);
						//M('tag')->where($mp)->setInc('tag_click');
					}
				}
			}
		}
		$flags = I('flags', array(), 'intval');
		$pic   = $data['litpic'];
		//图片标志
        if (!empty($pic) && !in_array(B_PIC, $flags)) {
            $flags[] = B_PIC;
        }
        $data['flag'] = 0;
        foreach ($flags as $v) {
            $data['flag'] += $v;
        }
		//获取属于分类信息,得到modelid
        $selfCate = Category::getSelf(get_category(0), $data['cid']); //当前栏目信息
        $modelid  = $selfCate['modelid'];
		
		if(!$data['id']){
			M('member')->where(array('id' => $uid))->setInc('score',C('PUBLISH_SCORE'));  //增加积分
			//记录积分操作
			$log['uid'] = $user['id'];
			$log['scoreinfo'] = '+'.C('PUBLISH_SCORE');
			$log['type'] = 1;
			$log['addtime'] = time();
			$log['title'] = $data['title'];
			$log['descrip'] = '发表文章，积分+'.C('PUBLISH_SCORE');
			M('member_slog')->add($log);
			
			$status = M('article')->add($data);
			$result['tip'] = '添加成功！积分+'.C('PUBLISH_SCORE');
		}else{
			$status = M('article')->save($data);
			$result['tip'] = '编辑成功！';
		}
		if($status){
			$firstpic  = '';
			$attid_arr = get_att_content($data['content'], $firstpic, empty($pic)); //内容中的图片
			//更新上传附件表
			if (!empty($pic)) {
				$attid_arr = array_merge($attid_arr, get_att_attachment($pic, true));
			} else if (!empty($firstpic)) {
				//更新表字段
				$updata = array('id' => $id, 'litpic' => $firstpic);
				if (!in_array(B_PIC, $flags)) {
					$updata['flag'] = array('exp', 'flag+' . B_PIC);
				}
				M('article')->save($updata);
			}
			//attachment index入库
			insert_att_index($attid_arr, $id, $modelid);

			//更新静态缓存
			del_cache_html('List/index_' . $data['cid'], false, 'list:index');
			del_cache_html('Index_index', false, 'index:index');
			del_cache_html('Show/index_*_' . $id, false, 'show:index'); //不太精确，会删除其他模块同id文档
			//Delete blog archive
			get_datelist($modelid, 2);
			$this->ajaxReturn($result);
		}else{
			$result['error'] = '编辑失败！';
			$this->ajaxReturn($result);
		}
		
	}
	public function article_del(){
		$id = I('id', 0, 'intval');
		$uid = get_cookie('uid');
		if(!$uid){
			$this->error('非法操作！');
		}
		if($id){
			$map['id'] = $id;
			$map['userid'] = $uid;
			$info = M('article')->where($map)->delete();
			if($info){
				$this->success('删除成功！', U('Member/article'));
			}else{
				$this->error('删除失败！');
			}
		}else{
			$this->error('参数错误！');
		}
	}
	public function forum(){
		$uid = intval(get_cookie('uid'));
		//$map['status'] = 1;
		$map['userid'] = $uid;
        $count = D2('ArcView', 'forum')->where($map)->count();
		//设置显示的页数
		$thisPage = new \Common\Lib\Page($count, 15);
		$thisPage->rollPage = 3;
		$thisPage->setConfig('prev',"上一页");
		$thisPage->setConfig('next',"下一页");
		$thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
		$limit = $thisPage->firstRow . ',' . $thisPage->listRows;
		$page  = $thisPage->show();

		$vlist = D2('ArcView', 'forum')->nofield('content')->where($map)->order('id desc')->limit($limit)->select();
		if($vlist){
			foreach ($vlist as $k => $v) {
				if (isset($v['flag'])) {
					$_jumpflag = ($v['flag'] & B_JUMP) == B_JUMP ? true : false;
					$_jumpurl  = $v['jumpurl'];
				} else {
					$_jumpflag = false;
					$_jumpurl  = '';
				}
				$vlist[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], $_jumpflag, $_jumpurl);
				$type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);		
				$vlist[$k]['curl'] = get_url($type);
				$vlist[$k]['comment'] = get_forum_reply($v['id'],$v['modelid']);
			}
		}
		//$list = M('topic')->where($map)->order('id DESC')->limit(15)->select();
		//dump($vlist);
		$this->assign('vlist', $vlist);
		$this->assign('page', $page);
        $this->assign('title', '我的帖子');
        $this->display();
    }
	public function forum_add(){
		$cate = get_category(2);
		
        $cate = Category::getLevelOfModel(Category::toLevel($cate), 'forum');
		$cids = array();
		foreach($cate as $key=>$value){
			$cids[] = $value['id'];
		}
		//dump($cate);
		$map['tag_status'] = 1;
		$map['typeid'] = array('in',$cids);
		$tags = M('tag')->where($map)->order('tag_click DESC')->limit(18)->select();
		$this->assign('tags', $tags);
		//dump($cate);
        $this->assign('cate', $cate);
        $this->assign('flagtypelist', get_item('flagtype')); //文档属性
		$this->assign('title', '新增帖子');
		$this->display('forum_edit');
	}
	public function forum_edit(){
		$id = I('id', 0, 'intval');
		$cate = get_category(2);
        $cate = Category::getLevelOfModel(Category::toLevel($cate), 'forum');

        $info = M('forum')->find($id);
		/*if($info['status'] != 2){
			$this->error('该状态下不允许编辑！');
		}*/
        $info['content'] = $info['content']; //ueditor
		
		$map['tag_status'] = 1;
		$map['typeid'] = $info['cid'];
		$tags = M('tag')->where($map)->order('tag_click DESC')->limit(18)->select();
		$this->assign('tags', $tags);
		
        $this->assign('cate', $cate);
        $this->assign('info', $info);
        $this->assign('flagtypelist', get_item('flagtype')); //文档属性
		$this->assign('title', '编辑帖子');
		$this->display();
	}
	public function forum_post(){
		$uid = get_cookie('uid');
		$username = get_cookie('username');
		
		$result['error'] = '';
		$result['tip'] = '';
		
		if(!$uid){
			$result['error'] = '-1';
		}
		if (!IS_AJAX) {
            //exit(0);
			$result['error'] = '非法提交！';
			$this->ajaxReturn($result);
        }
		$data['id'] = I('id', 0, 'intval');
		$data['cid'] = I('cid', 0, 'intval');
		$data['title'] = I('title', '', 'htmlspecialchars,trim');
		$data['content'] = I('content', '', '');
		$data['tag'] = I('tags', '', 'htmlspecialchars,trim');
		$data['status'] = 1;
		if(!$data['id']){
			$data['publishtime'] = time();
		}
		$data['updatetime']  = time();
		$data['userid']  = $uid;
		$data['author'] = $username;
		if (empty($data['description'])) {
            $data['description'] = str2sub(strip_tags($data['content']), 120);
        }
		
		if (empty($data['title'])) {
            //$this->error('标题不能为空');
			$result['error'] = '标题不能为空！';
			$this->ajaxReturn($result);
        }
		if (!$data['cid']) {
			$result['error'] = '请选择栏目！';
			$this->ajaxReturn($result);
        }
		
		if($data['tag']){
			$tags = explode(',',$data['tag']);
			if(count($tags) > 5){
				//$this->error('最多5个标签，用“,”分隔！');
				$result['error'] = '最多5个标签，用“,”分隔！';
				$this->ajaxReturn($result);
			}
			if(count($tags) > 0){
				foreach($tags as $k=>$val){
					$mp['tag_name'] = trim($val);
					$rs = M('tag')->where($mp)->find();
					if(empty($rs)){
						$r['tablename'] = 'forum';
						$r['tag_name'] = $val;
						$r['typeid'] = $data['cid'];
						$r['tag_sort'] = 1;
						$r['tag_status'] = 1;
						$r['posttime'] = time();
						$r['tag_click'] = 1;
						
						$where['status'] = 1;
						$where['tag'] = array('like','%'.$val.'%');
						$num = M('forum')->where($where)->count();
						$r['num'] = $num;
						
						M('tag')->add($r);
					}else{
						$where['status'] = 1;
						$where['tag'] = array('like','%'.$val.'%');
						$num = M('forum')->where($where)->count();
						$r['num'] = $num;
						$r['tag_click'] = $rs['tag_click']+1;
						M('tag')->where($mp)->save($r);
						//M('tag')->where($mp)->setInc('tag_click');
					}
				}
			}
		}
		$flags = I('flags', array(), 'intval');
		$pic   = $data['litpic'];
		//图片标志
        if (!empty($pic) && !in_array(B_PIC, $flags)) {
            $flags[] = B_PIC;
        }
        $data['flag'] = 0;
        foreach ($flags as $v) {
            $data['flag'] += $v;
        }
		//获取属于分类信息,得到modelid
        $selfCate = Category::getSelf(get_category(0), $data['cid']); //当前栏目信息
        $modelid  = $selfCate['modelid'];
		
		if(!$data['id']){
			M('member')->where(array('id' => $uid))->setInc('score',C('PUBLISH_SCORE'));  //增加积分
			//记录积分操作
			$log['uid'] = $user['id'];
			$log['scoreinfo'] = '+'.C('PUBLISH_SCORE');
			$log['type'] = 1;
			$log['addtime'] = time();
			$log['title'] = $data['title'];
			$log['descrip'] = '发表论坛帖子，积分+'.C('PUBLISH_SCORE');
			M('member_slog')->add($log);
			
			$status = M('forum')->add($data);
			$result['tip'] = '添加成功！积分+'.C('PUBLISH_SCORE');
		}else{
			$status = M('forum')->save($data);
			$result['tip'] = '编辑成功！';
		}
		if($status){
			$firstpic  = '';
			$attid_arr = get_att_content($data['content'], $firstpic, empty($pic)); //内容中的图片
			//更新上传附件表
			if (!empty($pic)) {
				$attid_arr = array_merge($attid_arr, get_att_attachment($pic, true));
			} else if (!empty($firstpic)) {
				//更新表字段
				$updata = array('id' => $id, 'litpic' => $firstpic);
				if (!in_array(B_PIC, $flags)) {
					$updata['flag'] = array('exp', 'flag+' . B_PIC);
				}
				M('forum')->save($updata);
			}
			//attachment index入库
			insert_att_index($attid_arr, $id, $modelid);

			//更新静态缓存
			del_cache_html('List/index_' . $data['cid'], false, 'list:index');
			del_cache_html('Index_index', false, 'index:index');
			del_cache_html('Show/index_*_' . $id, false, 'show:index'); //不太精确，会删除其他模块同id文档
			//Delete blog archive
			get_datelist($modelid, 2);
			$this->ajaxReturn($result);
		}else{
			$result['error'] = '编辑失败！';
			$this->ajaxReturn($result);
		}
		
	}
	public function forum_del(){
		$id = I('id', 0, 'intval');
		$uid = get_cookie('uid');
		if(!$uid){
			$this->error('非法操作！');
		}
		if($id){
			$map['id'] = $id;
			$map['userid'] = $uid;
			$info = M('forum')->where($map)->delete();
			if($info){
				$this->success('删除成功！', U('Member/forum'));
			}else{
				$this->error('删除失败！');
			}
		}else{
			$this->error('参数错误！');
		}
	}
	public function comment(){
		$uid = get_cookie('uid');
		
		$map['userid'] = $uid;
		$count = D('CommentView')->where($map)->count();
		
		$thisPage = new \Common\Lib\Page($count, 15);
		$thisPage->rollPage = 3;
		$thisPage->setConfig('prev',"上一页");
		$thisPage->setConfig('next',"下一页");
		$thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
		$limit = $thisPage->firstRow . ',' . $thisPage->listRows;
		$page  = $thisPage->show();
		
		$list = D('CommentView')->where($map)->order('id desc')->limit($limit)->select();
		//dump($list);
		$this->assign('title', '我的评论');
		$this->assign('list', $list);
		$this->assign('page', $page);
		$this->display();
	}	
	public function reply(){
		$uid = get_cookie('uid');
		
		$map['userid'] = $uid;
		$count = D('ForumReplyView')->where($map)->count();
		
		$thisPage = new \Common\Lib\Page($count, 15);
		$thisPage->rollPage = 3;
		$thisPage->setConfig('prev',"上一页");
		$thisPage->setConfig('next',"下一页");
		$thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
		$limit = $thisPage->firstRow . ',' . $thisPage->listRows;
		$page  = $thisPage->show();
		
		$list = D('ForumReplyView')->where($map)->order('id desc')->limit($limit)->select();
		//dump($list);
		$this->assign('title', '我的回复');
		$this->assign('list', $list);
		$this->assign('page', $page);
		$this->display();
	}
	//积分流水记录
	public function logs(){
		$uid = get_cookie('uid');
		$map['uid'] = $uid;
		$count = M('member_slog')->where($map)->count();
		
		$thisPage = new \Common\Lib\Page($count, 15);
		$thisPage->rollPage = 3;
		$thisPage->setConfig('prev',"上一页");
		$thisPage->setConfig('next',"下一页");
		$thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
		$limit = $thisPage->firstRow . ',' . $thisPage->listRows;
		$page  = $thisPage->show();
		
		$list = M('member_slog')->where($map)->order('id desc')->limit($limit)->select();
		$this->assign('title', '积分收支明细');
		$this->assign('lists', $list);
		$this->assign('page', $page);
		$this->display();
	}
	public function bind() {
        $this->assign("title", "绑定账号");
        $this->display();
    }

    public function pay() {
        $pay_month = M("pay_month")->where("is_show = 1")->select();
        $this->assign("pay_month", $pay_month);
        $this->assign("title", "在线充值");
        $this->display();
    }
	public function order() {
        $userid = get_cookie('uid');
        $sql = "uid = " . $userid . " AND status = 1";
        if ($userid == 1) {
            $sql = "status = 1";
            $times = getTimes();
            $statics = array();
            foreach ($times as $k => $v) {
                $statics[$k]['title'] = $v['title'];
                $statics[$k]['money'] = intval(M('pay')->where("addtime between " . $v['starttime'] . " AND " . $v['endtime'] . " AND status = 1")->sum("money"));
            }
            $this->assign("statics", $statics);
        }

        $count = M('pay')->where($sql)->count();    //计算总数
        $Page = new \Think\Page($count, 10);
        $lists = M('pay')->where($sql)->limit($Page->firstRow . ',' . $Page->listRows)->order("addtime desc")->select();
        $page = $Page->show();
        $this->assign("page", $page);
        $this->assign("lists", $lists);
        $this->assign("title", "充值记录");
        $this->display();
    }
	
	public function points() {
        $userid = get_cookie('uid');
        $month_first = date("Y-m-01 00:00:00");
        $starttime = strtotime(I('get.starttime', $month_first));
        $endtime = strtotime(I('get.endtime', date("Y-m-" . date("t") . "")));
        $this->assign("starttime", date("Y-m-d", $starttime));
        $this->assign("endtime", date("Y-m-d", $endtime));
        $mtype = I('get.mtype', '', 'int');
        $sql = "(uid = " . $userid . " or to_uid = " . $userid . ")";
        $count = M("points")->where($sql)->count();    //计算总数
        $Page = new \Think\Page($count, 10);
        $lists = M("points")->where($sql)->limit($Page->firstRow . ',' . $Page->listRows)->order("id desc")->select();
        $this->assign("page", $Page->show());
        $this->assign("lists", $lists);
        $this->assign("mtype", $mtype);
        /*$user = M("user")->field("money")->where("id = " . $userid . "")->find();
        $this->assign("user", $user);*/
        $this->assign("title", "财务记录");
        $this->display();
    }

}
?>