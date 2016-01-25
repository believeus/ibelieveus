<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title></title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
<style type="text/css">
table.input th {
	font-size: 13px;
}

.list_box {
	position: relative;
	width: 178px;
	background: #FFFFFF;
	border: 1px solid #CCC;
}

.keywords_list {
	margin: 0;
	padding: 0;
	list-style: none;
}

.hover {
	background: #EEEEEE;
	color: #333333;
	cursor:pointer;
}
</style>
<script type="text/javascript">
	
		$(function(){
			
			 $("#inputForm").validate({
				 rules: {
					 title:{
						  required: true,
		                }
					 }
					
			 });
			$('.list_box').hide();
			 //在表格中添加一行
			 var index=1;
			 $("#add_synd").click(function(){
			 	 var trHTML = "<tr id=trId"+index+">"+
			 	 				"<th>临床症状:</th>"+
			 	 				  "<td>"+
			 	 				  	"<input id='syndname' type='text' name='newsynd' onkeyup='new Utils().autocomplete(this)' class='text' style='margin-right:5px;' maxlength='200' />"+
			 	 				  	"<input value='' name='oldsynd'  type='hidden' />"+
			 				    	"<input type='button'  onclick='new Utils().update(this)' class='button' value='更新'/>"+
			 	 				  	"<input type='button' class='button' onclick='new Utils().clear(this)' style='color: red;' value='删除'/>"+
			 	 				  	"<span id='result'></span>"+
			 	 				  	"<div class='list_box'></div>"+
			 	 				  "</td>"+
			 	 				"</tr>";
				 $("#tr0").after(trHTML);
				 index++;
			 });
			 
		 
		});
		 
	var Utils = function() {
		//共有方法
		this.autocomplete = function(obj) {
			var parent = $(obj).parent();
			var keywords = $(obj).val();
			var data = 'keywords=' + keywords;
			$.ajax({
				type : "POST",
				url : "/admin/synd/getSynd.jhtml",
				data : data,
				success : function(html) {
					parent.find('.list_box').show();
					parent.find('.list_box').html(html);
					parent.find('.list_box span').hover(function() {
						$(this).addClass('hover');
					}, function() {
						$(this).removeClass('hover');
					});
					parent.find('.list_box span').click(function() {
						$(obj).val($(this).text());
						parent.find('.list_box').hide();
					});
				}
			});
			return false;
		};
		
		this.clear=function(obj){
			var synd_id=$("#synd-id").val();
			var syndname = $(obj).parent().find("#syndname").val();
			var data='id='+synd_id+"&syndname="+syndname;
			$.ajax({
				type : "POST",
				url : "/admin/synd/deletesynd.jhtml",
				data : data,
				success : function(html) {
					$(obj).parent().parent().remove();
				}
			});
			return false;
		};
		this.update=function(obj){
			var id=$("#synd-id").val();
			var newsynd=$(obj).parent().find("input[name='newsynd']").val();
			var oldsynd=$(obj).parent().find("input[name='oldsynd']").val();
			var data="id="+id+"&newsynd="+newsynd+"&oldsynd="+oldsynd;
			$.ajax({
				type : "POST",
				url : "/admin/synd/update.jhtml",
				data : data,
				success : function(result) {
					if(result=="false"){
					  $(obj).parent().find("span").text("已存在");
					}else if(result=="true"){
						$(obj).parent().find("span").text("已更新");
						$(obj).parent().find("input[name='oldsynd']").val(newsynd);
					}else if(result=="empty"){
						$(obj).parent().find("span").text("必填");
					}
				}
			});
			return false;
		};
	}
</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加病证
	</div>
	<form id="inputForm" action="/admin/synd/update.jhtml" method="post">
	  <input type="hidden" name="id" id="synd-id" value="${synd.id}"/>
		<table class="input" id="detal_tab">
			<tr id="tr0">
				<th>
					病证名:
				</th>
				<td>
					<input type="text" name="title" id="title"  value="${synd.title}" class="text" maxlength="200" />
					<input type="button" class="button" id="add_synd" value="添加" />
				</td>
			</tr>
			<c:set var="syndList" value="${fn:split(synd.synd, ' ')}" />
			<c:forEach items="${syndList}" var="syndname" varStatus="status">
				<tr id="trId${status.index+1}"> 
			 	<th>
					临床症状:
				</th>
			 	<td>
			    	<input value="${syndname}" name="newsynd" id="syndname" class="text" onkeyup="new Utils().autocomplete(this)"/>
			    	<input value="${syndname}" name="oldsynd"  type="hidden" />
			    	<input type="button"  onclick="new Utils().update(this)" class="button" value="更新"/>
			    	<input type="button" id="add" style="color: red;margin-left: -4px" onclick="new Utils().clear(this)" class="button" value="删除"/>
			    	<span id="result"></span>
			    	<div class="list_box"></div>
			    </td>
			 </tr>
			</c:forEach>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="button" class="button" value="返回"  onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
