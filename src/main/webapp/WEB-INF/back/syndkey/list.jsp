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
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 内容列表 <span>共${size}条记录</span>
	</div>
	<div>
		<div class="bar">
		<a href="/admin/syndset/addView.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
		<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">病证</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">辩证要点</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">病证解释</a>
				</th>
				<th>
					<a href="#"  class="sort">编辑</a>
				</th>
			</tr>
			<c:forEach var="syndkey" items="${page.content}" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${syndkey.id}" />
					</td>
					<td>
						${syndkey.synd}
					</td>
					<td>
						${syndkey.keypoint}
					</td>
					<td>
						${syndkey.description}
					</td>
					<td>
						<a href="/admin/syndkey/editView.jhtml?id=${syndkey.id}">[编辑]</a>
						<a href="/admin/syndset/delete.jhtml?id=${syndkey.id}">[删除]</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="/admin/syndset/list.jhtml" id="listForm">
			<jsp:include page="../include/pagination.jsp" flush="true" />
		</form>
	</div>
  </body>
</html>
