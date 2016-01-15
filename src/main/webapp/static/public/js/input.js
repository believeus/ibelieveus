/*
 * 
 * 
 * 
 * 
 * JavaScript - Input
 * Version: 3.0
 */

$().ready( function() {
	
	var $backButton = $("#backButton");
	
	if ($.tools != null) {
		var $tab = $("#tab");
		var $title = $("#inputForm :input[title], #inputForm label[title]");

		// Tab效果
		$tab.tabs("table.tabContent, div.tabContent", {
			tabs: "input"
		});
	
		// 表单提示
		$title.tooltip({
			position: "center right",
			offset: [0, 4],
			effect: "fade"
		});
	}
	
	// 返回上一页
	$backButton.click( function() {
		location.href = window.history.back();
		return false;
	});

	// 验证消息
	if($.validator != null) {
		$.extend($.validator.messages, {
		    required: message("必填"),
			email: message("admin.validate.email"),
			url: message("admin.validate.url"),
			date: message("admin.validate.date"),
			dateISO: message("admin.validate.dateISO"),
			pointcard: message("admin.validate.pointcard"),
			number: message("只允许输入数字"),
			digits: message("只允许输入整数"),
			minlength: $.validator.format(message("长度不允许小于{0}")),
			maxlength: $.validator.format(message("admin.validate.maxlength")),
			rangelength: $.validator.format(message("admin.validate.rangelength")),
			min: $.validator.format(message("不允许小于{0}")),
			max: $.validator.format(message("admin.validate.max")),
			range: $.validator.format(message("admin.validate.range")),
			accept: message("admin.validate.accept"),
			equalTo: message("admin.validate.equalTo"),
			remote: message("admin.validate.remote"),
			integer: message("admin.validate.integer"),
			positive: message("admin.validate.positive"),
			negative: message("admin.validate.negative"),
			decimal: message("admin.validate.decimal"),
			pattern: message("admin.validate.pattern"),
			extension: "文件格式错误"
		});
		
		$.validator.setDefaults({
			errorClass: "fieldError",
			ignore: ".ignore",
			ignoreTitle: true,
			errorPlacement: function(error, element) {
				var fieldSet = element.closest("span.fieldSet");
				if (fieldSet.size() > 0) {
					error.appendTo(fieldSet);
				} else {
					error.insertAfter(element);
				}
			},
			submitHandler: function(form) {
				$(form).find(":submit").prop("disabled", true);
				form.submit();
			}
		});
	}

});

// 编辑器
if(typeof(KindEditor) != "undefined") {
	KindEditor.ready(function(K) {
		editor = K.create("#editor", {
			height: "350px",
			items: [
				"source", "|", "undo", "redo", "|", "preview", "print", "template", "cut", "copy", "paste",
				"plainpaste", "wordpaste", "|", "justifyleft", "justifycenter", "justifyright",
				"justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent", "subscript",
				"superscript", "clearhtml", "quickformat", "selectall", "|", "fullscreen", "/",
				"formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold",
				"italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image",
				"flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak",
				"anchor", "link", "unlink"
			],
			langType: e3dmall.locale,
			syncType: "form",
			filterMode: false,
			pagebreakHtml: '<hr class="pageBreak" \/>',
			allowFileManager: true,
			filePostName: "file",
			uploadJson: "/EUpload.jhtml",
			uploadImageExtension: setting.uploadImageExtension,
			uploadFlashExtension: setting.uploadFlashExtension,
			uploadMediaExtension: setting.uploadMediaExtension,
			uploadFileExtension: setting.uploadFileExtension,
			extraFileUploadParams: {
				token: getCookie("token")
			},
			afterChange: function() {
				this.sync();
			}
		});
	});
}

// 图片预览
	function onUploadImgChange(sender,offsetWidth,offsetHeight,preview,preview_fake,preview_size_fake){     
	    if(!sender.value.match( /.jpg|.gif|.png|.bmp/i)){     
	        alert('图片格式无效！');     
	        $(sender).after($(sender).clone().val(""));
			$(sender).remove(); 	
	        return false;     
	    }     
	         
	    var objPreview = document.getElementById(preview);     
	    var objPreviewFake = document.getElementById(preview_fake);     
	    var objPreviewSizeFake = document.getElementById(preview_size_fake);    
	    if( sender.files &&  sender.files[0] ){  
	        var reader = new FileReader();
			reader.onload = function(evt){objPreview.src = evt.target.result;}
	        reader.readAsDataURL(sender.files[0]);	   
	        
	    }else if(objPreviewFake.filters){    
	        // IE7,IE8 在设置本地图片地址为 img.src 时出现莫名其妙的后果     
	        //（相同环境有时能显示，有时不显示），因此只能用滤镜来解决        
	        // IE7, IE8因安全性问题已无法直接通过 input[file].value 获取完整的文件路径     
	        sender.select();     
	        window.parent.document.body.focus();
	        var imgSrc = document.selection.createRange().htmlText;     
	        objPreviewFake.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;     
	        objPreviewSizeFake.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;     
	        autoSizePreview(objPreviewFake,offsetWidth,offsetHeight);     
	        objPreview.style.display = 'none';     
	    }     
	}     
	  
	function onPreviewLoad(sender,offsetWidth,offsetHeight){    
	    autoSizePreview( sender, offsetWidth, offsetHeight );     
	}     
	    
	function autoSizePreview( objPre, originalWidth, originalHeight ){     
	    var zoomParam = clacImgZoomParam( originalWidth, originalHeight, originalWidth, originalHeight );     
	    objPre.style.width = zoomParam.width + 'px';     
	    objPre.style.height = zoomParam.height + 'px';     
	}     
	    
	function clacImgZoomParam( maxWidth, maxHeight, width, height ){     
	    var param = { width:width, height:height, top:0, left:0 };     
	         
	    if( width>maxWidth || height>maxHeight ){     
	        rateWidth = width / maxWidth;     
	        rateHeight = height / maxHeight;     
	             
	        if( rateWidth > rateHeight ){     
	            param.width =  maxWidth;     
	            param.height = height / rateWidth;     
	        }else{     
	            param.width = width / rateHeight;     
	            param.height = maxHeight;     
	        }     
	    }     
	         
	    param.left = (maxWidth - param.width) / 2;     
	    param.top = (maxHeight - param.height) / 2;     
	         
	    return param;     
	}      
