$(function(){
	$("img[original]").lazyload({ placeholder:"/Public/Home/sucai/view/images/load.gif" });
	var url = location.hash;
	if(url != '' && url != '#p1'){
		var allpic=document.getElementsByTagName("li").length;
		num = (location.hash).substring(2);
		setContentTab('p',num,allpic);
	}
	
});

//部分区域图片延迟加载
function lazyloadForPart(container) {
    container.find('img').each(function () {
        var original = $(this).attr("original");
        if (original) {
            $(this).attr('src', original).removeAttr('original');
        }
    });
}

function setContentTab(name, curr, n) {
    for (i = 1; i <= n; i++) {
        var menu = document.getElementById(name + i);
        var cont = document.getElementById("con_" + name + "_" + i);
        menu.className = i == curr ? "current" : "";
        if (i == curr) {
            cont.style.display = "block";
            lazyloadForPart($(cont));
        } else {
            cont.style.display = "none";
        }
    }
	curid = curr;
}
function getElementsByClassName(a, b) {  
            if (a.getElementsByClassName) {  
                return a.getElementsByClassName(b);  
            } else {  
                return function c(m, k) {  
                    if (k == null) {  
                        k = document;  
                    }  
                    var h = [], g = k.getElementsByTagName("INPUT"), d = g.length, l = new RegExp("(^|\\s)" + m + "(\\s|$)"), f, e;  
                    for (f = 0, e = 0; f < d; f++) {  
                        if (l.test(g[f].className)) {  
                            h[e] = g[f];  
                            e++;  
                        }  
                    }  
                    return h;  
                }(b, a);  
            }  
        }  
 		
var picnum=document.getElementsByTagName("li").length;
var imgNum=1;

function upNext(bigimg){	
	var width	= bigimg.width;
	var height	= bigimg.height;
	bigimg.onmousemove=function(){
		if(event.offsetX<width/2){
			bigimg.style.cursor	= 'url(/Public/Home/sucai/view/images/arr_left.cur),auto';
		}else{
			bigimg.style.cursor	= 'url(/Public/Home/sucai/view/images/arr_right.cur),auto';
		}
	}
	bigimg.onclick=function(){
		/*var curid = getElementsByClassName(document,"current");
		curid = (curid[0].id).substring(1);*/
		var curid = location.hash;
		curid = curid.substring(2);
		//alert(curid);
		imgNum=curid;
		var str = bigimg.style.cursor;
		var reg = /arr_left/;
		if(reg.test(str)){	
			//left
			if(imgNum<=1){
				imgNum=picnum;
			}else{
				imgNum--;
			}					
		}else{
			//right
			if(imgNum>=picnum){
				imgNum=1;					
			}else{
				imgNum++;					
			}
			
		}
		var urlstr = location.href;
		var urlarry = urlstr.split('#');
		location.href=urlarry[0]+'#p'+imgNum;
		setContentTab('p',imgNum,picnum);
	}
}