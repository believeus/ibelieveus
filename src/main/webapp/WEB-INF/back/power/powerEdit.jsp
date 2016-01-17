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
<title>权限管理</title>
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
	<c:forEach var="authority" items="${authoritys}">
	   $("input[value='${authority.authorityName}']").attr("checked",true);
	</c:forEach>
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 内容列表
	</div>
	<form id="listForm" action="/admin/updateRole.jhtml" method="post">
	    <input type="hidden" name="roleId" value="${roleId}"/>
	    <table class="input">
		  <tr>
			<th>
				<span class="requiredField">*</span>角色名:
			</th>
			<td>
				<input type="text" id="roleName" name="roleName" value="${role.roleName }"  class="text" maxlength="200" />
			</td>
		  </tr>
		   <tr>
			<th>
				<span class="requiredField">*</span>角色描述:
			</th>
			<td>
				<input type="text" id="description" name="description" value="${role.description }" class="text" maxlength="200" />
			</td>
		  </tr>
	    </table>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<a href="javascript:;" class="sort">栏目</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">查看</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">添加</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">修改</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">删除</a>
				</th>
			</tr>
			
			<<tr>
				<td>
					企业新闻管理
				</td>
				<td>
					<input type="checkbox" id="nv1" name="authority" value="newsDinamic:view" />
				</td>
				<td>
					<input type="checkbox" id="nv2" name="authority" value="newsDinamic:create" />
				</td>
				<td>
					<input type="checkbox" id="nv3" name="authority" value="newsDinamic:update"  />
				</td>
				<td>
					<input type="checkbox" id="nv4" name="authority" value="newsDinamic:delete" />
				</td>
			</tr>
			<tr>
				<td>
					服务范围管理
				</td>
				<td>
					<input type="checkbox" id="bv1" name="authority" value="business:view" />
				</td>
				<td>
					<input type="checkbox" id="bv2" name="authority" value="business:create" />
				</td>
				<td>
					<input type="checkbox" id="bv3" name="authority" value="business:update" />
				</td>
				<td>
					<input type="checkbox" id="bv4" name="authority" value="business:delete"  />
				</td>
			</tr>
			<tr>
				<td>
					企业案例管理
				</td>
				<td>
					<input type="checkbox" id="ev1" name="authority" value="example:view" />
				</td>
				<td>
					<input type="checkbox" id="ev2" name="authority" value="example:create" />
				</td>
				<td>
					<input type="checkbox" id="ev3" name="authority" value="example:update" />
				</td>
				<td>
					<input type="checkbox" id="ev4" name="authority" value="example:delete" />
				</td>
			</tr>
			<tr>
				<td>
					用户咨询管理
				</td>
				<td>
					<input type="checkbox" id="cv1" name="authority" value="contact:view" />
				</td>
				<td>
					<input type="checkbox" id="cv2" name="authority" value="contact:create" />
				</td>
				<td>
					<input type="checkbox" id="cv3" name="authority" value="contact:update" />
				</td>
				<td>
					<input type="checkbox" id="cv4" name="authority" value="contact:delete" />
				</td>
			</tr>
			<tr>
				<td>
					合作伙伴管理
				</td>
				<td>
					<input type="checkbox" id="pt1" name="authority" value="partners:view" />
				</td>
				<td>
					<input type="checkbox" id="pt2" name="authority" value="partners:create" />
				</td>
				<td>
					<input type="checkbox" id="pt3" name="authority" value="partners:update" />
				</td>
				<td>
					<input type="checkbox" id="pt4" name="authority" value="partners:delete" />
				</td>
			</tr>
			<tr>
				<td>
					企业信息管理
				</td>
				<td>
					<input type="checkbox" id="cv1" name="authority" value="companyMsg:view" />
				</td>
				<td>
					<input type="checkbox" id="cv2" name="authority" value="companyMsg:create" />
				</td>
				<td>
					<input type="checkbox" id="cv3" name="authority" value="companyMsg:update" />
				</td>
				<td>
					<input type="checkbox" id="cv4" name="authority" value="companyMsg:delete" />
				</td>
			</tr>
			<tr>
				<td>
					核心团队管理
				</td>
				<td>
					<input type="checkbox" id="tm1" name="authority" value="team:view" />
				</td>
				<td>
					<input type="checkbox" id="tm2" name="authority" value="team:create" />
				</td>
				<td>
					<input type="checkbox" id="tm3" name="authority" value="team:update" />
				</td>
				<td>
					<input type="checkbox" id="tm4" name="authority" value="team:delete" />
				</td>
			</tr>
			<tr>
				<td>
					banner管理
				</td>
				<td>
					<input type="checkbox" id="bn1" name="authority" value="banner:view" />
				</td>
				<td>
					<input type="checkbox" id="bn2" name="authority" value="banner:create" />
				</td>
				<td>
					<input type="checkbox" id="bn3" name="authority" value="banner:update" />
				</td>
				<td>
					<input type="checkbox" id="bn4" name="authority" value="banner:delete" />
				</td>
			</tr>
			<tr>
				<td>
					企业流程管理
				</td>
				<td>
					<input type="checkbox" id="ps1" name="authority" value="process:view" />
				</td>
				<td>
					<input type="checkbox" id="ps2" name="authority" value="process:create" />
				</td>
				<td>
					<input type="checkbox" id="ps3" name="authority" value="process:update" />
				</td>
				<td>
					<input type="checkbox" id="ps4" name="authority" value="process:delete" />
				</td>
			</tr>
			<tr>
				<td>
					企业客户管理
				</td>
				<td>
					<input type="checkbox" id="oc1" name="authority" value="ourcustomer:view" />
				</td>
				<td>
					<input type="checkbox" id="oc2" name="authority" value="ourcustomer:create" />
				</td>
				<td>
					<input type="checkbox" id="oc3" name="authority" value="ourcustomer:update" />
				</td>
				<td>
					<input type="checkbox" id="oc4" name="authority" value="ourcustomer:delete" />
				</td>
			</tr>
			<tr>
				<td>
					关于我们管理
				</td>
				<td>
					<input type="checkbox" id="cu1" name="authority" value="contactus:view" />
				</td>
				<td>
					<input type="checkbox" id="cu2" name="authority" value="contactus:create" />
				</td>
				<td>
					<input type="checkbox" id="cu3" name="authority" value="contactus:update" />
				</td>
				<td>
					<input type="checkbox" id="cu4" name="authority" value="contactus:delete" />
				</td>
			</tr>
			<tr>
				<td colspan="4">
				&nbsp;
				</td>
				<td>
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>