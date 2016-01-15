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
<title>阿修罗_IT自学网免费视频教程资源下载学习网</title>
<meta name="Keywords"
	content="阿修罗,IT,免费,IT自学网,it学习网,IT教程,我要自学网,App开发免费视频教程下载,html5免费视频教程下载,android免费视频教程下载,ios免费视频教程下载,我要自学网视频教程,it免费课程,IT免费教程" />
<meta name="Description"
	content="阿修罗(www.believeus.cn)是一家IT视频教程下载资源的IT自学网,也是很多IT人员自学的专业网站，是国内资源最多的IT自学教程网，为大家提供网站开发视频教程，App手机应用开发免费视频教程,html5免费视频教程,android免费视频教程,ios免费视频教程等4000G的IT资源下载,是自学者的IT训练营" />
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="static/public/css/frontCss/style.css" rel="stylesheet" type="text/css" />
<!-- <link rel="alternate" type="application/rss+xml" title="RSS|IT营" href="feed.xml" /> -->
<script type="text/javascript" src="static/public/js/frontJs/common.js"></script>
<script type="text/javascript" src="static/public/js/frontJs/index.js"></script>
<style type="text/css">
.container,.container * {
	margin: 0;
	padding: 0;
}

.container {
	width: 644px;
	height: 300px;
	overflow: hidden;
	position: relative;
}

.slider {
	position: absolute;
}

.slider li {
	list-style: none;
	display: inline;
}

.slider img {
	width: 644px;
	height: 300px;
	display: block;
}

.slider2 {
	width: 2000px;
}

.slider2 li {
	float: left;
}

.num {
	position: absolute;
	right: 5px;
	bottom: 5px;
}

.num li {
	float: left;
	color: #d71437;
	text-align: center;
	line-height: 16px;
	width: 16px;
	height: 16px;
	font-family: Arial;
	font-size: 12px;
	cursor: pointer;
	overflow: hidden;
	margin: 3px 1px;
	border: 1px solid #d71437;
	background-color: #fff;
}

