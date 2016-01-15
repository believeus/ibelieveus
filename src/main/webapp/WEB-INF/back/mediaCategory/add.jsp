<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>添加媒体分类 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<link href="/static/public/css/easyui.css" rel="stylesheet" type="text/css" />
	<link href="/static/public/css/icon.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.easyui.min.js"></script>
	<style type="text/css">
		table.input th {
		    font-size: 13px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
	
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				parentId:"required",
				categoryName: "required"
			}
		});
		
	});
	
	</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加媒体分类 
	</div>
	<form id="inputForm" action="/admin/mcategory/save.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<th>
					上级分类:
				</th>
				<td>
					<input id="parentId" name="parentId" class="easyui-combobox" data-options="
						required:true,
						missingMessage:'不能为空',
				        valueField: 'id',
				        textField: 'categoryName',
				        url: '/admin/mcategory/categoryTree.jhtml?parentId=1'
				        ">
				</td>
			</tr>
			<tr>
				<th>
					分类名称:
				</th>
				<td>
					<input type="text" name="categoryName" class="text" maxlength="200" />
				</td>
			</tr>
			
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
