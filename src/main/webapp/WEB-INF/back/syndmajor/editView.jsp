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
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">内容管理</a> &raquo; 编辑病症
	</div>
	<form id="inputForm" action="/admin/syndmajor/update.jhtml" method="post" >
		<input type="hidden" name="id" value="${syndmajor.id }"/>
		<input type="hidden" name="hiddensynd" value="${syndmajor.synd }"/>
		<table class="input">
			<tr>
				<th>
					病症:
				</th>
				<td>
					<input type="text" id="synd" class="text" name="synd" value="${syndmajor.synd }"/>
				</td>
			</tr>
			<tr>
				<th>
					病症解释:
				</th>
				<td>
					<input type="text" name="description" class="text" style="width: 500px;" value="${syndmajor.description}"/>
				</td>
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="javascript:window.location.href='/admin/syndmajor/list.jhtml'"/>
				</td>
			</tr>
		</table>
		</form>
		<c:if test="${!empty syndmajor.reflist}">
		<hr>
		<form action="/admin/syndmajor/deleteRef.jhtml" method="post">
		<input type="hidden"  name="id" value="${syndmajor.id }"/>
		<table class="input">
			<tr>
				<th>关联病证</th>
				<td>
					<c:forEach items="${syndmajor.reflist}" var="refer" varStatus="status" >
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
		  	<td><input type="submit" class="button" value="删除" /><input type="button" class="button" value="返回" onclick="javascript:window.location.href='/admin/syndmajor/list.jhtml'"/></td>
		  </tr>
		</table>
	</form>
	</c:if>
		<form  method="post" action="/admin/syndmajor/savesmaybesynd.jhtml">
			<input type="hidden" name="id" value="${syndmajor.id }"/>
			<hr>
				<table class="input">
					<tr>
						<th>脏腑:</th>
						<td colspan="3">
						    <select name="maybesynd"  class="select">
								<option selected="selected"/>
								<option value="心">心</option>
								<option value="肝">肝</option>
								<option value="脾">脾</option>
								<option value="肺">肺</option>
								<option value="肾">肾</option>
								<option value="胃">胃</option>
								<option value="大肠">大肠</option>
								<option value="小肠">小肠</option>
							</select>
						</td>
					</tr>
					<tr >
						<th>八纲:</th>
						<td colspan="2">
							<span style="font-size: 14px;">阴阳:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="阴">阴</option>
								<option value="阳">阳</option>
							</select>
							<span style="font-size: 14px;">表里:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="表">表</option>
								<option value="里">里</option>
							</select>
							<span style="font-size: 14px;">虚实:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="虚">虚</option>
								<option value="实">实</option>
							</select>
							<span style="font-size: 14px;">寒热:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="寒" >寒</option>
								<option value="热">热</option>
							</select>
							
						</td>
					</tr>
					
					<tr>
						<th>气：</th>
						<td>
							<input name="maybesynd" value="气虚" type="checkbox" style="checkbox"/>气虚
							<input name="maybesynd" value="气陷" type="checkbox" style="checkbox"/>气陷
							<input name="maybesynd" value="气逆" type="checkbox" style="checkbox"/>气逆
							<input name="maybesynd" value="气滞" type="checkbox" style="checkbox"/>气滞
						</td>
					</tr>
					<tr>
						<th>血：</th>
						<td>
							<input name="maybesynd" value="血虚" type="checkbox" style="checkbox"/>血虚
							<input name="maybesynd" value="血淤" type="checkbox" style="checkbox"/>血淤
							<input name="maybesynd" value="血寒" type="checkbox" style="checkbox"/>血寒
							<input name="maybesynd" value="血热" type="checkbox" style="checkbox"/>血热
						</td>
					</tr>
					<tr>
						<th>六淫:</th>
						<td>
							<span style="font-size: 14px;">风淫:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="风" >风</option>
							</select>
					
							<span style="font-size: 14px;">暑淫:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="暑">暑</option>
							</select>
							
							<span style="font-size: 14px;">湿淫:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="湿">湿</option>
							</select>
							
							<span style="font-size: 14px;">燥淫:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="燥">燥</option>
							</select>
							
							<span style="font-size: 14px;">火淫:</span>
							<select name="maybesynd" class="select">
								<option value="" selected="selected"/>
								<option value="火">火</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>六经:</th>
						<td>
							<input name="maybesynd" value="太阳证" type="checkbox" style="checkbox"/>太阳证
							<input name="maybesynd" value="阳明证" type="checkbox" style="checkbox"/>阳明证
							<input name="maybesynd" value="少阳证" type="checkbox" style="checkbox"/>少阳证
							<input name="maybesynd" value="太阴证" type="checkbox" style="checkbox"/>太阴证
							<input name="maybesynd" value="少阴证" type="checkbox" style="checkbox"/>少阴证
							<input name="maybesynd" value="厥阴证" type="checkbox" style="checkbox"/>厥阴证
						</td>
					</tr>
					<tr>
						<th>备注:</th>
						<td><input type="text" class="text" name="maybesynd" /></td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input type="submit" class="button" value="确定"/>
							<input type="reset" class="button" value="清空" />
						</td>
					</tr>
				</table>
		</form>	
		<c:if test="${!empty syndmajor.syndmasters }">
		<script type="text/javascript">
			var Synd=function(){
			this.clear=function(obj){
				var syndmajorId=$("#syndmajor-id").val();
				var syndmasterId=$(obj).parent().find("input[name='syndmaster-id']").val();
				var data="syndmajorId="+syndmajorId+"&syndmasterId="+syndmasterId;
				$.ajax({
					type : "POST",
					url : "/admin/syndmajor/deletemaybesynd.jhtml",
					data : data,
					success : function(html) {
						if(html=="true"){
							$(obj).parent().parent().remove();
						}
					}
				});
			};
			};
		</script>
		<hr>
		<form action="#" method="post">
		<input type="hidden" name="id" id="syndmajor-id" value="${syndmajor.id}"/>
			<table class="input" style="width: 1000px;">
				<tr>
					<th>病证:</th>
					<td></td>
					<td>辩证要点</td>
				</tr>
				<c:forEach items="${syndmajor.syndmasters}" var="syndmaster">
				<tr>
					<th>可能病证:</th>
					<td>
						<input type="hidden" name="maybesynd" value="${syndmaster.synd}" />:${syndmaster.synd}
					</td>
					<td>
						<input type="hidden" name="syndmaster-id" value="${syndmaster.id}"/>
						<c:forEach items="${syndmaster.syndmajors }" var="syndmajor">
							<input class="text" name="syndpoint" readonly="readonly" style="width: 70px;" value="${syndmajor.synd}"/>
						</c:forEach>
						
						<input type="button" id="update" class="button" value="删除" onclick="new Synd().clear(this)"/>
						<span  id="msg"></span>
					</td>
				</tr>
				</c:forEach>
			</table>
		</form>
		</c:if>
</body>
</html>
