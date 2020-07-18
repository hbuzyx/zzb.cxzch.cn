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
	    var URL = '/xn_admin.php?s=/Model';
	    var APP	 = '/xn_admin.php?s=';
	    var SELF='/xn_admin.php?s=/Model/add';
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
			<h3 class="page-header"><em class="glyphicon glyphicon-plus"></em> 
			添加内容模型
		    </h3>
		</div>
		
	</div>


	<div class="row">
		<div class="col-lg-12">

				<form method='post' class="form-horizontal" id="form_do" name="form_do" action="<?php echo U('add');?>">
					<div class="form-group">
						<label for="inputName" class="col-sm-2 control-label">模型名称</label>
						<div class="col-sm-9">
							<input type="text" name="name" id="inputName" class="form-control" placeholder="模型名称" required="required" />		
						</div>
					</div>	
					<div class="form-group">
						<label for="inputTablename" class="col-sm-2 control-label">附加表</label>
						<div class="col-sm-9">
							<input type="text" name="tablename" id="inputTablename" value="" class="form-control" placeholder="表名小写，去掉默认表前缀" required="required" />
							<p class="form-control-static">表名小写，去掉默认表前缀</p>	
						</div>
					</div>
					<div class="form-group">
						<label for="inputTablename" class="col-sm-2 control-label">列表模板</label>
						<div class="col-sm-9">
							<select name="template_list" class="form-control">
								<?php if(is_array($styleListList)): foreach($styleListList as $key=>$v): ?><option value="<?php echo ($v); ?>"><?php echo ($v); ?></option><?php endforeach; endif; ?>
							</select>	
						</div>
					</div>
					<div class="form-group">
						<label for="inputTablename" class="col-sm-2 control-label">内容页模板</label>
						<div class="col-sm-9">
							<select name="template_show" class="form-control">
								<?php if(is_array($styleShowList)): foreach($styleShowList as $key=>$v): ?><option value="<?php echo ($v); ?>"><?php echo ($v); ?></option><?php endforeach; endif; ?>
							</select>	
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">描述</label>
						<div class="col-sm-9">
							<textarea name="description" class="form-control"></textarea>
						</div>
					</div>


					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">启用</label>
						<div class="col-sm-9">
							<label class="radio-inline">
							<input type="radio" name="status" value="1" checked="checked" />启用</label>
							<label class="radio-inline">
							<input type="radio" name="status" value="0" />禁用</label>
						</div>
					</div>
				
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">排序</label>
						<div class="col-sm-9">
							<input type="text" name="sort" class="form-control" value="1" />
						</div>
					</div>

					<div class="row margin-botton-large">
						<div class="col-sm-offset-2 col-sm-9">
							<div class="btn-group">							
								<button type="submit" class="btn btn-primary"> <i class="glyphicon glyphicon-saved"></i>
									保存
								</button>
								<button type="button" onclick="goUrl('<?php echo U('index');?>')" class="btn btn-default"> <i class="glyphicon glyphicon-chevron-left"></i>
									返回
								</button>
							</div>
						</div>
					</div>
				</form>
	
		</div>
	</div>

		



			
	</div>	
</body>
</html>