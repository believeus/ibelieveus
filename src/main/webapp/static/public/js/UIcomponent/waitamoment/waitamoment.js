//显示等待窗口
/**
 * 使用方法 
 *    var waitamoment=new waitamoment();
 *    messageDiv.show();
 * */
var Waitamoment=function() {
   this.show=function(){
	   var msgw, msgh, bordercolor;
	    msgw = 32; //提示窗口的宽度 
	    msgh = 32; //提示窗口的高度 
	    bordercolor = "none"; //提示窗口的边框颜色 
	    titlecolor = "#99CCFF"; //提示窗口的标题颜色 

	    var bgObj = document.createElement("div");
	    bgObj.setAttribute('id', 'bgDiv');
	    bgObj.style.position = "absolute";
	    bgObj.style.top = "0";
	    bgObj.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
	    bgObj.style.opacity = "0.6";
	    bgObj.style.left = "0";
	    bgObj.style.width =  window.screen.availWidth + "px";
	    bgObj.style.height =  document.body.scrollHeight + "px";
	    document.body.appendChild(bgObj);
	    var msgObj = document.createElement("div");
	    msgObj.setAttribute("id", "msgDiv");
	    msgObj.setAttribute("align", "center");
	    msgObj.style.position = "fixed";
	    msgObj.style.backgroundImage = "url(/static/public/js/UIcomponent/waitamoment/processImg.gif)";
	    msgObj.style.font = "12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
	    // ie 下不行，所以忽略掉。
	    //msgObj.style.border = "1px solid " + bordercolor;
	    msgObj.style.width = msgw + "px";
	    msgObj.style.height = msgh + "px";
	    msgObj.style.top ="45%";
	    msgObj.style.left ="50%";
	    msgObj.style.margin="0 auto";
	    document.body.appendChild(msgObj);  
   };  
};
