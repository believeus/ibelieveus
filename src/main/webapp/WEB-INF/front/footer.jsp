<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="footer" style="background:none;"></div>
<div id="banquan_nav">
	<div id="bottomNav" class="box">
		<div class="box_1">
			<a href="#" target="_blank">联系我们</a> | <a href="#" target="_blank">免责说明</a>
			<div class="f_r" id="returnTop"
				style="display: block; background-position: 0px -81px; ">
				<a href="#top"></a>
			</div>
			<script language="javascript" type="text/javascript">
				$(window).scroll(
						function() {
							var tt = document.documentElement.scrollTop
									|| document.body.scrollTop;
							;
							if (tt > 500) {
								$('#returnTop').show();
							} else {
								$('#returnTop').hide();
							}
						});
				$('#returnTop').click(function() {
					$("html, body").animate({
						'scrollTop' : 0
					}, 320);
				})
			</script>
		</div>
	</div>
	<p class="fooCorpy">
		凡本网站转载的文章、图片等资料的版权归版权所有人所有，因无法和版权所有者一一联系，如果本网站选取的文/图威胁到您的权益，请您及时和本网站联系。<br />我们会在第一时间内采取措施，避免给双方造
		成不必要的损失。 <br /> <br /> ICP备案证书号:<a href="#" target="_blank">京ICP备xxxxxxx号</a><br />
		&copy; 2005-2015 IT营 版权所有，并保留所有权利。 <br>
</div>
