<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />

<title>用户登录</title>

<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="static/public/css/frontCss/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/static/public/js/jquery.js"></script>
<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
<script type="text/javascript">
		$().ready(function() {
		    $("#formLogin").validate({
		        rules: {
		            password: {
		                required: true
		            },
		            email: {
		                required: true
		            }
		        },
		        messages: {
		            password: {
		                required: "<font color='red'>&nbsp&nbsp密码必填</font>"
		            },
		            email: {
		                required: "<font color='red'>&nbsp&nbspemail必填</font>"
		               
		            }
		        },
		        submitHandler:function() {
		        	var url = "<%=basePath%>"+"submit/login.jhtml";
					//定义一个数组,js的数组就是json串
					var param={};
					param.email=$("#email").val();
					param.password=$("#password").val();
			        $.ajax({
			            type: "post",
			            cache: false,
			            dataType: "json",
			            url: url,
			            data: param,
			            beforeSend: function(XMLHttpRequest){
			                //do something before submit...
			            },
			            success: function(data, textStatus){
			                //do something after submited...
			                if(data.msg=="success"){
			                	 window.location.href="<%=basePath%>";
			                }else{
			                	 alert(data.msg);
			                }
			            	
			            },
			            complete: function(data,XMLHttpRequest, textStatus){
			                //alert(data.msg);
			            }
			        });
	            }
		    });
			
		});
	
</script>
</head>
<body>

	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->
	<div class="block box">
		<div id="ur_here">
			<div class="box">
				<div id="ur_here">
					当前位置: <a href=".">首页</a>
					<code>&gt;</code>
					用户登录
				</div>
			</div>
			<div class="blank"></div>
		</div>
	</div>
	<div class="blank"></div>
	<div class="usBox clearfix">
		<div class="logtitle">用户登录</div>
		<div class="usBox_1 f_l">
			<form name="formLogin" id="formLogin" action="#" method="post" >
				<table width="100%" border="0" align="left" cellpadding="3"
					cellspacing="5">
					<tr>
						<td width="20%" align="right">邮箱</td>
						<td width="80%">
							<input name="email" id="email" type="text" size="25"class="inputBg" />
						</td>
					</tr>
					<tr>
						<td align="right">密码</td>
						<td><input name="password" id="password" type="password" size="15"class="inputBg" /></td>
					</tr>
					<!-- <tr>
						<td colspan="2" style="text-indent:140px;"><input
							type="checkbox" value="1" name="remember" id="remember" /><label
							for="remember">请保存我这次的登录信息。</label></td>
					</tr> -->
					<tr>
						<td>&nbsp;</td>
						<td align="left">
						 	<input type="submit" name="submit" value="" class="us_Submit" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td><a href="user.php?act=qpassword_name" class="f3">密码问题找回密码</a>&nbsp;&nbsp;&nbsp;<a
							href="user.php?act=get_password" class="f3">注册邮件找回密码</a></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="usTxt">
			<strong>如果您不是会员，请注册</strong> <br /> <strong class="f4">友情提示：</strong><br />
			不注册为会员也可在本店购买商品<br /> 但注册之后您可以：<br /> 1. 保存您的个人资料<br /> 2.
			收藏您关注的商品<br /> 3. 享受会员积分制度<br /> 4. 订阅本店商品信息 <br /> <br /> <a
				href="user.php?act=register"><img
				src="/static/public/images/bnt_ur_reg.gif" /></a>
		</div>
	</div>
	<div class="blank"></div>
	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->
</body>
</html>
