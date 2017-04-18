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
	<form action="<%=basePath%>admin/addNews" method="post">
		<table style="width: 100%;">
			<tr>
				<th>标题</th>
				<td><input type="text" name="news.name"></td>
				
			</tr>
			<tr>
				<th>内容</th>
				<td><textarea name="news.describe" style="width:800px; height: 300px;"></textarea></td>
			</tr> 
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" value="保存"></td>
			</tr>
		</table>
	</form>
</div>