	var imgOpen = new Image();
	var imgClose = new Image();
	imgOpen.src = "images/b.gif"
	imgClose.src = "images/a.gif"

	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
	}
/*按比例生成缩略图*/
function ImgSize(obj, MaxW, MaxH)
{
    if (obj != null) imageObject = obj;
    var state=imageObject.readyState;
    var oldImage = new Image();
    oldImage.src = imageObject.src;
    var dW=oldImage.width; var dH=oldImage.height;
    if(dW>MaxW || dH>MaxH) {
        a=dW/MaxW; b=dH/MaxH; 
        if(b>a) a=b;
        dW=dW/a; dH=dH/a;
    }
    if(dW > 0 && dH > 0)
        imageObject.width=dW;imageObject.height=dH;
    if(state!='complete' || imageObject.width>MaxW || imageObject.height>MaxH) {
        setTimeout("ResizeImage(null,"+MaxW+","+MaxH+")",40); 
    }
}
//滚动评选构造函
var sina={$:function(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}},isIE:navigator.appVersion.indexOf("MSIE")!=-1?true:false,addEvent:function(l,i,I){if(l.attachEvent){l.attachEvent("on"+i,I)}else{l.addEventListener(i,I,false)}},delEvent:function(l,i,I){if(l.detachEvent){l.detachEvent("on"+i,I)}else{l.removeEventListener(i,I,false)}},readCookie:function(O){var o="",l=O+"=";if(document.cookie.length>0){var i=document.cookie.indexOf(l);if(i!=-1){i+=l.length;var I=document.cookie.indexOf(";",i);if(I==-1)I=document.cookie.length;o=unescape(document.cookie.substring(i,I))}};return o},writeCookie:function(i,l,o,c){var O="",I="";if(o!=null){O=new Date((new Date).getTime()+o*3600000);O="; expires="+O.toGMTString()};if(c!=null){I=";domain="+c};document.cookie=i+"="+escape(l)+O+I},readStyle:function(I,l){if(I.style[l]){return I.style[l]}else if(I.currentStyle){return I.currentStyle[l]}else if(document.defaultView&&document.defaultView.getComputedStyle){var i=document.defaultView.getComputedStyle(I,null);return i.getPropertyValue(l)}else{return null}}};

