<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>后台</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name="baidu-site-verification" content="unXl91MyB6" />
	<link rel="stylesheet" type="text/css" href="/Data/static/bootstrap/3.3.5/css/bootstrap.min.css" media="screen">	
	<link rel='stylesheet' type="text/css" href="/App/Manage/View/Public/css/main.css" />
	<!-- 头部css文件|自定义  -->
	

	<script type="text/javascript" src="/Data/static/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/Data/static/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
		<script src="/Data/static/js/html5shiv.min.js"></script>
		<script src="/Data/static/js/respond.min.js"></script>
    <![endif]-->
	
	<script type="text/javascript" src="/App/Manage/View/Public/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="/Data/static/jq_plugins/layer/layer.js"></script>
	<script language="JavaScript">
	    <!--
	    var URL = '/xn_admin.php?s=/Public';
	    var APP	 = '/xn_admin.php?s=';
	    var SELF='/xn_admin.php?s=/Public/main';
	    var PUBLIC='/App/Manage/View/Public';
	    var data_path = "/Data";
		var tpl_public = "/App/Manage/View/Public";
	    //-->
	</script>
	<script type="text/javascript" src="/App/Manage/View/Public/js/common.js"></script> 
	<!-- 头部js文件|自定义 -->
	
</head>
<body>
	<div class="xyh-content">
		
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-info">
				<!-- Default panel contents -->		
				<div class="panel-heading">个人信息</div>
				<div class="panel-body">
					<p>用户名：<?php echo (session('yang_adm_username')); ?></p>
                    <p>用户组：<?php if($Think.session.yang_adm_superadmin): ?>超级管理员<?php else: ?>管理员<?php endif; ?></p>
					<p>上次登录时间：<?php echo (session('yang_adm_logintime')); ?></p>
					<p>上次登录IP：<?php echo (session('yang_adm_loginip')); ?></p>
                    <p>登录次数：<?php echo (session('yang_adm_loginnum')); ?></p>
				</div>
			</div>
			
			
		</div>

		<div class="col-md-6">
        	<div class="panel panel-info">
				<div class="panel-heading">系统信息</div>
				<div class="panel-body">
					<p>程序版本： V<?php echo ($cms_info["XYHCMS_VER"]); ?></p>
					<p>操作系统：<?php echo ($os); ?></p>
					<p>服务器软件：<?php echo ($software); ?></p>
					<p>MySQL 版本：<?php echo ($mysql_ver); ?></p>
					<p>上传文件：<?php echo ($environment_upload); ?></p>
				</div>
			</div>
		</div>


	</div>




			
	</div>	
</body>
</html>