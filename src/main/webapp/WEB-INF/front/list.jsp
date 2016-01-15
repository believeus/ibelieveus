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
<title>ios视频教程_手机App开发教程_IT营</title>
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="static/public/css/frontCss/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="static/public/js/frontJs/common.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/global.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/compare.js"></script>
</head>
<body>

	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->

	


	<div class="block clearfix">

		<div class="AreaL">





			<div id="category_tree">
				<div class="tits">相关课程分类</div>
				<dl class="clearfix" style="border:none; height:auto">
					<div class="box1 cate" id="cate">
						<h1 onclick="tab(0)" style="border-top:none">

							<span class="f_l"><img
								src="static/public/images/frontImages/btn_unfold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>
							<a href="category-1-b0.html" class="  f_l">手机App开发教程</a>

						</h1>
						<ul>
							<a class="over_2" href="category-2-b0.html">wp视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-3-b0.html">phonegap视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-4-b0.html">Android视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-5-b0.html" style="color:red">ios视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-47-b0.html">游戏开发</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


						<h1 onclick="tab(1)">

							<span class="f_l"><img
								src="static/public/images/frontImages/btn_unfold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>
							<a href="category-6-b0.html" class="  f_l">网站开发视频教程</a>

						</h1>
						<ul>
							<a class="over_2" href="category-7-b0.html">node.js教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-8-b0.html">php免费视频教程下载</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-9-b0.html">java视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-11-b0.html">.net视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-41-b0.html">html5视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-42-b0.html">css3视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-43-b0.html">javascript视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-45-b0.html">html+css</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


						<h1 onclick="tab(2)">

							<span class="f_l"><img
								src="static/public/images/frontImages/btn_unfold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>
							<a href="category-12-b0.html" class="  f_l">平面设计视频教程</a>

						</h1>
						<ul>
							<a class="over_2" href="category-13-b0.html">fireworks视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-14-b0.html">illustrator视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-15-b0.html">CorelDraw视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-16-b0.html">InDesign视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-17-b0.html">photoshop视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-18-b0.html">ui系列视频教程</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>



						<h1 onclick="tab(3)">

							<span class="f_l"> <img
								src="static/public/images/frontImages/btn_fold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>

							<a href="category-24-b0.html" class="  f_l">IT新技术</a>

						</h1>


						<ul style="display:none">


							<a class="over_2" href="category-25-b0.html">大数据教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-26-b0.html">云计算</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-27-b0.html">物联网</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


						<h1 onclick="tab(4)">

							<span class="f_l"> <img
								src="static/public/images/frontImages/btn_fold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>

							<a href="category-28-b0.html" class="  f_l">网络营销视频教程</a>

						</h1>


						<ul style="display:none">


							<a class="over_2" href="category-29-b0.html">SEO视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-35-b0.html">微信营销视频教程</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


						<h1 onclick="tab(5)">

							<span class="f_l"> <img
								src="static/public/images/frontImages/btn_fold.gif"
								style="padding-top:10px;padding-right:6px;cursor:pointer;"></span>

							<a href="category-36-b0.html" class="  f_l">操作系统教程</a>

						</h1>


						<ul style="display:none">


							<a class="over_2" href="category-37-b0.html">windows视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-38-b0.html">linux视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-39-b0.html">虚拟机视频教程</a>

							<div class="clearfix"></div>
							<a class="over_2" href="category-40-b0.html">unix视频教程</a>

							<div class="clearfix"></div>
						</ul>
						<div style="clear:both"></div>


					</div>
				</dl>
			</div>
			<div class="blank"></div>

			<script type="text/javascript">
				function tab(id) {
					obj_h4 = document.getElementById("cate")
							.getElementsByTagName("h4");
					obj_ul = document.getElementById("cate")
							.getElementsByTagName("ul");
					obj_img = document.getElementById("cate")
							.getElementsByTagName("img");
					if (obj_ul[id].style.display == "none") {
						obj_ul[id].style.display = "block"
						obj_img[id].src = "static/public/images/frontImages/btn_unfold.gif"
						return false;
					} else
						(obj_ul[id].style.display == "block")
					{
						obj_ul[id].style.display = "none"
						obj_img[id].src = "static/public/images/frontImages/btn_fold.gif"
					}
				}
			</script>

			<div class="blank"></div>
			<div class="box" id='history_div'>
				<div class="box_1">
					<h3>
						<span>浏览历史</span>
					</h3>

					<div class="boxCenterList clearfix" id='history_list'></div>
				</div>
			</div>
			<div class="blank5"></div>
			<script type="text/javascript">
				if (document.getElementById('history_list').innerHTML.replace(
						/\s/g, '').length < 1) {
					document.getElementById('history_div').style.display = 'none';
				} else {
					document.getElementById('history_div').style.display = 'block';
				}
				function clear_history() {
					Ajax.call('user.php', 'act=clear_history',
							clear_history_Response, 'GET', 'TEXT', 1, 1);
				}
				function clear_history_Response(res) {
					document.getElementById('history_list').innerHTML = '您已清空最近浏览过的商品';
				}
			</script>

		</div>


		<div class="AreaR">
			<div class="box">
				<div id="ur_here">
					当前位置: <a href=".">首页</a>
					<code>&gt;</code>
					<a href="category-1-b0.html">手机App开发教程</a>
					<code>&gt;</code>
					<a href="category-5-b0.html">ios视频教程</a>
				</div>
			</div>
			<div class="blank"></div>
			<div class="box">
				<div class="box_1">
					<h3>
						<span>商品筛选</span>
					</h3>
					<!--
            显示分类
            -->
					<div class="screeBox">





						<strong>课程分类 :</strong> <a href="category-2-b0.html">wp视频教程</a>&nbsp;&nbsp;







						<a href="category-3-b0.html">phonegap视频教程</a>&nbsp;&nbsp; <a
							href="category-4-b0.html">Android视频教程</a>&nbsp;&nbsp; <span>ios视频教程</span>&nbsp;&nbsp;








						<a href="category-47-b0.html">游戏开发</a>&nbsp;&nbsp;






					</div>




					<div class="screeBox">
						<strong>讲师 :</strong> <span>全部</span> <a
							href="category-5-b15-min0-max0-attr0.html">传智播客</a>&nbsp; <a
							href="category-5-b16-min0-max0-attr0.html">黑马</a>&nbsp; <a
							href="category-5-b18-min0-max0-attr0.html">北风网</a>&nbsp;
					</div>
					<div class="screeBox">
						<strong>价格 :</strong> <span>全部</span> <a
							href="category-5-b0-min0-max160-attr0.html">0&nbsp;-&nbsp;160</a>&nbsp;
						<a href="category-5-b0-min480-max640-attr0.html">480&nbsp;-&nbsp;640</a>&nbsp;
						<a href="category-5-b0-min640-max800-attr0.html">640&nbsp;-&nbsp;800</a>&nbsp;
					</div>
				</div>
			</div>
			<div class="blank"></div>


			<div class="box">
				<div class="box_1">
					<h3>
						<span>商品列表</span>
						<form method="GET" class="sort" name="listform">
							<a
								href="category.php?category=5&display=list&brand=0&price_min=0&price_max=0&filter_attr=0&page=1&sort=goods_id&order=DESC#goods_list"><img
								src="static/public/images/frontImages/goods_id_default.gif"
								alt="按上架时间排序"></a> <a
								href="category.php?category=5&display=list&brand=0&price_min=0&price_max=0&filter_attr=0&page=1&sort=shop_price&order=ASC#goods_list"><img
								src="static/public/images/frontImages/shop_price_default.gif"
								alt="按价格排序"></a> <a
								href="category.php?category=5&display=list&brand=0&price_min=0&price_max=0&filter_attr=0&page=1&sort=last_update&order=DESC#goods_list"><img
								src="static/public/images/frontImages/last_update_default.gif"
								alt="按更新时间排序"></a> <input type="hidden" name="category"
								value="5" /> <input type="hidden" name="display" value="list"
								id="display" /> <input type="hidden" name="brand" value="0" />
							<input type="hidden" name="price_min" value="0" /> <input
								type="hidden" name="price_max" value="0" /> <input
								type="hidden" name="filter_attr" value="0" /> <input
								type="hidden" name="page" value="1" /> <input type="hidden"
								name="sort" value="sort_order" /> <input type="hidden"
								name="order" value="DESC" />
						</form>
					</h3>
					<form name="compareForm" action="compare.php" method="post"
						onSubmit="return compareGoods(this);">
						<div class="goodsList">
							<ul class="clearfix bgcolor" id="">
								<li class="thumb"><a href="goods-208.html" target="_blank"><img
										src="static/public/images/frontImages/208_thumb_g_1429801724200.jpg"
										alt="Swift免费ios开发视频教程下载(共四季)" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-208.html" target="_blank" class="f6">
											Swift免费ios开发视频教程下载(共四季)<br />
										</a>
										商品描述：Swift免费ios开发视频教程下载(共四季),wift语言继承了C语言以及Objective-C的特性，且克服了C语言的兼容性问题，对于广大开发者来说，这无疑是一剂难以抗拒的兴奋剂。
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>课程讲师：</strong>雨燕&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>Swift&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>ios
											swift&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-208.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="bgcolor">
								<li class="thumb"><a href="goods-77.html" target="_blank"><img
										src="static/public/images/frontImages/77_thumb_g_1415799499034.jpg"
										alt="传智播客ios案例讲解" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-77.html" target="_blank" class="f6">
											传智播客ios案例讲解<br />
										</a> 商品描述：
										这些都是传智播客的公开课录制的视频，讲解的都是一些实际案例，io7-简单媒体播放器案例实现,ios7-helloworld案例实现,ios7-旋转动画的案例实现及处理动画播放完成事件,ios7-简单动画案例实现图片放大缩小.mov
										ios7-简单动画案例实现图片移动淡入淡出,ios7-简单图片浏览器案例,ios7-简单文本阅读器的案例实现,ios7-简单网页浏览器案例
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>课程讲师：</strong>传智播客&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>适合人群：</strong>初级&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-77.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="">
								<li class="thumb"><a href="goods-76.html" target="_blank"><img
										src="static/public/images/frontImages/76_thumb_g_1415798508973.jpg"
										alt="iOS开发快速入门教程" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-76.html" target="_blank" class="f6">
											iOS开发快速入门教程<br />
										</a> 商品描述：第一阶段：开发平台介绍、C语言强化。mac
										os系统介绍，c语言基础及强化，c语言数组及指针详解，objective-c语法基础，objective-c面向对象开发，iOS平台开发概述、xcode
										开发工具基本使用，xcode工具使用技巧。
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>适合人群：</strong>初级&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-76.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="bgcolor">
								<li class="thumb"><a href="goods-80.html" target="_blank"><img
										src="static/public/images/frontImages/80_thumb_g_1415803096523.jpg"
										alt="IOS(iPhone)开发中级视频教程" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-80.html" target="_blank" class="f6">
											IOS(iPhone)开发中级视频教程<br />
										</a> 商品描述：IOS(iPhone)开发中级视频教程，第1讲elloworld概述，第2讲UI设计基础，第3讲IOS
										UI设计基础， 第4讲IOS UI设计基础，第5讲IOS UI设计基础，
										第6讲基本UI控件，第7讲基本UI控件，第8讲多视图应用程序
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>适合人群：</strong>中级
											&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-80.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="">
								<li class="thumb"><a href="goods-83.html" target="_blank"><img
										src="static/public/images/frontImages/83_thumb_g_1415883846238.jpg"
										alt="华章关东升版IOS开发实战" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-83.html" target="_blank" class="f6">
											华章关东升版IOS开发实战<br />
										</a> 商品描述：1.密码生成器 2.2012奥林匹克 3.电子音乐合成器 4.记事本 5.IOS开发实战（地理位置）--我在哪
										6.IOS开发实战（照相）--感应铅锤
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>适合人群：</strong>中级&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-83.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="bgcolor">
								<li class="thumb"><a href="goods-86.html" target="_blank"><img
										src="static/public/images/frontImages/86_thumb_g_1415887813837.jpg"
										alt="最全android+ios软件开发视频教程" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-86.html" target="_blank" class="f6">
											最全android+ios软件开发视频教程<br />
										</a> 商品描述：itying为您提供最全的android+ios软件开发视频教程，62套android教程你懂的
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>适合人群：</strong>初级&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>Android
											ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>Android
											ios&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-86.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="">
								<li class="thumb"><a href="goods-88.html" target="_blank"><img
										src="static/public/images/frontImages/88_thumb_g_1415888502707.jpg"
										alt="iOS游戏开发视频教程《愤怒的小鸟》（15集）" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-88.html" target="_blank" class="f6">
											iOS游戏开发视频教程《愤怒的小鸟》（15集）<br />
										</a>
										商品描述：本专题主要以AngryBirds这个具体的项目来讲解如何用Cocos2D和Box2D开发一个商业性的游戏项目，包括Cocos2D介绍、CCScene剧场、锚点和进度条、CCMenu菜单、CCAction、粒子效果、剧场动画切换、游戏选关、坐标转换、精灵数据处理、OpenGL画线、Cocos2D事件机制、Box2D物理引擎、物理世界的模拟、碰撞检测等内容。
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>适合人群：</strong>初级&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-88.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="bgcolor">
								<li class="thumb"><a href="goods-89.html" target="_blank"><img
										src="static/public/images/frontImages/89_thumb_g_1415889030152.jpg"
										alt="iphone、ipad应用开发-iOS5剖析" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-89.html" target="_blank" class="f6">
											iphone、ipad应用开发-iOS5剖析<br />
										</a> 商品描述：iphone、ipad应用开发-iOS5剖析(新增IOS5项目实战秦朝史话小说项目
										），1.秦朝史话视听小说_框架的定义，2.秦朝史话视听小说_自定义导航，3.秦朝史话视听小说_目录模块的实现，4.秦朝史话视听小说_目录模块_tableview封装
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>适合人群：</strong>中级&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-89.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="">
								<li class="thumb"><a href="goods-91.html" target="_blank"><img
										src="static/public/images/frontImages/91_thumb_g_1415967568905.jpg"
										alt="iOS开发零基础入门教程" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-91.html" target="_blank" class="f6">
											iOS开发零基础入门教程<br />
										</a>
										商品描述：第一阶段：学前须知，01-什么是iOS和iOS开发，02-为什么选择移动开发，03-iOS和android对比，04-iOS开发的准备，05-iOS开发初体验，06-iOS设备发展史
										第二阶段：Mac OS X
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>适合人群：</strong>初级&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-91.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
							<ul class="clearfix bgcolor" id="bgcolor">
								<li class="thumb"><a href="goods-92.html" target="_blank"><img
										src="static/public/images/frontImages/92_thumb_g_1415968034020.jpg"
										alt="无限互联ios视频教程全集之时光电影实例" /></a></li>
								<li class="goodsName">
									<div class="div_name">
										<a href="goods-92.html" target="_blank" class="f6">
											无限互联ios视频教程全集之时光电影实例<br />
										</a> 商品描述：时光电影_项目简介以及客户端开发流程介绍.mov
										，时光电影_服务器与客户端的交互方式以及数据交换格式讲解.mov ，时光电影_项目演示和功能概述.mov
										，时光电影_项目开发需求和接口文档介绍.mov
									</div>

									<div class="goods_property">

										<span class="property_span"> <strong>适合人群：</strong>中级&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>更新程度：</strong>完成&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>主要技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>赞助类型：</strong>免费&nbsp;&nbsp;&nbsp;
										</span> <span class="property_span"> <strong>用到技术：</strong>ios&nbsp;&nbsp;&nbsp;
										</span>


									</div>


								</li>
								<li class="action">
									<div class="action_type">
										<font class="shop" style="color:blue;">免费</font>

									</div>
									<div class="action_info">

										<a href="goods-92.html" target="_blank">课程详情</a>
									</div>
								</li>
							</ul>
						</div>
					</form>

				</div>
			</div>
			<div class="blank5"></div>
			<script type="Text/Javascript" language="JavaScript">
			<!--
				function selectPage(sel) {
					sel.form.submit();
				}
			//-->
			</script>
			<script type="text/javascript">
				window.onload = function() {
					Compare.init();
					fixpng();
				}
				var button_compare = '';
				var exist = "您已经选择了%s";
				var count_limit = "最多只能选择4个商品进行对比";
				var goods_type_different = "\"%s\"和已选择商品类型不同无法进行对比";
				var compare_no_goods = "您没有选定任何需要比较的商品或者比较的商品数少于 2 个。";
				var btn_buy = "购买";
				var is_cancel = "取消";
				var select_spe = "请选择商品属性";
			</script>
			<form name="selectPageForm" action="/category.php" method="get">
				<div id="pager" class="pagebar">
					<span class="f_l " style="margin-right:10px;">总计 <b>19</b>
						个记录
					</span> <span class="page_now">1</span> <a
						href="category-5-b0-min0-max0-attr0-2-sort_order-DESC.html">[2]</a>

					<a class="next"
						href="category-5-b0-min0-max0-attr0-2-sort_order-DESC.html">下一页</a>
				</div>
			</form>
			<script type="Text/Javascript" language="JavaScript">
			<!--
				function selectPage(sel) {
					sel.form.submit();
				}
			//-->
			</script>
		</div>

	</div>

	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->

</body>
</html>
