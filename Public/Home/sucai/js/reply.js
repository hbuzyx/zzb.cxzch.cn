$(function(){
	//当前页面配置
	/* 
	引用页中设置此项
	var get_review_url = '';//提交评论地址
	var get_review_url = '';/评论点载地址
	*/
        
    //阻止事件的冒泡
    $(':text,textarea').keyup(function(event){
            event.stopPropagation();
    });
        
    //快捷键提交评论
    $("#replyForm").find('textarea').on("keydown", function(e){
            e.stopPropagation();
            if(e.ctrlKey && e.which ==13){
                $('#replyForm').submit();
            }
        });
	
	/*$("#replysubmit").click(function() {
		$('#replyForm').submit();
	});*/
	
	//表单提交
    //var post_review_url ='';//所引用页中必需得新设置此项
	//$('#reviewForm').submit(function(){
	$("#replysubmit").click(function() {
		var title = $("#title").val();
		var post_id = $("#post_id").val();
		var model_id = $("#model_id").val();
		var review_id = $("#review_id").val();
		var cid = $("#cid").val();
		var url = $("#url").val();
		var content = UE.getEditor('editor').getContent();
		
		if (typeof(post_review_url)=="undefined") {
    		alert('post_review_url 未定义');
    		return false;
    	}
   		if (post_review_url == '') {
   			alert('提交网址错误');
    		return false;
    	}
        if(content==''){
			alert('内容不能为空');
            return false;
        }
		
		$.post(post_review_url, {
			title: title,
			post_id: post_id,
			model_id: model_id,
			review_id: review_id,
			cid: cid,
			url: url,
			content: content
		},
		function(data) {
			if (data.status == 1) {
				//alert("回复成功");
				window.location.href = url;
			} else {
				alert(data.info);
			}

		}, "json")
	});
    
});    
    //评论加载
    //var get_review_url = '';//所引用页中必需得新设置此项
    var page =1;
    function get_review(){
    	if (typeof(get_review_url)=="undefined") {
    		//alert('get_review_url 未定义');    		
    		$('.more-comment').before('<p class="error">js加载错误：get_review_url 未定义</p>');
    		return false;
    	}
    	if (get_review_url == '') {
    		//alert('加载错误');
    		$('.more-comment').before('<p class="error">js加载错误：get_review_url</p>');
    		return false;
    	}
        $.get(get_review_url,
            {
                'model_id' : $(':input[name=model_id]').val(), 
                'post_id' : $(':input[name=post_id]').val(), 
                'num' : 5, 
                'page' : page,
                'avatar' : 'middle'
            },
            function(data){
                //是否登录做对应展示
                if(data.user_id != 0){
                    $('#my_avatar').attr('src', data.avatar);
                    $('#replyForm').show();
                    $('.login-tip').hide();
                }else{
                    $('#my_avatar').attr('src', data.avatar);
                    if (data.guest != 1) {
                        $('#replyForm').hide();
                    }                   
                    $('.login-tip').show();
                    
                }
                
                $.isNumeric(data.count) && $('.review-count').text(data.count);
				$('.comments-count').text(data.count);
                //$('#comment_count').text(data.count);
                if(data.list && (typeof data.list == 'object')){
                    $.each(data.list, function(i, v){
                        var html = '<div class="comment-item review_item_list">'+
                            '<a class="avatar" user_id="'+v.user_id+'" href="#" target="_blank">'+
                                '<img src="'+ v.avatar+'" />'+
                            '</a> '+
                            '<div class="comment-hd">'+                         
                            '<a class="reply-btn" href="javascript:;" reply="'+v.id+'">回复<i></i></a>'+
                            '<span class="username">' + v.username + v.ico + '</span>' + 
                            '<span class="commment-time">' + v.posttime + '</span>'+
                            '</div>'+
                            '<div class="comment-bd" id="' + v.id + '">'+ v.content + 
                            '</div>';

                        //review start
                        if(v.child && (typeof v.child == 'object')){

                            $.each(v.child, function(i2, v2){
                                
                                html += '<div class="comment-item reply-item" id="' + v2.id + '">'+
                                    '<a class="avatar" user_id="'+v2.user_id+'" href="#" target="_blank">'+
                                        '<img src="'+ v2.avatar+'" />'+
                                    '</a>'+
                                    '<div class="comment-hd"><a class="reply-btn" href="javascript:;" reply="'+v2.review_id+'" at-user="true">回复<i></i></a>'+
                                    '<span class="username">' + v2.username + v2.ico + '</span>' + 
                                    '<span class="commment-time">' + v2.posttime + '</span>'+
                                    '</div>'+
                                    '<div class="comment-bd">'+
                                    '<div>' + v2.content + '</div>'+
                                    '</div>'+
                                    '</div>';
                            });
                        }

                        
                        //review end
                        html += '</div>';
                        $('.more-comment').before(html);
                    });
                    page = page+1;
                }

                var review_count = data.count;
                if($('.review_item_list').length < review_count){
                    $('#more_count').text(review_count - $('.review_item_list').length);
                    $('.more-comment').show();
                }else{
                    $('.more-comment').hide();
                }
                               
            },
            'json'
        );
        
    }


    //将光标移动到textarea末尾
    function moveEnd(obj){
		if(obj==null) return false;
        if(obj.offsetWidth<=0&&obj.offsetHeight<=0) {//隐藏时，不能focus
			return false;
		}
		
		obj.focus();
        var len = obj.value.length;
        if (document.selection) {
            var sel = obj.createTextRange(); 
            sel.moveStart('character',len); 
            sel.collapse(); 
            sel.select(); 
        } else if (typeof obj.selectionStart == 'number' && typeof obj.selectionEnd == 'number') {
            obj.selectionStart = obj.selectionEnd = len; 
        } 
    }
