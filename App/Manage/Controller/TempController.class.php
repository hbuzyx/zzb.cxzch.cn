<?php

namespace Manage\Controller;

use Common\Lib\Category;

class TempController extends CommonContentController
{

    public function index(){

		$pid = I('pid', 0, 'intval'); //类别ID
        $keyword = I('keyword', '', 'htmlspecialchars,trim'); //关键字

        //所有子栏目列表
        $cate    = get_category(); //全部分类
        $subcate = Category::toLayer(Category::clearCate(Category::getChilds($cate, $pid), 'type'), 'child', $pid); //子类,多维
        $poscate = Category::getParents($cate, $pid);

        if ($pid) {
            $idarr = Category::getChildsId($cate, $pid, 1); //所有子类ID
            $where = array('temp.status' => array('gt',0), 'cid' => array('in', $idarr));
        } else {
            $where = array('temp.status' => array('gt',0));
        }

        if (!empty($keyword)) {
            $where['temp.title'] = array('LIKE', "%{$keyword}%");
        }

        $count          = D2('ArcView', 'temp')->where($where)->count();
        $page           = new \Common\Lib\Page($count, 10);
        $page->rollPage = 7;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $art   = D2('ArcView', 'temp')->nofield('content,pictureurls')->where($where)->order('temp.id DESC')->limit($limit)->select();
		
		$cateLevel = Category::toLevel($cate, '---', 0);
		$this->assign('cate', $cateLevel);

        $this->assign('pid', $pid);
        $this->assign('subcate', $subcate);
        $this->assign('poscate', $poscate);
        $this->assign('keyword', $keyword);
        $this->assign('page', $page->show());
        $this->assign('vlist', $art);
        $this->assign('type', '临时文章列表');
		
        $this->display();
    }

    //编辑
    public function edit(){
        //当前控制器名称
        $id         = I('id', 0, 'intval');
        $actionName = strtolower(CONTROLLER_NAME);

        if (IS_POST) {
            $this->editPost();
            exit();
        }

        $pid  = I('pid', 0, 'intval');
        $cate = get_category(2);
        $cate = Category::toLevel($cate);
        //$cate = get_category_access(Category::getLevelOfModel($cate, $actionName), 'edit');
        $vo = M($actionName)->find($id);

        $pictureurls = array();
        if (!empty($vo['pictureurls'])) {
            $temparr = explode('|||', $vo['pictureurls']);
            foreach ($temparr as $key => $v) {
                $temparr2      = explode('$$$', $v);
                $pictureurls[] = array('url' => '' . $temparr2[0], 'alt' => '' . $temparr2[1]);
            }
        }

        $vo['pictureurls'] = $pictureurls;
        $vo['content']     = htmlspecialchars($vo['content']);

        $this->assign('pid', $pid);
        $this->assign('cate', $cate);
        $this->assign('vo', $vo);
        $this->assign('flagtypelist', get_item('flagtype')); //文档属性
        $this->display();
    }
	
