<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>​
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			background-color: #016aa9;
			overflow:hidden;
		}
		.STYLE1 {
			color: #000000;
			font-size: 12px;
		}
	</style>
  </head>
  
  <body>
    <!-- Begin Name:wuqiwei 此处必须加：不加验证之后就不能表单提交了,所以如果已经验证直接跳转到/admin/manager.jhtml页面 -->
     <shiro:authenticated>
      <script type="text/javascript">
        window.location.href ="/admin/manager.jhtml";
      </script>
	</shiro:authenticated>
	<!-- End Name:wuqiwei 此处必须加：不加验证之后就不能表单提交了,所以如果已经验证直接跳转到/admin/manager.jhtml页面 -->
	
  	<form action="/admin/login.jhtml" method="post">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td><table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
	      <tr>
	        <td height="235" background="/static/public/images/login_03.gif">&nbsp;</td>
	      </tr>
	      <tr>
	        <td height="53"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td width="394" height="53" background="/static/public/images/login_05.gif">&nbsp;</td>
	            <td width="206" background="/static/public/images/login_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="16%" height="25"><div align="right"><span class="STYLE1">用户</span></div></td>
	                <td width="57%" height="25"><div align="center">
	                  <input type="text" name="username" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
	                </div></td>
	                <td width="27%" height="25">&nbsp;</td>
	              </tr>
	              <tr>
	                <td height="25"><div align="right"><span class="STYLE1">密码</span></div></td>
	                <td height="25"><div align="center">
	                  <input type="password" name="password" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
	                </div></td>
	               <!--  <td height="25"><div align="left"><img src="/static/public/images/dl.gif" width="49" height="18" border="0"></div></td> -->
	              	<td><input type="submit" value="提交"/></td>
	              </tr>
	            </table></td>
	            <td width="362" background="/static/public/images/login_07.gif">&nbsp;</td>
	          </tr>
	        </table></td>
	      </tr>
	      <tr>
	        <td height="213" background="/static/public/images/login_08.gif">&nbsp;</td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
	</form>
  </body>
</html>
