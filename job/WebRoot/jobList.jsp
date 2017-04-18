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
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>职位搜索</title>

<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
var ctx = "<%=basePath%>";
</script>
<link rel="Shortcut Icon" href="http://www.lagou.com/h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="theme/default/css/style.css"/>
<link rel="stylesheet" type="text/css" href="theme/default/css/external.min.css"/>
<link rel="stylesheet" type="text/css" href="theme/default/css/popup.css"/>
<script src="theme/default/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/jquery.lib.min.js"></script>
<script src="theme/default/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/additional-methods.js"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="theme/default/js/excanvas.js"></script>
<![endif]-->
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
    </div><!-- end #header -->
    <div id="container">
        
       	<div class="sidebar">
           	<div class="qq_group">
	            <h2>通知公告</h2>
	            	<ul>
	            		<c:forEach items="${news }" var="newsa">
		            		<li>${newsa.name }</li>
	            		</c:forEach>
	            	</ul>
            </div>
        </div>
        
        <div class="content">
       	<div id="search_box">
			<form action="<%=basePath %>work/list" method="post">
		        <ul id="searchType">
		       		<li data-searchtype="1" class="type_selected">职位</li>
		        </ul>
		        <div class="searchtype_arrow"></div>
		        <input type="text" id="search_input" name = "key"  tabindex="1" value="${key }"  placeholder="请输入职位名称，如：产品经理"  />
	            <input type="submit" id="search_button" value="搜索" />
	    	</form>
		</div>
