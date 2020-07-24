var storage = window.localStorage;
var initData = {};
var formData = {};

function set(k,v,t){
	var _this = this;
	if(typeof(_this) == "object"&& Object.prototype.toString.call(_this).toLowerCase() == "[object object]" && !_this.length)
	{
		_this[k] = {'value':v,'time':t};
		storage.setItem('questions',$.toJSON(formData));
	}
}

function clearStorage()
{
	storage.removeItem('questions');
}

function submitPaper()
{
	// $.zoombox.show('confirm',{"msg":"交卷成功","time":1000});
	// $('#form1').submit();
	var params = $(':input').serialize();
	$.ajax({
		url:'kaoshi.php/index/saveUserAnswer',
		async:false,
		type:'post',
		dataType:'json',
		data:params,
		success:function(da){
			//请求成功时处理
			if(da.status == 1){
				clearStorage();
				$('#submodal').modal('hide');
				document.location.href = 'kaoshi.php/index/result';
			}else{
				alert(da.msg);
			}
		},
		complete:function(){
			//请求完成的处理

		},
		error:function(xhr, textStatus, errorThrown){
			//请求出错处理
			alert("原生ajax：" + xhr + textStatus + "详细错误：" + errorThrown);
		}
	})
}

function saveanswer(){
	var params = $(':input').serialize();
	$.ajax({
		url:'kaoshi.php/index/saveUserAnswer',
		async:false,
		type:'post',
		dataType:'json',
		data:params,
		success:function(da){
			//请求成功时处理
			if(da.status == 1){
				clearStorage();
				$('#submodal').modal('hide');
				document.location.href = 'kaoshi.php/index/result';
			}else{
				alert(da.msg);
			}
		},
		complete:function(){
			//请求完成的处理

		},
		error:function(xhr, textStatus, errorThrown){
			//请求出错处理
			alert("原生ajax：" + xhr + textStatus + "详细错误：" + errorThrown);
		}
	})
	// ).done(function (da) {
	//
	// }).fail(function (xhr, textStatus, errorThrown) {
	// 	alert("原生ajax：" + xhr + textStatus + "详细错误：" + errorThrown);
	// }).always(function () {
	// 	console.log("完成任务流程结束");
	// }
}

function markQuestion(rel,isTextArea)
{
	var t = 0;
	var f = false;
	try {
		f = $('#form1 :input[rel='+rel+']');
	}catch(e) {
		f = false;
	}
	if(!f)return false;
	if(isTextArea) {
		if($('#form1 :input[rel='+rel+']').val() && $('#form1 :input[rel='+rel+']').val() != '' && $('#form1 :input[rel='+rel+']').val() != '<p></p>')t++;
	}else $('#form1 :input[rel='+rel+']').each(function(){if($(this).is(':checked') && $(this).val() && $(this).val() != '' && $(this).val() != '<p></p>')t++;});
	if(t > 0) {
		if(!$('#sign_'+rel).hasClass("btn-primary"))$('#sign_'+rel).addClass("btn-primary");
	}else {
		$('#sign_'+rel).removeClass("btn-primary");
	}
	$('.yesdonumber').html($('#questionindex .btn-primary').length);
}

function batmark(rel,value)
{
	if(value && value != '')
	{
		if(!$('#sign_'+rel).hasClass("btn-primary"))$('#sign_'+rel).addClass("btn-primary");
	}
	else
	$('#sign_'+rel).removeClass("btn-primary");
	$('.yesdonumber').html($('#questionindex .btn-primary').length);
}

function signQuestion(id,obj)
{

	$(obj).addClass('btn btn-danger').removeClass('btn-info');

	$('#sign_'+id).addClass('btn-danger');

	return
	$.get("index.php?exam-app-index-ajax-sign&questionid="+id+'&'+Math.random(),function(data){
		if(parseInt(data) != 1){
			$(obj).addClass('btn-info').removeClass('btn-danger');
			$('#sign_'+id).removeClass('btn-danger');
		}else{
			$(obj).addClass('btn btn-danger').removeClass('btn-info');
			$('#sign_'+id).addClass('btn-danger');
		}
	});
}

function favorquestion(questionid){

	$.zoombox.show('ajaxOK',{"statusCode":200,"message":"\u6536\u85cf\u6210\u529f\uff01","time":1000});
	submitAjax({'url':"index.php?exam-app-favor-ajax-addfavor&questionid="+questionid});
}

function delfavorquestion(questionid){
	submitAjax({'url':"index.php?exam-app-favor-ajax-delfavor&questionid="+questionid});
}