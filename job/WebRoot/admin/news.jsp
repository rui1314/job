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
	<input type="button" value="添加" id="btn_add_news" onclick="addNews();">
	<table style="width: 100%;">
		<tr>
			<th>id</th>
			<th>标题</th>
			<th>创建时间</th>
			<th>操作</th>
		</tr>
		
		<c:forEach items="${newsList }" var="news">
			<tr>
				<td>${news.id }</td>
				<td>${news.name }</td>
				<td>${news.createDate }</td>
				<td><a href="<%=basePath%>admin/delNews?id=${news.id }">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</div>