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
    <title></title>
    <link href="static/public/css/alogin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- Begin Name:wuqiwei 此处必须加：不加验证之后就不能表单提交了,所以如果已经验证直接跳转到/admin/manager.jhtml页面 -->
     <shiro:authenticated>
      <script type="text/javascript">
        window.location.href ="/admin/manager.jhtml";
      </script>
	</shiro:authenticated>
	<!-- End Name:wuqiwei 此处必须加：不加验证之后就不能表单提交了,所以如果已经验证直接跳转到/admin/manager.jhtml页面 -->
    <form  action="/admin/login.jhtml" method="post" >
    <div class="Main">
        <ul>
            <li class="top"></li>
            <li class="top2"></li>
            <li class="topA"></li>
            <li class="topB">
              <span>
                <!-- <img src="static/public/images/login/logo.gif" alt="" style="" /> -->
             </span>
            </li>
            <li class="topC"></li>
            <li class="topD">
                <ul class="login" style="margin-top: 55px;">
                    <li>
                    	<span class="left">用户名:</span> 
                    	<span style="left">
                        	<input id="Text1" type="text" name="username" class="txt" />  
                    	</span>
                    </li>
                    <li>
                    	<span class="left">密 码:</span> <span style="left">
                         	<input id="Text2" type="text" name="password" class="txt" />  
                    	</span>
                    </li>
                </ul>
            </li>
            <li class="topE"></li>
            <li class="middle_A"></li>
            <li class="middle_B"></li>
            <li class="middle_C">
            
            <span class="btn">
                <input type="image"  src="static/public/images/login/btnlogin.gif" />
             </span>
            </li>
            <li class="middle_D"></li>
            <li class="bottom_A"></li>
            <li class="bottom_B"></li>
        </ul>
    </div>
    </form>
</body>
</html>
