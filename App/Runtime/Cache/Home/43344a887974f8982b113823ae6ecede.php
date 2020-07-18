<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0035)http://j.hbxuwe.cn/a/jianzhujienen/ -->
<html class="js cssanimations"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="order by dede58.com/">
  <title><?php echo ($title); ?> - 紫塞先锋</title>
    <meta name="keywords" content="<?php echo ($keywords); ?>" />
    <meta name="description" content="<?php echo ($description); ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/Public/Home/sucai/list/amazeui.min.css">
<link rel="stylesheet" href="/Public/Home/sucai/list/app.css">
<link rel="stylesheet" href="/Public/Home/sucai/list/index.css">
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/Public/Home/sucai/zzb/jquery.min.js"></script>
<!--<![endif]-->
<script src="/Public/Home/sucai/zzb/amazeui.min.js"></script>
<link rel="stylesheet" href="/Public/Home/sucai/list/index.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a
        href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]--> 
<!-- 代码区 --> 
    <!--<div id="site_nav">
            <div  class="sn_container clearfix">
                <ul class="tg_tools fr">
                    <li class="no-hover" style="display: none">
                        <a id="msg_notify" class="msg_notify" href="<?php echo U('Member/message');?>"></a>
                    </li>
                    <li class="box_color nav_home hide haslogin">
                        <span><a href="<?php echo U('Member/index');?>">个人中心</a></span><b class="icon"></b>
                        <ul>
                            <li><a href="<?php echo U('Member/index');?>"><span>我的主页</span></a></li>
                            <li><a href="<?php echo U('Member/person');?>"><span>个人设置</span></a></li>
                            <li><a href="<?php echo U('Member/index');?>"><span>我的签到</span></a></li>
                            <li><a href="<?php echo U('Public/logout');?>"><span>退出登录</span></a></li>
                        </ul>
                    </li>
                    <li class="tg-line"></li>
                    <li class="box_color">
                        <span>帮助中心</span><b class="icon"></b>
                        <ul>
                        	<?php
 $_typeid = intval(1); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li><a href="<?php echo ($catlist["url"]); ?>"><span><?php echo ($catlist["name"]); ?></span></a></li><?php endforeach;?>
                        </ul>
                    </li>
                    <li class="tg-line"></li>
                    <li class="box_color">
                        <span><a href="<?php echo U('Tag/lists');?>">标签库</a></span>
                    </li>
                </ul>
                <ul class="tg_tools fl" id="login_area" style="display: block;">
                    <li class="tg_tools_home no-hover"><i class="icon-more"></i><span><a href="http://zzb.cxzch.cn/">小楠首页</a></span></li>
                    <li class="no-hover hide haslogin"><span><a href="<?php echo U('Member/index');?>"><font class="sn_login username" id="head_username"></font></a></span></li>
                    <li class="tg-line icon"></li>
                    <li class="no-hover hide haslogin"><span><a href="<?php echo U('Public/logout');?>">退出</a></span></li>

                    <li class="no-hover nologin"><span><a href="<?php echo U('Public/register');?>">注册</a></span></li>
                    <li class="tg-line icon"></li>
                    <li class="box_color nav_home" id="nav_login"><span><a href="<?php echo U('Public/login');?>" class="sn_login">登录</a></span></li>
                </ul>
            </div>
        </div>
