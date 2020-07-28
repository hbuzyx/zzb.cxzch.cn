<?php

namespace Home\Controller;

use Common\Lib\Category;

class IndexController extends HomeCommonController
{

    //方法：index
    public function index()
    {
        go_mobile();
        $this->assign('title', C('CFG_WEBNAME'));
        $map['tag_status'] = 1;
        $tags = M('tag')->where($map)->order('tag_click DESC')->limit(15)->select();
        $ar=M('article')->order("id desc")->find();
        $where['id']= $ar['cid'];
        $cat= M('category')->where($where)->order("sort asc,id desc")->find();


        $cat['contet']= mb_substr(strip_tags($ar['content']), 0, 150);
        //时政要闻
        $shizhengyaowen = M('article')->where('cid=53')->order("id desc")->find();

        $this->assign('shizhengyaowen', $shizhengyaowen);
        $this->assign('ar', $ar);
        $this->assign('cat', $cat);
        $this->assign('tags', $tags);
        // $this->display();
        $this->display();
    }

    public function search()
    {
//        go_mobile();
        $this->assign('title', C('CFG_WEBNAME'));
        // $this->display();
        $this->display();
    }

    public function search_post()
    {
        $keyword = I('keyword','','htmlspecialchars');
        if($keyword){
            $map['title'] =  array('LIKE', "%{$keyword}%");
        }else{
            $map = "1=1";
        }
//        $list = M('article')->where($map)->order('publishtime DESC')->select();
        $proModel = M('article');
        $count      = $proModel->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,5);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性

        $list = $proModel->where($map)->order('publishtime desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('page',$show);// 赋值分页输出
        $this->assign('count',$count);
//        $this->ajaxReturn(['status'=>1,'msg'=>'成功','data'=>$tags],json);
        $this->assign('title', C('CFG_WEBNAME'));
        $this->assign('list', $list);
        $this->display('search_list');
    }

    public function detail()
    {
        $id = I('id','','htmlspecialchars');
        $list = M('article')->where('id='.$id)->find();
//        $this->ajaxReturn(['status'=>1,'msg'=>'成功','data'=>$tags],json);
        $this->assign('title', C('CFG_WEBNAME'));
        $this->assign('list', $list);
        $this->display('search_detail');
    }
}