	public function addPost(){

        $data                = I('post.');
		$id = I('id', 0, 'intval');
		$data['id'] = 0;
        $data['cid']         = I('cid', 0, 'intval');
        $data['title']       = I('title', '', 'htmlspecialchars,rtrim');
        $data['shorttitle']  = I('shorttitle', '', 'htmlspecialchars,rtrim');
        $data['keywords']    = trim($data['keywords']);
        $data['content']     = I('content', '', '');
        $data['publishtime'] = I('publishtime', time(), 'strtotime');
        $data['updatetime']  = time();
        $data['click']       = 0;
        //$data['status']      = 0;
        $data['aid']         = session(C('USER_AUTH_KEY'));
		
		if(!$data['author']){
			$data['author'] = '管理员';
		}
		
		//给图片自动添加alt和title
		$data['content'] = imgalt($data['title'],$data['content']);
		
		$cid = $data['cid'];
		$actionName = D('CategoryView')->where("category.id=$cid")->getField('tablename');
		$data['tag']    = I('tag', '', 'htmlspecialchars,trim');
		if($data['tag']){
			$tags = explode(',',$data['tag']);
			if(count($tags) > 5){
				$this->error('最多5个标签，用空格分隔！');
			}
			if(count($tags) > 0){
				foreach($tags as $k=>$val){
					$mp['tag_name'] = $val;
					//$mp['tablename'] = $actionName;
					$rs = M('tag')->where($mp)->find();
					if(!$rs){
						$r['tag_name'] = $val;
						$r['typeid'] = $data['cid'];
						$r['tag_sort'] = 1;
						$r['tag_status'] = 1;
						$r['posttime'] = time();
						$r['tag_click'] = 1;
						$r['tablename'] = $actionName;
						M('tag')->add($r);
					}else{
						$r['tag_click'] = $rs['tag_click']+1;
						$r['tablename'] = $actionName;
						M('tag')->where($mp)->save($r);
						//M('tag')->where($mp)->setInc('tag_click');
					}
				}
			}
		}

        //$pid   = intval($data['pid']);
        $flags = I('flags', array(), 'intval');

        if (empty($data['title'])) {
            $this->error('图片名称不能为空');
        }
        if (!$data['cid']) {
            $this->error('请选择栏目');
        }
        $pid = $data['cid']; //转到自己的栏目
		$pic = $data['litpic'];

        if (empty($data['description'])) {
            $data['description'] = str2sub(strip_tags($data['content']), 120);
        }

        //获取属于分类信息,得到modelid
        $selfCate = Category::getSelf(get_category(0), $data['cid']); //当前栏目信息
        $modelid  = $selfCate['modelid'];

        $pictureurls_arr = array();

        $imgPostUrls = isset($data['pictureurls']) ? $data['pictureurls'] : '';
        if (is_array($imgPostUrls)) {
            foreach ($imgPostUrls as $k => $v) {
                //$pictureurls_arr[] = $v . '$$$' . '$$$';
				$picarry = explode('$$$',$v);
				if(!$picarry[1]){
					$pictureurls_arr[] = $picarry[0].'$$$'.$data['title'].'('.$k.')';
				}else{
					$pictureurls_arr[] = $v;
				}
                //缩略图
				if(!$data['litpic']){
                	if ($k == 0) {
						$imgtbSize = explode(',', C('CFG_IMGTHUMB_SIZE')); //配置缩略图第一个参数
						$imgTSize  = explode('X', $imgtbSize[0]);
						
						//$picarry = explode('$$$',$v);
						if (!empty($imgTSize)) {
							$pic = get_picture($picarry[0], $imgTSize[0], $imgTSize[1]);
						} else {
							$pic = $picarry[0];
						}
					}
				}
            }
        }
        $pictureurls    = $data['pictureurls']    = join('|||', $pictureurls_arr);
        $data['litpic'] = isset($pic) ? $pic : '';

        //图片标志
        if (!empty($data['litpic']) && !in_array(B_PIC, $flags)) {
            $flags[] = B_PIC;
        }

        $data['flag'] = 0;
        foreach ($flags as $v) {
            $data['flag'] += $v;
        }

        if (M($actionName)->add($data)) {
            //更新图片集

            $attid_arr = get_att_content($data['content']); //内容中的图片
            $attid_arr = array_merge($attid_arr, get_att_attachment($imgPostUrls)); //图片数组
            insert_att_index($attid_arr, $id, $modelid); //attachmentindex入库

            //更新静态缓存
            del_cache_html('List/index_' . $data['cid'], false, 'list:index');
            del_cache_html('Index_index', false, 'index:index');
			
			M('temp')->where("id=$id")->delete();
			
            $this->success('发布成功', U('Temp/index'));
        } else {
            $this->error('发布失败');
        }
    }
	
	public function addlist(){
		$idArr = I('key', 0, 'intval');
        //$pid   = I('get.pid', 0, 'intval');
        if (!is_array($idArr)) {
            $this->error('请选择要入库的项');
        }
		$cid = I('cid', 0, 'intval');
		/*if ($cid == 0) {
            $this->error('请选择栏目');
        }*/
        $where = array('id' => array('in', $idArr));
		$list = M('temp')->where($where)->select();
		if($list){
			foreach($list as $vo){
				$data = $vo;
				if (empty($vo['title'])) {
					$this->error('标题不能为空');
				}
				$data['id'] = 0;
				$data['cid'] = $cid ? $cid : $vo['cid'];
				$cid = $data['cid'];
				$id = $vo['id'];
				$actionName = D('CategoryView')->where("category.id=$cid")->getField('tablename');
				/*dump($data);
				exit;*/
				if (M($actionName)->add($data)) {
					//更新静态缓存
					del_cache_html('List/index_' . $data['cid'], false, 'list:index');
					del_cache_html('Index_index', false, 'index:index');
					
					M('temp')->where("id=$id")->delete();
				} else {
					$this->error('入库失败');
				}
			}
			$this->success('批量入库成功', U('Temp/index'));
		}else{
			$this->error('内容不存在');
		}
    }

