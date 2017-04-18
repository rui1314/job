<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我发布的职位</title>
<script type="text/javascript">
var ctx = "<%=basePath%>";
</script>
<link rel="Shortcut Icon" href="http://www.lagou.com/h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="theme/default/css/style.css" />
<link rel="stylesheet" type="text/css" href="theme/default/css/external.min.css" />
<link rel="stylesheet" type="text/css" href="theme/default/css/popup.css" />
<script src="theme/default/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/jquery.lib.min.js"></script>
<script src="theme/default/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/additional-methods.js"></script>
<script src="theme/default/js/ajaxCross.json" charset="UTF-8"></script></head>
</head>
<body>
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
					<dd class="current">
						<a href="work/list">有效职位</a>
					</dd>
				</dl>
			</div>
			<!-- end .sidebar -->
			<div class="content">
				<dl class="company_center_content">
					<dt>
						<h1>
							<em></em> 有效职位 <span>（共<i
								style="color:#fff;font-style:normal" id="positionNumber">${works.size() }</i>个）
							</span>
						</h1>
					</dt>
					<dd>
						<c:forEach items="${works }" var="work">
						<form id="searchForm">
							<input type="hidden" value="Publish" name="type">
							<ul class="reset my_jobs">
								<li data-id="149594">
									<h3>
										<a target="_blank" title="${work.name }" href="work/info?workId=${work.id }">${work.name }</a> <span>[${work.city }]</span>
									</h3> 
									<span class="receivedResumeNo"><a href="<%=basePath%>work/apply?workId=${work.id}">应聘简历</a></span>
									<div>${work.nature } / ${work.salaryMin }k-${work.salaryMax }k / ${work.workExp } / ${work.education }及以上</div>
									<div class="c9">发布时间： ${work.createDate }</div>
									<div class="links">
										<a target="_blank" class="job_edit" href="work/detail?workId=${work.id }">编辑</a> 
										<a class="job_del" href="javascript:void(0)">删除</a>
									</div>
								</li>
							</ul>
						</form>
						</c:forEach>
					</dd>
				</dl>
			</div>
			<!-- end .content -->
			<script src="theme/default/js/job_list.min.js" type="text/javascript"></script>
			<div class="clear"></div>
			<input type="hidden" value="74fb1ce14ebf4e2495270b0fbad64704"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop"></a>
		</div>
		<!-- end #container -->
	</div>
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			
		</div>
	</div>

	<script src="theme/default/js/core.min.js" type="text/javascript"></script>
	<script src="theme/default/js/popup.min.js" type="text/javascript"></script>
	<script src="theme/default/js/tongji.js" type="text/javascript"></script>
	<!--  -->
	<script src="theme/default/js/analytics01.js" type="text/javascript"></script>
	<script type="text/javascript" src="theme/default/js/h.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#noticeDot-1').hide();
			$('#noticeTip a.closeNT').click(function() {
				$(this).parent().hide();
			});
		});
		var index = Math.floor(Math.random() * 2);
		var ipArray = new Array('42.62.79.226', '42.62.79.227');
		var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
		var CallCenter = {
			init : function(url) {
				var _websocket = new WebSocket(url);
				_websocket.onopen = function(evt) {
					console.log("Connected to WebSocket server.");
				};
				_websocket.onclose = function(evt) {
					console.log("Disconnected");
				};
				_websocket.onmessage = function(evt) {
					//alert(evt.data);
					var notice = jQuery.parseJSON(evt.data);
					if (notice.status[0] == 0) {
						$('#noticeDot-0').hide();
						$('#noticeTip').hide();
						$('#noticeNo').text('').show().parent('a').attr('href',
								ctx + '/mycenter/delivery.html');
						$('#noticeNoPage').text('').show().parent('a').attr(
								'href', ctx + '/mycenter/delivery.html');
					} else {
						$('#noticeDot-0').show();
						$('#noticeTip strong').text(notice.status[0]);
						$('#noticeTip').show();
						$('#noticeNo').text('(' + notice.status[0] + ')')
								.show().parent('a').attr('href',
										ctx + '/mycenter/delivery.html');
						$('#noticeNoPage').text(' (' + notice.status[0] + ')')
								.show().parent('a').attr('href',
										ctx + '/mycenter/delivery.html');
					}
					$('#noticeDot-1').hide();
				};
				_websocket.onerror = function(evt) {
					console.log('Error occured: ' + evt);
				};
			}
		};
		CallCenter.init(url);
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
</body>
</html>