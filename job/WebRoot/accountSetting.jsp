<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>修改密码</title>
<link href="theme/default/css/style.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/external.min.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/popup.css" type="text/css" rel="stylesheet">
<script src="theme/default/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/jquery.lib.min.js"></script>
<script src="theme/default/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/additional-methods.js"></script>
</head>
<body>
	<div id="body">
		<div id="header">
			<div class="wrapper">
				<a href="index" class="logo">
					<h1>招聘网站</h1>
				</a>
				<ul class="reset" id="navheader">
					<li><a href="index">首页</a></li>
					<c:if test="${sessionScope.index_user.type==2 }">
						<li><a href="release" rel="nofollow">发布职位</a></li>
					</c:if>
					<c:if test="${sessionScope.index_user.type==3 }">
						<li><a href="user/myresume" rel="nofollow">我的简历</a></li>
					</c:if>
				</ul>
				<c:if test="${sessionScope.index_user!=null &&  sessionScope.index_user.id!=null}">
					<dl class="collapsible_menu">
						<dt>
							<span>${sessionScope.index_user.email }&nbsp;</span> <span class="red dn" id="noticeDot-0"></span>
							<i></i>
						</dt>
						<c:if test="${sessionScope.index_user.type==2 }">
							<dd>
								<a href="release">我要招人</a>
							</dd>
							<dd style="display: none;">
								<a href="work/list">我发布的职位</a>
							</dd>
							<dd style="display: none;">
								<a href="work/recommendResumes">我收到的简历</a>
							</dd>
						</c:if>
						<c:if test="${sessionScope.index_user.type==3 }">
							<dd>
								<a rel="nofollow" href="user/myresume">我的简历</a>
							</dd>
						</c:if>
						<dd>
							<a href="user/toUpdate">帐号设置</a>
						</dd>
						<dd class="logout">
							<a rel="nofollow" href="user/logout">退出</a>
						</dd>
					</dl>
				</c:if>
				<c:if test="${sessionScope.index_user==null ||  sessionScope.index_user.id==null}">
					<ul class="loginTop">
						<li><a href="login" rel="nofollow">登录</a></li>
						<li>|</li>
						<li><a href="register" rel="nofollow">注册</a></li>
					</ul>
				</c:if>
			</div>
		</div>
		<!-- end #header -->
		<div id="container">
			<div class="user_bindSidebar">
				<dl id="user_sideBarmenu" class="user_sideBarmenu">
					<dt>
						<h3>帐号设置</h3>
					</dt>
					<dd>
						<a class="hover" href="updatePwd.html">修改密码</a>
					</dd>
				</dl>
			</div>
			<input type="hidden" id="hasSidebar" value="1">
			<div class="content user_modifyContent">
				<dl class="c_section">
					<dt>
						<h2>
							<em></em>修改密码
						</h2>
					</dt>
					<dd>
						<form id="updatePswForm" method="post" action="user/uppassword">
							<table class="savePassword">
								<tbody>
									<tr>
										<td colspan="2" style="text-align: center;"><span style="color: red;">${message }</span></td>
									</tr>
									<tr>
										<td>登录邮箱</td>
										<td class="c7">${user.email }<input type="hidden" name="user.id" value="${user.id }"></td>
									</tr>
									<tr>
										<td class="label">当前密码</td>
										<td><input type="password" maxlength="16"
											id="oldpassword" name="oldpassword"
											style=" background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
											<span id="updatePwd_beError" style="display:none;"
											class="error"> </span></td>
									</tr>
									<tr>
										<td class="label">新密码</td>
										<td><input type="password" maxlength="16"
											id="password" name="user.password"
											style="background-repeat: no-repeat; background-attachment: scroll; background-position: right center;"></td>
									</tr>
									<tr>
										<td class="label">确认密码</td>
										<td><input type="password" maxlength="16"
											id="comfirmpassword" name="comfirmpassword"
											style="background-repeat: no-repeat; background-attachment: scroll; background-position: right center;"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td><input type="submit"  id="submitLogin" value="保 存"></td>
									</tr>
								</tbody>
							</table>
						</form>
					</dd>
				</dl>
			</div>
			<div class="clear"></div>
			<input type="hidden" value="" id="resubmitToken"> <a
				rel="nofollow" title="回到顶部" id="backtop"></a>
		</div>
		<!-- end #container -->
	</div>
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			
		</div>
	</div>

	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">
		<div id="cboxWrapper">
			<div>
				<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxTitle" style="float: left;"></div>
					<div id="cboxCurrent" style="float: left;"></div>
					<button type="button" id="cboxPrevious"></button>
					<button type="button" id="cboxNext"></button>
					<button id="cboxSlideshow"></button>
					<div id="cboxLoadingOverlay" style="float: left;"></div>
					<div id="cboxLoadingGraphic" style="float: left;"></div>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
	</div>
	<script type="text/javascript">
		$(function(){
			//验证表单
			 	$("#updatePswForm").validate({
			        rules: {
			        	oldpassword: {
			    	    	required: true,
			    	    	rangelength: [6,16]
			    	   	},
			    	   	"user.password": {
			    	    	required: true,
			    	    	rangelength: [6,16]
			    	   	},
			    	   	comfirmpassword:{
			    	   		required: true,
			    	    	rangelength: [6,16],
			    	    	equalTo: "#password"
			    	   	}
			    	},
			    	messages: {
			    		oldpassword: {
			    	    	required: "请输入旧密码",
			    	    	rangelength: "请输入6-16位密码，字母区分大小写"
			    	   	},
			    	   	"user.password": {
			    	   		required: "请输入新密码",
			    	    	rangelength: "请输入6-16位密码，字母区分大小写"
			    	   	},
			    	   	comfirmpassword:{
			    	   		required: "请输入确认密码",
			    	    	rangelength:  "请输入6-16位密码，字母区分大小写",
			    	    	equalTo:"两次密码输入不一致，请重新输入"
			    	   	}
			    	},
			    	submitHandler:function(form){
			    		form.submit();
			        }  
				});
		});
	</script>
</body>
</html>