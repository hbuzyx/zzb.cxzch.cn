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
	    var URL = '/xn_admin.php?s=/Category';
	    var APP	 = '/xn_admin.php?s=';
	    var SELF='/xn_admin.php?s=/Category/edit/id/50';
	    var PUBLIC='/App/Manage/View/Public';
	    var data_path = "/Data";
		var tpl_public = "/App/Manage/View/Public";
	    //-->
	</script>
	<script type="text/javascript" src="/App/Manage/View/Public/js/common.js"></script> 
	<!-- 头部js文件|自定义 -->
	
<script type="text/javascript">
	$(function(){

		$("#form_do").submit(function(){
			var name = $("input[name='name']");
			if($.trim(name.val())==''){
				layer.tips('名称不能为空', "input[name='name']", {
				  tips: [3, '#78BA32']
				});
				return false;			
			}else {
			}

		});


		$("input[name='type']").click(function(){    
            
            var checked = $(this).prop('checked'); 
            var nextEname = $(this).parents('.form-group').next();//ename; 

            if(checked) {
                nextEname.find('label').html('链接地址：');
                nextEname.find('span').hide();
            }else {
            	nextEname.find('label').html('别名(拼音)：');
            	nextEname.find('span').show();
            }
            
        });
        
        autoHide();
        function autoHide(){
        	var inputs = $("input[name='type']")
        	var nextEname = inputs.parents('.form-group').next();//ename;
            
            if(inputs.prop('checked')) {
                nextEname.find('label').html('链接地址：');
                nextEname.find('span').hide(); 
            }

        }



        $("select[name='modelid']").change(function(){
        	var styleId = $(this).val();
			setStyleSelect(styleId);
		});
		
		function setStyleSelect(id){
			var template_list = $("select[name='template_list']");
        	var template_show = $("select[name='template_show']");        	
			switch (id){
				<?php if(is_array($mlist)): foreach($mlist as $key=>$v): ?>case '<?php echo ($v["id"]); ?>':
					//template_list.val("<?php echo ($v["template_list"]); ?>");
					template_list.find("option[value='<?php echo ($v["template_list"]); ?>']").prop("selected","selected");
					template_show.find("option[value='<?php echo ($v["template_show"]); ?>']").prop("selected","selected");
				 	break;<?php endforeach; endif; ?>
			}

		}

    });
</script>

<script type="text/javascript">
$(function () {
	//缩略图上传
	var litpic_tip = $(".litpic_tip");
	var btn = $(".up-picture-btn span");
	$("#fileupload").wrap("<form id='myupload' action='<?php echo U('Public/upload',array('img_flag' => 1));?>' method='post' enctype='multipart/form-data'></form>");
    $("#fileupload").change(function(){
    	if($("#fileupload").val() == "") return;
		$("#myupload").ajaxSubmit({
			dataType:  'json',
			beforeSend: function() {
        		$('#litpic_show').empty();
				btn.html("上传中...");
    		},
			success: function(data) {
				if(data.state == 'SUCCESS'){
					var fileSize = parseFloat(data.info[0].size/1024).toFixed(2);
					litpic_tip.html(""+ data.info[0].name +" 上传成功("+ fileSize +"k)");
					var img = data.info[0].url;//原图
					var timg = data.info[0].turl;//缩略图
					$('#litpic_show').html("<img src='"+timg+"' width='120'>");
					$("#litpic").val(timg);
				}else {
					litpic_tip.html(data.state);		
				}			
					btn.html("添加图片");

			},
			error:function(xhr){
				btn.html("上传失败");
				litpic_tip.html(xhr);
			}
		});
	});


	
});




$(function () {

	$('#BrowerPicture').click(function(){
		layer.open({
			type: 2,
			title: '系统提示',
			shadeClose: true,
			shade: 0.5,
			area: ['670px', '350px'],
			content: "<?php echo U('Public/browseFile', array('stype' => 'picture'));?>"
		});
	});	

});


function selectPicture(sfile) {
	layer.msg('选择文件成功')
	$("#litpic").val(sfile);
	$('#litpic_show').html("<img src='"+sfile+"' width='120'>");
}



</script>
	

