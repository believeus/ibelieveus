<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div id="toolbar">
	<div class="heaTop w">
		<div class="f_l">
			<a href="index.php" class="shouye">返回首页</a> 
			<!-- <script type="text/javascript"
				src="static/public/js/frontJs/transport.js"></script>
			<script type="text/javascript"
				src="static/public/js/frontJs/utils.js"></script> -->
			<span class="heaHalving"> <a href="flow.php">查看购物车</a>


			</span>
		</div>

		<div class="f_r">



			<font id="ECS_MEMBERZONE" class="f_l"> 欢迎光临本店！&nbsp;&nbsp; <span
				id="topLoginDiv" class="heaTopHighlight"
				style="display:inline-block;"> <a href="login.jhtml"
					class="bgNone" target="_blank">登录</a><a
					href="/register.jhtml" target="_blank" class="popHover">注册</a>
			</span>
			</font> &nbsp;&nbsp

		</div>

		<!--
        <div class="f_r">
        	 <a href="user.php?act=oath&type=qq"><img style="padding-top:3px;" src="static/public/images/frontImages/qq_login.gif"/> &nbsp;&nbsp
        </div>
      -->

	</div>
</div>

<div id="head">
	<div class="hd">
		<p class="heaLogo f_l" style="width:296px;height:79px;">
			<a href="index.php" target="_parent" title="IT营"> <!-- <img src="static/public/images/frontImages/logo.gif" alt="IT营"> -->
				Logo
			</a>
		</p>
		<div class="hd_search f_l">
			<div class="tab_search ">

				<div id="search" class="clearfix">
					<form id="searchForm" name="searchForm" method="get"
						action="search.php" onSubmit="return checkSearchForm()"
						class="f_r">
						<input name="keywords" type="text" id="searchinput" value=""
							class="f_l searchinput" /> <input name="imageField"
							type="submit" value="" class="searchbtn"
							style="cursor:pointer; border:none" />
					</form>
					<div class="keys f_l">
						<script type="text/javascript">
						<!--
							function checkSearchForm() {
								if (document.getElementById('keyword').value) {
									return true;
								} else {
									alert("请输入搜索关键词！");
									return false;
								}
							}
							-->
						</script>
						<font>热门搜索 ：</font> <a href="search.php?keywords=Html5">Html5</a>
						<a href="search.php?keywords=PhoneGap">PhoneGap</a> <a
							href="search.php?keywords=php%E6%95%99%E7%A8%8B">php教程</a> <a
							href="search.php?keywords=Hadoop">Hadoop</a> <a
							href="search.php?keywords=Angularjs">Angularjs</a> <a
							href="search.php?keywords=cocos2d">cocos2d</a> <a
							href="search.php?keywords=NoSql">NoSql</a> <a
							href="search.php?keywords=Css3">Css3</a>
					</div>

				</div>

			</div>
		</div>

		<div class="heaCar" onmouseover="this.className='heaCar heaCar_on'"
			onmouseout="this.className='heaCar'">
			<div class="clearfix" id="ECS_CARTINFO">
				<a href="flow.php">购物车&nbsp;( <a href="flow.php" title="查看购物车">0</a>
					)&nbsp;件
				</a>
			</div>
		</div>
	</div>

</div>

<div id="heaNav">
	<div class="bd">
		<p class="heaNavOnly">
			<a href="catalog.php"> 所有课程分类</a>
		</p>
		<ul class="heaNavNone">
			<li class="heaNav"><a href="http://www.itying.com/" class="cur">首页</a>
			</li>
			<li class="heaNav"><a href="category-1-b0.html" title="手机开发">手机开发</a>
			</li>
			<li class="heaNav"><a href="category-6-b0.html" title="网站开发">网站开发</a>
			</li>
			<li class="heaNav"><a href="category-12-b0.html" title="平面设计">平面设计</a>
			</li>
			<li class="heaNav"><a href="category-19-b0.html" title="数据库">数据库</a>
			</li>
			<li class="heaNav"><a href="category-28-b0.html" title="网络营销">网络营销</a>
			</li>
			<li class="heaNav"><a href="category-24-b0.html" title="IT新技术">IT新技术</a>
			</li>
			<li class="heaNav"><a href="category-41-b0.html" title="html5教程">html5教程</a></li>
		</ul>

	</div>
</div>