<style>
.ui-autocomplete{width:488px;background:#fafafa !important;position: relative;z-index:10;border: 2px solid #91cebe;}
.ui-autocomplete-category{font-size:16px;color:#999;width:50px;position: absolute;z-index:11; right: 0px;/*top: 6px; */text-align:center;border-top: 1px dashed #e5e5e5;padding:5px 0;}
.ui-menu-item{ *width:439px;vertical-align: middle;position: relative;margin: 0px;margin-right: 50px !important;background:#fff;border-right: 1px dashed #ededed;}
.ui-menu-item a{display:block;overflow:hidden;}
</style>
<script type="text/javascript" src="theme/default/js/search.min.js"></script>
				<div class="breakline"></div>
				<div id="tip_didi" class="dn">
	            	<span>亲，“嘀嘀打车”已更名为“滴滴打车”了哦，我们已帮您自动跳转~</span>
	            	<a href="javascript:;">我知道了</a>
	            </div>
            	<ul class="hot_pos reset">
            		<c:forEach items="${works }" var="work">
	                    	<li class="odd clearfix">
        				       <div class="hot_pos_l">
			                        <div class="mb10">
			                            <a href="<%=basePath %>work/info?workId=${work.id }" title="${work.name }" target="_blank">${work.name }</a>&nbsp;<span class="c9">[${work.city }]</span>
			                        </div>
			                        <span><em class="c7">月薪：</em>${work.salaryMin }k-${work.salaryMax }k</span>
			                        <span><em class="c7">经验：</em> ${work.workExp }</span>
			                        <span><em class="c7">最低学历： </em>${work.education }</span>
			                        <br />
			                        <span><em class="c7">职位诱惑：</em>${work.advantage  }</span>
			                        <br />
			                        <span>${work.createDate }</span>
			                    </div> 
						        <div class="hot_pos_r">
						        	<c:if test="${sessionScope.index_user!=null &&  sessionScope.index_user.id!=null}">
				                        <div class="apply"> <a href="<%=basePath %>work/delivery?workId=${work.id}" onclick="alert('你的投职请求已经被发送！');return true;" target="_blank">投个简历</a></div>
			                        </c:if>
			                        <c:if test="${sessionScope.index_user==null ||  sessionScope.index_user.id==null}">
				                        <div class="apply"> <a href="<%=basePath %>login">投个简历</a></div>
			                        </c:if>
			                        <span></span><br/>
			                        <span><em class="c7"></em></span>
			                        <span><em class="c7"></em></span>
			                        
			                    </div>
			                 </li>
			              </c:forEach>  
	                   </ul>
            	</div>	

<script>
$(function(){
	/***************************
 	 * 分页
 	 */
 	 						$('.Pagination').pager({
		      currPage: 1,
		      pageNOName: "pn",
		      form: "searchForm",
		      pageCount: 30,
		      pageSize:  5 
		});
		
	$(".workplace dd").not('.more').children('a').click(function(){
		$('#lc').val(1);
		editForm("cityInput" , $(this).html());
	});
	
	$("#box_expectCity dd span").click(function(){
		$('#lc').val(1);
		editForm("cityInput" , $(this).html());
	});
	
	$('#options dd div').click(function(){
		var firstName = $(this).parents('dl').children('dt').text();
		var fn = $.trim(firstName);
		if (fn=="月薪范围"){
			editForm("yxInput" , $(this).html());
		}
		else if(fn=="工作经验"){
			editForm("gjInput" , $(this).html());
		}
		else if(fn=="最低学历"){
			editForm("xlInput" , $(this).html());
		}
		else if(fn=="工作性质"){
			editForm("gxInput" , $(this).html());
		}
		else if(fn=="发布时间"){
			editForm("stInput" , $(this).html());
		}
	});
	
	$('#selected ul').delegate('li span.select_remove','click',function(event){
		var firstName = $(this).parent('li').find('strong').text();
		var fn = $.trim(firstName);
		if (fn=="月薪范围")
			editForm("yxInput" , "");
		else if(fn=="工作经验")
			editForm("gjInput" , "");
		else if(fn=="最低学历")
			editForm("xlInput" , "");
		else if(fn=="工作性质")
			editForm("gxInput" , "");
		else if(fn=="发布时间")
			editForm("stInput" , "");
	});
	
	/* search结果飘绿	*/
	(function($) {
		var searchVal = $('#search_input').val();
		var reg = /\s/g;     
		searchVal = searchVal.replace(reg, "").split(""); 
		
		var resultL = '';
		var resultR = '';
		$('.hot_pos li').each(function(){
			resultL = $('.hot_pos_l a',this).text().split("");
			$.each(resultL,function(i,v){
				if($.inArray(v.toLowerCase(),searchVal) != -1 || $.inArray(v.toUpperCase(),searchVal) != -1){
					resultL[i] = '<span>'+ v +'</span>';
				}
			});
			$('.hot_pos_l a',this).html(resultL.join(''));
			
			resultR = $('.hot_pos_r .mb10 a',this).text().split("");
			$.each(resultR,function(i,v){
				if($.inArray(v.toLowerCase(),searchVal) != -1 || $.inArray(v.toUpperCase(),searchVal) != -1){
					resultR[i] = '<span>'+ v +'</span>';
				}
			});
			$('.hot_pos_r .mb10 a',this).html(resultR.join(''));
		});
		
	})(jQuery);
	
	//didi tip
   	if($.cookie('didiTip') != 1 && false){
		$('#tip_didi').show();
	}
	$('#tip_didi a').click(function(){
		$(this).parent().remove();
		$.cookie('didiTip',1,{ expires: 30, path: '/'});
	});
	
});

function editForm(inputId,inputValue){
	$("#"+inputId).val(inputValue);
	var keyword = $.trim($('#search_input').val());
	var reg =  /[`~!@\$%\^\&\*\(\)_<>\?:"\{\},\\\/;'\[\]]/ig;
	var re = /#/g;
	var r = /\./g;
	var kw = keyword.replace(reg," ");

	if(kw == ''){
		$('#searchForm').attr('action','list.html所有职位').submit();	
	}else{
		kw = kw.replace(re,'井');
		kw = kw.replace(r,'。');
		$('#searchForm').attr('action','list.html'+kw).submit();
	}
	//$("#searchForm").submit();
}
</script>

			<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="" />
	    	<a id="backtop" title="回到顶部" rel="nofollow"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
		<div class="wrapper">
		</div>
	</div>

<script type="text/javascript" src="theme/default/js/core.min.js"></script>
<script type="text/javascript" src="theme/default/js/popup.min.js"></script>

<!--  -->

</body>
</html>