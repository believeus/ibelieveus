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
<title>角色列表</title>
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
</style>
<script type="text/javascript">
$().ready(function() {


});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 内容列表 <span>共${dataCenters.total}条记录</span>
	</div>
	<div class="bar">
			<a href="/admin/addRole.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" class="current" val="username">管理员登录名</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	<form id="listForm" action="list.jhtml" method="post">
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort">角色名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">描述</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">操作</a>
				</th>
			</tr>
			<c:forEach var="role" items="${roles}">
				<tr>
					<td>
						${role.roleName}
					</td>
					<td>
						${role.description}
					</td>
					<c:choose>
						<c:when test="${role.admin.id == 1}">
							 <td>
								<a href="javascript:void(0)" onclick="alert('最高权限不可编辑')">[编辑权限]</a>
								<a href="javascript:void(0)" onclick="alert('最高权限不可删除')">[删除]</a>
							 </td>
						</c:when>
						<c:otherwise>
						   <td>
							  <a href="/admin/power.jhtml?roleId=${role.id}">[编辑权限]</a>
							  <a href="/admin/deleteRole.jhtml?roleId=${role.id}">[删除]</a>
						   </td>
						</c:otherwise>
					</c:choose>
					
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>