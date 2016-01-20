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
	<title>添加新闻 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
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
			$('.list_box').hide();
			 //在表格中添加一行
			 var index=1;
			 $("#add_synd").click(function(){
			 	 var trHTML = "<tr id=trId"+index+"><th>临床症状:</th><td><input id='syndname' type='text' name='synd' onkeyup='new Utils().autocomplete(this)' class='text' style='margin-right:8px;' maxlength='200' /><a href='javascript:void(0);' onclick='new Utils().kill(this)' style='color: red;'>X</a><div class='list_box'></div></td></tr>";
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
				url : "/autocomplete/getSynd.jhtml",
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
		
		this.kill=function(obj){
			var synd_id=$("#synd-id").val();
			var syndname = $(obj).parent().find("#syndname").val();
			var data='id='+synd_id+"&syndname="+syndname;
			$.ajax({
				type : "POST",
				url : "/delete/syndname.jhtml",
				data : data,
				success : function(html) {
					$(obj).parent().parent().remove();
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
					<input type="text" name="title" value="${synd.title}" class="text" maxlength="200" />
					<a href="javascript:void(0);" id="add_synd" style="color: green;">++</a>
				</td>
			</tr>
			<c:set var="syndList" value="${fn:split(synd.synd, ' ')}" />
			<c:forEach items="${syndList}" var="syndname" varStatus="status">
				<tr id="trId${status.index+1}"> 
			 	<th>
					临床症状:
				</th>
			 	<td>
			    	<input value="${syndname}" name="synd" id="syndname" class="text" onkeyup="auto(this)"/>
			    	<a href="javascript:void(0);" id="add" style="color: red;" onclick="new Utils().kill(this)">X</a>
			    	<div class="list_box">
						
					</div>
			    </td>
			 </tr>
			</c:forEach>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回"  onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
