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
	<title>编辑新闻 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
	<style type="text/css">
		table.input th {
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
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 编辑新闻
	</div>
	<form id="inputForm" action="/admin/syndset/update.jhtml" method="post" >
		<input type="hidden" name="id" value="${syndset.id }"/>
		<table class="input">
			<tr>
				<th>
					病症:
				</th>
				<td>
					${syndset.synd }
				</td>
			</tr>
			<tr>
				<th>
					病症解释:
				</th>
				<td>
					<input type="text" name="description" class="text" style="width: 500px;" value="${syndset.description}"/>
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
	<c:if test="${!empty syndset.reflist}">
	<hr>
		<form action="/admin/syndset/deleteRef.jhtml" method="post">
		<input type="hidden"  name="id" value="${syndset.id }"/>
		<table class="input">
			<tr>
				<th>病症:</th>
				<td>${syndset.synd}</td>
			</tr>
			<tr>
				<th>可能病证</th>
				<td>
					<c:forEach items="${syndset.reflist}" var="refer" varStatus="status" >
						<c:if test="${!empty refer}">
							<c:choose>
								<c:when test="${status.index % 5==4}"><input type="checkbox" class="checkout" name="refers" value="${refer}"/>${refer}<br></c:when>
								<c:otherwise><input type="checkbox" class="checkout" name="refers" value="${refer}"/>${refer}</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				<td>
			</tr>
		  <tr>
		  	<th></th>
		  	<td><input type="submit" class="button" value="删除" /><input type="button" class="button" value="返回" onclick="javascript:window.location.href='/admin/syndset/list.jhtml'"/></td>
		  </tr>
		</table>
	</form>
	</c:if>
	
	
</body>
</html>
