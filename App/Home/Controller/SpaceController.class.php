<?php

namespace Home\Controller;

class SpaceController extends HomeCommonController
{
    //方法：index
    public function index()
    {
		$uid   = I('uid', 0, 'intval');
		if(!$uid) {
            $this->redirect('Index/index');
        }
		$uspace = D('MemberView')->nofield('password,encrypt')->find($uid);
        if (!$uspace) {
            $this->redirect('Index/index');
        }
		
		$map['userid'] = $uid;
		$map['status'] = 1;
		//我的投稿
		$article = D2('ArcView', 'article')->nofield('content')->where($map)->order('id desc')->limit(10)->select();
		if($article){
			foreach ($article as $k => $v) {
				$article[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], false, '');
				$article[$k]['comment'] = get_comment($v['id'],$v['modelid']);
			}
		}
		//我的帖子
		$forum = D2('ArcView', 'forum')->nofield('content')->where($map)->order('id desc')->limit(10)->select();
		if($forum){
			foreach ($forum as $k => $v) {
				$forum[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], false, '');
				$forum[$k]['comment'] = get_forum_reply($v['id'],$v['modelid']);
			}
		}
		
		$map1['userid'] = $uid;
		//我的评论
		$comment = D('CommentView')->where($map1)->order('id desc')->limit(10)->select();
		//我的回复
		$reply = D('ForumReplyView')->where($map1)->order('id desc')->limit(10)->select();
		//dump($comment);
		$this->assign('article', $article);
		$this->assign('forum', $forum);
		$this->assign('comment', $comment);
		$this->assign('reply', $reply);
		
		//dump($member);
		$this->assign('uspace', $uspace);
		if($uspace['nickname']){
			$nickname = $uspace['nickname'];
		}else{
			$nickname = $uspace['username'];
		}
		$this->assign('nickname', $nickname);
        $this->assign('title', $nickname.'的个人主页');
        $this->display();

    }
}
?>