.num li.on {
	color: #fff;
	line-height: 21px;
	width: 21px;
	height: 21px;
	font-size: 16px;
	margin: 0 1px;
	border: 0;
	background-color: #d71437;
	font-weight: bold;
}
</style>
<script type="text/javascript">
						var $ = function(id) {
							return "string" == typeof id ? document
									.getElementById(id) : id;
						};
						var Class = {
							create : function() {
								return function() {
									this.initialize.apply(this, arguments);
								};
							}
						};
						Object.extend = function(destination, source) {
							for ( var property in source) {
								destination[property] = source[property];
							}
							return destination;
						};
						var TransformView = Class.create();
						TransformView.prototype = {
							//容器对象,滑动对象,切换参数,切换数量
							initialize : function(container, slider, parameter,
									count, options) {
								if (parameter <= 0 || count <= 0)
									return;
								var oContainer = $(container), oSlider = $(slider), oThis = this;
								this.Index = 0;//当前索引

								this._timer = null;//定时器
								this._slider = oSlider;//滑动对象
								this._parameter = parameter;//切换参数
								this._count = count || 0;//切换数量
								this._target = 0;//目标参数

								this.SetOptions(options);

								this.Up = !!this.options.Up;
								this.Step = Math.abs(this.options.Step);
								this.Time = Math.abs(this.options.Time);
								this.Auto = !!this.options.Auto;
								this.Pause = Math.abs(this.options.Pause);
								this.onStart = this.options.onStart;
								this.onFinish = this.options.onFinish;

								oContainer.style.overflow = "hidden";
								oContainer.style.position = "relative";

								oSlider.style.position = "absolute";
								oSlider.style.top = oSlider.style.left = 0;
							},
							//设置默认属性
							SetOptions : function(options) {
								this.options = {//默认值
									Up : true,//是否向上(否则向左)
									Step : 5,//滑动变化率
									Time : 10,//滑动延时
									Auto : true,//是否自动转换
									Pause : 2000,//停顿时间(Auto为true时有效)
									onStart : function() {
									},//开始转换时执行
									onFinish : function() {
									}//完成转换时执行
								};
								Object.extend(this.options, options || {});
							},
							//开始切换设置
							Start : function() {
								if (this.Index < 0) {
									this.Index = this._count - 1;
								} else if (this.Index >= this._count) {
									this.Index = 0;
								}

								this._target = -1 * this._parameter
										* this.Index;
								this.onStart();
								this.Move();
							},
							//移动
							Move : function() {
								clearTimeout(this._timer);
								var oThis = this, style = this.Up ? "top"
										: "left", iNow = parseInt(this._slider.style[style]) || 0, iStep = this
										.GetStep(this._target, iNow);

								if (iStep != 0) {
									this._slider.style[style] = (iNow + iStep)
											+ "px";
									this._timer = setTimeout(function() {
										oThis.Move();
									}, this.Time);
								} else {
									this._slider.style[style] = this._target
											+ "px";
									this.onFinish();
									if (this.Auto) {
										this._timer = setTimeout(function() {
											oThis.Index++;
											oThis.Start();
										}, this.Pause);
									}
								}
							},
							//获取步长
							GetStep : function(iTarget, iNow) {
								var iStep = (iTarget - iNow) / this.Step;
								if (iStep == 0)
									return 0;
								if (Math.abs(iStep) < 1)
									return (iStep > 0 ? 1 : -1);
								return iStep;
							},
							//停止
							Stop : function(iTarget, iNow) {
								clearTimeout(this._timer);
								this._slider.style[this.Up ? "top" : "left"] = this._target
										+ "px";
							}
						};
						window.onload = function() {
							function Each(list, fun) {
								for ( var i = 0, len = list.length; i < len; i++) {
									fun(list[i], i);
								}
							}
							;

							var objs = $("idNum").getElementsByTagName("li");

							var tv = new TransformView(
									"idTransformView",
									"idSlider",
									300,
									4,
									{
										onStart : function() {
											Each(
													objs,
													function(o, i) {
														o.className = tv.Index == i ? "on"
																: "";
													})
										}//按钮样式
									});

							tv.Start();

							Each(objs, function(o, i) {
								o.onmouseover = function() {
									o.className = "on";
									tv.Auto = false;
									tv.Index = i;
									tv.Start();
								}
								o.onmouseout = function() {
									o.className = "";
									tv.Auto = true;
									tv.Start();
								}
							})

							////////////////////////test2

							var objs2 = $("idNum2").getElementsByTagName("li");

							var tv2 = new TransformView(
									"idTransformView2",
									"idSlider2",
									990,
									3,
									{
										onStart : function() {
											Each(
													objs2,
													function(o, i) {
														o.className = tv2.Index == i ? "on"
																: "";
													})
										},//按钮样式
										Up : false
									});

							tv2.Start();

							Each(objs2, function(o, i) {
								o.onmouseover = function() {
									o.className = "on";
									tv2.Auto = false;
									tv2.Index = i;
									tv2.Start();
								}
								o.onmouseout = function() {
									o.className = "";
									tv2.Auto = true;
									tv2.Start();
								}
							})

							$("idStop").onclick = function() {
								tv2.Auto = false;
								tv2.Stop();
							}
							$("idStart").onclick = function() {
								tv2.Auto = true;
								tv2.Start();
							}
							$("idNext").onclick = function() {
								tv2.Index++;
								tv2.Start();
							}
							$("idPre").onclick = function() {
								tv2.Index--;
								tv2.Start();
							}
							$("idFast").onclick = function() {
								if (--tv2.Step <= 0) {
									tv2.Step = 1;
								}
							}
							$("idSlow").onclick = function() {
								if (++tv2.Step >= 10) {
									tv2.Step = 10;
								}
							}
							$("idReduce").onclick = function() {
								tv2.Pause -= 1000;
								if (tv2.Pause <= 0) {
									tv2.Pause = 0;
								}
							}
							$("idAdd").onclick = function() {
								tv2.Pause += 1000;
								if (tv2.Pause >= 5000) {
									tv2.Pause = 5000;
								}
							}

							$("idReset").onclick = function() {
								tv2.Step = Math.abs(tv2.options.Step);
								tv2.Time = Math.abs(tv2.options.Time);
								tv2.Auto = !!tv2.options.Auto;
								tv2.Pause = Math.abs(tv2.options.Pause);
							}

						}
					</script>