    //修改文章处理
    public function editPost(){

        $data                = I('post.');
        $id                  = $data['id']                  = I('id', 0, 'intval');
        $data['cid']         = I('cid', 0, 'intval');
        $data['title']       = I('title', '', 'htmlspecialchars,rtrim');
        $data['shorttitle']  = I('shorttitle', '', 'htmlspecialchars,rtrim');
        $data['keywords']    = trim($data['keywords']);
        $data['content']     = I('content', '', '');
        $data['publishtime'] = I('publishtime', time(), 'strtotime');
        $data['updatetime']  = time();
		
		if(!$data['author']){
			$data['author'] = '管理员';
		}
		
		//给图片自动添加alt和title
		$data['content'] = imgalt($data['title'],$data['content']);
		
		$cid = $data['cid'];
		$actionName = D('CategoryView')->where("category.id=$cid")->getField('tablename');
		$data['tag']    = I('tag', '', 'htmlspecialchars,trim');
		if($data['tag']){
			$tags = explode(',',$data['tag']);
			if(count($tags) > 5){
				$this->error('最多5个标签，用空格分隔！');
			}
			if(count($tags) > 0){
				foreach($tags as $k=>$val){
					$mp['tag_name'] = $val;
					//$mp['tablename'] = $actionName;
					$rs = M('tag')->where($mp)->find();
					if(!$rs){
						$r['tag_name'] = $val;
						$r['typeid'] = $data['cid'];
						$r['tag_sort'] = 1;
						$r['tag_status'] = 1;
						$r['posttime'] = time();
						$r['tag_click'] = 1;
						$r['tablename'] = $actionName;
						M('tag')->add($r);
					}else{
						$r['tag_click'] = $rs['tag_click']+1;
						$r['tablename'] = $actionName;
						M('tag')->where($mp)->save($r);
						//M('tag')->where($mp)->setInc('tag_click');
					}
				}
			}
		}

        //$pid   = I('pid', 0, 'intval');
        $flags = I('flags', array(), 'intval');

        if (empty($data['title'])) {
            $this->error('图片名称不能为空');
        }
        if (!$data['cid']) {
            $this->error('请选择栏目');
        }

        $pid = $data['cid']; //转到自己的栏目
		$pic = $data['litpic'];

        if (empty($data['description'])) {
            $data['description'] = str2sub(strip_tags($data['content']), 120);
        }

        //获取属于分类信息,得到modelid
        $selfCate = Category::getSelf(get_category(0), $data['cid']); //当前栏目信息
        $modelid  = $selfCate['modelid'];

        $pictureurls_arr = array();
        $imgPostUrls     = isset($data['pictureurls']) ? $data['pictureurls'] : '';
        if (is_array($imgPostUrls)) {
            foreach ($imgPostUrls as $k => $v) {
                //$pictureurls_arr[] = $v . '$$$' . '$$$'; //array('url'=> $v ,'alt'=> '');
				$picarry = explode('$$$',$v);
				if(!$picarry[1]){
					$pictureurls_arr[] = $picarry[0].'$$$'.$data['title'].'('.$k.')';
				}else{
					$pictureurls_arr[] = $v;
				}
				if(!$data['litpic']){
					if ($k == 0) {
						$imgtbSize = explode(',', C('CFG_IMGTHUMB_SIZE')); //配置缩略图第一个参数
						$imgTSize  = explode('X', $imgtbSize[0]);
						//$picarry = explode('$$$',$v);
						if (!empty($imgTSize)) {
							$pic = get_picture($picarry[0], $imgTSize[0], $imgTSize[1]);
						} else {
							$pic = $picarry[0];
						}
					}
				}
            }
        }

        $data['pictureurls'] = join('|||', $pictureurls_arr);
        $data['litpic'] = isset($pic) ? $pic : '';

        //图片标志
        if (!empty($data['litpic']) && !in_array(B_PIC, $flags)) {
            $flags[] = B_PIC;
        }
        $data['flag'] = 0;
        foreach ($flags as $v) {
            $data['flag'] += $v;
        }

        if (false !== M('temp')->save($data)) {
            //del
            M('attachmentindex')->where(array('arcid' => $id, 'modelid' => $modelid))->delete();

            $attid_arr = get_att_content($data['content']); //内容中的图片
            $attid_arr = array_merge($attid_arr, get_att_attachment($imgPostUrls)); //图片数组
            insert_att_index($attid_arr, $id, $modelid); //attachmentindex入库

            //更新静态缓存
            del_cache_html('List/index_' . $data['cid'] . '_', false, 'list:index');
            del_cache_html('List/index_' . $selfCate['ename'], false, 'list:index'); //还有只有名称
            del_cache_html('Show/index_*_' . $id, false, 'show:index'); //不太精确，会删除其他模块同id文档

            $this->success('修改成功', U('Temp/index'));
        } else {

            $this->error('修改失败');
        }

    }

    //彻底删除
    public function clear(){
        $id        = I('id', 0, 'intval');
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $this->clearBatch();
            return;
        }
        //$pid     = I('get.pid', 0, 'intval');
        //$modelid = D2('ArcView', 'temp')->where(array('id' => $id))->getField('modelid');

        if (M('temp')->delete($id)) {
            $this->success('彻底删除成功', U('Temp/index'));
        } else {
            $this->error('彻底删除失败');
        }
    }

    //批量彻底删除
    public function clearBatch()
    {

        $idArr = I('key', 0, 'intval');
        //$pid   = I('get.pid', 0, 'intval');
        if (!is_array($idArr)) {
            $this->error('请选择要彻底删除的项');
        }
        $where   = array('id' => array('in', $idArr));
        //$modelid = D2('ArcView', 'temp')->where(array('id' => $idArr[0]))->getField('modelid'); //for delete temp index,use

        if (M('temp')->where($where)->delete()) {
            // delete temp index
            /*if ($modelid) {
                M('attachmentindex')->where(array('arcid' => array('in', $idArr), 'modelid' => $modelid))->delete();
            }*/
            $this->success('彻底删除成功', U('Temp/index'));
        } else {
            $this->error('彻底删除失败');
        }
    }

}
