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
	    var URL = '/xn_admin.php?s=/ClearHtml';
	    var APP	 = '/xn_admin.php?s=';
	    var SELF='/xn_admin.php?s=/ClearHtml/home';
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
        <div class="col-lg-12">
            <h3 class="page-header"><em class="glyphicon glyphicon-cog"></em> 
            <?php echo ($type); ?>         
            </h3>
        </div>
        
    </div>

    <?php if(ACTION_NAME == "all"): ?><div class="row">
        <div class="col-sm-12">
            <div class="alert alert-info" role="alert">
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <span class="sr-only">Note:</span>
              <span>说明：</span>只有开启静态缓存，才能使用此功能。 一键更新全站静态缓存(Html)。
            </div>
        </div>
    </div>

    <div class="row margin-botton">
        <div class="col-lg-12">
            <form action="" method="post" id="form_do" name="form_do">
            <div class="btn-group btn-group-md">
                <button class="btn btn-success" type="button" onclick="doGoSubmit('<?php echo U('ClearHtml/home');?>', 'form_do')"><em class="glyphicon glyphicon-ok-sign"></em> 开始更新全站</button>
            </div>
            </form>
        </div>
    </div><?php endif; ?>

    <?php if(ACTION_NAME == "home"): ?><div class="row">
        <div class="col-sm-12">
            <div class="alert alert-info" role="alert">
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <span class="sr-only">Note:</span>
              <span>说明：</span>只有开启静态缓存，才能使用此功能。 更新首页静态缓存(Html)。
            </div>
        </div>
    </div>

    <div class="row margin-botton">
        <div class="col-lg-12">
            <form action="" method="post" id="form_do" name="form_do">
            <div class="btn-group btn-group-md">
                <button class="btn btn-info" type="button" onclick="doGoSubmit('<?php echo U('ClearHtml/home');?>', 'form_do')"><em class="glyphicon glyphicon-ok-sign"></em> 开始更新首页</button>
            </div>
            </form>
        </div>
    </div><?php endif; ?>

    <?php if(ACTION_NAME == "lists"): ?><div class="row">
        <div class="col-sm-12">
            <div class="alert alert-info" role="alert">
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <span class="sr-only">Note:</span>
              <span>说明：</span>只有开启静态缓存，才能使用此功能。 更新栏目列表静态缓存(Html)。
            </div>
        </div>
    </div>

    <div class="row margin-botton">
        <div class="col-lg-12">
            <div class="btn-group btn-group-md">
                <button class="btn btn-info" type="button" onclick="doGoBatch('<?php echo U('ClearHtml/lists');?>')"><em class="glyphicon glyphicon-ok-sign"></em> 更新选中的栏目</button>
                <button class="btn btn-default" type="button" onclick="doGoSubmit('<?php echo U('ClearHtml/lists', array('isall' => 1));?>', 'form_do')"><em class="glyphicon glyphicon-ok-sign"></em> 一键更新所有栏目</button>
            </div>
        </div>
    </div> 

    <div class="row">
        <div class="col-sm-12">
            <form action="<?php echo U('ClearHtml/lists');?>" method="post" id="form_do" name="form_do">
                <table class="table table-hover xyh-table-bordered-out">
                    <tr>
                        <th width="50"><input type="checkbox" id="check"></th>
                        <th class="aleft">栏目</th>
                    </tr>
                    <?php if(is_array($cate)): foreach($cate as $key=>$v): ?><tr>
                        <td><input type="checkbox" name="key[]" value="<?php echo ($v["id"]); ?>"></td>
                        <td class="aleft"><?php echo ($v["delimiter"]); if($v['pid'] != 0): ?>├─<?php endif; echo ($v["name"]); ?></td>
                    </tr><?php endforeach; endif; ?>
                </table>
            </form> 
        </div>
    </div><?php endif; ?>

    <?php if(ACTION_NAME == "shows"): ?><div class="row">
        <div class="col-sm-12">
            <div class="alert alert-info" role="alert">
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <span class="sr-only">Note:</span>
              <span>说明：</span>只有开启静态缓存，才能使用此功能。 更新文档(内容页)静态缓存(Html)。
            </div>
        </div>
    </div>

    <div class="row margin-botton">
        <div class="col-lg-12">
            <div class="btn-group btn-group-md">
                <button class="btn btn-info" type="button" onclick="doGoBatch('<?php echo U('ClearHtml/shows');?>')"><em class="glyphicon glyphicon-ok-sign"></em> 更新选中的栏目下文档</button>
                <button class="btn btn-default" type="button" onclick="doGoSubmit('<?php echo U('ClearHtml/shows', array('isall' => 1));?>', 'form_do')"><em class="glyphicon glyphicon-ok-sign"></em> 一键更新所有文档</button>
            </div>
        </div>
    </div> 

    <div class="row">
        <div class="col-sm-12">
            <form action="<?php echo U('ClearHtml/shows');?>" method="post" id="form_do" name="form_do">
                <table class="table table-hover xyh-table-bordered-out">
                    <tr>
                        <th width="50"><input type="checkbox" id="check"></th>
                        <th class="aleft">栏目</th>
                    </tr>
                    <?php if(is_array($cate)): foreach($cate as $key=>$v): ?><tr>
                        <td><input type="checkbox" name="key[]" value="<?php echo ($v["id"]); ?>" <?php if($v["tablename"] == 'page'): ?>disabled="disabled"<?php endif; ?></td>
                        <td class="aleft"><?php echo ($v["delimiter"]); if($v['pid'] != 0): ?>├─<?php endif; echo ($v["name"]); ?></td>
                    </tr><?php endforeach; endif; ?>
                </table>
            </form> 
        </div>
    </div><?php endif; ?>


    <?php if(ACTION_NAME == "special"): ?><div class="row">
        <div class="col-sm-12">
            <div class="alert alert-info" role="alert">
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <span class="sr-only">Note:</span>
              <span>说明：</span>只有开启静态缓存，才能使用此功能。 更新专题静态缓存(Html)。
            </div>
        </div>
    </div>

    <div class="row margin-botton">
        <div class="col-lg-12">
            <div class="btn-group btn-group-md">
            <form action="" method="post" id="form_do" name="form_do">
                <button class="btn btn-info" type="button" onclick="doGoSubmit('<?php echo U('ClearHtml/special');?>', 'form_do')"><em class="glyphicon glyphicon-ok-sign"></em> 更新专题列表</button>
                <button class="btn btn-default" type="button" onclick="doGoSubmit('<?php echo U('ClearHtml/special', array('isall' => 1));?>', 'form_do')"><em class="glyphicon glyphicon-ok-sign"></em> 一键更新所有专题</button>
            </form>
            </div>
        </div>
    </div><?php endif; ?>




			
	</div>	
</body>
</html>