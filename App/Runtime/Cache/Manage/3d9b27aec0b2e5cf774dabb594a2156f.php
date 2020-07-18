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
	    var URL = '/xn_admin.php?s=/Collect';
	    var APP	 = '/xn_admin.php?s=';
	    var SELF='/xn_admin.php?s=/Collect/page';
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
			<h3 class="page-header"><em class="glyphicon glyphicon-edit"></em> 
			采集单页
		    </h3>
		</div>
		
	</div>


	<div class="row">
		<div class="col-lg-12">

				<form method="post" class="form-horizontal" id="form_do" name="form_do" action="<?php echo U('page');?>">											
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">网站域名</label>
						<div class="col-sm-9">
							<input type="text" name="site" id="inputSite" value="<?php echo ($vo["site"]); ?>" class="form-control" placeholder="网站域名" />									
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">单页地址</label>
						<div class="col-sm-9">
							<input type="text" name="url" id="inputUrl" value="<?php echo ($vo["url"]); ?>" class="form-control" placeholder="单页地址" />									
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">所属栏目</label>
						<div class="col-sm-9">
						<select name="cid" >
                            <option value="0">请选择</option>
                            <?php if(is_array($cate)): foreach($cate as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>" <?php if($vo["cid"] == $v['id']): ?>selected="selected"<?php endif; ?>><?php echo ($v["delimiter"]); echo ($v["name"]); ?></option><?php endforeach; endif; ?>
                        </select>								
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">页面后缀</label>
						<div class="col-sm-9">
							<input type="text" name="ext" id="inputColor" value="<?php echo ($vo["ext"]); ?>" class="form-control  iColorPicker" placeholder="页面后缀，例如：.html">
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">标题匹配规则</label>
						<div class="col-sm-9">
							<textarea name="titlepreg" id="inputDescription" class="form-control"><?php echo ($vo["titlepreg"]); ?></textarea>		
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">关键词匹配规则</label>
						<div class="col-sm-9">
							<textarea name="keypreg" id="inputKeypreg" class="form-control"><?php echo ($vo["keypreg"]); ?></textarea>		
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">正文匹配规则</label>
						<div class="col-sm-9">
							<textarea name="contentpreg" id="inputDescription" class="form-control"><?php echo ($vo["contentpreg"]); ?></textarea>	
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">图片采集方式</label>
						<div class="col-sm-9">
							<label class="radio-inline">
							 	<input type="radio" name="type" value="1" <?php if($vo['type'] == 1): ?>checked="checked"<?php endif; ?> />curl方式				
							 </label>
							<label class="radio-inline">
							 	<input type="radio" name="type" value="0" <?php if($vo['type'] == 0): ?>checked="checked"<?php endif; ?> />ob_get_contents方式&nbsp;&nbsp;
                                （提示：如果采集不到图片或者采集的图片损坏请选用ob_get_contents方式）
							 </label>	
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">图片匹配规则</label>
						<div class="col-sm-9">
							<textarea name="picpreg" id="inputDescription" class="form-control"><?php echo ($vo["picpreg"]); ?></textarea>	
						</div>
					</div>
                    
                    <div class="form-group">
						<label for="inputUrl" class="col-sm-2 control-label">图片分页参数</label>
						<div class="col-sm-9">
							<input type="text" name="picpage" id="inputColor" value="<?php echo ($vo["picpage"]); ?>" class="form-control iColorPicker" placeholder="图片分页参数">
						</div>
					</div>
					
					<div class="row margin-botton-large">
						<div class="col-sm-offset-2 col-sm-9">
							<div class="btn-group">
								<button type="submit" class="btn btn-primary"> <i class="glyphicon glyphicon-saved"></i>
									保存
								</button>
								<button type="button" onclick="caiji();" class="btn btn-default" style="margin-left:30px;"> 
									立即采集 <i class="glyphicon glyphicon-chevron-right"></i>
								</button>
							</div>
						</div>
					</div>
				</form>
				<script language="javascript">
					function caiji(){
						$("#form_do").attr("action", "<?php echo U('get_content');?>");
						$('#form_do').submit();
					}
				</script>
		</div>
	</div>

		



			
	</div>	
</body>
</html>