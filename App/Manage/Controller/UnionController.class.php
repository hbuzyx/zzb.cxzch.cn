<?php

namespace Manage\Controller;

use Think\Controller;

class UnionController extends CommonController
{

    public function index()
    {
        $keyword = I('keyword', '', 'htmlspecialchars,trim'); //关键字

        $where = array();
        if (!empty($keyword)) {
            $where['name'] = array('LIKE', "%{$keyword}%");
        }

        $count          = M('union')->where($where)->count();
        $page           = new \Common\Lib\Page($count, 10);
        $page->rollPage = 7;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $list  = M('union')->where($where)->order('id desc')->limit($limit)->select();

        $this->assign('keyword', $keyword);
        $this->assign('page', $page->show());
        $this->assign('vlist', $list);
        $this->assign('type', '广告列表');
        $this->display();
    }
    //添加
    public function add()
    {
        //当前控制器名称
        $actionName = strtolower(CONTROLLER_NAME);
        if (IS_POST) {
            $data            = I('post.', '');
            $data['name']    = trim($data['name']);
			$data['publishtime'] = time();
			$data['code'] = I('post.code','','stripslashes');

            if (empty($data['name'])) {
                $this->error('广告名称必须填写！');
            }

            $ad = M('union')->where(array('name' => $data['name']))->find();
            if ($ad) {
                $this->error('广告位名称已经存在！');
            }

            if ($id = M('union')->add($data)) {
                $this->success('添加成功', U('Union/index'));
            } else {
                $this->error('添加失败');
            }
            exit();
        }
        $this->display();
    }

    //编辑文章
    public function edit()
    {
        //当前控制器名称
        $id         = I('id', 0, 'intval');
        $actionName = strtolower(CONTROLLER_NAME);
        if (IS_POST) {
            $data            = I('post.', '');
            $data['id']      = intval($data['id']);
			$data['code'] = I('post.code','','stripslashes');

            $data['name'] = trim($data['name']);
            if (empty($data['name'])) {
                $this->error('广告位名称必须填写！');
            }

            if (M('union')->where(array('name' => $data['name'], 'id' => array('neq', $id)))->find()) {
                $this->error('广告位名称已经存在！');
            }

            if (false !== M('union')->save($data)) {
                $this->success('修改成功', U('Union/index'));
            } else {

                $this->error('修改失败');
            }
            exit();
        }
        $vo = M($actionName)->find($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    //删除
    public function del()
    {

        $id    = I('id', 0, 'intval');
        $Model = M();

        if (M('union')->delete($id)) {
            $this->success('彻底删除成功', U('Union/index'));
        } else {
            $this->error('彻底删除失败');
        }
    }

    //获取广告代码
    public function getcode()
    {
        $id = I('id', 0, 'intval');
        if (empty($id)) {
            $this->error('参数错误！');
        }

        $this->assign('id', $id);
        $this->display();
    }

}
