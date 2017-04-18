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
			<th>职位名称</th>
			<th>工作类型</th>
			<th>部门</th>
			<th>地址</th>
		</tr>
		
		<c:forEach items="${works }" var="work">
			<tr>
				<td>${work.id }</td>
				<td>${work.name }</td>
				<td>${work.type }</td>
				<td>${work.department }</td>
				<td>${work.address }</td>
			</tr>
		</c:forEach>
	</table>
</div>