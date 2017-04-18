<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>简历预览</title>
</script>
<script type="text/javascript">
	var ctx = "<%=basePath%>";
</script>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
<link href="theme/default/css/style.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/colorbox.min.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/popup.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="theme/default/js/jquery.1.10.1.min.js"></script>

<script src="theme/default/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script>
	$(function() {
		$("body").on("click", "a.btn_s", function() {
			$.colorbox.close();
			parent.jQuery.colorbox.close();
		});
		$(".inline").colorbox({
			inline : true
		});
	});
</script>
<script src="theme/default/js/ajaxCross.json" charset="UTF-8"></script>
</head>

<body>
	<div id="previewWrapper">
		<div class="preview_header">
			<h1 title="${userResume.resume.name }">${userResume.resume.name }</h1>
		</div>
		<!--end .preview_header-->

		<div class="preview_content">
			<div class="profile_box" id="basicInfo">
				<h2>基本信息</h2>
				<div class="basicShow">
					<span>${userResume.users.name } | ${userResume.users.sex } | ${userResume.users.education } | ${userResume.users.workExp } | ${userResume.resume.expectCity }<br> 
					${userResume.workExps.get(0).position } · ${userResume.workExps.get(0).name } | ${userResume.educations.get(0).major } · ${userResume.educations.get(0).name }<br> ${ userResume.users.phone} | ${ userResume.users.email}<br>
					</span>
					<div class="m_portrait">
						<div></div>
						<img width="120" height="120" alt="jason"
							src="theme/default/images/default_headpic.png">
					</div>
				</div>
				<!--end .basicShow-->
			</div>
			<!--end #basicInfo-->

			<div class="profile_box" id="expectJob">
				<h2>期望工作</h2>
				<div class="expectShow">${userResume.resume.expectCity }，${userResume.resume.type }，月薪${userResume.resume.expectSalary }，${userResume.resume.expectPosition }</div>
				<!--end .expectShow-->
			</div>
			<!--end #expectJob-->

			<div class="profile_box" id="workExperience">
				<h2>工作经历</h2>
				<div class="experienceShow">
					<ul class="wlist clearfix">
						<c:forEach items="${userResume.workExps }" var="exp">
							<li class="clear"><span class="c9">${exp.position }|${exp.name }<fmt:formatDate value="${exp.beginDate }" pattern="yyyy-MM" />——<fmt:formatDate value="${exp.endDate }" pattern="yyyy-MM" /></span>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!--end .experienceShow-->
			</div>
			<!--end #workExperience-->

			<!--end #projectExperience-->

			<div class="profile_box" id="educationalBackground">
				<h2>教育背景</h2>
				<div class="educationalShow">
					<ul class="elist clearfix">
						<c:forEach items="${userResume.educations }" var="edu">
							<li class="clear">
								<span class="c9">${edu.name }|${edu.major },${edu.education }<fmt:formatDate value="${edu.beginDate }" pattern="yyyy" />-<fmt:formatDate value="${edu.endDate }" pattern="yyyy" /></span>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!--end .educationalShow-->
			</div>
		</div>
		<!--end .preview_content-->
	</div>
	<!--end #previewWrapper-->

	<!-------------------------------------弹窗lightbox ----------------------------------------->
	<div style="display:none;">
		<!-- 下载简历 -->
		<div class="popup" id="downloadOnlineResume">
			<table width="100%">
				<tbody>
					<tr>
						<td class="c5 f18">请选择下载简历格式：</td>
					</tr>
					<tr>
						<td><a class="btn_s"
							href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=1">word格式</a>
							<a class="btn_s"
							href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=2">html格式</a>
							<a class="btn_s"
							href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=3">pdf格式</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!--/#downloadOnlineResume-->
	</div>
	<!------------------------------------- end ----------------------------------------->




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
</body>
</html>