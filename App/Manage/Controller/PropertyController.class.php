<?php

namespace Manage\Controller;

class PropertyController extends CommonController
{

    public function index()
    {
        $keyword = I('keyword', '', 'htmlspecialchars,trim'); //关键字

        $where = array();
        if (!empty($keyword)) {
            $where['name'] = array('LIKE', "%{$keyword}%");
        }

        $count = M('property')->where($where)->count();

        $page           = new \Common\Lib\Page($count, 10);
        $page->rollPage = 7;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $list  = M('property')->where($where)->order('id DESC')->limit($limit)->select();

        $this->assign('page', $page->show());
        $this->assign('vlist', $list);
        $this->assign('type', '属性列表');
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
        $data['name']    = trim($data['name']);
		$data['listorder']    = I('listorder', 0, 'intval');
        if (empty($data['name'])) {
            $this->error('属性名称不能为空');
        }
        $data['addtime'] = time();

        if ($id = M('property')->add($data)) {
            $this->success('添加成功', U('Property/index'));
        } else {
            $this->error('添加失败');
        }
    }

    //编辑属性
    public function edit()
    {
        //当前控制器名称
        $id         = I('id', 0, 'intval');
        $actionName = strtolower(CONTROLLER_NAME);
        if (IS_POST) {
            $this->editPost();
            exit();
        }
        $vo = M($actionName)->find($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    //修改文章处理
    public function editPost()
    {

        $data         = I('post.');
        $data['name'] = trim($data['name']);
        $id = $data['id'] = I('id', 0, 'intval');
        if (empty($data['name'])) {
            $this->error('属性不能为空');
        }

        if (false !== M('property')->save($_POST)) {
            $this->success('修改成功', U('Property/index'));
        } else {

            $this->error('修改失败');
        }

    }

    //彻底删除
    public function del()
    {

        $id        = I('id', 0, 'intval');
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $this->delBatch();
            return;
        }
		
		$map['prop_id'] = $id;
		M('PropertyValue')->where($map)->delete();
		
        if (M('property')->delete($id)) {
            $this->success('彻底删除成功', U('Property/index'));
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
        $where = array('id' => array('in', $idArr));
		
		foreach($idArr as $id){
			$map['prop_id'] = $id;
			M('PropertyValue')->where($map)->delete();
		}

        if (M('property')->where($where)->delete()) {
            $this->success('彻底删除成功', U('Property/index'));
        } else {
            $this->error('彻底删除失败');
        }
    }

}
