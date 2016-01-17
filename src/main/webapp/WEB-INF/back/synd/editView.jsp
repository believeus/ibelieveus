<%@page import="cn.believeus.model.Tsynd"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
	</style>
	<script type="text/javascript">
	$().ready(function() {
	
		var editor = new UE.ui.Editor();
	    editor.render('editor');
	    editor.addListener('contentchange',function(){
	        this.sync();
	        $('textarea').valid();
	    });
	    
	    var editor1 = new UE.ui.Editor();
	    editor1.render('editor1');
	    editor1.addListener('contentchange',function(){
	        this.sync();
	        $('#editor1').valid();
	    });
	
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				title: "required",
				upload_img: "required",
			}
		});
		
		 //在表格中添加一行
		 var tr_index=1;
		 $("#add_synd").click(function(){
			 var delTr="$('#trId"+tr_index+"').remove()";
		 	 var trHTML = "<tr id=trId"+tr_index+"><th></th><td><input  type='text' name='synd' class='text' style='margin-right:8px;' maxlength='200' /><a href='javascript:void(0);' onclick="+delTr+" style='color: red;'>X</a></td></tr>";
			 $("#trId0").after(trHTML);
			 tr_index++;
		 });
	});
	
	</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加病证
	</div>
	<form id="inputForm" action="/admin/synd/update.jhtml" method="post">
	  <input type="hidden" name="id" value="${synd.id}"/>
		<table class="input" id="detal_tab">
			<tr>
				<th>
					病证名:
				</th>
				<td>
					<input type="text" name="title" value="${synd.title}" class="text" maxlength="200" />
					<a href="javascript:void(0);" id="add_synd" style="color: green;">++</a>
				</td>
			</tr>
			<c:forEach items="${synd.synd}" var="strSynd" varStatus="status">
				<tr id="trId${status.index }"> 
			 	<th>
					临床症状:
				</th>
			 	<td>
			    	<input value="${strSynd }" name="synd" class="text"/>
			    	<a href="javascript:void(0);" id="add" style="color: red;" onclick="$('#trId${status.index }').remove()">X</a>
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