<div id="header">
    <div class="tg_tools_home">
        <div class="bbs_enter">
           <a class="bbs-banner"  href="Member/pay.html" target="_blank"><img src="/Public/Home/sucai/images/other/banner.jpg" alt="充值"></a>
        </div>
        <div class="logo">
            <a class="logo-bd" href="http://zzb.cxzch.cn/"><img src="/Public/Home/sucai/images/logo.png" alt="紫塞先锋logo"></a>
        </div>
        <form action="/index.php?s=/Search-index.html" method="get" id="form_search" onsubmit="return searchSub()">
            <div id="search">
                <div class="search_area">
                    <input type="submit" value="搜 索" class="btn_search">
                    <div class="search_select">
                        <span class="icon-search"></span>
                    </div>
                    <input type="text" value='请输入搜索内容'  class="search_input"  autocomplete="off" id="search_input" data-default="请输入搜索内容" onblur="checkInputBlur($(this))" onfocus="checkInputFocus($(this))" />
                    <input type="hidden" name="modelid" value="5" />
                    <input type="hidden" name="keyword" />
                </div>
                <div class="search_box hide" id="search_box"></div>
                <div class="search_keywords" >
                    <span>热门搜索：</span>
                    <?php if(is_array($searchkey)): $i = 0; $__LIST__ = $searchkey;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a href="<?php echo U('Search/index');?>?modelid=5&keyword=<?php echo ($vo["keyword"]); ?>"><?php echo ($vo["keyword"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="nav" class="nav">
    <div class='nav_main clearfix'>
        <a href="http://zzb.cxzch.cn/" title="紫塞先锋" class="menu <?php if($cid == ''): ?>current<?php endif; ?>" >首 页</a>
        <?php
 $_typeid = 0; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $_navlist = get_category(1); if($_typeid == 0) { $_navlist = Common\Lib\Category::toLayer($_navlist); }else { $_navlist = Common\Lib\Category::toLayer($_navlist, 'child', $_typeid); } foreach($_navlist as $autoindex => $navlist): $navlist['url'] = get_url($navlist); ?><a href="<?php echo ($navlist["url"]); ?>" title="<?php echo ($navlist["name"]); ?>" class="menu <?php if($cid == $navlist['id'] or $pid == $navlist['id']): ?>current<?php endif; ?>" ><?php echo ($navlist["name"]); ?></a><?php endforeach;?>
        <span class="icon_hot"></span>
    </div>
</div>-->
<div class="head" style="position:relative">
  <div class="wap_logo">
    <a href="http://j.hbxuwe.cn/"><img src="/Public/Home/sucai/zzb/logo.png"/></a>
  </div>
  <div class="banner">
    <!-- <div class="banner_top"></div> -->
    <div
      data-am-widget="slider"
      class="am-slider am-slider-a2 am-no-layout"
      data-am-slider='{"directionNav":false,"slideshowSpeed": 5000,"animationSpeed": 1000,"animation": "fade","slideshow:":false}'
    >
<!--
      data-am-slider='{"slideshow:":false}'
    >
-->
      <ul class="am-slides">
        <li
          class="am-active-slide"
          data-thumb-alt=""
          style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;"
        >
          <div
            class="ddsgg"
            style="background: url(/uploads/img1/banner1.png);background-size: 100% 100%;"
          ></div>
        </li>
        <li
          class="am-active-slide"
          data-thumb-alt=""
          style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 2;"
        >
          <div
            class="ddsgg"
            style="background: url(/uploads/img1/banner2.png);background-size: 100% 100%;"
          ></div>
        </li>



</ul>
      <ol class="am-control-nav am-control-paging">
        <li><a href="http://j.hbxuwe.cn/#" class="">1</a><i></i></li>
      </ol>
<div style="background: url(/uploads/img1/tc.png);width: 100%; height: 238px; margin-right: -100%; top: 0px; position: absolute;; z-index: 9;"></div>
    </div>
  </div>
</div>


<div class="nav" id="nav">
  <div class="jz">
    <ul class="nav_main">
      <li class="yiji_li"><a class="wh_wbd" href="http://zzb.cxzch.cn/">首页</a></li>
      <?php
 $_typeid = 0; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $_navlist = get_category(1); if($_typeid == 0) { $_navlist = Common\Lib\Category::toLayer($_navlist); }else { $_navlist = Common\Lib\Category::toLayer($_navlist, 'child', $_typeid); } foreach($_navlist as $autoindex => $navlist): $navlist['url'] = get_url($navlist); ?><li
          class="yiji_li"
          style="<?php if($navlist["id"] == 50 or $navlist["id"] == 8 or $navlist["id"] == 42): ?>display:none;<?php endif; ?>"
        >
          <a class="wh_wbd " href="<?php echo ($navlist["url"]); ?>"><?php echo ($navlist["name"]); ?></a>
          <ul class="nav_c">
            <?php if(is_array($navlist["child"])): $i = 0; $__LIST__ = array_slice($navlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li class="erji_li c"> <a href="<?php echo ($v["ename"]); ?>"><?php echo ($v["name"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
          </ul>
        </li><?php endforeach;?>
    </ul>
  </div>
</div>
<nav
  data-am-widget="menu"
  class="am-menu  am-menu-dropdown1 am-no-layout"
  data-am-menu-collapse=""
>
  <a href="javascript: void(0)" class="am-menu-toggle">
    <img src="/Public/Home/sucai/zzb/ddh.png" alt="Menu Toggle" />
  </a>
  <ul class="am-menu-nav am-avg-sm-1 am-collapse" style="height: 0px;">
    <?php
 $_typeid = 0; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $_navlist = get_category(1); if($_typeid == 0) { $_navlist = Common\Lib\Category::toLayer($_navlist); }else { $_navlist = Common\Lib\Category::toLayer($_navlist, 'child', $_typeid); } foreach($_navlist as $autoindex => $navlist): $navlist['url'] = get_url($navlist); ?><li class="am-parent" style="">
        <a href="<?php echo ($navlist["url"]); ?>" class=""><?php echo ($navlist["name"]); ?></a>
        <ul class="am-menu-sub am-collapse  am-avg-sm-2 ">
          <?php if(is_array($navlist["child"])): $i = 0; $__LIST__ = array_slice($navlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li class=""> <a href="<?php echo ($v["ename"]); ?>"><?php echo ($v["name"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
      </li><?php endforeach;?>
  </ul>
</nav>

<!--<div class="sbanner"><ul class="am-slides"><li>
        <div class="ddsgg" style="background: url(/skin/img/banner.jpg) no-repeat center;"> </div>
      </li></ul></div>
 <div class="sbanner"> 
 <div class="banner_top"></div> 
 <div data-am-widget="slider" class="am-slider am-slider-a2" data-am-slider='{"directionNav":false,"slideshowSpeed": 3000,"animationSpeed": 1000,"animation": "fade"}' > 
  <ul class="am-slides">
  
   <li>
        <div class="ddsgg" style="background: url(/uploads/191027/1-19102H20101619.jpg) no-repeat center;">
        
        </div>
      </li>
<li>
        <div class="ddsgg" style="background: url(/uploads/191027/1-19102H20032134.jpg) no-repeat center;">
        
        </div>
      </li>

    </li>
	
  </ul>
  </div>
</div>
-->


<div class="n_cont c">
  <div class="jz c">
    <div class="ny_nav" id="my_sticky">
      <div class="wjssbt c"> <?php if($pid > 0): echo ($cate["name"]); ?>            <?php else: ?>
            <?php
 $type = Common\Lib\Category::getSelf(get_category(0), $cid); $type['url'] = get_url($type); echo ($cate["name"]); endif; ?></div>
      
      <ul class="wjsndh c">
        	<?php if($flag_son): $_typeid = intval($cid); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li class="c <?php if(($cid) == $catlist['id']): ?>tabactive<?php endif; ?>" ><a href="<?php echo ($catlist["url"]); ?>"><?php echo ($catlist["name"]); ?><span> &gt; </span></a></li><?php endforeach;?>
            <?php else: ?>
            <?php if($cate['pid'] > 0): $_typeid = intval($cate['pid']); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li class="c <?php if(($cid) == $catlist['id']): ?>tabactive<?php endif; ?>" ><a href="<?php echo ($catlist["url"]); ?>"><?php echo ($catlist["name"]); ?><span> &gt; </span></a></li><?php endforeach; endif; endif; ?>
        
        
      </ul>
      <img src="/Public/Home/sucai/list/fqfm_051.jpg">
    </div>
        <script>
            $(window).bind('scroll', function () {
                var div_h = $('.ny_nav').height(); // div的高度
                var foot_h = $(".foot").offset().top - $(window).scrollTop(); // foot到顶部的距离
                var con_h = $('.ny_zqw_chb').offset().top - $(window).scrollTop(); // con到顶部的距离
                if(con_h <= 0){
                    $('#my_sticky').addClass('ny_nav_chb');
                    if(foot_h - div_h <= 0){
                        $('#my_sticky').css({
                            'top':'auto',
                            'bottom':$(window).height() - foot_h
                        })
                    }else{
                        $('#my_sticky').css({
                            'top':'0',
                            'bottom':'auto'
                        })
                    }
                }else{
                    $('#my_sticky').removeClass('ny_nav_chb');
                }
            });
        </script>
    <div class="ny_zqw ny_zqw_chb">
      <div class="nw_top"> <span class="top_tzbt l"><?php echo ($cate["name"]); ?>  </span> <span class="top_mbx r">您的位置：<?php
 $_sname = ""; $_typeid = -1; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid == 0 && $_sname == '') { $_sname = isset($title) ? $title : ''; } echo get_position($_typeid, $_sname, "", 0, ""); ?></span> </div>
      <!--main--> 
      
      <!--内页正文-->
      <div class="bjbld">
        <ul class="wjzlb">
          
        <?php
 $_typeid = -1; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (0 > 0) { $where['_string'] = $_tablename.'.flag & 0 = 0 '; } if (!empty($_tablename) && $_tablename != 'page') { if (15 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 15, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "10"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(150) $list['description'] = str2sub($list['description'], 150, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li class="c"> <a href="<?php echo ($list["url"]); ?>"> <span class="wjll l"> <span class="wjlbt"><?php echo ($list["title"]); ?></span> <span class="wjlrq"><?php echo (date('Y-m-d H:i:s',$list["publishtime"])); ?></span> </span> </a> </li><?php endforeach;?>      
        </ul>
        <div class="yemmm"> <div class="pager"><?php echo ($page); ?></div>
</div>
      </div>
      <!--内页正文--> 
    </div>
  </div>
</div>
  <div align="center"><div class="foot">
  <div align="center"><div class="footjz">
<div div="" style="LINE-HEIGHT: 60%"><br></div>
    <div align="center"><div class="egwm"> <img src="/Public/Home/sucai/list/ewm.jpg" class="ewmtpw" alt="二维码">
      <div class="lxfsa"> <span class="ytbts">紫塞先锋网</span> <span class="ytbta">电话：0314-2050747</span> <span class="ytbta">传真：0314-2050747</span> <span class="ytbta">邮箱：cdycb@126.com</span> <span class="ytbta">地址：河北省承德市政府行政中心 </span> </div>
    </div></div>
    <br>
    <div class="dbxx">Copyright © 2002-2019 紫塞先锋党建网 版权所有     备案号：冀ICP备1325325253 &nbsp;&nbsp;</div>
  </div>
</div></div></div>
<script src="/Public/Home/sucai/js/common_version1.js" type="text/javascript"></script>
<script src="/Public/Home/sucai/js/other/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<div class="mmsg-box mmsg-box-info" id="msg-box" style="margin-top: -23.5px; margin-left: -96.5px;">
    <div class="mmsg-content">
        <i class="mmsg-icon"></i>
        <p id="msg-box-content"></p>
    </div>
    <div class="mmsg-background"></div>
</div>
<script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https'){
   bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
  }
  else{
  bp.src = 'http://push.zhanzhang.baidu.com/push.js';
  }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>


</body></html>