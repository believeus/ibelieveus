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
					url : "/admin/syndmaster/ajaxSynd.jhtml",
					data : data,
					success : function(result) {
						if(result!='false'){
							 $.messager.confirm('系统提示', '该《证》已存在,为您跳转到编辑!', function(r) {

				                    if (r) {
				                    	window.location.href="/admin/syndmaster/editView.jhtml?id="+result;
				                    }else{
				                    	window.location.href="/admin/syndmaster/editView.jhtml?id="+result;
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
	<form id="inputForm" action="/admin/syndmaster/save.jhtml" method="post" >
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
				<td><input name="syndmaster" class="text"/></td>
			</tr>
			<tr>
				<th>脉象</th>
				<td>
					<select class="select" name="pulse">
						 <option value=""></option>
						 <option value="浮脉">浮 脉</option>
						 <option value="沉脉">沉 脉</option>
						 <option value="迟脉">迟 脉</option>
						 <option value="数脉">数 脉</option>
						 <option value="滑脉">滑 脉</option>
						 <option value="涩脉">涩 脉</option>
						 <option value="虚脉">虚 脉</option>
						 <option value="实脉">实 脉</option>
						 <option value="长脉">长 脉</option>
						 <option value="短脉">短 脉</option>
						 <option value="洪脉">洪 脉</option>
						 <option value="微脉">微 脉</option>
						 <option value="紧脉">紧 脉</option>
						 <option value="缓脉">缓 脉</option>
						 <option value="芤脉">芤 脉</option>
						 <option value="弦脉">弦 脉</option>
						 <option value="革脉">革 脉</option>
						 <option value="牢脉">牢 脉</option>
						 <option value="濡脉">濡 脉</option>
						 <option value="弱脉">弱 脉</option>
						 <option value="散脉">散 脉</option>
						 <option value="细脉">细 脉</option>
						 <option value="伏脉">伏 脉</option>
						 <option value="动脉">动 脉</option>
						 <option value="促脉">促 脉</option>
						 <option value="结脉">结 脉</option>
						 <option value="代脉">代 脉</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					病症解释
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
