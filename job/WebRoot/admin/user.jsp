<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
<!--
table{
	border: 1px solid;
}
table th{
	border: 1px solid;
}
table th td{
	border: 1px solid;
}
table tr td{
	border: 1px solid;
}
-->
</style>
<div style="width: 100%; height: 100%;">
	<table style="width: 100%;">
		<tr>
			<th>id</th>
			<th>姓名</th>
			<th>账号</th>
			<th>邮箱账号</th>
			<th>电话号码</th>
			<th>用户类型</th>
		</tr>
		
		<c:forEach items="${users }" var="user">
			<tr>
				<td>${user.id }</td>
				<td>${user.name }</td>
				<td>${user.account }</td>
				<td>${user.email }</td>
				<td>${user.phone }</td>
				<td>${user.type==1?"系统管理员":user.type==2?"企业会员":user.type==3?"普通用户":"" }</td>
			</tr>
		</c:forEach>
	</table>
</div>