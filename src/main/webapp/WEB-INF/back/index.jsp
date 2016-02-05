<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head id="Head1">
    <title>开源医疗后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html charset=gbk"/>
    <link href="/static/public/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/static/public/js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/static/public/js/themes/icon.css" />
    <script type="text/javascript" src="/static/public/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="/static/public/js/jQuery.easyui.js"></script>

	<script type="text/javascript" src='/static/public/js/outlook2.js'></script>
    <script type="text/javascript">
	 var _menus = {"menus":[
			{"menuid":"1","icon":"icon-sys","menuname":"内容管理",
				"menus":[
						<shiro:hasPermission name="mediaDinamic:view">
				         {"menuname":"[辩证论治管理]","url":"/admin/synd/list.jhtml"},
				        </shiro:hasPermission>
				         
				         <shiro:hasPermission name="mediaDinamic:view">
				         {"menuname":"[症状定义管理]","url":"/admin/syndset/list.jhtml"},
				        </shiro:hasPermission>
				         
				        <shiro:hasPermission name="bannar:view"> 
						 {"menuname":"[辨病要点管理]","icon":"icon-users","url":"/admin/syndmaster/list.jhtml"}
						</shiro:hasPermission>
					
					]
			}
			,{"menuid":"2","icon":"icon-sys","menuname":"系统管理",
				"menus":[
						<c:if test="${sessionUser.id==1}">
				        {"menuname":"角色管理","icon":"icon-log","url":"/admin/roleList.jhtml"},
				        </c:if>
						{"menuname":"管理员管理","icon":"icon-log","url":"/admin/adminList.jhtml"}
					]
			}
			
	]};
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function close() {
            $('#w').window('close');
        }

        

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }
	        // ajax 页面无刷新调用后台方法
            $.post('/admin/updatePwd.jhtml?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            });
            
        }

        $(function() {

            openPwd();
            //
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

           

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '/admin/logout.jhtml';
                    }
                });

            })
			
			
			
        });
		
		$(function(){
			$(".panel div").each(function(){
				//$(this).removeClass("accordion-header-selected");
			});
		});

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(/static/public/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 admin <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "/>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer"></div>
    </div>
    <div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
<div class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
				
			<h1 style="font-size: 40px;">《大医精诚》</大医精诚></h1>
			<span style="font-size: 20px;">凡大医治病，必当安神定志，无欲无求，先发大慈恻隐之心，</span><br/>
			<span style="font-size: 20px;">誓愿普救含灵之苦。若有疾厄来求救者，不得问其贵贱贫富，</span><br/>
			<span style="font-size: 20px;">长幼妍媸，怨亲善友，华夷愚智，普同一等，皆如至亲之想。</span><br/>
			<span style="font-size: 20px;">亦不得瞻前顾后，自虑吉凶，护惜身命。见彼苦恼，若己有之，</span><br/>
			<span style="font-size: 20px;">深心凄怆。勿避险巇、昼夜寒暑、饥渴疲劳，一心赴救，</span><br/>
			<span style="font-size: 20px;">无作功夫形迹之心。如此可为苍生大医，反此则是含灵巨贼。</span>
			</div>
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)"
                        onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>