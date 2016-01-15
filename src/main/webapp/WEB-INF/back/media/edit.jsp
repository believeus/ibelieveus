<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>编辑视频 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<link href="/static/public/css/easyui.css" rel="stylesheet" type="text/css" />
	<link href="/static/public/css/icon.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.easyui.min.js"></script>
	<style type="text/css">
		table.input th {
		    font-size: 13px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
		
		var editor = new UE.ui.Editor();
	    editor.render('editor');
	    editor.addListener('contentchange',function(){
	        this.sync();
	        $('textarea').valid();
	    });
	    editor.addListener("ready", function () {
	        // editor准备好之后才可以使用
	    	editor.setContent("${media.detail}");
	     });
	    $("#parentCate").combobox('setValue',"${mediaCategoryParentId}");
	    var url = "/admin/mcategory/categoryTree.jhtml?parentId="+"${mediaCategoryParentId}";
    	$("#type").combobox('reload', url);
    	$("#type").combobox('setValue', "${media.type}");
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				parentCate:"required",
				type:"required",
				title: "required",
				coin: "required",
				url: "required",
				detail: "required",
				type:"required"
			}
		});
		
	});
	
	</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 编辑新闻
	</div>
	<form id="inputForm" action="/admin/media/update.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${media.id}">
		<input type="hidden" name="imgpath" value="${media.imgpath}">
		<input type="hidden" name="status" value="${media.status}">
		<input type="hidden" name="createTime" value="${media.createTime}">
		<input type="hidden" name="editTime" value="${media.editTime}">
		<table class="input">
			<tr>
				<th>
					视频分类:
				</th>
				<td>
					<input id="parentCate" name="parentCate" class="easyui-combobox" data-options="
						required:true,
						missingMessage:'不能为空',
				        valueField: 'id',
				        textField: 'categoryName',
				        url: '/admin/mcategory/categoryTree.jhtml?parentId=1',
				        onSelect: function(rec){
				        	$('#type').combobox('setValue', '--请选择--');
					    	var url = '/admin/mcategory/categoryTree.jhtml?parentId='+rec.id;
					    	$('#type').combobox('reload', url);
					    } 
					">
					<input id="type" name="type" class="easyui-combobox" data-options="
						required:true,
						missingMessage:'不能为空',
				        valueField: 'id',
				        textField: 'categoryName',
				    ">
				</td>
			</tr>
			<tr>
				<th>
					视频名称:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" value="${media.title}"/>
				</td>
			</tr>
			<tr>
				<th>
					需要下载积分:
				</th>
				<td>
					<input type="text" name="coin" class="text" maxlength="500" value="${media.coin}"/>
				</td>
			</tr>
			<tr>
				<th>
					下载链接地址:
				</th>
				<td>
					<input type="text" name="url" class="text" maxlength="200" value="${media.url}"/>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					相关图片:
				</th>
				<td colspan="3">
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake" >  
						            <img id="preview" onload="onPreviewLoad(this,190,120)" src="/${media.imgpath}"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="upload_img" type="file" name="upload_img" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview','preview_fake','preview_size_fake');"/>  
						    <input type="hidden" id="filename0" name="filename0">
						    <br/>    
						    <img id="preview_size_fake"/> <span style="color: red;font-size: 12px;">建议上传图片宽190px、宽125px</span>
						</span>
					</div>
				</td>
			</tr>
			
			<tr id="contentTr">
				<th>
					视频描述:
				</th>
				<td colspan="3">
					<textarea id="editor" name="detail" maxlength="10000" class="editor"></textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回"  onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