</head>
<body>
	<div class="xyh-content">
		
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header"><em class="glyphicon glyphicon-edit"></em> 
			<?php echo ($type); ?>    
		    </h3>
		</div>
		
	</div>


	<div class="row">
		<div class="col-lg-12">
			<div>
			
				<!-- Nav tabs -->			
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#home" aria-controls="home" role="tab" data-toggle="tab">基本选项</a>
					</li>
					<li role="presentation">
						<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">高级设置</a>
					</li>
					<li role="presentation">
						<a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">权限设置</a>
					</li>
				</ul>

				<form method='post' class="form-horizontal" id="form_do" name="form_do" action="<?php echo U('edit');?>">
					<!-- Tab panes -->			
					<div class="tab-content" style="margin-top:20px;">
						<div role="tabpanel" class="tab-pane active" id="home">
							<div class="form-group">
								<label for="inputProName" class="col-sm-2 control-label">所属栏目</label>
								<div class="col-sm-9">
									<select name="pid" class="form-control">
										<option value="0">顶级栏目</option>
										<?php if(is_array($cate)): foreach($cate as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>" <?php if($data['pid'] == $v['id']): ?>selected="selected"<?php endif; ?>><?php echo ($v["delimiter"]); echo ($v["name"]); ?></option><?php endforeach; endif; ?>
									</select>									
								</div>
							</div>

							<div class="form-group">
								<label for="inputModelId" class="col-sm-2 control-label">内容模型</label>
								<div class="col-sm-9">
									<select name="modelid" class="form-control">
										<?php if(is_array($mlist)): foreach($mlist as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>" <?php if($data['modelid'] == $v['id']): ?>selected="selected"<?php endif; ?>><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
									</select>									
								</div>
							</div>							

							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">栏目名称</label>
								<div class="col-sm-9">
									<input type="text" name="name" id="inputName" value="<?php echo ($data["name"]); ?>" class="form-control" placeholder="栏目名称" />									
								</div>
							</div>
							<div class="form-group">
								<label for="inputType" class="col-sm-2 control-label">外部链接</label>
								<div class="col-sm-9">
									<label class="checkbox-inline">
										<input type="checkbox" name="type" id="inputType" value="1"  <?php if($data['type'] == 1): ?>checked="checked"<?php endif; ?> />外部链接				
									 </label>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEname" class="col-sm-2 control-label">别名(拼音)</label>
								<div class="col-sm-9">
									<input type="text" name="ename" id="inputEname" value="<?php echo ($data["ename"]); ?>" class="form-control" />	
									<span>只能包含字母，数字</span>								
								</div>
							</div>
							<div class="form-group">
								<label for="inputEname" class="col-sm-2 control-label">栏目图片</label>
								<div class="col-sm-5">
									    <input type="text" class="form-control" name="catpic" id="litpic" value="<?php echo ($data["catpic"]); ?>" placeholder="栏目图片地址" />	
								</div>
								<div class="col-sm-5">
									<button class="btn btn-primary" type="button" id="BrowerPicture"><em class="glyphicon glyphicon-plus-sign"></em> 选择站内图片</button>
										<div class="btn btn-success up-picture-btn">
									        <span><em class="glyphicon glyphicon-plus-sign"></em>添加图片</span>										        
									        <input id="fileupload" type="file" name="mypic">
									    </div>							
								</div>
							</div>


							<div class="form-group">
								<label for="" class="col-sm-2 control-label"></label>
								<div class="col-sm-9">
									<div class="litpic_tip"></div>
									<div id="litpic_show">
										<?php if(!empty($data['catpic'])): ?><img src="<?php echo ($data["catpic"]); ?>" width='120' /><?php endif; ?>
									</div>							
								</div>
							</div>

							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">排序</label>
								<div class="col-sm-9">
									<input type="text" name="sort" id="inputSort" class="form-control" value="<?php echo ($data["sort"]); ?>" />									
								</div>
							</div>

							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">显示</label>
								<div class="col-sm-9">
									<label class="radio-inline">
									 	<input type="radio" name="status" value="1" <?php if($data['status'] == 1): ?>checked="checked"<?php endif; ?>/>显示				
									 </label>
									<label class="radio-inline">
									 	<input type="radio" name="status" value="0" <?php if($data['status'] == 0): ?>checked="checked"<?php endif; ?> />隐藏		
									 </label>	
								</div>
							</div>
                            
                            <div class="form-group">
								<label for="inputType" class="col-sm-2 control-label">包含属性</label>
								<div class="col-sm-9">
                                <?php if(is_array($proplist)): foreach($proplist as $key=>$v): ?><label class="checkbox-inline">
										<input type="checkbox" name="property[]" id="inputType" value="<?php echo ($v["id"]); ?>" <?php if(is_checked($data['property'],$v['id'])): ?>checked="checked"<?php endif; ?> /><?php echo ($v["name"]); ?>				
									 </label><?php endforeach; endif; ?>
								</div>
							</div>

						</div>
						<div role="tabpanel" class="tab-pane" id="profile">
							<div class="form-group">
								<label for="inputProName" class="col-sm-2 control-label">栏目模板</label>
								<div class="col-sm-9">
									<select name="template_list" class="form-control">
										<?php if(is_array($styleListList)): foreach($styleListList as $key=>$v): ?><option value="<?php echo ($v); ?>" <?php if($data['template_list'] == $v): ?>selected="selected"<?php endif; ?>><?php echo ($v); ?></option><?php endforeach; endif; ?>
									</select>									
								</div>
							</div>

							<div class="form-group">
								<label for="inputTemplateShow" class="col-sm-2 control-label">内容页模板</label>
								<div class="col-sm-9">
									<select name="template_show" id="inputTemplateShow" class="form-control">
										<?php if(is_array($styleShowList)): foreach($styleShowList as $key=>$v): ?><option value="<?php echo ($v); ?>" <?php if($data['template_show'] == $v): ?>selected="selected"<?php endif; ?>><?php echo ($v); ?></option><?php endforeach; endif; ?>
									</select>									
								</div>
							</div>							

							<div class="form-group">
								<label for="inputSeotitle" class="col-sm-2 control-label">Seo标题</label>
								<div class="col-sm-9">
									<input type="text" name="seotitle" id="inputSeotitle" value="<?php echo ($data["seotitle"]); ?>" class="form-control" placeholder="Seo标题" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputKeywords" class="col-sm-2 control-label">关键词</label>
								<div class="col-sm-9">
									<input type="text" name="keywords" id="inputKeywords" value="<?php echo ($data["keywords"]); ?>" class="form-control" placeholder="关键词" />						
								</div>
							</div>
							<div class="form-group">
								<label for="inputDescription" class="col-sm-2 control-label">栏目描述</label>
								<div class="col-sm-9">
									<textarea name="description" id="inputDescription" class="form-control" placeholder="栏目描述"><?php echo ($data["description"]); ?></textarea>							
								</div>
							</div>	

						</div>
						<div role="tabpanel" class="tab-pane" id="messages">
							<div class="form-group">
								<label for="inputProName" class="col-sm-2 control-label">管理员组权限</label>
								<div class="col-sm-9">
									<table class="table table-hover xyh-table-bordered-out-small">
										<thead>
											  <tr class="active">
											    <th>管理员组名称</th>
											    <th>查看</th>				    
											    <th>添加</th>				    
											    <th>修改</th>				    
											    <th>删除</th>
											    <th>移动</th>		    
											    <th>回收站</th>	    
											    <th>还原</th>	    
											    <th>清除</th>
											  </tr>
										  </thead>
										  <tbody>
										  <?php if(is_array($roleList)): foreach($roleList as $key=>$v): ?><tr>
										    <td><?php echo ($v["name"]); ?></td>
										    <td align="center"><input type="checkbox" name="acc_roleid[]" value="index,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'],'index',$v['id']) == 1): ?>checked="checked"<?php endif; ?> /></td>
										    <td align="center"><input type="checkbox" name="acc_roleid[]" value="add,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'],'add',$v['id']) == 1): ?>checked="checked"<?php endif; ?> /></td>
										    <td align="center"><input type="checkbox" name="acc_roleid[]" value="edit,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'],'edit',$v['id']) == 1): ?>checked="checked"<?php endif; ?> /></td>
										    <td align="center"><input type="checkbox" name="acc_roleid[]" value="del,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'],'del',$v['id']) == 1): ?>checked="checked"<?php endif; ?> /></td>
										    <td align="center"><input type="checkbox" name="acc_roleid[]" value="move,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'],'move',$v['id']) == 1): ?>checked="checked"<?php endif; ?> /></td>
										    <td align="center"><input type="checkbox" name="acc_roleid[]" value="trach,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'],'trach',$v['id']) == 1): ?>checked="checked"<?php endif; ?> /></td>
										    <td align="center"><input type="checkbox" name="acc_roleid[]" value="restore,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'],'restore',$v['id']) == 1): ?>checked="checked"<?php endif; ?> /></td>
										    <td align="center"><input type="checkbox" name="acc_roleid[]" value="clear,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'],'clear',$v['id']) == 1): ?>checked="checked"<?php endif; ?> /></td>
										  </tr><?php endforeach; endif; ?>
										  </tbody>
									</table>							
								</div>
							</div>

							<div class="form-group">
								<label for="inputTemplateShow" class="col-sm-2 control-label">会员组权限</label>
								<div class="col-sm-9">
									<table class="table table-hover xyh-table-bordered-out-small">
									  <thead>
										  <tr class="active">
										    <th>会员组名称</th>
										    <th>允许访问</th>
										  </tr>
									  </thead>
									  <tbody>
										  <?php if(is_array($groupList)): foreach($groupList as $key=>$v): ?><tr>
										    <td><?php echo ($v["name"]); ?></td>
										    <td align="center"><input type="checkbox" name="acc_groupid[]" value="visit,<?php echo ($v["id"]); ?>" <?php if(check_category_access($data['id'], 'visit', $v['id'], 0) == 1): ?>checked="checked"<?php endif; ?> /></td>
										  </tr><?php endforeach; endif; ?>
									  </tbody>
									</table>								
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-sm-offset-2 col-sm-9">
							<input type="hidden" name="id" value="<?php echo ($data["id"]); ?>"/>			
							<input type="hidden" name="oldmodelid" value="<?php echo ($data["modelid"]); ?>"/>
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

		



			
	</div>	
</body>
</html>