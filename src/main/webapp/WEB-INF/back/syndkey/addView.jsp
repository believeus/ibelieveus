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
	 <script type="text/javascript" src="/static/public/js/jQuery.easyui.js"></script>
	 <link rel="stylesheet" type="text/css" href="/static/public/js/themes/default/easyui.css" />
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
	var SyndAjax=function(){
		this.send=function(obj){
			var synd=$(obj).val();
			if(synd!=null){
				var data="synd="+synd;
				$.ajax({
					type : "POST",
					url : "/admin/syndkey/ajaxSynd.jhtml",
					data : data,
					success : function(result) {
						if(result!='false'){
							 $.messager.confirm('系统提示', '该《证》已存在,为您跳转到编辑吗️?', function(r) {

				                    if (r) {
				                    	window.location.href="/admin/syndkey/editView.jhtml?id="+result;
				                    }
				                });
							
						}
					}
				}); 
			}
			
		};
	}
 	
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">内容管理</a> &raquo; 添加病证
	</div>
	<form id="inputForm" action="/admin/syndkey/save.jhtml" method="post" >
		<table class="input">
			<tr id="tr">
				<th>
					病证:
				</th>
				<td>
					<input type="text" id="synd" class="text" name="synd"  onblur="new SyndAjax().send(this)"/>
				</td>
			</tr>
			<tr>
				<th>辩证要点</th>
				<td><input name="keypoint" class="text"/></td>
			</tr>
			<tr>
				<th>
					病症解释:
				</th>
				<td>
					<input type="text" name="description" class="text" style="width: 500px;" value=""/>
				</td>
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="javascript:window.location.href='/admin/syndset/list.jhtml'"/>
					<span>只需添加一个关键病症，点击确定按钮将会跳转到编辑页面！</span>
				</td>
			</tr>
		</table>
		</form>
		
</body>
</html>
