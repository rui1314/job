<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>招聘管理系统-登录</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<link href="<%=basePath %>theme/default/login.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>script/third/easyui/themes/default/easyui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>script/third/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath %>script/third/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath %>script/third/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath %>script/third/jquery.cookie.js"></script>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0
	MARGINHEIGHT=0 style="text-align: center; padding-top: 20px;">
	<div class="Main">
		<ul>
			<li class="top"></li>
			<li class="top2"></li>
			<li class="topA"></li>
			<li class="topB">
				<span> <h1><b>招聘管理系统</b></h1></span>
			</li>
			<li class="topC"></li>
			<li class="topD">
				<form action="<%=basePath %>admin/login" method="post" id="adminLogin_form">
					<ul class="login" style="margin-top: 50px;">
						<c:if test="${message!=null }">
							<li><span style="color: red;"><b>${message }</b></span></li>
						</c:if>
						<li>
							<span class="left">用户名：</span> 
							<span style=""> 
								<input id="account" name="user.account" type="text" class="txt" />
							</span>
						</li>
						<li>
							<span class="left">密 码：</span> 
							<span style=""> 
								<input id="password" type="password" name="user.password" class="txt" />
							</span>
						</li>
					</ul>
				</form>
			</li>
			<li class="topE"></li>
			<li class="middle_A"></li>
			<li class="middle_B"></li>
			<li class="middle_C">
				<span class="btn"> 
					<img id="sys_user_login_btn" alt="" src="<%=basePath %>theme/default/images/login/btnlogin.gif" />
				</span>
			</li>
			<li class="middle_D"></li>
			<li class="bottom_A">招聘管理系统|<a href="<%=basePath %>index">招聘管理前台</a></li>
			<li class="bottom_B"></li>
		</ul>
	</div>
</BODY>
</HTML>
<script type="text/javascript">
$(function(){
	$("#sys_user_login_btn").click(function(){
		$("#adminLogin_form").submit();
	});
});
</script>
