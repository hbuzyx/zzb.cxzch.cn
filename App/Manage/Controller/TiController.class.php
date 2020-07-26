<?php

namespace Manage\Controller;

use Common\Lib\Category;

class TiController extends CommonContentController
{

    public function index()
    {
        $pid     = I('pid', 0, 'intval'); //类别ID
        $keyword = I('keyword', '', 'htmlspecialchars,trim'); //关键字
        //所有子栏目列表
        //$cate = D('CategoryView')->nofield('content')->order('category.sort,category.id')->select();
        $cate = get_category();
        //$subcate = Category::clearCate(Category::getChilds($cate, $pid),'type');//所以子类/子子类
        $subcate = Category::toLayer(Category::clearCate(Category::getChilds($cate, $pid), 'type'), 'child', $pid); //子类,多维
        $poscate = Category::getParents($cate, $pid);
        $this->assign('subcate', $subcate);
        $this->assign('poscate', $poscate);

        if (!empty($keyword)) {
            $where['name'] = array('LIKE', "%{$keyword}%");
        }

        //import('Class.Page', APP_PATH.'Lib/');
        $count = M('ti')->where($where)->count();

        $page           = new \Common\Lib\Page($count, 10);
        $page->rollPage = 7;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $art   =  M('ti')->where($where)->order('id desc')->limit($limit)->select();

        $this->assign('pid', $pid);
        $this->assign('keyword', $keyword);
        $this->assign('page', $page->show());
        $this->assign('vlist', $art);
        $this->assign('type', '试题列表');

        $this->display();
    }
    //添加文章
    public function add()
    {

        //当前控制器名称
        $actionName = strtolower(CONTROLLER_NAME);
        $pid        = I('pid', 0, 'intval');

        if (IS_POST) {
            $this->addPost();
            exit();
        }

        $cate = get_category(2);
        $cate = get_category_access(Category::getLevelOfModel(Category::toLevel($cate), $actionName), 'add');
        $this->assign('pid', $pid);
        $this->assign('flagtypelist', get_item('flagtype')); //文档属性
        $this->assign('cate', $cate);
        $this->display();
    }

    //
    public function addPost()
    {

//        $data                = I('post.');
        $cid       = I('cid', 0, 'intval');
        $data['name']       = I('name', '', 'htmlspecialchars,rtrim');
        $data['anwser']       = I('anwser', '', 'htmlspecialchars,rtrim');
        $data['item']  = I('item/a', '', 'htmlspecialchars,rtrim');
        $data['fenxi']     = I('fenxi', '', 'htmlspecialchars,rtrim');
        $data['type']  = I('type', 1, 'intval');
        $remp = [];
        $arr = ["A","B","C","D"];
        foreach ($data['item'] as $key => $v) {
            if($v) $remp = array_merge($remp,[$arr[$key]=>$v]);
        }
        $data['item'] = json_encode($remp);

        if (empty($data['name'])) {
            $this->error('题目不能为空');
        }
        if (!$cid) {
            $this->error('请选择栏目');
        }


        if ($id = M('ti')->add($data)) {
            $this->success('添加试题成功', U('Ti/index', array('pid' => $cid)));
        } else {
            $this->error('添加试题失败');
        }
    }

    //编辑文章
    public function edit()
    {
        //当前控制器名称
        $id         = I('id', 0, 'intval');
        $actionName = strtolower(CONTROLLER_NAME);
        $pid        = I('pid', 0, 'intval');

        if (IS_POST) {
            $this->editPost();
            exit();
        }

        //'type' => 0
        $cate = get_category(2);
        $cate = get_category_access(Category::getLevelOfModel(Category::toLevel($cate), $actionName), 'edit');

        $vo            =  M('ti')->find($id);
        $vo['item'] = json_decode($vo['item'],true);
//        dump($vo);die;
        $this->assign('pid', $pid);
        $this->assign('cate', $cate);
        $this->assign('vo', $vo);
        $this->assign('xuanxiang', ["A","B","C","D"]); //文档属性
        $this->display();
    }

    //修改文章处理
    public function editPost()
    {
        $cid       = I('cid', 0, 'intval');
        $id       = I('id', 0, 'intval');
        $data['name']       = I('name', '', 'htmlspecialchars,rtrim');
        $data['anwser']       = I('anwser', '', 'htmlspecialchars,rtrim');
        $data['item']  = I('item/a', '', 'htmlspecialchars,rtrim');
        $data['fenxi']     = I('fenxi', '', 'htmlspecialchars,rtrim');
        $data['type']  = I('type', 1, 'intval');
        $data['status']  = I('status', 0, 'intval');
        $remp = [];
        $arr = ["A","B","C","D"];
        foreach ($data['item'] as $key => $v) {
            if($v) $remp = array_merge($remp,[$arr[$key]=>$v]);
        }
        $data['item'] = json_encode($remp);

        if (empty($data['name'])) {
            $this->error('题目不能为空');
        }
        if (!$cid) {
            $this->error('请选择栏目');
        }


        if ($id = M('ti')->where('id='.$id)->save($data)) {
            $this->success('修改成功', U('ti/index', array('pid' => $data['cid'])));
        } else {

            $this->error('修改失败');
        }


    }