</head>
<body class="index_page">
	<!-- 页面头部引用  begin -->
	<jsp:include page="header.jsp" />
	<!-- 页面头部引用 end -->
	<div class="block clearfix">
		<div class="index_top">
			<div class="AreaL">
				<ul class="cls_course clearfix">
					<li class="clearfix">
						<div class="course_title">
							<span class="more"><a href="category-1-b0.html">></a></span><a
								href="category-1-b0.html">手机App开发教程</a>
						</div>
						<div class="course_title_sub clearfix">
							<label><a href="category-4-b0.html">android教程</a></label><label><a
								href="category-5-b0.html">ios教程</a></label> <label><a
								href="category-3-b0.html">phonegap教程</a></label><label><a
								href="category-2-b0.html">wp教程</a></label>
						</div>
					</li>
					<li class="clearfix">
						<div class="course_title">
							<span class="more"><a href="category-24-b0.html">></a></span><a
								href="category-24-b0.html">新技术</a>
						</div>
						<div class="course_title_sub clearfix">
							<label class="cl3"><a href="category-25-b0.html">大数据</a></label>
							<label class="cl3"><a href="category-27-b0.html">物联网</a></label>
							<label class="cl3"><a href="category-26-b0.html">云计算</a></label>
						</div>
					</li>
					<li class="clearfix">
						<div class="course_title">
							<span class="more"><a href="#">></a></span><a
								href="category-6-b0.html">网站开发教程</a>
						</div>
						<div class="course_title_sub clearfix">
							<label><a href="category-8-b0.html">php教程</a></label> <label><a
								href="category-9-b0.html">java教程</a></label> <label><a
								href="category-11-b0.html">.net教程</a></label> <label><a
								href="category-7-b0.html">node.js教程</a></label>
						</div>
					</li>
					<li class="clearfix">
						<div class="course_title">
							<span class="more"><a href="#">></a></span><a
								href="category-12-b0.html">平面设计教程</a>
						</div>
						<div class="course_title_sub clearfix">
							<label><a href="category-18-b0.html">ui系列教程</a></label> <label><a
								href="category-17-b0.html">photoshop教程 </a></label> <label><a
								href="category-13-b0.html">fireworks教程</a></label> <label><a
								href="category-16-b0.html">InDesign教程</a></label>
						</div>
					</li>
					<li class="clearfix">
						<div class="course_title">
							<span class="more"><a href="#">></a></span><a
								href="category-28-b0.html">网络营销教程</a>
						</div>
						<div class="course_title_sub clearfix">
							<label><a href="category-29-b0.html">SEO视频</a></label> <label><a
								href="category-35-b0.html">微信营销</a></label> <label><a
								href="category-31-b0.html">淘宝店铺装修</a></label> <label><a
								href="category-33-b0.html">网赚教程</a></label>
						</div>
					</li>
					<li class="clearfix">
						<div class="course_title">
							<span class="more"><a href="#">></a></span><a href="#">其他</a>
						</div>
						<div class="course_title_sub clearfix">
							<label><a href="category-19-b0.html">数据库教程</a></label> <label><a
								href="category-134-b0.html">Hadoop</a></label> <label><a
								href="category-134-b0.html">web前端</a></label> <label><a
								href="category-134-b0.html">linux教程</a></label>
						</div>
					</li>
				</ul>
			</div>

			<div class="AreaR">
				<div class="AreaR_left">
					
					<div class="container" id="idTransformView">
						<ul class="slider" id="idSlider">
							<li><a href="http://www.phonegap100.com" target="_blank"><img
									src="static/public/images/frontImages/20150109kfjxlx.png" /></a></li>
							<li><a href="http://www.itying.com/category-41-b0.html"
								target="_blank"><img
									src="static/public/images/frontImages/20141221ngtorq.png" /></a></li>
							<li><a href="http://www.itying.com/category-12-b0.html"
								target="_blank"><img
									src="static/public/images/frontImages/20141221pnryhm.png" /></a></li>
							<li><a href="http://www.itying.com/category-11-b0.html"
								target="_blank"><img
									src="static/public/images/frontImages/20141221ecybwv.png" /></a></li>

						</ul>
						<ul class="num" id="idNum">
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
						</ul>
					</div>
					<div class="blank"></div>
					<div class="index_rec">
						<ul>
							<li><a target="_blank" title="EcTouch"
								href="http://www.itying.com/category-4-b0.html"> <img
									alt="Android开发视频教程"
									src="static/public/images/frontImages/android.png">
									<h5>Android开发视频教程</h5>
							</a></li>
							<li><a target="_blank" title="EcTouch"
								href="http://www.itying.com/category-5-b0.html"> <img
									alt="IOS开发教程" src="static/public/images/frontImages/ios.png">
									<h5>IOS开发教程</h5>
							</a></li>
							<li><a target="_blank" title="WEB开发教程"
								href="http://www.itying.com/category-6-b0.html"> <img
									alt="WEB开发教程" src="static/public/images/frontImages/web.png">
									<h5>WEB开发教程</h5>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="AreaR_right">


					<div class="home_tbg">
						<span><a href="tech_list-11.html" target="_blank">行业热点</a></span>
					</div>
					<div class="news_hot">

						<ul class="news_hot_list">
							<li><a href="http://www.phonegap100.com/" target="_blank"
								class="news_hot_tit" title="phonegap视频教程" style="color:red;">phonegap免费视频教程下载</a>
								<p class="clearfix">
									<a href="http://www.phonegap100.com/" target="_blank"
										title="phonegap教程下载"><img
										src="static/public/images/frontImages/pg.png" class="f_l"
										height="70" width="96"></a> <a
										href="http://www.phonegap100.com/" target="_blank"
										title="phonegap教程下载"><span class="news_hot_info">PhoneGap是一个用基于HTML,CSS和JavaScript就可以开发跨平台的移动app软件的开发框架,开发成本极低，并且开发速度快，会html就可以开发移动app</span></a>
								</p></li>
							<li><a href="#" target="_blank" class="news_hot_tit"
								title="iCloud泄露：手机数据洞开">iCloud泄露：手机数据洞开</a>
								<p class="clearfix">
									<a href="#" target="_blank" title="iCloud泄露：手机数据洞开"><img
										src="static/public/images/frontImages/20140904022458.jpg"
										class="f_l" height="70" width="96"></a><span
										class="news_hot_info">几天前的 iCloud
										上的上百明星不雅照被外泄事件曾闹得沸沸扬扬，手机数据安全的问题又一次真切地摆在我们面前。……</span>
								</p></li>
							<li><a href="#" target="_blank" class="news_hot_tit"
								title="MSN将永别：微软所错过的互联网黄金十年!">MSN将永别：微软所错过的互联网黄金十年!</a>
								<p class="clearfix">
									<a href="#" target="_blank" title="MSN将永别：微软所错过的互联网黄金十年!"><img
										src="static/public/images/frontImages/20140901015038.jpg"
										class="f_l" height="70" width="96"></a><span
										class="news_hot_info">上周六（8月28日），中国MSN用户收到微软官方正式邮件：Messenger服务将于2014年10月31日关闭，并建议用户迁移至Skype。……</span>
								</p></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>


	<div class="blank"></div>


	<div class="goodsBox_1">

		<div class="xm-box">
			<h4 class="title">
				<div class="index_tab">
					<span id="one1" onmouseover="setTab('one',1,3)" class="hover">免费教程</span>
					<span id="one2" onmouseover="setTab('one',2,3)">热门教程</span> <span
						id="one3" onmouseover="setTab('one',3,3)">新技术</span>
				</div>

			</h4>
			<div class="blank"></div>
			<div id="con_one_1" class="clearfix">



				<div class="xm-box">
					<div id="show_hot_area" class="clearfix">
						<div class="goodsItem">

							<a href="goods-212.html"><img
								src="static/public/images/frontImages/212_thumb_g_1430751319945.jpg"
								alt="HTML5+css3实例讲解" class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-212.html" title="HTML5+css3实例讲解">HTML5+css3实例讲解</a>
							</p>

						</div>
						<div class="goodsItem">

							<a href="goods-210.html"><img
								src="static/public/images/frontImages/210_thumb_g_1430056450569.jpg"
								alt="兄弟连cocos2d-x3.0免费教程下载" class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-210.html" title="兄弟连cocos2d-x3.0免费教程下载">兄弟连cocos2d-x3.0免费教程下载</a>
							</p>

						</div>
						<div class="goodsItem">

							<a href="goods-189.html"><img
								src="static/public/images/frontImages/189_thumb_g_1421287434381.jpg"
								alt="升级版:深入浅出Hadoop实战开发(云存储、MapReduce、HBase实战微博、Hive应用、Storm应用)"
								class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-189.html"
									title="升级版:深入浅出Hadoop实战开发(云存储、MapReduce、HBase实战微博、Hive应用、Storm应用)">升级版:深入浅出Hadoop实战开发(云存储、MapReduce、HBase实战微博、Hive应用、Storm应用)</a>
							</p>

						</div>
						<div class="goodsItem">

							<a href="goods-175.html"><img
								src="static/public/images/frontImages/175_thumb_g_1420361448037.jpg"
								alt="基于Springmvc+Spring+Mybatis+Bootstrap+jQuery Mobile +MySql教务管理系统(分为PC端和手机端)"
								class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-175.html"
									title="基于Springmvc+Spring+Mybatis+Bootstrap+jQuery Mobile +MySql教务管理系统(分为PC端和手机端)">基于Springmvc+Spring+Mybatis+Bootstrap+jQuery
									Mobile +MySql教务管理系统(分为PC端和手机端)</a>
							</p>

						</div>
						<div class="goodsItem">

							<a href="goods-191.html"><img
								src="static/public/images/frontImages/191_thumb_g_1421289457003.jpg"
								alt="嵌入式Linux驱动开发实战教程(内核驱动、看门狗技术、触摸屏、视频采集系统)" class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-191.html"
									title="嵌入式Linux驱动开发实战教程(内核驱动、看门狗技术、触摸屏、视频采集系统)">嵌入式Linux驱动开发实战教程(内核驱动、看门狗技术、触摸屏、视频采集系统)</a>
							</p>

						</div>

					</div>

				</div>





			</div>

			<div id="con_one_2" class="clearfix" style="display: none">
				<div class="xm-box">
					<div id="show_hot_area" class="clearfix">
						<div class="goodsItem">

							<a href="goods-87.html"><img
								src="static/public/images/frontImages/87_thumb_g_1415888346485.jpg"
								alt="兄弟连HTML5+css3视频教程免费下载" class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-87.html" title="兄弟连HTML5+css3视频教程免费下载">兄弟连HTML5+css3视频教程免费下载</a>
							</p>

						</div>
						<div class="goodsItem">

							<a href="goods-210.html"><img
								src="static/public/images/frontImages/210_thumb_g_1430056450569.jpg"
								alt="兄弟连cocos2d-x3.0免费教程下载" class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-210.html" title="兄弟连cocos2d-x3.0免费教程下载">兄弟连cocos2d-x3.0免费教程下载</a>
							</p>

						</div>
						<div class="goodsItem">

							<a href="goods-195.html"><img
								src="static/public/images/frontImages/195_thumb_g_1421292055641.jpg"
								alt="iOS开发入门教程 (Object-C、网络编程、多线程、蓝牙、二维码、Cocos2D、OpenGL)"
								class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-195.html"
									title="iOS开发入门教程 (Object-C、网络编程、多线程、蓝牙、二维码、Cocos2D、OpenGL)">iOS开发入门教程
									(Object-C、网络编程、多线程、蓝牙、二维码、Cocos2D、OpenGL)</a>
							</p>

						</div>
						<div class="goodsItem">

							<a href="goods-202.html"><img
								src="static/public/images/frontImages/202_thumb_g_1422168231098.jpg"
								alt="深入oracle 12c数据库备份与恢复(优化RMAN性能、Oracle flashback技术)"
								class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-202.html"
									title="深入oracle 12c数据库备份与恢复(优化RMAN性能、Oracle flashback技术)">深入oracle
									12c数据库备份与恢复(优化RMAN性能、Oracle flashback技术)</a>
							</p>

						</div>
						<div class="goodsItem">

							<a href="goods-199.html"><img
								src="static/public/images/frontImages/199_thumb_g_1422166108420.jpg"
								alt="使用C#+Silverlight+实体框架(EF)+主域服务(Domain Service)构建富Internet应用程序(RIA)—企业进销存"
								class="goodsimg" /></a><br />
							<p class="f1">
								<a href="goods-199.html"
									title="使用C#+Silverlight+实体框架(EF)+主域服务(Domain Service)构建富Internet应用程序(RIA)—企业进销存">使用C#+Silverlight+实体框架(EF)+主域服务(Domain
									Service)构建富Internet应用程序(RIA)—企业进销存</a>
							</p>

						</div>

					</div>

				</div>


			</div>

			<div id="con_one_3" class="clearfix" style="display: none">

				<div class="goodsItem">
					<a href="goods-154.html"><img
						src="static/public/images/frontImages/154_thumb_g_1418266553274.jpg"
						alt="CorelDraw.X3设计与制作深度剖析" class="goodsimg"></a><br>
					<p class="f1">
						<a href="goods-154.html" title="CorelDraw.X3设计与制作深度剖析">CorelDraw.X3设计与制作深度剖析</a>
					</p>

				</div>
				<div class="goodsItem">

					<a href="goods-150.html"><img
						src="static/public/images/frontImages/150_thumb_g_1418195650101.jpg"
						alt="CorelDRAW+广告设计视频教程" class="goodsimg"></a><br>
					<p class="f1">
						<a href="goods-150.html" title="CorelDRAW+广告设计视频教程">CorelDRAW+广告设计视频教程</a>
					</p>

				</div>
				<div class="goodsItem">

					<a href="goods-142.html"><img
						src="static/public/images/frontImages/142_thumb_g_1418191434240.jpg"
						alt="fireworks_CS4知名资深讲师视频培训教程" class="goodsimg"></a><br>
					<p class="f1">
						<a href="goods-142.html" title="fireworks_CS4知名资深讲师视频培训教程">fireworks_CS4知名资深讲师视频培训教程</a>
					</p>

				</div>
				<div class="goodsItem">

					<a href="goods-165.html"><img
						src="static/public/images/frontImages/165_thumb_g_1418383666851.jpg"
						alt="Ai illustrator CS5视频教程" class="goodsimg"></a><br>
					<p class="f1">
						<a href="goods-165.html" title="Ai illustrator CS5视频教程">Ai
							illustrator CS5视频教程</a>
					</p>

				</div>
				<div class="goodsItem">

					<a href="goods-136.html"><img
						src="static/public/images/frontImages/136_thumb_g_1417779116889.jpg"
						alt="100集高清Photoshop CS6视频教程" class="goodsimg"></a><br>
					<p class="f1">
						<a href="goods-136.html" title="100集高清Photoshop CS6视频教程">100集高清Photoshop
							CS6视频教程</a>
					</p>

				</div>


			</div>


		</div>

		<div class="blank"></div>

		<div class="xm-box">
			<h4 class="title">
				<span>手机APP开发教程精选</span> <a class="more" href="category-1-b0.html">更多</a>
			</h4>
			<div class="blank"></div>
			<div id="show_best_area" class="clearfix">


				<div class="goodsItem">
					<a href="goods-210.html"><img
						src="static/public/images/frontImages/210_thumb_g_1430056450569.jpg"
						alt="兄弟连cocos2d-x3.0免费教程下载" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-210.html" title="兄弟连cocos2d-x3.0免费教程下载">兄弟连cocos2d-x3.0免费教程下载</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-92.html"><img
						src="static/public/images/frontImages/92_thumb_g_1415968034020.jpg"
						alt="无限互联ios视频教程全集之时光电影实例" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-92.html" title="无限互联ios视频教程全集之时光电影实例">无限互联ios视频教程全集之时光电影实例</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-88.html"><img
						src="static/public/images/frontImages/88_thumb_g_1415888502707.jpg"
						alt="iOS游戏开发视频教程《愤怒的小鸟》（15集）" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-88.html" title="iOS游戏开发视频教程《愤怒的小鸟》（15集）">iOS游戏开发视频教程《愤怒的小鸟》（15集）</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-89.html"><img
						src="static/public/images/frontImages/89_thumb_g_1415889030152.jpg"
						alt="iphone、ipad应用开发-iOS5剖析" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-89.html" title="iphone、ipad应用开发-iOS5剖析">iphone、ipad应用开发-iOS5剖析</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-204.html"><img
						src="static/public/images/frontImages/204_thumb_g_1423999886279.jpg"
						alt="老罗Android开发视频教程下载" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-204.html" title="老罗Android开发视频教程下载">老罗Android开发视频教程下载</a>
					</p>
				</div>


			</div>
		</div>
		<div class="blank"></div>




		<div class="xm-box">
			<h4 class="title">
				<span>网站开发精选教程</span> <a class="more" href="category-1-b0.html">更多</a>
			</h4>
			<div class="blank"></div>
			<div id="show_best_area" class="clearfix">


				<div class="goodsItem">
					<a href="goods-212.html"><img
						src="static/public/images/frontImages/212_thumb_g_1430751319945.jpg"
						alt="HTML5+css3实例讲解" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-212.html" title="HTML5+css3实例讲解">HTML5+css3实例讲解</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-189.html"><img
						src="static/public/images/frontImages/189_thumb_g_1421287434381.jpg"
						alt="升级版:深入浅出Hadoop实战开发(云存储、MapReduce、HBase实战微博、Hive应用、Storm应用)"
						class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-189.html"
							title="升级版:深入浅出Hadoop实战开发(云存储、MapReduce、HBase实战微博、Hive应用、Storm应用)">升级版:深入浅出Hadoop实战开发(云存储、MapReduce、HBase实战微博、Hive应用、Storm应用)</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-175.html"><img
						src="static/public/images/frontImages/175_thumb_g_1420361448037.jpg"
						alt="基于Springmvc+Spring+Mybatis+Bootstrap+jQuery Mobile +MySql教务管理系统(分为PC端和手机端)"
						class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-175.html"
							title="基于Springmvc+Spring+Mybatis+Bootstrap+jQuery Mobile +MySql教务管理系统(分为PC端和手机端)">基于Springmvc+Spring+Mybatis+Bootstrap+jQuery
							Mobile +MySql教务管理系统(分为PC端和手机端)</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-55.html"><img
						src="static/public/images/frontImages/55_thumb_g_1414845706893.jpg"
						alt="ecshop视频教程_ecshop二次开发教程" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-55.html" title="ecshop视频教程_ecshop二次开发教程">ecshop视频教程_ecshop二次开发教程</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-49.html"><img
						src="static/public/images/frontImages/49_thumb_g_1414498290270.jpg"
						alt="CI视频教程【php框架CI框架完成商城的开发教程】" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-49.html" title="CI视频教程【php框架CI框架完成商城的开发教程】">CI视频教程【php框架CI框架完成商城的开发教程】</a>
					</p>
				</div>


			</div>
		</div>
		<div class="blank"></div>





		<div class="xm-box">
			<h4 class="title">
				<span>数据库开发视频教程</span> <a class="more" href="category-1-b0.html">更多</a>
			</h4>
			<div class="blank"></div>
			<div id="show_best_area" class="clearfix">


				<div class="goodsItem">
					<a href="goods-94.html"><img
						src="static/public/images/frontImages/94_thumb_g_1415971805004.jpg"
						alt="后盾网MYSQL视频教程" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-94.html" title="后盾网MYSQL视频教程">后盾网MYSQL视频教程</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-116.html"><img
						src="static/public/images/frontImages/116_thumb_g_1416232832639.jpg"
						alt="NoSQL视频教程-兄弟连" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-116.html" title="NoSQL视频教程-兄弟连">NoSQL视频教程-兄弟连</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-117.html"><img
						src="static/public/images/frontImages/117_thumb_g_1416233389183.jpg"
						alt="李兴华主讲-ORACLE实战 最强大的数据库课程" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-117.html" title="李兴华主讲-ORACLE实战 最强大的数据库课程">李兴华主讲-ORACLE实战
							最强大的数据库课程</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-186.html"><img
						src="static/public/images/frontImages/186_thumb_g_1420809751285.jpg"
						alt="php+mysql+sphinx全文检索引擎视频教程" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-186.html" title="php+mysql+sphinx全文检索引擎视频教程">php+mysql+sphinx全文检索引擎视频教程</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-40.html"><img
						src="static/public/images/frontImages/40_thumb_g_1414294548102.jpg"
						alt="Mysql+php高级视频教程-兄弟连李强强" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-40.html" title="Mysql+php高级视频教程-兄弟连李强强">Mysql+php高级视频教程-兄弟连李强强</a>
					</p>
				</div>


			</div>
		</div>
		<div class="blank"></div>





		<div class="xm-box">
			<h4 class="title">
				<span>平面设计视频教程</span> <a class="more" href="category-1-b0.html">更多</a>
			</h4>
			<div class="blank"></div>
			<div id="show_best_area" class="clearfix">


				<div class="goodsItem">
					<a href="goods-106.html"><img
						src="static/public/images/frontImages/106_thumb_g_1416230289011.jpg"
						alt="Photoshop 数码照片处理与精修完全学习手册160多例" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-106.html" title="Photoshop 数码照片处理与精修完全学习手册160多例">Photoshop
							数码照片处理与精修完全学习手册160多例</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-112.html"><img
						src="static/public/images/frontImages/112_thumb_g_1416231899078.jpg"
						alt="PS全套、Photoshop玩转PS绘画（10集）" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-112.html" title="PS全套、Photoshop玩转PS绘画（10集）">PS全套、Photoshop玩转PS绘画（10集）</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-118.html"><img
						src="static/public/images/frontImages/118_thumb_g_1416233397779.jpg"
						alt="Photoshop经典效果1-120例" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-118.html" title="Photoshop经典效果1-120例">Photoshop经典效果1-120例</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-156.html"><img
						src="static/public/images/frontImages/156_thumb_g_1418267086084.jpg"
						alt="CorelDRAW X4案例实战从入门到精通之书籍及插画海报类" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-156.html" title="CorelDRAW X4案例实战从入门到精通之书籍及插画海报类">CorelDRAW
							X4案例实战从入门到精通之书籍及插画海报类</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-130.html"><img
						src="static/public/images/frontImages/130_thumb_g_1416924926279.jpg"
						alt="Photoshop CS 视频教程" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-130.html" title="Photoshop CS 视频教程">Photoshop
							CS 视频教程</a>
					</p>
				</div>


			</div>
		</div>
		<div class="blank"></div>


		<div class="xm-box">
			<h4 class="title">
				<span>网络营销视频教程</span> <a class="more" href="category-1-b0.html">更多</a>
			</h4>
			<div class="blank"></div>
			<div id="show_best_area" class="clearfix">


				<div class="goodsItem">
					<a href="goods-122.html"><img
						src="static/public/images/frontImages/122_thumb_g_1416488624176.jpg"
						alt="2014微信公众平台接口傻瓜教程" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-122.html" title="2014微信公众平台接口傻瓜教程">2014微信公众平台接口傻瓜教程</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-124.html"><img
						src="static/public/images/frontImages/124_thumb_g_1416667011488.jpg"
						alt="微信营销视频教程共计22讲-阿龙老师" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-124.html" title="微信营销视频教程共计22讲-阿龙老师">微信营销视频教程共计22讲-阿龙老师</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-75.html"><img
						src="static/public/images/frontImages/75_thumb_g_1415797848380.jpg"
						alt="微信营销实战培训班视频教程及PPT" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-75.html" title="微信营销实战培训班视频教程及PPT">微信营销实战培训班视频教程及PPT</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-78.html"><img
						src="static/public/images/frontImages/78_thumb_g_1415799592320.jpg"
						alt="微信营销专家教程" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-78.html" title="微信营销专家教程">微信营销专家教程</a>
					</p>
				</div>


				<div class="goodsItem">
					<a href="goods-79.html"><img
						src="static/public/images/frontImages/79_thumb_g_1415801330985.jpg"
						alt="特训网微信营销软件教程25集" class="goodsimg" /></a><br />
					<p class="f1">
						<a href="goods-79.html" title="特训网微信营销软件教程25集">特训网微信营销软件教程25集</a>
					</p>
				</div>


			</div>
		</div>
		<div class="blank"></div>

	</div>

	</div>


	<script type="text/javascript">
		function setTab(name, cursel, n) {
			for (i = 1; i <= n; i++) {
				var index_menu = document.getElementById(name + i);
				var index_con = document
						.getElementById("con_" + name + "_" + i);
				index_menu.className = i == cursel ? "hover" : "";
				index_con.style.display = i == cursel ? "block" : "none";
			}
		}
	//-->
	</script>

	<div class="box_1">
		<div class="links clearfix">
			[<a href="http://bbs.phonegap100.com" target="_blank"
				title="phonegap论坛">phonegap论坛</a>] [<a href="http://www.ionic.wang/"
				target="_blank" title="ionic教程">ionic教程</a>] [<a
				href="http://www.apiying.com" target="_blank" title="微信后台管理系统">微信后台管理系统</a>]
			[<a href="http://www.phonegap100.com" target="_blank"
				title="phonegap中文网">phonegap中文网</a>]
		</div>
	</div>
	<div class="blank"></div>

	<!-- 页面底部引用 begin -->
	<jsp:include page="footer.jsp" />
	<!-- 页面底部引用 end -->

</body>
</html>
