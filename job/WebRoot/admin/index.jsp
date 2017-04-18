<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>招聘管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>script/third/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>script/third/easyui/themes/icon.css" />
	<script type="text/javascript" src="<%=basePath %>script/third/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>script/third/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>script/third/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath %>script/third/ueditor1_4_3_2/ueditor.config.js"></script>
	<script type="text/javascript" src="<%=basePath %>script/third/ueditor1_4_3_2/ueditor.all.js"></script>
	<script type="text/javascript" src="<%=basePath %>script/third/ueditor1_4_3_2/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="<%=basePath %>script/third/json.js"></script>
	<script type="text/javascript" src='<%=basePath %>script/util.js'> </script>
	<script type="text/javascript" src='<%=basePath %>script/index.js'> </script>
  </head>
  
  <body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<noscript>
		<div
			style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
			<img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
	<div region="north" split="true" border="false"
		style="overflow: hidden; height: 30px; background: url(<%=basePath %>theme/default/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="padding-left: 10px; font-size: 16px;"><img
			src="<%=basePath %>theme/default/images/blocks.gif" width="20" height="20"
			align="absmiddle" /> 招聘管理系统</span>
	</div>
	<div region="south" split="true"
		style="height: 30px; background: #D2E0F2;">
		<div class="footer">招聘管理系统</div>
	</div>
	<div region="west" split="true" title="导航菜单" style="width: 180px;"
		id="west">
		<input type="hidden" value="${type }" id="pageType">
		<div id="index-menu-accordion">
			<!--  导航内容 -->
		</div>

	</div>
	<div id="mainPanle" region="center" style="background: #eee; overflow-y: hidden">
		<div id="amdin_center_main" class="easyui-panel" title="用户管理" 
		        style="width:100%;height:100%;background:#fafafa;"
		        data-options="iconCls:'',closable:false,
		                fit:true,collapsible:false,minimizable:false,maximizable:false,href:'<%=basePath%>admin/user'">
		</div>
	</div>
</body>
</html>