    //移动
    public function move()
    {
        //当前控制器名称
        $id         = I('key', 0);
        $actionName = strtolower(CONTROLLER_NAME);
        $pid        = I('pid', 0, 'intval');

        if (IS_POST) {
            $id  = I('id', 0);
            $cid = I('cid', 0, 'intval');
            if (empty($id)) {
                $this->error('请选择要移动的文档');
            }

            if (!$cid) {
                $this->error('请选择栏目');
            }

            if (false !== M($actionName)->where(array('id' => array('in', $id)))->setField('cid', $cid)) {
                $this->success('移动成功', U('Article/index', array('pid' => $pid)));
            } else {
                $this->error('移动失败');
            }
            exit();
        }

        if (empty($id)) {
            $this->error('请选择要移动的文档');
        }

        $cate = get_category(2);
        $cate = get_category_access(Category::getLevelOfModel(Category::toLevel($cate), $actionName), 'move');

        $this->assign('id', $id);
        $this->assign('pid', $pid);
        $this->assign('cate', $cate);
        $this->assign('type', '移动文档');
        $this->display();
    }

    //回收站文章列表
    public function trach()
    {

        $where = array('article.status' => 0);
        $count = D2('ArcView', 'article')->where($where)->count();

        $page           = new \Common\Lib\Page($count, 10);
        $page->rollPage = 7;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $art   = D2('ArcView', 'article')->nofield('content')->where($where)->limit($limit)->select();

        $pid = I('pid', 0, 'intval');

        $this->assign('pid', $pid);
        $this->assign('page', $page->show());
        $this->assign('vlist', $art);
        $this->assign('type', '文章回收站');
        $this->assign('subcate', '');
        $this->display('index');
    }

    //删除文章到回收站
    public function del()
    {

        $id        = I('id', 0, 'intval');
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $this->delBatch();
            return;
        }

        $pid = I('pid', 0, 'intval'); //单纯的GET没问题
        if (false !== M('ti')->where(array('id' => $id))->setField('status', 0)) {

            del_cache_html('Show/index_*_' . $id . '.', false, 'show:index');
            $this->success('删除成功', U('ti/index', array('pid' => $pid)));

        } else {
            $this->error('删除失败');
        }
    }

    //批量删除到回收站
    public function delBatch()
    {

        $idArr = I('key', 0, 'intval');
        $pid   = I('get.pid', 0, 'intval');

        if (!is_array($idArr)) {
            $this->error('请选择要删除的项');
        }

        if (false !== M('ti')->where(array('id' => array('in', $idArr)))->setField('status', 0)) {

            //更新静态缓存
            foreach ($idArr as $v) {
                del_cache_html('Show/index_*_' . $v . '.', false, 'show:index');
            }
            //. M('article')->getlastsql();
            $this->success('批量删除成功', U('ti/index', array('pid' => $pid)));

        } else {
            $this->error('批量删除文失败');
        }
    }

    //还原文章
    public function restore()
    {

        $id        = I('id', 0, 'intval');
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $this->restoreBatch();
            return;
        }

        $pid = I('get.pid', 0, 'intval');

        if (false !== M('article')->where(array('id' => $id))->setField('status', 1)) {

            $this->success('还原成功', U('Article/trach', array('pid' => $pid)));

        } else {
            $this->error('还原失败');
        }
    }

    //批量还原文章
    public function restoreBatch()
    {

        $idArr = I('key', 0, 'intval');
        $pid   = I('get.pid', 0, 'intval');
        if (!is_array($idArr)) {
            $this->error('请选择要还原的项');
        }

        if (false !== M('article')->where(array('id' => array('in', $idArr)))->setField('status', 1)) {

            $this->success('还原成功', U('Article/trach', array('pid' => $pid)));

        } else {
            $this->error('还原失败');
        }
    }

    //彻底删除文章
    public function clear()
    {

        $id        = I('id', 0, 'intval');
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $this->clearBatch();
            return;
        }

        $pid     = I('get.pid', 0, 'intval');
        $modelid = D2('ArcView', 'article')->where(array('id' => $id))->getField('modelid');

        if (M('article')->delete($id)) {
            // delete picture index
            if ($modelid) {
                M('attachmentindex')->where(array('arcid' => $id, 'modelid' => $modelid))->delete(); //test
            }
            $this->success('彻底删除成功', U('Article/trach', array('pid' => $pid)));
        } else {
            $this->error('彻底删除失败');
        }
    }

    //批量彻底删除文章
    public function clearBatch()
    {

        $idArr = I('key', 0, 'intval');
        $pid   = I('get.pid', 0, 'intval');
        if (!is_array($idArr)) {
            $this->error('请选择要彻底删除的项');
        }
        $where   = array('id' => array('in', $idArr));
        $modelid = D2('ArcView', 'article')->where(array('id' => $idArr[0]))->getField('modelid'); //

        if (M('article')->where($where)->delete()) {
            // delete picture index
            if ($modelid) {
                M('attachmentindex')->where(array('arcid' => array('in', $idArr), 'modelid' => $modelid))->delete();
            }
            $this->success('彻底删除成功', U('Article/trach', array('pid' => $pid)));
        } else {
            $this->error('彻底删除失败');
        }
    }

}
