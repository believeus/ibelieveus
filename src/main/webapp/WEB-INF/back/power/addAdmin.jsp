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
<title>添加管理员</title>
<meta name="author" content="Believeus Team" />
<meta name="copyright" content="Believeus" />
<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/static/public/js/jquery.js"></script>
<script type="text/javascript" src="/static/public/js/common.js"></script>
<script type="text/javascript" src="/static/public/js/list.js"></script>
<style type="text/css">
	table.list td {
	    font-size: 13px;
	}
	
	table.input {
	    font-size: 13px;
	}
</style>
<script type="text/javascript">
$().ready(function() {
	$("#inputForm").submit(function() {
		var adminName = $("#adminName").val();
		var password = $("#password").val();
		var repass = $("#repass").val();
		if(password == ""){
			alert("密码必填");
			return false;
		}
		if(repass == ""){
			alert("确认密码必填");
			return false;
		}
		if(password != repass){
			alert("密码和确认密码不一致");
			return false;
		}
		if(adminName == ""){
			alert("用户名必填");
			return false;
		}
		return true;
   });
	
	// 焦点离开时，发送ajax请求,交互式事件
	$("#adminName").blur(function(){
		$.post('/admin/ajaxValidateAdmin.jhtml?adminName=' + $("#adminName").val(), function(msg) {
		if(msg == "exist"){
				$("#adminName").val("");
				alert("管理员名已被注册");
			}
		});
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加管理员
	</div>
	<form id="inputForm" action="/admin/addRoleForAdmin.jhtml" method="post">
		<table class="input">
			<tr>
				<th colspan="2" style="text-align: left; font-size: 15px; padding-left: 120px;">
					新建管理员
				</th>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>用户名:
				</th>
				<td>
					<input onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" type="text" id="adminName" name="adminName" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>描述:
				</th>
				<td>
					<input type="text" name="description" value="" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>角色权限:
				</th>
				<td>
					<select name="roleId">
						<c:forEach var="role" items="${roles}">
						   <c:if test="${role.roleName ne 'root' }">
							 <option value="${role.id }">${role.roleName}</option>
						   </c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>密码:
				</th>
				<td>
					<input type="password" value="" name="password" id="password" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>确认密码:
				</th>
				<td>
					<input type="password" value="" name="repass" id="repass" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="提交" />
					<input type="button" id="backButton" class="button" value="返回" onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>