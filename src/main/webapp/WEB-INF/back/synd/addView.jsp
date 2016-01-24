<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<script type="text/javascript" src="/static/public/js/common.js"></script>
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
				 title:{
					  required: true,
					  remote: {
	                        url: "/admin/synd/ajaxTitle.jhtml",
	                        type: "POST",
	                        data: {
	                        	title: function () {
	                                return $("#title").val();
	                            }
	                        }
	                    }
	                }
				 },
			 messages: {
				 title:{
					 remote:" 已存在"
				 }
			 }
		 });
		
		 //在表格中添加一行
		 var tr_index=0;
		 $("#add_synd").click(function(){
			 var delTr="$('#trId_"+tr_index+"').remove()";
		 	 var trHTML = "<tr id=trId_"+tr_index+"><th></th><td><input  type='text' name='synd' class='text' style='margin-right:8px;' maxlength='200' /><input type='button' value='删除' class='button' onclick="+delTr+" style='color: red;margin-left:-2px;'></td></tr>";
			 $("#tr_001").after(trHTML);
			 tr_index++;
		 });
	});
	
	</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加病证
	</div>
	<form id="inputForm" action="/admin/synd/save.jhtml" method="post">
		<table class="input" id="detal_tab">
			<tr>
				<th>
					病证名:
				</th>
				<td>
					<input type="text" name="title" id="title" class="text" maxlength="200" />
				</td>
			</tr>
			<tr id="tr_001">
				<th>
					临床症状:
				</th>
				<td>
					<input type="text" name="synd" class="text" maxlength="200" />
					<input type="button" id="add_synd" class="button" value="添加" />
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
