<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>应聘简历</title>
<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
var ctx = "<%=basePath%>";
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="theme/default/css/style.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/external.min.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="theme/default/js/jquery.1.10.1.min.js"></script>
<script src="theme/default/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/ajaxfileupload.js"></script>
<script src="theme/default/js/additional-methods.js" type="text/javascript"></script>
</head>
<body>
	<div id="body">
		<div id="header">
			<div class="wrapper">
				<a href="index" class="logo">
					<h1>招聘网站</h1>
				</a>
				<ul class="reset" id="navheader">
					<li class="current"><a href="index">首页</a></li>
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
			<div class="sidebar">
				<a class="btn_create" href="<%=basePath %>release">发布新职位</a>
				<dl class="company_center_aside">
					<dt>我收到的简历</dt>
					<dd>
						<a href="<%=basePath %>work/recommendResumes">推荐简历</a>
					</dd>
					<dd>
						<a href="<%=basePath %>work/canInterviewResumes">待处理简历</a>
					</dd>
					<dd>
						<a href="<%=basePath %>work/notifiedResumes">已通知面试简历</a>
					</dd>
					<dd>
						<a href="<%=basePath %>work/inappropriateResumes">不合适简历</a>
					</dd>
				</dl>
				<dl class="company_center_aside">
					<dt>我发布的职位</dt>
					<dd>
						<a href="work/list">有效职位</a>
					</dd>
				</dl>
			</div>
			<!-- end .sidebar -->
			<div class="content">
				<dl class="company_center_content">
					<dt>
						<h1>
							<em></em> 应聘简历 <span>（共${resumes.size() }份）</span>
						</h1>
					</dt>
					<dd>
						<ul class="reset resumeLists">
							<c:forEach items="${resumes}" var="resume">
								<li data-id="" class="onlineResume">
									<label class=""> <input type="hidden"> <i></i></label>
									<div class="resumeShow">
										<a title="预览在线简历" target="_blank" class="resumeImg" href="resume/preview?userId=${resume.users.id }"> <img src="theme/default/images/default_headpic.png"></a>
										<div class="resumeIntro">
											<h3 class="unread">
												<a target="_blank" title="预览${resume.users.name }的简历"
													href="resume/preview?userId=${resume.users.id }"> ${resume.resume.name } </a> <em></em>
											</h3>
											<span class="fr"></span>
											<div>
												${resume.users.name } / ${resume.users.sex } / ${resume.users.education } / ${resume.users.workExp } / ${resume.resume.expectCity } <br> ${resume.workExps.get(0).position } · ${resume.workExps.get(0).name } | ${resume.educations.get(0).major } · ${resume.educations.get(0).name }
											</div>
											<div class="jdpublisher">
												<span> 应聘职位：<a title="随便写" target="_blank"
													href="javascript:;">${resume.resume.expectPosition }</a>
												</span>
											</div>
										</div>
										<div class="links">
											<form action="work/notice" method="post" class="resume_notice_form">
												<input type="hidden" name="delivery.id" value="${resume.id }">
												<input type="hidden" name="delivery.userId" value="${resume.users.id }">
												<input type="hidden" name="delivery.workId" value="${resume.workId }">
												<a href="javascript:void(0)" class="resume_notice">通知面试</a>
												<a class="resume_refuse" href="javascript:void(0)">不合适</a> 
											</form>
										</div>
									</div>
									<div class="contactInfo">
										<span class="c9">电话：</span>${resume.users.phone } &nbsp;&nbsp;&nbsp; <span
											class="c9">邮箱：</span><a href="mailto:${resume.users.email }">${resume.users.email }</a>
									</div>
								</li>
							</c:forEach>
						</ul>
							<!-- end .resumeLists -->
					</dd>
				</dl>
				<!-- end .company_center_content -->
			</div>
			<!-- end .content -->

			<script src="theme/default/js/jquery.ui.datetimepicker.min.js" type="text/javascript"></script>
			<div class="clear"></div>
			<input type="hidden" value="b4bc225f0d084ee5b8d045f9c98a49ff"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop"></a>
		</div>
		<!-- end #container -->
	</div>
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="about.html">联系我们</a> <a
				target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
			<a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">拉勾微博</a>
			<a rel="nofollow" href="javascript:void(0)" class="footer_qr">拉勾微信<i></i></a>
			<div class="copyright">
				&copy;2013-2014 Lagou <a
					href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"
					target="_blank">京ICP备14023790号-2</a>
			</div>
		</div>
	</div>

	<script src="theme/default/js/core.min.js" type="text/javascript"></script>
	<script src="theme/default/js/popup.min.js" type="text/javascript"></script>

	<!--  -->

<script type="text/javascript">
	$(function(){
		$(".resume_notice_form .resume_notice").click(function(){
			$(this).parent().attr("action","work/notice").submit();
		});
		$(".resume_notice_form .resume_refuse").click(function(){
			$(this).parent().attr("action","work/refuse").submit();
		});
	});
</script>

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
	<div
		class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"
		id="ui-datepicker-div"></div>
</body>
</html>