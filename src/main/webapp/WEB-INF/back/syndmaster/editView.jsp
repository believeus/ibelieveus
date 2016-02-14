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
		$(".select").find("option[value='${syndmaster.pulse}']").attr("selected",true);
		$("select[name='pulse']").change(function(){
			$(this).parent().find("span[id='pulseMsg']").text("更新中");
			var obj=$(this);
			var pulse=$(this).children('option:selected').val();
			var syndmasterId=$("#syndmasterId").val();
			var data="id="+syndmasterId+"&pulse="+pulse;
			$.ajax({
				type : "POST",
				url : "/admin/syndmaster/updatePluse.jhtml",
				data : data,
				success : function(result) {
					if(result=='true'){
						$(obj).parent().parent().find("span[id='pulseMsg']").text("已更新");
					}
				}
			}); 
			
		});
		
		$("input[name='synd']").blur(function(){
			var syndmasterId=$("#syndmasterId").val();
			var syndname=$(this).val();
			if(syndname!=""){
				var data="id="+syndmasterId+"&syndname="+syndname;
				$.ajax({
					type : "POST",
					url : "/admin/syndmaster/updatesyndname.jhtml",
					data : data,
					success : function(result) {
						if(result=='true'){
							$(this).parent().find("span[id='msg']").text("更新成功");
						}else{
							$(this).parent().find("span[id='msg']").text("更新失败");
						}
					}
				}); 
			}
		});
	});
	
 	var Tr=function(){
		this.addmaster=function(obj){
			var tr="<tr>"+
					  "<th>主证</th>"+
					  "<td>"+
					  	"<input name='syndmaster' class='text'/>"+
					  	"<input type='hidden' name='hiddenmaster'/>"+
						"<input value='删除' onclick='new Tr().clearmajor(this)' style='margin-left:5px;' type='button' class='button'/>"+
						"<input value='更新' type='button' class='button' onclick='new Tr().updatemajor(this)'/>"+
						"<span id='msg'></span>"+
					  "</td>"+
					"</tr>";
			$("#tr").after(tr);
		};
		this.addminor=function(obj){
			var tr="<tr>"+
			  "<th>从症</th>"+
			  "<td>"+
			  	"<input name='syndminor' class='text'/>"+
				"<input value='删除' onclick='new Tr().clearminor(this)' style='margin-left:5px;' type='button' class='button'/>"+
				"<input value='更新' type='button' class='button' onclick='new Tr().updateminor(this)'/>"+
				"<span id='msg'></span>"+
			  "</td>"+
			"</tr>";
			$("#trP").after(tr);
		};
		
		
		this.updateminor=function(obj){
			var syndmasterId=$("#syndmasterId").val();
			var syndminor=$(obj).parent().find("input[name='syndminor']").val();
			if(syndminor!=""){
				var data="id="+syndmasterId+"&syndminor="+syndminor;
				$.ajax({
					type : "POST",
					url : "/admin/syndminor/updateminor.jhtml",
					data : data,
					success : function(result) {
						if(result=='true'){
							$(obj).parent().find("span[id='msg']").text("更新成功");
						}else{
							$(obj).parent().find("span[id='msg']").text("更新失败");
						}
					}
				}); 
			}
		};
		
		this.clearminor=function(obj){
			$(obj).parent().find("span[id='msg']").text("");
			var syndmasterId=$("#syndmasterId").val();
			var syndminor=$(obj).parent().find("input[name='syndminor']").val();
			if(syndminor!=""){
				var data="id="+syndmasterId+"&syndminor="+syndminor;
				$.ajax({
					type : "POST",
					url : "/admin/syndminor/delete.jhtml",
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
		
		this.clearmajor=function(obj){
			$(obj).parent().find("span[id='msg']").text("");
			var syndmasterId=$("#syndmasterId").val();
			var majorid=$(obj).parent().find("input[name='majorid']").val();
			if(majorid!=""){
				var data="id="+syndmasterId+"&majorid="+majorid;
				$.ajax({
					type : "POST",
					url : "/admin/syndmaster/delete.jhtml",
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
		this.updatemajor=function(obj){
			$(obj).parent().find("span[id='msg']").text("");
			var syndmasterId=$("#syndmasterId").val();
			var syndmajor=$(obj).parent().find("input[name='syndmajor']").val();
			var majorid=$(obj).parent().find("input[name='majorid']").val();
			
			if(syndmajor!=""){
				var data="id="+syndmasterId+"&syndmajor="+syndmajor+"&majorid="+majorid;
				$.ajax({
					type : "POST",
					url : "/admin/syndmaster/update.jhtml",
					data : data,
					success : function(result) {
						if(result=='true'){
							$(obj).parent().find("span[id='msg']").text("已更新");
						}else{
							$(obj).parent().find("span[id='msg']").text("该病症已存在，请填写其他病症️");
						}
					}
				}); 
			}else{
				$(obj).parent().find("span[id='msg']").text("必填");
			}
		};
		
	};
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">内容管理</a> &raquo; 编辑病证
	</div>
	<form id="inputForm" action="/admin/syndmaster/update.jhtml" method="post" >
		<input type="hidden" name="id" id="syndmasterId" value="${syndmaster.id }"/>
		<table class="input">
			<tr id="tr">
				<th>
					病证:
				</th>
				<td>
					<input type="text" id="synd" class="text" name="synd" value="${syndmaster.synd }"/>
					<input type="button" class="button" value="添加主症状" onclick="new Tr().addmaster(this)"/>
					<span id='msg'></span>
				</td>
			</tr>
			<c:forEach items="${syndmaster.syndmajors }" var="syndmajor">
				<tr>
				<th>主证</th>
				<td>
					<input type="text" class="text" value="${syndmajor.synd }" name='syndmajor'/>
					<input value="${syndmajor.id}" type="hidden" name="majorid"/>
					<input value='删除' onclick="new Tr().clearmajor(this)"  style="margin-left:2px;"  type="button" class="button"/>
					<input value='更新' onclick="new Tr().updatemajor(this)" style="margin-left:-4px;" type="button" class="button"  />
				</td>
				</tr>
			</c:forEach>
			<tr id="trP">
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
					<input type="button" class="button" value="添加从证" onclick="new Tr().addminor(this)"/>
					<span id="pulseMsg"></span>
				</td>
			</tr>
			<c:forEach items="${syndmaster.syndminors}" var="syndminor">
				<tr>
					<th>从症</th>
					<td>
						<input value="${syndminor.synd}" class="text" name="syndminor"/>
						<input value="删除" onclick="new Tr().clearminor(this)" style="margin-left:2px;" type="button" class="button"/>
						<input value="更新" type="button" class="button" style="margin-left: -5px;" onclick="new Tr().updateminor(this)"/>
						<span id='msg'></span>
					</td>
				</tr>
			
			</c:forEach>
			<tr>
				<th>
					病症解释:
				</th>
				<td>
					<input type="text" name="description" class="text" style="width: 500px;" value="${syndmaster.description}"/>
				</td>
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="button" class="button" value="返回" onclick="javascript:window.location.href='/admin/syndmaster/list.jhtml'"/>
				</td>
			</tr>
		</table>
		</form>
		
</body>
</html>
