<?php

namespace Home\Controller;

class TagController extends HomeCommonController
{
    //方法：index
    public function index()
    {
        $tagname = I('tagname', '', 'htmlspecialchars,trim'); //标签
        if ($tagname == '') {
            $this->error('非法操作');
        }
		//$tablename = 'article';
		$tablename = 'soft';
        if (!empty($tagname)) {

            $where = array('tag' => array('LIKE', '%' . $tagname . '%'));
			$where['status'] = 1;
            $count = D2('ArcView', $tablename)->where($where)->count();

            //设置显示的页数
            $thisPage           = new \Common\Lib\Page($count, 20);
            $thisPage->rollPage = 3;
			$thisPage->setConfig('prev',"上一页");
			$thisPage->setConfig('next',"下一页");
            $thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
            $limit = $thisPage->firstRow . ',' . $thisPage->listRows;
            $page  = $thisPage->show();

            $vlist = D2('ArcView', $tablename)->nofield('content')->where($where)->order('id desc')->limit($limit)->select();
        } else {
            $page  = '';
            $vlist = array();
        }
        if (empty($vlist)) {
            $vlist = array();
        }
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

        if (empty($tagname)) {
            $title = '标签库';
        } else {
            $title = $tagname . '_标签库';
        }

        $this->assign('title', $title);
        $this->assign('tagname', $tagname);
        $this->assign('vlist', $vlist);
        $this->assign('page', $page);
        $this->display();

    }
	
	public function lists(){
		$map['tag_status'] = 1;
		$tags = M('tag')->where($map)->order('tag_id DESC')->limit(1500)->select();
		$title = '标签库';
		$this->assign('title', $title);
		$this->assign('tags', $tags);
        $this->display();
	}

}
