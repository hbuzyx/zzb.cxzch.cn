<?php

namespace Home\Controller;

class ReplyController extends HomeCommonController
{
    //方法：index
    public function index(){}

    public function add(){
        header("Content-Type:text/html; charset=utf-8");
        if (!IS_AJAX || !IS_POST) {
            //exit(json_encode( array('status' => 0, 'info' => '非法请求' ) ));
            $this->error('非法请求');
        }
        //M验证
        $data['postid']   = I('post_id', 0, 'intval');
        $data['modelid']  = I('model_id', 0, 'intval');
        $data['pid']      = I('review_id', 0, 'intval');
		$data['cid']      = I('cid', 0, 'intval');
		$data['url']    = I('url', '','htmlspecialchars');
        $data['title']    = I('title', '','htmlspecialchars');
        $data['content']  = I('content', '','');
        $data['posttime'] = time();
        $data['ip']       = get_client_ip();
        $data['agent']    = $_SERVER['HTTP_USER_AGENT'];

        $verify = I('vcode', '', 'htmlspecialchars,trim');
        if (C('cfg_verify_review') == 1 && !check_verify($verify)) {
            $this->error('验证码不正确');
        }

        $uid = get_cookie('uid'); //不能用empty(get_cookie('uid')),empty不能用于函数返回值
        if (!empty($uid)) {
            $data['userid'] = $uid;
            $data['email']  = get_cookie('email');
            //$data['nickname'] = get_cookie('username');
			$data['nickname'] = get_nickname($uid);
			
			//记录积分操作
			$log['uid'] = $uid;
			$log['scoreinfo'] = '+'.C('REPLY_SCORE');
			$log['type'] = 1;
			$log['addtime'] = time();
			$log['title'] = $data['title'];
			$log['url'] = $data['url'];
			$log['descrip'] = '发表回复，积分+'.C('REPLY_SCORE');
			M('member_slog')->add($log);
			M('member')->where(array('id' => $uid))->setInc('score',C('REPLY_SCORE'));  //增加积分

        } else {
            $data['userid']   = 0;
            $data['nickname'] = I('nickname', '游客');
            $data['email']    = I('email', '', 'htmlspecialchars,trim');
        }
        if ($data['userid'] == 0 && !C('CFG_FEEDBACK_GUEST')) {
//允许匿名评论
            $this->error('请登录后评论');
        }

        if (empty($data['postid']) || empty($data['modelid'])) {
            $this->error('参数错误');
        }

        if (empty($data['title'])) {
            $this->error('文章不正确，请刷新再评论');
        }

        if (empty($data['content']) || mb_strlen($data['content'], 'utf-8') < 3) {
            $this->error('请填写评论内容，内容太短');
        }

        if (check_badword($data['content'])) {
            $this->error('评论内容包含非法信息，请认真填写！');
        }

        if ($id = M('ForumReply')->add($data)) {
            //$this->success('添加成功',U(MODULE_NAME. '/Guestbook/index'));
            $list = array(
                //'status' => 1,
                'id'        => $id,
                'user_id'   => $data['userid'],
                'review_id' => $data['pid'],
                'nickname'  => $data['nickname'],
                'ico'       => '',
                'avatar'    => get_avatar(get_cookie('face'), 0),
                'content'   => $data['content'],
                'posttime'  => date('Y-m-d H:i:s', time()),
            );
            $furl = $_SERVER['HTTP_REFERER'];
            //exit(json_encode($list));
            $this->success('添加成功', $furl, $list);
        } else {
            $this->error('添加失败' . M('ForumReply')->getError());
        }

    }

    public function getlist()
    {

        header("Content-Type:text/html; charset=utf-8"); //不然返回中文乱码
        if (!IS_AJAX) {
            //exit('非法请求');
        }

        $postid   = I('post_id', 0, 'intval');
        $modelid  = I('model_id', 0, 'intval');
        $pageSize = I('num', 2, 'intval');
        $page     = I('page', 1, 'intval');
        $avatar   = I('avatar', 'middle');
        $userid   = get_cookie('uid');
        $userid   = empty($userid) ? '0' : get_cookie('uid');

        $count = D('ForumReplyView')->where(array('pid' => 0, 'postid' => $postid, 'modelid' => $modelid))->count();
        if ($count % $pageSize) {
            $pageCount = (int) ($count / $pageSize) + 1; //如果有余数，则页数等于总数据量除以每页数的结果取整再加一
        } else {
            $pageCount = $count / $pageSize;
        }
        $page = $page > $pageCount ? $pageCount : $page;
        $page = $page < 1 ? 1 : $page;

        $data = D('ForumReplyView')->where(array('pid' => 0, 'postid' => $postid, 'modelid' => $modelid))->order('forum_reply.id DESC')->limit(($page - 1) * $pageSize, $pageSize)->select();
        if (empty($data)) {
            $data = array();
        }
        $list = array(
            'count'   => $count,
            'avatar'  => get_avatar(get_cookie('face'), 0),
            'user_id' => $userid,
            'guest'   => intval(C('CFG_FEEDBACK_GUEST')),
            //'sql' => M('ForumReply')->getlastsql(),
            //'review' => ''
        );
        $list['list'] = array();
        $ids          = array(); //所有id为下面的查询的pid

        foreach ($data as $k => $v) {
            $list['list'][] = array(
                'id'       => $v['id'],
                'user_id'  => $v['userid'],
                //'username' => $v['username'],
				'username' => get_nickname($v['userid']),
                'ico'      => '',
                'avatar'   => get_avatar($v['face'], 0),
                'content'  => $v['content'],
                'posttime' => date('Y-m-d H:i:s', $v['posttime']),
                'child'    => array(), //后面就不用初始化
            );
            $ids[] = $v['id'];
        }

        //评论回复

        if (!empty($ids)) {
            $data = D('ForumReplyView')->where(array('pid' => array('in', $ids), 'postid' => $postid, 'modelid' => $modelid))->order('forum_reply.id')->select();

            if (!empty($data)) {
                foreach ($list['list'] as $k => $v) {
                    foreach ($data as $k2 => $v2) {
                        if ($v['id'] == $v2['pid']) {
                            $list['list'][$k]['child'][] = array(
                                'id'        => $v2['id'],
                                'user_id'   => $v2['userid'],
                                'review_id' => $v2['pid'],
                                //'username'  => $v2['username'],
								'username'  => get_nickname($v2['userid']),
                                'ico'       => '',
                                'avatar'    => get_avatar($v2['face'], 0),
                                'content'   => $v2['content'],
                                'posttime'  => date('Y-m-d H:i:s', $v2['posttime']),
                            );

                            unset($data[$k2]); //删除已经认领元素,减少内循环
                        }
                    }
                }
            }
        }

        unset($data);
        exit(json_encode($list));

    }

}
