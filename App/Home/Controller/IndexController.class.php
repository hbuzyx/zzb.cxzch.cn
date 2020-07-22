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
}
