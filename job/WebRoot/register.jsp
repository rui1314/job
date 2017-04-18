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
<title>注册</title>
<script type="text/javascript">
var ctx = "h";
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="theme/default/css/style.css"/>

<script src="theme/default/js/jquery.1.10.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="theme/default/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="theme/default/js/core.min.js"></script>

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
        
    	<input type="hidden" id="resubmitToken" value="9b207beb1e014a93bc852b7ba450db27" />		
		<div class="login_box">
        	<form id="loginForm" method="post" action="user/register">
        		<ul class="register_radio clearfix">
		            <li>
		            	找工作
		              	<input type="radio" value="3" name="user.type" /> 
		            </li>
		            <li>
		           	           招人
		              	<input type="radio" value="2" name="user.type" /> 
		            </li>
		        </ul> 
            	<input type="text" id="email" name="user.email" tabindex="1" placeholder="请输入常用邮箱地址" />
                <span class="error" style="display:none;" id="beError"></span>
                <input type="password" id="password" name="user.password" tabindex="2" placeholder="请输入密码" />
            	<label class="fl registerJianJu" for="checkbox">
            		<input type="checkbox" id="checkbox" name="checkbox" checked  class="checkbox valid" />我已阅读并同意<a href="javascript:;" target="_blank">《用户协议》</a>
           		</label>
                <input type="submit" id="submitLogin" value="注 &nbsp; &nbsp; 册" />
            </form>
            <div class="login_right">
            	<div>已有帐号</div>
            	<a  href="login"  class="registor_now">直接登录</a>
            </div>
        </div>
        <div class="login_box_btm"></div>
    </div>
    
    <script type="text/javascript">
    
    $(document).ready(function(e) {
    	$('.register_radio li input').click(function(e){
    		$(this).parent('li').addClass('current').append('<em></em>').siblings().removeClass('current').find('em').remove();
    	});
    	$('#email').focus(function(){
    		$('#beError').hide();
    	});
    	//验证表单
	    	 $("#loginForm").validate({
	    	        rules: {
	    	        	"user.type":{
	    	        		required: true
	    	        	},
			    	   	"user.email": {
			    	    	required: true,
			    	    	email: true
			    	   	},
			    	   	"user.password": {
			    	    	required: true,
			    	    	rangelength: [6,16]
			    	   	},
			    	   	checkbox:{required:true}
			    	},
			    	messages: {
			    		"user.type":{
	    	        		required:"请选择使用目的"
	    	        	},
			    	 	"user.email": {
			    	    	required: "请输入常用邮箱地址",
			    	    	email: "请输入有效的邮箱地址，如：vivi@lagou.com"
			    	   	},
			    	   	"user.password": {
			    	    	required: "请输入密码",
			    	    	rangelength: "请输入6-16位密码，字母区分大小写"
			    	   	},
			    	   	checkbox: {
			    	    	required: "请接受用户协议"
			    	   	}
			    	},
			    	errorPlacement:function(label, element){
			    		if(element.attr("type") == "radio"){
			    			label.insertAfter($(element).parents('ul')).css('marginTop','-20px');
			    		}else if(element.attr("type") == "checkbox"){
			    			label.insertAfter($(element).parent()).css('clear','left');
			    		}else{
			    			label.insertAfter(element);
			    		};	
			    	},
			    	submitHandler:function(form){
			    		form.submit();
			        }  
	    	});
    });
    </script>
</body>
</html>