//滚动评选构造函数
//UI&UE Dept. mengjia
//080623
function ScrollPic(scrollContId,arrLeftId,arrRightId,dotListId){this.scrollContId=scrollContId;this.arrLeftId=arrLeftId;this.arrRightId=arrRightId;this.dotListId=dotListId;this.dotClassName="dotItem";this.dotOnClassName="dotItemOn";this.dotObjArr=[];this.pageWidth=0;this.frameWidth=0;this.speed=10;this.space=10;this.pageIndex=0;this.autoPlay=true;this.autoPlayTime=5;var _autoTimeObj,_scrollTimeObj,_state="ready";this.stripDiv=document.createElement("DIV");this.listDiv01=document.createElement("DIV");this.listDiv02=document.createElement("DIV");if(!ScrollPic.childs){ScrollPic.childs=[]};this.ID=ScrollPic.childs.length;ScrollPic.childs.push(this);this.initialize=function(){if(!this.scrollContId){throw new Error("必须指定scrollContId.");return};this.scrollContDiv=sina.$(this.scrollContId);if(!this.scrollContDiv){throw new Error("scrollContId不是正确的对象.(scrollContId = \""+this.scrollContId+"\")");return};this.scrollContDiv.style.width=this.frameWidth+"px";this.scrollContDiv.style.overflow="hidden";this.listDiv01.innerHTML=this.listDiv02.innerHTML=this.scrollContDiv.innerHTML;this.scrollContDiv.innerHTML="";this.scrollContDiv.appendChild(this.stripDiv);this.stripDiv.appendChild(this.listDiv01);this.stripDiv.appendChild(this.listDiv02);this.stripDiv.style.overflow="hidden";this.stripDiv.style.zoom="1";this.stripDiv.style.width="32766px";this.listDiv01.style.cssFloat="left";this.listDiv02.style.cssFloat="left";sina.addEvent(this.scrollContDiv,"mouseover",Function("ScrollPic.childs["+this.ID+"].stop()"));sina.addEvent(this.scrollContDiv,"mouseout",Function("ScrollPic.childs["+this.ID+"].play()"));if(this.arrLeftId){this.arrLeftObj=sina.$(this.arrLeftId);if(this.arrLeftObj){sina.addEvent(this.arrLeftObj,"mousedown",Function("ScrollPic.childs["+this.ID+"].rightMouseDown()"));sina.addEvent(this.arrLeftObj,"mouseup",Function("ScrollPic.childs["+this.ID+"].rightEnd()"));sina.addEvent(this.arrLeftObj,"mouseout",Function("ScrollPic.childs["+this.ID+"].rightEnd()"))}};if(this.arrRightId){this.arrRightObj=sina.$(this.arrRightId);if(this.arrRightObj){sina.addEvent(this.arrRightObj,"mousedown",Function("ScrollPic.childs["+this.ID+"].leftMouseDown()"));sina.addEvent(this.arrRightObj,"mouseup",Function("ScrollPic.childs["+this.ID+"].leftEnd()"));sina.addEvent(this.arrRightObj,"mouseout",Function("ScrollPic.childs["+this.ID+"].leftEnd()"))}};if(this.dotListId){this.dotListObj=sina.$(this.dotListId);if(this.dotListObj){var pages=Math.round(this.listDiv01.offsetWidth/this.frameWidth+0.4),i,tempObj;for(i=0;i<pages;i++){tempObj=document.createElement("span");this.dotListObj.appendChild(tempObj);this.dotObjArr.push(tempObj);if(i==this.pageIndex){tempObj.className=this.dotClassName}else{tempObj.className=this.dotOnClassName};tempObj.title="第"+(i+1)+"页";sina.addEvent(tempObj,"click",Function("ScrollPic.childs["+this.ID+"].pageTo("+i+")"))}}};if(this.autoPlay){this.play()}};this.leftMouseDown=function(){if(_state!="ready"){return};_state="floating";_scrollTimeObj=setInterval("ScrollPic.childs["+this.ID+"].moveLeft()",this.speed)};this.rightMouseDown=function(){if(_state!="ready"){return};_state="floating";_scrollTimeObj=setInterval("ScrollPic.childs["+this.ID+"].moveRight()",this.speed)};this.moveLeft=function(){if(this.scrollContDiv.scrollLeft+this.space>=this.listDiv01.scrollWidth){this.scrollContDiv.scrollLeft=this.scrollContDiv.scrollLeft+this.space-this.listDiv01.scrollWidth}else{this.scrollContDiv.scrollLeft+=this.space};this.accountPageIndex()};this.moveRight=function(){if(this.scrollContDiv.scrollLeft-this.space<=0){this.scrollContDiv.scrollLeft=this.listDiv01.scrollWidth+this.scrollContDiv.scrollLeft-this.space}else{this.scrollContDiv.scrollLeft-=this.space};this.accountPageIndex()};this.leftEnd=function(){if(_state!="floating"){return};_state="stoping";clearInterval(_scrollTimeObj);var fill=this.pageWidth-this.scrollContDiv.scrollLeft%this.pageWidth;this.move(fill)};this.rightEnd=function(){if(_state!="floating"){return};_state="stoping";clearInterval(_scrollTimeObj);var fill=-this.scrollContDiv.scrollLeft%this.pageWidth;this.move(fill)};this.move=function(num,quick){var thisMove=num/5;if(!quick){if(thisMove>this.space){thisMove=this.space};if(thisMove<-this.space){thisMove=-this.space}};if(Math.abs(thisMove)<1&&thisMove!=0){thisMove=thisMove>=0?1:-1}else{thisMove=Math.round(thisMove)};var temp=this.scrollContDiv.scrollLeft+thisMove;if(thisMove>0){if(this.scrollContDiv.scrollLeft+thisMove>=this.listDiv01.scrollWidth){this.scrollContDiv.scrollLeft=this.scrollContDiv.scrollLeft+thisMove-this.listDiv01.scrollWidth}else{this.scrollContDiv.scrollLeft+=thisMove}}else{if(this.scrollContDiv.scrollLeft-thisMove<=0){this.scrollContDiv.scrollLeft=this.listDiv01.scrollWidth+this.scrollContDiv.scrollLeft-thisMove}else{this.scrollContDiv.scrollLeft+=thisMove}};num-=thisMove;if(Math.abs(num)==0){_state="ready";if(this.autoPlay){this.play()};this.accountPageIndex();return}else{this.accountPageIndex();setTimeout("ScrollPic.childs["+this.ID+"].move("+num+","+quick+")",this.speed)}};this.next=function(){if(_state!="ready"){return};_state="stoping";this.move(this.pageWidth,true)};this.play=function(){if(!this.autoPlay){return};clearInterval(_autoTimeObj);_autoTimeObj=setInterval("ScrollPic.childs["+this.ID+"].next()",this.autoPlayTime*1000)};this.stop=function(){clearInterval(_autoTimeObj)};this.pageTo=function(num){if(_state!="ready"){return};_state="stoping";var fill=num*this.frameWidth-this.scrollContDiv.scrollLeft;this.move(fill,true)};this.accountPageIndex=function(){this.pageIndex=Math.round(this.scrollContDiv.scrollLeft/this.frameWidth);if(this.pageIndex>Math.round(this.listDiv01.offsetWidth/this.frameWidth+0.4)-1){this.pageIndex=0};var i;for(i=0;i<this.dotObjArr.length;i++){if(i==this.pageIndex){this.dotObjArr[i].className=this.dotClassName}else{this.dotObjArr[i].className=this.dotOnClassName}}}};

