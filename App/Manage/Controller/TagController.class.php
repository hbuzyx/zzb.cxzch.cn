<?php

namespace Manage\Controller;

class TagController extends CommonController
{

    public function index()
    {
        $keyword = I('keyword', '', 'htmlspecialchars,trim'); //关键字

        $where = array();
        if (!empty($keyword)) {
            $where['tag_name'] = array('LIKE', "%{$keyword}%");
        }

        $count = M('tag')->where($where)->count();

        $page           = new \Common\Lib\Page($count, 10);
        $page->rollPage = 7;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $list  = M('tag')->where($where)->order('tag_id DESC')->limit($limit)->select();

        $this->assign('page', $page->show());
        $this->assign('vlist', $list);
        $this->assign('type', '标签列表');
        $this->assign('keyword', $keyword);
        $this->display();
    }
    //添加
    public function add()
    {
        //当前控制器名称
        $actionName = strtolower(CONTROLLER_NAME);
        if (IS_POST) {
            $this->addPost();
            exit();
        }
        $this->display();
    }

    //
    public function addPost()
    {
        $data            = I('post.', '');
        $data['tag_name']    = trim($data['tag_name']);
        $data['tag_sort']    = I('tag_sort', 0, 'intval');
        if (empty($data['tag_name'])) {
            $this->error('标签名称不能为空');
        }
        $data['posttime'] = time();

        if ($id = M('tag')->add($data)) {
            $this->success('添加成功', U('Tag/index'));
        } else {
            $this->error('添加失败');
        }
    }

    //编辑标签
    public function edit()
    {
        //当前控制器名称
        $tag_id         = I('tag_id', 0, 'intval');
        $actionName = strtolower(CONTROLLER_NAME);
        if (IS_POST) {
            $this->editPost();
            exit();
        }
        $vo = M($actionName)->find($tag_id);
        $this->assign('vo', $vo);
        $this->display();
    }

    //修改文章处理
    public function editPost()
    {

        $data         = I('post.');
        $data['tag_name'] = trim($data['tag_name']);
        $tag_id = $data['tag_id'] = I('tag_id', 0, 'intval');
        if (empty($data['tag_name'])) {
            $this->error('标签不能为空');
        }

        if (false !== M('tag')->save($_POST)) {
            $this->success('修改成功', U('Tag/index'));
        } else {

            $this->error('修改失败');
        }

    }

    //彻底删除文章
    public function del()
    {

        $tag_id        = I('tag_id', 0, 'intval');
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $this->delBatch();
            return;
        }

        if (M('tag')->delete($tag_id)) {
            $this->success('彻底删除成功', U('Tag/index'));
        } else {
            $this->error('彻底删除失败');
        }
    }

    //批量彻底删除
    public function delBatch()
    {

        $idArr = I('key', 0, 'intval');
        if (!is_array($idArr)) {
            $this->error('请选择要彻底删除的项');
        }
        $where = array('tag_id' => array('in', $idArr));

        if (M('tag')->where($where)->delete()) {
            $this->success('彻底删除成功', U('Tag/index'));
        } else {
            $this->error('彻底删除失败');
        }
    }

}
