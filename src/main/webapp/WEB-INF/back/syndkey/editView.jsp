<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title></title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
	<style type="text/css">
		table.input th {
		    font-size: 13px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
		$("#inputForm").validate({
			 rules: {
				 synd:{
					  required: true
	                }
				 }
				
		 });
	});
 	var Tr=function(){
		this.add=function(obj){
			var tr="<tr><th>要点:</th><td><input name='keypoint' class='text'/><input value='删除' onclick='new Tr().clear(this)' style='margin-left:5px;' type='button' class='button'/></td></tr>";
			$("#tr").after(tr);
		};
		this.clear=function(obj){
			$(obj).parent().parent().remove();
		};
	};
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">内容管理</a> &raquo; 编辑病证
	</div>
	<form id="inputForm" action="/admin/syndset/update.jhtml" method="post" >
		<input type="hidden" name="id" value="${syndkey.id }"/>
		<table class="input">
			<tr id="tr">
				<th>
					病证:
				</th>
				<td>
					<input type="text" id="synd" class="text" name="synd" value="${syndkey.synd }"/>
					<input type="button" class="button" value="添加" onclick="new Tr().add(this)"/>
				</td>
			</tr>
			<tr>
				<th>
					病症解释:
				</th>
				<td>
					<input type="text" name="description" class="text" style="width: 500px;" value="${syndkey.description}"/>
				</td>
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="javascript:window.location.href='/admin/syndset/list.jhtml'"/>
				</td>
			</tr>
		</table>
		</form>
		
</body>
</html>