//Tab选项卡
function nTabs(tabObj,obj){
 var tabList = document.getElementById(tabObj).getElementsByTagName("li");
 for(i=0; i <tabList.length; i++)
 {
  if (tabList[i].id == obj.id)
  {
   document.getElementById(tabObj+"_Title"+i).className = "active";
      document.getElementById(tabObj+"_Content"+i).style.display = "block";
  }else{
   document.getElementById(tabObj+"_Title"+i).className = "normal";
   document.getElementById(tabObj+"_Content"+i).style.display = "none";
  }
 }
}

//输入数字
function   check_isnum()   
  {   
  if((window.event.keyCode>95&&window.event.keyCode<106)   
  ||(window.event.keyCode>47&&window.event.keyCode<59)   
  ||window.event.keyCode==8   
  ||window.event.keyCode==46   
  ||window.event.keyCode==37   
  ||window.event.keyCode==39)   
  {   
  }   
  else   {   
  alert("请您输入0-9之间的数字！");   
  return   false;   
  }   
    
  } 
  
  //反选
  function CheckOthers(form)
{
   for (var i=0;i<form.elements.length;i++)
   {
      var e = form.elements[i];
      if (e.checked==false)
      {
	     e.checked = true;
      }
      else
      {
	     e.checked = false;
      }
   }
}

function CheckAll(form)
{
   for (var i=0;i<form.elements.length;i++)
   {
      var e = form.elements[i];
      e.checked = true;
   }
}
//相关条目删除提示------------------------------------------------------------
function ConfirmDel(message)
{
   if (confirm(message))
   {
      document.formDel.submit()
   }
}
function display(ID)
{
	if (document.getElementById(ID).style.display == "none") {
		document.getElementById(ID).style.display = "";
	}else{
		document.getElementById(ID).style.display = "none";
	}
}