<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>我的简历</title>
<script type="text/javascript">
var ctx = "<%=basePath%>";
</script>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
<link href="theme/default/css/style.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/external.min.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="theme/default/js/jquery.1.10.1.min.js"></script>
<script src="theme/default/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/ajaxfileupload.js"></script>
<script src="theme/default/js/additional-methods.js" type="text/javascript"></script>
<script src="theme/default/js/ajaxCross.json" charset="UTF-8"></script>
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
						<li><a href="/release" rel="nofollow">发布职位</a></li>
					</c:if>
					<c:if test="${sessionScope.index_user.type==3 }">
						<li class="current"><a href="user/myresume" rel="nofollow">我的简历</a></li>
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
								<a href="create.html">我要招人</a>
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
				<div class="dn" id="noticeTip">
					<span class="bot"></span> <span class="top"></span> <a
						target="_blank" href="delivery.html"><strong>0</strong>条新投递反馈</a>
					<a class="closeNT" href="javascript:;"></a>
				</div>
			</div>
		</div>
		<!-- end #header -->
		<div id="container">

			<div class="clearfix">
				<div class="content_l">
					<div class="fl" id="resume_name">
						<div class="nameShow fl">
							<c:if test="${resume!=null && resume.id!=null }">
								<h1 title='${resume.name}'>${resume.name}</h1>
							</c:if>
							<c:if test="${resume==null || resume.id==null }">
								<h1 title='${user.name}的简历'>${user.name}的简历</h1>
							</c:if>
							
							<span class="rename">重命名</span> | <a target="_blank"
								href="h/resume/preview.html">预览</a>
						</div>
						<form action="resume/updatename" method="post" class="fl dn" id="resumeNameForm">
							<c:if test="${resume!=null && resume.id!=null }">
								<input type="hidden" name="resume.id" value="${resume.id }">
								<input type="text" value="${resume.name}" id="resumeName" name="resume.name" class="nameEdit c9"> 
							</c:if>
							<c:if test="${resume==null || resume.id==null }">
								<input type="text" value="${user.name}的简历" name="resume.name" class="nameEdit c9"> 
							</c:if>
							<a href="javascript:;" id="saveResumeName">保存</a>| <a target="_blank" href="h/resume/preview.html">预览</a>
						</form>
					</div>
					<!--end #resume_name-->
					<div class="fr c5" id="lastChangedTime">
						最后一次更新：<span>${resume.updateTime }</span>
					</div>
					<div class="profile_box" id="basicInfo">
						<h2>基本信息</h2>
						<span class="c_edit"></span>
						<div class="basicShow">
							<span>${user.name } | ${user.sex } | ${user.education } | ${user.workExp }工作经验<br> ${user.phone } |
								${user.email }<br>
							</span>
						</div>
						<!--end .basicShow-->

						<div class="basicEdit dn">
							<form id="profileForm" method="post" action="<%=basePath %>user/update">
								<input type="hidden" name="user.id" value="${user.id }">
								<table>
									<tbody>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td><input type="text" placeholder="姓名" value="${user.name }" name="user.name" id="name"></td>
											<td valign="top"></td>
											<td>
												<ul class="profile_radio clearfix reset">
													<li ${user.sex=="男"?"class='current'":"" }>男<em></em> 
													<input type="radio" ${user.sex=="男"?"checked='checked'":"" } name="user.sex" value="男">
													</li>
													<li ${user.sex=="女"?"class='current'":"" }>女<em></em> 
														<input type="radio" ${user.sex=="女"?"checked='checked'":"" } name="user.sex" value="女">
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<input type="hidden" id="topDegree" value="${user.education }" name="user.education"> 
												<input type="button" value="${user.education }" id="select_topDegree" class="profile_select_190 profile_select_normal">
												<div class="boxUpDown boxUpDown_190 dn" id="box_topDegree" style="display: none;">
													<ul>
														<li>大专</li>
														<li>本科</li>
														<li>硕士</li>
														<li>博士</li>
														<li>其他</li>
													</ul>
												</div></td>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<input type="hidden" id="workyear" value="${user.workExp }" name="user.workExp"> 
												<input type="button" value="${user.workExp }" id="select_workyear" class="profile_select_190 profile_select_normal">
												<div class="boxUpDown boxUpDown_190 dn" id="box_workyear" style="display: none;">
													<ul>
														<li>应届毕业生</li>
														<li>1年</li>
														<li>2年</li>
														<li>3年</li>
														<li>4年</li>
														<li>5年</li>
														<li>6年</li>
														<li>7年</li>
														<li>8年</li>
														<li>9年</li>
														<li>10年</li>
														<li>10年以上</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td colspan="3">
												<input type="text" placeholder="手机号码" value="${user.phone }" name="user.phone" id="tel"></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td colspan="3">
												<input type="text" placeholder="接收面试通知的邮箱" value="${user.email }" name="user.email" id="email"></td>
										</tr>
										<tr>
											<td valign="top"></td>
											<td colspan="3">
												<input type="hidden" id="currentState" value="${user.currentState }" name="user.currentState"> 
												<input type="button"  placeholder="目前状态" value="${user.currentState }" id="select_currentState" class="profile_select_410 profile_select_normal">
												<div class="boxUpDown boxUpDown_410 dn"
													id="box_currentState" style="display: none;">
													<ul>
														<li>我目前已离职，可快速到岗</li>
														<li>我目前正在职，正考虑换个新环境</li>
														<li>我暂时不想找工作</li>
														<li>我是应届毕业生</li>
													</ul>
												</div></td>
										</tr>
										<tr>
											<td></td>
											<td colspan="3">
												<input type="submit" value="保 存" class="btn_profile_save"> 
												<a class="btn_profile_cancel" href="javascript:;">取 消</a></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
						<!--end .basicEdit-->
						<input type="hidden" id="nameVal" value="${user.name }"> 
						<input type="hidden" id="genderVal" value="${user.sex }"> 
						<input type="hidden" id="topDegreeVal" value="${user.education }"> 
						<input type="hidden" id="workyearVal" value="${user.workExp }"> 
						<input type="hidden" id="currentStateVal" value="${user.currentState }"> 
						<input type="hidden" id="emailVal" value="${user.email }"> 
						<input type="hidden" id="telVal" value="${user.phone }">
					</div>
					<!--end #basicInfo-->

					
					<div class="profile_box" id="expectJob">
						<h2>期望工作</h2>
						<c:if test='${resume!=null && resume.expectPosition!=null && resume.expectPosition!="" }'>
							<span class="c_edit"></span>
							<div class="expectShow">
								<span>${resume.expectCity }|${resume.type }|${resume.expectPosition }|${resume.expectSalary }</span>
							</div>
						</c:if>
						<c:if test='${resume==null || resume.expectPosition==null || resume.expectPosition==""}'>
							<span class="c_edit dn"></span>
							<div class="expectShow dn">
								<span></span>
							</div>
						</c:if>
						<!--end .expectShow-->
						<div class="expectEdit dn">
							<form id="expectForm" action="<%=basePath %>resume/save" method="post">
								<table>
									<tbody>
										<tr>
											<td>
												<input type="hidden" name="resume.id" value="${resume.id }">
												<input type="hidden" id="expectCity" value="${resume.expectCity }" name="resume.expectCity"> 
												<c:if test='${resume!=null && resume.expectCity!=null && resume.expectCity!="" }'>
													<input type="button" value="${resume.expectCity }" id="select_expectCity" class="profile_select_287 profile_select_normal">
												</c:if>
												<c:if test='${resume==null || resume.expectCity==null || resume.expectCity==""}'>
													<input type="button" value="期望城市，如：北京" id="select_expectCity" class="profile_select_287 profile_select_normal">
												</c:if>
												<div class="boxUpDown boxUpDown_596 dn" id="box_expectCity"
													style="display: none;">
													<dl>
														<dt>热门城市</dt>
														<dd>
															<span>北京</span> <span>上海</span> <span>广州</span> <span>深圳</span>
															<span>成都</span> <span>杭州</span>
														</dd>
													</dl>
													<dl>
														<dt>ABCDEF</dt>
														<dd>
															<span>北京</span> <span>长春</span> <span>成都</span> <span>重庆</span>
															<span>长沙</span> <span>常州</span> <span>东莞</span> <span>大连</span>
															<span>佛山</span> <span>福州</span>
														</dd>
													</dl>
													<dl>
														<dt>GHIJ</dt>
														<dd>
															<span>贵阳</span> <span>广州</span> <span>哈尔滨</span> <span>合肥</span>
															<span>海口</span> <span>杭州</span> <span>惠州</span> <span>金华</span>
															<span>济南</span> <span>嘉兴</span>
														</dd>
													</dl>
													<dl>
														<dt>KLMN</dt>
														<dd>
															<span>昆明</span> <span>廊坊</span> <span>宁波</span> <span>南昌</span>
															<span>南京</span> <span>南宁</span> <span>南通</span>
														</dd>
													</dl>
													<dl>
														<dt>OPQR</dt>
														<dd>
															<span>青岛</span> <span>泉州</span>
														</dd>
													</dl>
													<dl>
														<dt>STUV</dt>
														<dd>
															<span>上海</span> <span>石家庄</span> <span>绍兴</span> <span>沈阳</span>
															<span>深圳</span> <span>苏州</span> <span>天津</span> <span>太原</span>
															<span>台州</span>
														</dd>
													</dl>
													<dl>
														<dt>WXYZ</dt>
														<dd>
															<span>武汉</span> <span>无锡</span> <span>温州</span> <span>西安</span>
															<span>厦门</span> <span>烟台</span> <span>珠海</span> <span>中山</span>
															<span>郑州</span>
														</dd>
													</dl>
												</div></td>
											<td>
												<ul class="profile_radio clearfix reset">
													<li  ${resume=="全职"?"class='current'":"" }>全职<em></em> 
														<input type="radio" ${resume=="全职"?"checked='checked'":"" }  name="resume.type" value="全职">
													</li>
													<li ${resume=="兼职"?"class='current'":"" }>兼职<em></em> 
														<input type="radio" ${resume=="兼职"?"checked='checked'":"" } name="resume.type" value="兼职">
													</li>
													<li ${resume=="实习"?"class='current'":"" }>实习<em></em> 
														<input type="radio" ${resume=="实习"?"checked='checked'":"" } name="resume.type" value="实习">
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<c:if test='${resume!=null && resume.expectPosition!=null && resume.expectPosition!="" }'>
													<input type="text" placeholder="${resume.expectPosition }" value="${resume.expectPosition }" name="resume.expectPosition" id="expectPosition">
												</c:if>
												<c:if test='${resume==null || resume.expectPosition==null || resume.expectPosition==""}'>
													<input type="text" placeholder="期望职位，如：产品经理" value="" name="resume.expectPosition" id="expectPosition">
												</c:if>
												
											</td>
											<td>
												<input type="hidden" id="expectSalary" value="${resume.expectSalary }" name="resume.expectSalary"> 
												<c:if test='${resume!=null && resume.expectSalary!=null && resume.expectSalary!="" }'>
													<input type="button" value="${resume.expectSalary }" id="select_expectSalary" class="profile_select_287 profile_select_normal">
												</c:if>
												<c:if test='${resume==null || resume.expectSalary==null || resume.expectSalary==""}'>
													<input type="button" value="期望月薪" id="select_expectSalary" class="profile_select_287 profile_select_normal">
												</c:if>
												<div class="boxUpDown boxUpDown_287 dn"
													id="box_expectSalary" style="display: none;">
													<ul>
														<li>2k以下</li>
														<li>2k-5k</li>
														<li>5k-10k</li>
														<li>10k-15k</li>
														<li>15k-25k</li>
														<li>25k-50k</li>
														<li>50k以上</li>
													</ul>
												</div></td>
										</tr>
										<tr>
											<td colspan="2">
												<input type="submit" value="保 存" class="btn_profile_save"> 
												<a class="btn_profile_cancel" href="javascript:;">取 消</a>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<!--end #expectForm-->
						</div>
						<!--end .expectEdit-->
						<c:if test='${resume!=null && resume.expectPosition!=null && resume.expectPosition!=""}'>
							<div class="expectAdd pAdd dn">
								填写准确的期望工作能大大提高求职成功率哦…<br> 快来添加期望工作吧！ <span>添加期望工作</span>
							</div>
						</c:if>
						<c:if test='${resume==null || resume.expectPosition==null || resume.expectPosition=="" }'>
							<div class="expectAdd pAdd">
								填写准确的期望工作能大大提高求职成功率哦…<br> 快来添加期望工作吧！ <span>添加期望工作</span>
							</div>
						</c:if>
						<!--end .expectAdd-->

						<input type="hidden" id="expectJobVal" value=""> <input
							type="hidden" id="expectCityVal" value=""> <input
							type="hidden" id="typeVal" value=""> <input type="hidden"
							id="expectPositionVal" value=""> <input type="hidden"
							id="expectSalaryVal" value="">
					</div>
					<!--end #expectJob-->

					<div class="profile_box" id="workExperience">
						<h2>
							工作经历 <span> （投递简历时必填）</span>
						</h2>
						<c:if test="${workExps!=null && workExps.size()>0 }">
							<span class="c_add"></span>
							<div class="experienceShow">
								<form class="experienceForm borderBtm dn"  method="post" action="<%=basePath %>resume/saveExp">
									<table>
										<tbody>
											<tr>
												<td valign="top"><span class="redstar">*</span></td>
												<td>
													<input type="hidden" name="exp.id">
													<input type="text" placeholder="公司名称" name="exp.name" class="companyName"></td>
												<td valign="top"><span class="redstar">*</span></td>
												<td><input type="text" placeholder="职位名称，如：产品经理"
													name="exp.position" class="positionName"></td>
											</tr>
											<tr>
												<td valign="top"><span class="redstar">*</span></td>
												<td>
													<div class="fl">
														<input type="hidden" class="companyYearStart" value=""
															name="companyYearStart"> <input type="button"
															value="开始年份"
															class="profile_select_139 profile_select_normal select_companyYearStart">
														<div
															class="box_companyYearStart boxUpDown boxUpDown_139 dn"
															style="display: none;">
															<ul>
																<li>2016</li>
																<li>2015</li>
																<li>2014</li>
																<li>2013</li>
																<li>2012</li>
																<li>2011</li>
																<li>2010</li>
																<li>2009</li>
																<li>2008</li>
																<li>2007</li>
																<li>2006</li>
																<li>2005</li>
																<li>2004</li>
																<li>2003</li>
																<li>2002</li>
																<li>2001</li>
																<li>2000</li>
																<li>1999</li>
																<li>1998</li>
																<li>1997</li>
																<li>1996</li>
																<li>1995</li>
																<li>1994</li>
																<li>1993</li>
																<li>1992</li>
																<li>1991</li>
																<li>1990</li>
																<li>1989</li>
																<li>1988</li>
																<li>1987</li>
																<li>1986</li>
																<li>1985</li>
																<li>1984</li>
																<li>1983</li>
																<li>1982</li>
																<li>1981</li>
																<li>1980</li>
																<li>1979</li>
																<li>1978</li>
																<li>1977</li>
																<li>1976</li>
																<li>1975</li>
																<li>1974</li>
																<li>1973</li>
																<li>1972</li>
																<li>1971</li>
																<li>1970</li>
															</ul>
														</div>
													</div>
													<div class="fl">
														<input type="hidden" class="companyMonthStart" value=""
															name="companyMonthStart"> <input type="button"
															value="开始月份"
															class="profile_select_139 profile_select_normal select_companyMonthStart">
														<div style="display: none;"
															class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
															<ul>
																<li>01</li>
																<li>02</li>
																<li>03</li>
																<li>04</li>
																<li>05</li>
																<li>06</li>
																<li>07</li>
																<li>08</li>
																<li>09</li>
																<li>10</li>
																<li>11</li>
																<li>12</li>
															</ul>
														</div>
													</div>
													<div class="clear"></div>
												</td>
												<td valign="top"><span class="redstar">*</span></td>
												<td>
													<div class="fl">
														<input type="hidden" class="companyYearEnd" value=""
															name="companyYearEnd"> <input type="button"
															value="结束年份"
															class="profile_select_139 profile_select_normal select_companyYearEnd">
														<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn"
															style="display: none;">
															<ul>
																<li>至今</li>
																<li>2016</li>
																<li>2015</li>
																<li>2014</li>
																<li>2013</li>
																<li>2012</li>
																<li>2011</li>
																<li>2010</li>
																<li>2009</li>
																<li>2008</li>
																<li>2007</li>
																<li>2006</li>
																<li>2005</li>
																<li>2004</li>
																<li>2003</li>
																<li>2002</li>
																<li>2001</li>
																<li>2000</li>
																<li>1999</li>
																<li>1998</li>
																<li>1997</li>
																<li>1996</li>
																<li>1995</li>
																<li>1994</li>
																<li>1993</li>
																<li>1992</li>
																<li>1991</li>
																<li>1990</li>
																<li>1989</li>
																<li>1988</li>
																<li>1987</li>
																<li>1986</li>
																<li>1985</li>
																<li>1984</li>
																<li>1983</li>
																<li>1982</li>
																<li>1981</li>
																<li>1980</li>
																<li>1979</li>
																<li>1978</li>
																<li>1977</li>
																<li>1976</li>
																<li>1975</li>
																<li>1974</li>
																<li>1973</li>
																<li>1972</li>
																<li>1971</li>
																<li>1970</li>
															</ul>
														</div>
													</div>
													<div class="fl">
														<input type="hidden" class="companyMonthEnd" value=""
															name="companyMonthEnd"> <input type="button"
															value="结束月份"
															class="profile_select_139 profile_select_normal select_companyMonthEnd">
														<div style="display: none;"
															class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
															<ul>
																<li>01</li>
																<li>02</li>
																<li>03</li>
																<li>04</li>
																<li>05</li>
																<li>06</li>
																<li>07</li>
																<li>08</li>
																<li>09</li>
																<li>10</li>
																<li>11</li>
																<li>12</li>
															</ul>
														</div>
													</div>
													<div class="clear"></div>
												</td>
											</tr>
											<tr>
												<td></td>
												<td colspan="3">
												<input type="submit" value="保 存" class="btn_profile_save"> 
												<a class="btn_profile_cancel" href="<%=basePath %>user/myresume">取 消</a></td>
											</tr>
										</tbody>
									</table>
								</form>
								<!--end .experienceForm-->
	
								<ul class="wlist clearfix">
									<c:forEach items="${workExps }" var="exp">
										<li style="width: 600px;height: 25px; min-height: 25px;">${exp.name }|${exp.position } | <fmt:formatDate value="${exp.beginDate }" pattern="yyyy-MM" />——<fmt:formatDate value="${exp.endDate }" pattern="yyyy-MM" /> &nbsp;&nbsp;
											<input type="hidden" id="expId" value="${exp.id }">
											<input type="hidden" id="expName" value="${exp.name }">
											<input type="hidden" id="startYear" value='<fmt:formatDate value="${exp.beginDate }" pattern="yyyy" />'>
											<input type="hidden" id="startMonth" value='<fmt:formatDate value="${exp.beginDate }" pattern="MM" />'>
											<input type="hidden" id="endYear" value='<fmt:formatDate value="${exp.endDate }" pattern="yyyy" />'>
											<input type="hidden" id="endMonth" value='<fmt:formatDate value="${exp.endDate }" pattern="MM" />'>
											<input type="hidden" id="expPosition" value="${exp.position }">
											<a href="javascript:;" class="editExp">编辑</a>|<a href="javascript:;" class="delExp" expId="${exp.id }">删除</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<!--end .experienceShow-->
						<div class="experienceEdit dn">
							<form class="experienceForm" method="post" action="<%=basePath %>resume/saveExp">
								<table>
									<tbody>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<input type="text" placeholder="公司名称" name="exp.name" class="companyName">
											</td>
											<td valign="top"><span class="redstar">*</span></td>
											<td><input type="text" placeholder="职位名称，如：产品经理"
												name="exp.position" class="positionName"></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<div class="fl">
													<input type="hidden" class="companyYearStart" value="" name="companyYearStart"> 
													<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart">
													<div
														class="box_companyYearStart boxUpDown boxUpDown_139 dn"
														style="display: none;">
														<ul>
															<li>2016</li>
															<li>2015</li>
															<li>2014</li>
															<li>2013</li>
															<li>2012</li>
															<li>2011</li>
															<li>2010</li>
															<li>2009</li>
															<li>2008</li>
															<li>2007</li>
															<li>2006</li>
															<li>2005</li>
															<li>2004</li>
															<li>2003</li>
															<li>2002</li>
															<li>2001</li>
															<li>2000</li>
															<li>1999</li>
															<li>1998</li>
															<li>1997</li>
															<li>1996</li>
															<li>1995</li>
															<li>1994</li>
															<li>1993</li>
															<li>1992</li>
															<li>1991</li>
															<li>1990</li>
															<li>1989</li>
															<li>1988</li>
															<li>1987</li>
															<li>1986</li>
															<li>1985</li>
															<li>1984</li>
															<li>1983</li>
															<li>1982</li>
															<li>1981</li>
															<li>1980</li>
															<li>1979</li>
															<li>1978</li>
															<li>1977</li>
															<li>1976</li>
															<li>1975</li>
															<li>1974</li>
															<li>1973</li>
															<li>1972</li>
															<li>1971</li>
															<li>1970</li>
														</ul>
													</div>
												</div>
												<div class="fl">
													<input type="hidden" class="companyMonthStart" value=""
														name="companyMonthStart"> <input type="button"
														value="开始月份"
														class="profile_select_139 profile_select_normal select_companyMonthStart">
													<div style="display: none;"
														class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
														<ul>
															<li>01</li>
															<li>02</li>
															<li>03</li>
															<li>04</li>
															<li>05</li>
															<li>06</li>
															<li>07</li>
															<li>08</li>
															<li>09</li>
															<li>10</li>
															<li>11</li>
															<li>12</li>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</td>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<div class="fl">
													<input type="hidden" class="companyYearEnd" value=""
														name="companyYearEnd"> <input type="button"
														value="结束年份"
														class="profile_select_139 profile_select_normal select_companyYearEnd">
													<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn"
														style="display: none;">
														<ul>
															<li>至今</li>
															<li>2016</li>
															<li>2015</li>
															<li>2014</li>
															<li>2013</li>
															<li>2012</li>
															<li>2011</li>
															<li>2010</li>
															<li>2009</li>
															<li>2008</li>
															<li>2007</li>
															<li>2006</li>
															<li>2005</li>
															<li>2004</li>
															<li>2003</li>
															<li>2002</li>
															<li>2001</li>
															<li>2000</li>
															<li>1999</li>
															<li>1998</li>
															<li>1997</li>
															<li>1996</li>
															<li>1995</li>
															<li>1994</li>
															<li>1993</li>
															<li>1992</li>
															<li>1991</li>
															<li>1990</li>
															<li>1989</li>
															<li>1988</li>
															<li>1987</li>
															<li>1986</li>
															<li>1985</li>
															<li>1984</li>
															<li>1983</li>
															<li>1982</li>
															<li>1981</li>
															<li>1980</li>
															<li>1979</li>
															<li>1978</li>
															<li>1977</li>
															<li>1976</li>
															<li>1975</li>
															<li>1974</li>
															<li>1973</li>
															<li>1972</li>
															<li>1971</li>
															<li>1970</li>
														</ul>
													</div>
												</div>
												<div class="fl">
													<input type="hidden" class="companyMonthEnd" value=""
														name="companyMonthEnd"> <input type="button"
														value="结束月份"
														class="profile_select_139 profile_select_normal select_companyMonthEnd">
													<div style="display: none;"
														class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
														<ul>
															<li>01</li>
															<li>02</li>
															<li>03</li>
															<li>04</li>
															<li>05</li>
															<li>06</li>
															<li>07</li>
															<li>08</li>
															<li>09</li>
															<li>10</li>
															<li>11</li>
															<li>12</li>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</td>
										</tr>
										<tr>
											<td></td>
											<td colspan="3">
												<input type="submit" value="保 存" class="btn_profile_save"> 
												<a class="btn_profile_cancel" href="javascript:;">取 消</a></td>
										</tr>
									</tbody>
								</table>
							</form>
							<!--end .experienceForm-->
						</div>
						<!--end .experienceEdit-->
						<c:if test="${workExps==null || workExps.size()<=0 }">
							<div class="experienceAdd pAdd">
								工作经历最能体现自己的工作能力，<br> 且完善后才可投递简历哦！ <span>添加工作经历</span>
							</div>
						</c:if>
						<!--end .experienceAdd-->
					</div>
					<!--end #workExperience-->

					
					<!--end #projectExperience-->
					<div class="profile_box" id="educationalBackground">
						<h2>
							教育背景<span>（投递简历时必填）</span>
						</h2>
						<c:if test="${educations!=null && educations.size()>0 }">
							<span class="c_add"></span>
							<div class="educationalShow">
								<form class="educationalForm borderBtm dn" action="<%=basePath%>resume/saveEdu" method="post">
									<table>
										<tbody>
											<tr>
												<td valign="top"><span class="redstar">*</span></td>
												<td>
													<input type="hidden" name="edu.id" value="">
													<input type="text" placeholder="学校名称" name="edu.name" class="schoolName">
												</td>
												<td valign="top"><span class="redstar">*</span></td>
												<td>
													<input type="hidden" class="degree" value="" name="edu.education"> 
													<input type="button" value="学历" class="profile_select_287 profile_select_normal select_degree">
													<div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;">
														<ul>
															<li>大专</li>
															<li>本科</li>
															<li>硕士</li>
															<li>博士</li>
															<li>其他</li>
														</ul>
													</div>
												</td>
											</tr>
											<tr>
												<td valign="top"><span class="redstar">*</span></td>
												<td>
													<input type="text" placeholder="专业名称" name="edu.major" class="professionalName">
												</td>
												<td valign="top"><span class="redstar">*</span></td>
												<td>
													<div class="fl">
														<input type="hidden" class="schoolYearStart" value="" name="companyYearStart"> 
														<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_schoolYearStart">
														<div class="box_schoolYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
															<ul>
																<li>2016</li>
																<li>2015</li>
																<li>2014</li>
																<li>2013</li>
																<li>2012</li>
																<li>2011</li>
																<li>2010</li>
																<li>2009</li>
																<li>2008</li>
																<li>2007</li>
																<li>2006</li>
																<li>2005</li>
																<li>2004</li>
																<li>2003</li>
																<li>2002</li>
																<li>2001</li>
																<li>2000</li>
																<li>1999</li>
																<li>1998</li>
																<li>1997</li>
																<li>1996</li>
																<li>1995</li>
																<li>1994</li>
																<li>1993</li>
																<li>1992</li>
																<li>1991</li>
																<li>1990</li>
																<li>1989</li>
																<li>1988</li>
																<li>1987</li>
																<li>1986</li>
																<li>1985</li>
																<li>1984</li>
																<li>1983</li>
																<li>1982</li>
																<li>1981</li>
																<li>1980</li>
																<li>1979</li>
																<li>1978</li>
																<li>1977</li>
																<li>1976</li>
																<li>1975</li>
																<li>1974</li>
																<li>1973</li>
																<li>1972</li>
																<li>1971</li>
																<li>1970</li>
															</ul>
														</div>
													</div>
													<div class="fl">
														<input type="hidden" class="schoolYearEnd" value="" name="companyYearEnd"> 
														<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_schoolYearEnd">
														<div style="display: none;" class="box_schoolYearEnd  boxUpDown boxUpDown_139 dn">
															<ul>
																<li>2021</li>
																<li>2020</li>
																<li>2019</li>
																<li>2018</li>
																<li>2017</li>
																<li>2016</li>
																<li>2015</li>
																<li>2014</li>
																<li>2013</li>
																<li>2012</li>
																<li>2011</li>
																<li>2010</li>
																<li>2009</li>
																<li>2008</li>
																<li>2007</li>
																<li>2006</li>
																<li>2005</li>
																<li>2004</li>
																<li>2003</li>
																<li>2002</li>
																<li>2001</li>
																<li>2000</li>
																<li>1999</li>
																<li>1998</li>
																<li>1997</li>
																<li>1996</li>
																<li>1995</li>
																<li>1994</li>
																<li>1993</li>
																<li>1992</li>
																<li>1991</li>
																<li>1990</li>
																<li>1989</li>
																<li>1988</li>
																<li>1987</li>
																<li>1986</li>
																<li>1985</li>
																<li>1984</li>
																<li>1983</li>
																<li>1982</li>
																<li>1981</li>
																<li>1980</li>
																<li>1979</li>
																<li>1978</li>
																<li>1977</li>
																<li>1976</li>
																<li>1975</li>
																<li>1974</li>
																<li>1973</li>
																<li>1972</li>
																<li>1971</li>
																<li>1970</li>
															</ul>
														</div>
													</div>
													<div class="clear"></div>
												</td>
											</tr>
											<tr>
												<td></td>
												<td colspan="3"><input type="submit" value="保 存"
													class="btn_profile_save"> <a
													class="btn_profile_cancel" href="<%=basePath %>user/myresume">取 消</a></td>
											</tr>
										</tbody>
									</table>
								</form>
								<!--end .educationalForm-->
	
								<ul class="elist clearfix">
									<c:forEach items="${educations }" var="edu">
										<li style="width: 600px;height: 25px; min-height: 25px;">
											${edu.name }|${edu.major }|${edu.education }|<fmt:formatDate value="${edu.beginDate }" pattern="yyyy" />——<fmt:formatDate value="${edu.endDate }" pattern="yyyy" />&nbsp;&nbsp;
											<input type="hidden" id="eduId" value="${edu.id }">
											<input type="hidden" id="eduName" value="${edu.name }">
											<input type="hidden" id="eduMajor" value="${edu.major }">
											<input type="hidden" id="eduEducation" value="${edu.education }">
											<input type="hidden" id="eduBeginYear" value='<fmt:formatDate value="${edu.beginDate }" pattern="yyyy" />'>
											<input type="hidden" id="eduEndYear" value='<fmt:formatDate value="${edu.endDate }" pattern="yyyy" />'>
											<a class="edit_education">编辑</a>|
											<a class="remove_education">删除</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<div class="educationalEdit dn">
							<form class="educationalForm" action="<%=basePath%>resume/saveEdu" method="post">
								<table>
									<tbody>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<input type="text" placeholder="学校名称" name="edu.name" class="schoolName">
											</td>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<input type="hidden" class="degree" value="" name="edu.education"> 
												<input type="button" value="学历" class="profile_select_287 profile_select_normal select_degree">
												<div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;">
													<ul>
														<li>大专</li>
														<li>本科</li>
														<li>硕士</li>
														<li>博士</li>
														<li>其他</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<input type="text" placeholder="专业名称" name="edu.major" class="professionalName">
											</td>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<div class="fl">
													<input type="hidden" class="schoolYearStart" value="" name="companyYearStart"> 
													<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_schoolYearStart">
													<div class="box_schoolYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
														<ul>
															<li>2016</li>
															<li>2015</li>
															<li>2014</li>
															<li>2013</li>
															<li>2012</li>
															<li>2011</li>
															<li>2010</li>
															<li>2009</li>
															<li>2008</li>
															<li>2007</li>
															<li>2006</li>
															<li>2005</li>
															<li>2004</li>
															<li>2003</li>
															<li>2002</li>
															<li>2001</li>
															<li>2000</li>
															<li>1999</li>
															<li>1998</li>
															<li>1997</li>
															<li>1996</li>
															<li>1995</li>
															<li>1994</li>
															<li>1993</li>
															<li>1992</li>
															<li>1991</li>
															<li>1990</li>
															<li>1989</li>
															<li>1988</li>
															<li>1987</li>
															<li>1986</li>
															<li>1985</li>
															<li>1984</li>
															<li>1983</li>
															<li>1982</li>
															<li>1981</li>
															<li>1980</li>
															<li>1979</li>
															<li>1978</li>
															<li>1977</li>
															<li>1976</li>
															<li>1975</li>
															<li>1974</li>
															<li>1973</li>
															<li>1972</li>
															<li>1971</li>
															<li>1970</li>
														</ul>
													</div>
												</div>
												<div class="fl">
													<input type="hidden" class="schoolYearEnd" value="" name="companyYearEnd"> 
													<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_schoolYearEnd">
													<div class="box_schoolYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
														<ul>
															<li>2016</li>
															<li>2015</li>
															<li>2014</li>
															<li>2013</li>
															<li>2012</li>
															<li>2011</li>
															<li>2010</li>
															<li>2009</li>
															<li>2008</li>
															<li>2007</li>
															<li>2006</li>
															<li>2005</li>
															<li>2004</li>
															<li>2003</li>
															<li>2002</li>
															<li>2001</li>
															<li>2000</li>
															<li>1999</li>
															<li>1998</li>
															<li>1997</li>
															<li>1996</li>
															<li>1995</li>
															<li>1994</li>
															<li>1993</li>
															<li>1992</li>
															<li>1991</li>
															<li>1990</li>
															<li>1989</li>
															<li>1988</li>
															<li>1987</li>
															<li>1986</li>
															<li>1985</li>
															<li>1984</li>
															<li>1983</li>
															<li>1982</li>
															<li>1981</li>
															<li>1980</li>
															<li>1979</li>
															<li>1978</li>
															<li>1977</li>
															<li>1976</li>
															<li>1975</li>
															<li>1974</li>
															<li>1973</li>
															<li>1972</li>
															<li>1971</li>
															<li>1970</li>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</td>
										</tr>
										<tr>
											<td></td>
											<td colspan="3"><input type="submit" value="保 存"
												class="btn_profile_save"> <a
												class="btn_profile_cancel" href="javascript:;">取 消</a></td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" class="eduId" value="">
							</form>
							<!--end .educationalForm-->
						</div>
						<!--end .educationalEdit-->
						<c:if test="${educations==null || educations.size()<=0 }">
							<div class="educationalAdd pAdd">
								教育背景可以充分体现你的学习和专业能力，<br> 且完善后才可投递简历哦！ <span>添加教育经历</span>
							</div>
						</c:if>
						<!--end .educationalAdd-->
					</div>
					<!--end #educationalBackground-->

					<div class="profile_box dn" id="selfDescription">
						<h2>自我描述</h2>
						<span class="c_edit dn"></span>
						<div class="descriptionShow dn"></div>
						<!--end .descriptionShow-->
						<div class="descriptionEdit dn">
							<form class="descriptionForm">
								<table>
									<tbody>
										<tr>
											<td colspan="2"><textarea
													class="selfDescription s_textarea" name="selfDescription"
													placeholder=""></textarea>
												<div class="word_count">
													你还可以输入 <span>500</span> 字
												</div></td>
										</tr>
										<tr>
											<td colspan="2"><input type="submit" value="保 存"
												class="btn_profile_save"> <a
												class="btn_profile_cancel" href="javascript:;">取 消</a></td>
										</tr>
									</tbody>
								</table>
							</form>
							<!--end .descriptionForm-->
						</div>
						<!--end .descriptionEdit-->
						<div class="descriptionAdd pAdd">
							描述你的性格、爱好以及吸引人的经历等，<br> 让企业了解多元化的你！ <span>添加自我描述</span>
						</div>
						<!--end .descriptionAdd-->
					</div>
					<input type="hidden" id="resumeId" value="268472">
				</div>
				<!--end .content_l-->
				<div class="content_r">
					<div class="mycenterR" id="myInfo">
						<h2>我的信息</h2>
						<a target="_blank" href="collections.html">我收藏的职位</a> <br> <a
							target="_blank" href="subscribe.html">我订阅的职位</a>
					</div>
				</div>
				<!--end .content_r-->
			</div>

			<input type="hidden" id="userid" name="userid" value="314873">

			<!-------------------------------------弹窗lightbox ----------------------------------------->
			<div style="display:none;">
				<!-- 上传简历 -->
				<div class="popup" id="uploadFile">
					<table width="100%">
						<tbody>
							<tr>
								<td align="center">
									<form>
										<a class="btn_addPic" href="javascript:void(0);"> <span>选择上传文件</span>
											<input type="file"
											onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload')"
											class="filePrew" id="resumeUpload" name="newResume" size="3"
											title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3">
										</a>
									</form>
								</td>
							</tr>
							<tr>
								<td align="left">支持word、pdf、ppt、txt、wps格式文件<br>文件大小需小于10M
								</td>
							</tr>
							<tr>
								<td align="left" style="color:#dd4a38; padding-top:10px;">注：若从其它网站下载的word简历，请将文件另存为.docx格式后上传</td>
							</tr>
							<tr>
								<td align="center"><img width="55" height="16"
									alt="loading" style="visibility: hidden;" id="loadingImg"
									src="theme/default/images/loading.gif"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--/#uploadFile-->

				<!-- 简历上传成功 -->
				<div class="popup" id="uploadFileSuccess">
					<h4>简历上传成功！</h4>
					<table width="100%">
						<tbody>
							<tr>
								<td align="center"><p>你可以将简历投给你中意的公司了。</p></td>
							</tr>
							<tr>
								<td align="center"><a class="btn_s" href="javascript:;">确&nbsp;定</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--/#uploadFileSuccess-->

				<!-- 没有简历请上传 -->
				<div class="popup" id="deliverResumesNo">
					<table width="100%">
						<tbody>
							<tr>
								<td align="center"><p class="font_16">你在拉勾还没有简历，请先上传一份</p></td>
							</tr>
							<tr>
								<td align="center">
									<form>
										<a class="btn_addPic" href="javascript:void(0);"> <span>选择上传文件</span>
											<input type="file"
											onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload1')"
											class="filePrew" id="resumeUpload1" name="newResume" size="3"
											title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M">
										</a>
									</form>
								</td>
							</tr>
							<tr>
								<td align="center">支持word、pdf、ppt、txt、wps格式文件，大小不超过10M</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--/#deliverResumesNo-->

				<!-- 上传附件简历操作说明-重新上传 -->
				<div class="popup" id="fileResumeUpload">
					<table width="100%">
						<tbody>
							<tr>
								<td>
									<div class="f18 mb10">请上传标准格式的word简历</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="f16">
										操作说明：<br> 打开需要上传的文件 - 点击文件另存为 - 选择.docx - 保存
									</div>
								</td>
							</tr>
							<tr>
								<td align="center"><a title="上传附件简历" href="#uploadFile"
									class="inline btn cboxElement">重新上传</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--/#fileResumeUpload-->

				<!-- 上传附件简历操作说明-重新上传 -->
				<div class="popup" id="fileResumeUploadSize">
					<table width="100%">
						<tbody>
							<tr>
								<td>
									<div class="f18 mb10">上传文件大小超出限制</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="f16">
										提示：<br> 单个附件不能超过10M，请重新选择附件简历！
									</div>
								</td>
							</tr>
							<tr>
								<td align="center"><a title="上传附件简历" href="#uploadFile"
									class="inline btn cboxElement">重新上传</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--/#deliverResumeConfirm-->

			</div>
			<!------------------------------------- end ----------------------------------------->

			<script src="theme/default/js/Chart.min.js" type="text/javascript"></script>
			<script src="theme/default/js/profile.min.js" type="text/javascript"></script>
			<!-- <div id="profileOverlay"></div> -->
			<div class="" id="qr_cloud_resume" style="display: none;">
				<div class="cloud">
					<img width="134" height="134" src=""> <a class="close"
						href="javascript:;"></a>
				</div>
			</div>
			<script>
</script>
			<div class="clear"></div>
			<input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop" style="display: none;"></a>
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

	<!--  -->

	<script type="text/javascript">
$(function(){
	$('#noticeDot-1').hide();
	$('#noticeTip a.closeNT').click(function(){
		$(this).parent().hide();
	});
});
var index = Math.floor(Math.random() * 2);
var ipArray = new Array('42.62.79.226','42.62.79.227');
var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
var CallCenter = {
		init:function(url){
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
				if(notice.status[0] == 0){
					$('#noticeDot-0').hide();
					$('#noticeTip').hide();
					$('#noticeNo').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
					$('#noticeNoPage').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
				}else{
					$('#noticeDot-0').show();
					$('#noticeTip strong').text(notice.status[0]);
					$('#noticeTip').show();
					$('#noticeNo').text('('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
					$('#noticeNoPage').text(' ('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
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