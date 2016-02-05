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
			var tr="<tr>"+
					  "<th>辩证要点:</th>"+
					  "<td>"+
					  	"<input name='keypoint' class='text'/>"+
						"<input value='删除' onclick='new Tr().clear(this)' style='margin-left:5px;' type='button' class='button'/>"+
						"<input value='更新' type='button' class='button' onclick='new Tr().update(this)'/>"+
						"<span id='msg'></span>"+
					  "</td>"+
					"</tr>";
			$("#tr").after(tr);
		};
		this.clear=function(obj){
			$(obj).parent().find("span[id='msg']").text("");
			var syndkeyId=$("#syndkeyId").val();
			var keypoint=$(obj).parent().find("input[name='keypoint']").val();
			if(keypoint!=""){
				var data="id="+syndkeyId+"&keypoint="+keypoint;
				$.ajax({
					type : "POST",
					url : "/admin/syndkey/delete.jhtml",
					data : data,
					success : function(result) {
						if(result=='true'){
							$(obj).parent().parent().remove();
						}else{
							$(obj).parent().find("span[id='msg']").text("删除失败");
						}
					}
				}); 
			}else{
				$(obj).parent().parent().remove();
			}
		};
		this.update=function(obj){
			$(obj).parent().find("span[id='msg']").text("");
			var syndkeyId=$("#syndkeyId").val();
			var keypoint=$(obj).parent().find("input[name='keypoint']").val();
			if(keypoint!=""){
				var data="id="+syndkeyId+"&keypoint="+keypoint;
				$.ajax({
					type : "POST",
					url : "/admin/syndkey/update.jhtml",
					data : data,
					success : function(result) {
						if(result=='true'){
							$(obj).parent().find("span[id='msg']").text("已更新");
						}else{
							$(obj).parent().find("span[id='msg']").text("已存在");
						}
					}
				}); 
			}else{
				$(obj).parent().find("span[id='msg']").text("必填");
			}
		};
		this.updatePulse=function(obj){
			var pulse=$(obj).parent().find("input[name='pulse']").val();
			var syndkeyId=$("#syndkeyId").val();
			var data="id="+syndkeyId+"&pulse="+pulse;
			$.ajax({
				type : "POST",
				url : "/admin/syndkey/updatePluse.jhtml",
				data : data,
				success : function(result) {
					if(result=='true'){
						$(obj).parent().find("span[id='pulseMsg']").text("已更新");
					}
				}
			}); 
		};
	};
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">内容管理</a> &raquo; 编辑病证
	</div>
	<form id="inputForm" action="/admin/syndkey/update.jhtml" method="post" >
		<input type="hidden" name="id" id="syndkeyId" value="${syndkey.id }"/>
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
			<c:forEach items="${syndkey.syndsetList }" var="syndset">
				<tr>
				<th>辩证要点</th>
				<td>
					<input type="text" class="text" value="${syndset.synd }" name='keypoint'/>
					<input value='删除' onclick="new Tr().clear(this)"  style="margin-left:2px;"  type="button" class="button"/>
					<input value='更新' onclick="new Tr().update(this)" style="margin-left:-4px;" type="button" class="button"  />
				</td>
				</tr>
			</c:forEach>
			<tr>
				<th>脉象</th>
				<td>
					<input class="text" name="pulse" value="${syndkey.pulse}"/>
					<input value='更新' onclick="new Tr().updatePulse(this)" style="margin-left:2px;" type="button" class="button"  />
					<span id="pulseMsg"></span>
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
					<input type="button" class="button" value="返回" onclick="javascript:window.location.href='/admin/syndkey/list.jhtml'"/>
				</td>
			</tr>
		</table>
		</form>
		
</body>
</html>
