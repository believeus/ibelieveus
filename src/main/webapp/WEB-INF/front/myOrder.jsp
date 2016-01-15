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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />

<title>用户中心_我的订单</title>

<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="static/public/css/frontCss/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="static/public/js/frontJs/hm.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/common.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/user.js"></script>
<script type="text/javascript">
//收藏本站 bbs.ecmoban.com
function AddFavorite(title, url) {
  try {
      window.external.addFavorite(url, title);
  }
catch (e) {
     try {
       window.sidebar.addPanel(title, url, "");
    }
     catch (e) {
         alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
     }
  }
}
</script>
</head>

<body>

	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->

	<div class="block clearfix">
		<div class="box">
		 <div id="ur_here">
		当前位置: <a href="http://www.itying.com/">首页</a> <code>&gt;</code> 用户中心 
		</div>
		</div>
		<div class="blank"></div>  
		  <div class="AreaL">
			<div class="box">
			 <div class="box_1">
			  <div class="userCenterBox">
				<div class="userMenu">
		<a href="http://www.itying.com/user.php"><img src="static/public/images/frontImages/u1.gif"> 欢迎页</a>
		<a href="http://www.itying.com/user.php?act=profile"><img src="static/public/images/frontImages/u2.gif"> 用户信息</a>
		<a href="http://www.itying.com/user.php?act=order_list" class="curs"><img src="static/public/images/frontImages/u3.gif"> 我的订单</a>
		<a href="http://www.itying.com/user.php?act=address_list"><img src="static/public/images/frontImages/u4.gif"> 收货地址</a>
		<a href="http://www.itying.com/user.php?act=collection_list"><img src="static/public/images/frontImages/u5.gif"> 我的收藏</a>
		<!--
		<a href="user.php?act=message_list"><img src="themes/itying/images/u6.gif"> 我的留言</a>

		<a href="user.php?act=tag_list"><img src="themes/itying/images/u7.gif"> 我的标签</a>

		<a href="user.php?act=booking_list"><img src="themes/itying/images/u8.gif"> 缺货登记</a>
		<a href="user.php?act=bonus"><img src="themes/itying/images/u9.gif"> 我的红包</a>
		-->



		<a href="http://www.itying.com/user.php?act=affiliate"><img src="static/public/images/frontImages/u10.gif"> 我的推荐</a><a href="http://www.itying.com/user.php?act=comment_list"><img src="static/public/images/frontImages/u11.gif"> 我的评论</a>
		<!--<a href="user.php?act=group_buy">我的团购</a>-->
		<!--
		<a href="user.php?act=track_packages"><img src="themes/itying/images/u12.gif"> 跟踪包裹</a>
		-->
		<a href="http://www.itying.com/user.php?act=account_log"><img src="static/public/images/frontImages/u13.gif"> 资金管理</a>
		<a href="http://www.itying.com/user.php?act=logout" style="background:none; text-align:right; margin-right:10px;"><img src="static/public/images/frontImages/bnt_sign.gif"></a>
		</div>      </div>
			 </div>
			</div>
		  </div>
		  
		  
		  <div class="AreaR">
			<div class="box">
			 <div class="box_1">
			  <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
				<h5><span>我的订单</span></h5>
			   <div class="blank"></div>
			   <table bgcolor="#dddddd" border="0" cellpadding="5" cellspacing="1" width="100%">
				  <tbody><tr align="center">
					<td bgcolor="#ffffff">订单号</td>
					<td bgcolor="#ffffff">商品标题</td>
					<td bgcolor="#ffffff">订单总金额</td>
					<td bgcolor="#ffffff">订单状态</td>
					<td bgcolor="#ffffff">操作</td>
				  </tr>
							<tr>
					<td style="padding:16px;" align="left" bgcolor="#ffffff"><a href="http://www.itying.com/user.php?act=order_detail&amp;order_id=185" class="f6"><p>订 单 号:2015101904488</p></a><br><p>下单时间:2015-10-19 14:56:48</p></td>
					<td align="center" bgcolor="#ffffff"><a href="http://www.itying.com/goods.php?id=175" target="_blank" class="f6">基于Springmvc+Spring+Mybatis+Bootstrap+jQuery Mobile +MySql教务管理系统(分为PC端和手机端)</a></td>
					<td align="right" bgcolor="#ffffff">￥1080.00元</td>
					<td align="center" bgcolor="#ffffff">未确认,未付款,未发货</td>
					<td align="center" bgcolor="#ffffff">
					
									 
					  <font class="f6"><a href="http://www.itying.com/user.php?act=cancel_order&amp;order_id=185" onclick="if (!confirm('您确认要取消该订单吗？取消后此订单将视为无效订单')) return false;">取消订单</a></font>
					   
								   
					
					</td>
				  </tr>
				 </tbody></table>
				<div class="blank5"></div>
			   
		<form name="selectPageForm" action="/user.php" method="get">
			 <div id="pager" class="pagebar">
				<span class="f_l " style="margin-right:10px;">总计 <b>1</b>  个记录</span>
			 </div>
		</form>
		<script type="Text/Javascript" language="JavaScript">
		<!--

		function selectPage(sel)
		{
		  sel.form.submit();
		}

		//-->
		</script>
			   <div class="blank5"></div>
			   <h5><span>合并订单</span></h5>
			   <div class="blank"></div>
				<script type="text/javascript">
				  var from_order_empty = "请选择要合并的从订单";
				  var to_order_empty = "请选择要合并的主订单";
				  var order_same = "主订单和从订单相同，请重新选择";
				  var confirm_merge = "您确实要合并这两个订单吗？";
				</script>
				<form action="user.php" method="post" name="formOrder" onsubmit="return mergeOrder()">
				  <table bgcolor="#dddddd" border="0" cellpadding="5" cellspacing="1" width="100%">
					<tbody><tr>
					  <td align="right" bgcolor="#ffffff" width="22%">主订单:</td>
					  <td align="left" bgcolor="#ffffff" width="12%"><select name="to_order">
					  <option value="0">请选择...</option>

						  <option selected="selected" value="2015101904488">2015101904488</option>
						</select></td>
					  <td align="right" bgcolor="#ffffff" width="19%">从订单:</td>
					  <td align="left" bgcolor="#ffffff" width="11%"><select name="from_order">
					  <option value="0">请选择...</option>

						  <option selected="selected" value="2015101904488">2015101904488</option>
						</select></td>
					  <td bgcolor="#ffffff" width="36%">&nbsp;<input name="act" value="merge_order" type="hidden">
					  <input name="Submit" class="bnt_blue_1" style="border:none;" value="合并订单" type="submit"></td>
					</tr>
					<tr>
					  <td bgcolor="#ffffff">&nbsp;</td>
					  <td colspan="4" align="left" bgcolor="#ffffff">订单合并是在发货前将相同状态的订单合并成一新的订单。<br>收货地址，送货方式等以主定单为准。</td>
					</tr>
				  </tbody></table>
				</form>
			  </div>
			 </div>
			</div>
		  </div>
		  
		</div>
		<div class="blank"></div>

	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->

</body>
</html>
