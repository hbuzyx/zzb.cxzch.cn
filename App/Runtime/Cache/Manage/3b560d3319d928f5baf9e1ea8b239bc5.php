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
	    var URL = '/xn_admin.php?s=/Temp';
	    var APP	 = '/xn_admin.php?s=';
	    var SELF='/xn_admin.php?s=/Temp/index';
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
            <h3 class="page-header"><em class="glyphicon glyphicon-th-list"></em> 
            <?php echo ($type); ?> 
            <span class="xyh-pos">
                <i class="glyphicon glyphicon-log-out"></i>
                <?php if(ACTION_NAME == "index"): if(is_array($poscate)): foreach($poscate as $key=>$v): ?><a href="<?php echo U('' . ucfirst($v['tablename']) .'/index', array('pid' => $v['id']));?>"><?php echo ($v["name"]); ?> </a> <em class="glyphicon glyphicon-menu-right"></em><?php endforeach; endif; endif; ?>
            </span>         
            </h3>
            
        </div>
        
    </div>
	
    <form action="" method="post" id="form_do" name="form_do">
    <div class="row margin-botton">
        <div class="col-sm-6 column">
            <div class="btn-group btn-group-md">
                <button class="btn btn-primary" type="button" onclick="doGoBatch('<?php echo U('addlist', array('pid'=>$pid));?>')"><em class="glyphicon glyphicon-plus-sign"></em> 批量入库</button>
                 <button class="btn btn-default" type="button" onclick="doConfirmBatch('<?php echo U('clear', array('batchFlag' => 1, 'pid' => $pid));?>', '确实要彻底删除选择项吗？')"><em class="glyphicon glyphicon-remove-circle"></em> 彻底删除</button> 

            </div>
        </div>
        <div class="col-sm-6 text-right">
            选择栏目 <select name="cid" >
                        <option value="0">请选择</option>
                        <?php if(is_array($cate)): foreach($cate as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>"><?php echo ($v["delimiter"]); echo ($v["name"]); ?></option><?php endforeach; endif; ?>
                    </select>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            
            <div class="table-responsive">
                <table class="table table-hover xyh-table-bordered-out">
                    <thead>
                        <tr class="active">
                            <th><input type="checkbox" id="check"></th>
                            <th>编号</th>
                            <th width="430">标题</th>
                            <th>分类</th>
                            <th>发布人</th>
                            <th>采集时间</th>
                            <th class="text-right">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php if(is_array($vlist)): foreach($vlist as $key=>$v): ?><tr>
                        <td><input type="checkbox" name="key[]" value="<?php echo ($v["id"]); ?>"></td>
                        <td><?php echo ($v["id"]); ?></td>
                        <td class="aleft" style="color:<?php echo ($v["color"]); ?>"><?php echo ($v["title"]); if($v["flag"] > 0): ?><span style="color:#079B04;">[<?php echo (flag2Str($v["flag"])); ?>]</span><?php endif; ?></td>
                        <td><?php echo ($v["catename"]); ?></td>
                        <td><?php echo ($v["author"]); ?></td>
                        <td><?php echo (date('Y-m-d H:i:s', $v["publishtime"])); ?></td>
                        <td class="text-right">
                        <a href="<?php echo U('edit',array('id' => $v['id'],'pid' => $v['cid']), '');?>" class="label label-success">编辑</a>
                        <a href="javascript:;" onclick="toConfirm('<?php echo U('clear',array('id' => $v['id'], 'pid' => $v['cid']), '');?>', '确实要彻底删除吗？')" class="label label-danger">删除</a>
                        </td>
                    </tr><?php endforeach; endif; ?>
                    </tbody>
                </table>
            </div>
                
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="xyh-page">
                        <?php echo ($page); ?>
                    </div>
                </div>
            </div>

            
        </div>
    </div>
	</form>
    

			
	</div>	
</body>
</html>