<?php

namespace Home\Controller;

class SearchController extends HomeCommonController
{
    //方法：index
    public function index()
    {

        $modelid = I('modelid', 0, 'intval');
        $keyword = I('keyword', '', 'htmlspecialchars,trim'); //关键字
        if (!empty($modelid)) {
            $tablename = M('model')->where(array('id' => $modelid))->getField('tablename');
        }

        if (empty($tablename)) {
            $model = M('model')->order('id')->find();
            if ($model) {
                $modelid   = $model['id'];
                $tablename = $model['tablename'];
            }
        }

        if ($keyword == '请输入关键词') {
            $keyword = '';
        }

        if (!empty($keyword) && !empty($tablename)) {
			
			//保存关键词
			$mp['keyword'] = $keyword;
			$rs = M('search')->where($mp)->find();
			if(!$rs){
				$r['keyword'] = $keyword;
				$r['status'] = 0;
				$r['addtime'] = time();
				$r['userid'] = $uid;
				$r['ipaddr'] = $_SERVER["REMOTE_ADDR"]; 
				$r['referer'] = htmlspecialchars($_SERVER['HTTP_REFERER']);
				$r['num'] = 1;
				M('search')->add($r);
			}else{
				$r['addtime'] = time();
				$r['userid'] = $uid;
				$r['ipaddr'] = $_SERVER["REMOTE_ADDR"]; 
				$r['referer'] = htmlspecialchars($_SERVER['HTTP_REFERER']);
				$r['num'] = $rs['num']+1;
				M('search')->where($mp)->save($r);
				//M('search')->where($mp)->setInc('num');
			}

            $where = array('title|'.$tablename.'.description' => array('LIKE', '%' . $keyword . '%'));
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

        if (empty($keyword)) {
            $title = '搜索中心';
        } else {
            $title = $keyword . '_搜索中心';
        }

        $this->assign('title', $title);
        $this->assign('keyword', $keyword);
        $this->assign('searchurl', U('Search/index'));
        $this->assign('vlist', $vlist);
        $this->assign('page', $page);
        $this->assign('modelid', $modelid);
        $this->display();

    }

}
