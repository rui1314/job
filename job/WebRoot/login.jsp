<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>登录-拉勾网-最专业的互联网招聘平台</title>
	<link rel="stylesheet" type="text/css" href="theme/default/css/style.css"/>
	<script src="theme/default/js/jquery.1.10.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="theme/default/js/jquery.lib.min.js"></script>
	<script type="text/javascript" src="theme/default/js/core.min.js"></script>
	<script type="text/javascript" src="theme/default/js/conv.js"></script>
</head>

<body id="login_bg">
	<div class="login_wrapper">
		<div class="login_header">
        	<a href="index">
					<h1>招聘网站</h1>
				</a>
            <div id="cloud_s"><img src="theme/default/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
            <div id="cloud_m"><img src="theme/default/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
        </div>
        
    	<input type="hidden" id="resubmitToken" value="" />		
		 <div class="login_box">
        	<form id="loginForm" action="user/login" method="post">
        		<span style="color: red;">${message }</span>
				<input type="text" id="email" name="user.email" value="" tabindex="1" placeholder="请输入登录邮箱地址" />
			  	<input type="password" id="password" name="user.password" tabindex="2" placeholder="请输入密码" />
				<span class="error" style="display:none;" id="beError"></span>
			    <label class="fl" for="remember"><input type="checkbox" id="remember" value="" checked="checked" name="autoLogin" /> 记住我</label>
			    <a href="javascript:;" class="fr" target="_blank">忘记密码？</a>
			    
				<input type="submit" id="submitLogin"  class="submitLogin" value="登 &nbsp; &nbsp; 录" />
<!-- 				<a style="color:#fff;" href="javascript:;" class="submitLogin" title="登 &nbsp; &nbsp; 录"/>登 &nbsp; &nbsp; 录</a> -->
			</form>
			<div class="login_right">
				<div>还没有帐号？</div>
				<a  href="register"  class="registor_now">立即注册</a>
			</div>
        </div>
        <div class="login_box_btm"></div>
    </div>

<script type="text/javascript">
$(function(){
	//验证表单
	 	$("#loginForm").validate({
	        rules: {
	    	   	email: {
	    	    	required: true,
	    	    	email: true
	    	   	},
	    	   	password: {
	    	    	required: true
	    	   	}
	    	},
	    	messages: {
	    	   	email: {
	    	    	required: "请输入登录邮箱地址",
	    	    	email: "请输入有效的邮箱地址，如：vivi@lagou.com"
	    	   	},
	    	   	password: {
	    	    	required: "请输入密码"
	    	   	}
	    	},
	    	submitHandler:function(form){
	    		form.submit();
	        }  
		});
})
</script>
</body>
</html>