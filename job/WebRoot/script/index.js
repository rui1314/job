var currentLoginUser;

$(function() {

	InitLeftMenu(getUserMenu());
	
	
	
	$("#logout").click(function(){
		$.messager.confirm("提示","你即将退出系统，是否继续？",function(r){
			if(r){
				$.post("login_logout",function(data){
					if(data && data.success){
						window.location.href="adminIndex";
					}
				})
			}
		})
	});
	
	$("#edit_base_info_bth").click(function(){
		$('#base_user_detail_info').dialog({
	        title: '修改密码',
	        width: 300,
	        height:190,
	        modal: true,
	        shadow: true,
	        resizable:false,
	        buttons:[
					{
					iconCls:'icon-add',
					text:'确定',
					handler:function(){
						var userId = $("#base_user_id").val();
						var oldPassword = $("#txtOldPassword").val();
						var newPassword = $("#txtNewPass").val();
						var reNewPassword = $("#txtRePass").val();
						
						if(newPassword!=reNewPassword){
							$("#updatepassword_error_info").html("两次密码输入不一致，请重新输入！");
							return false;
						}else{
							$("#updatepassword_error_info").html("");
						}
						
						$.post("user_uppassword",
								{"user.id":userId,oldPassword:oldPassword,"user.password":newPassword},
								function(data){
									if(data && data.success){
										util.showInfoMessage(data.msg);
										$('#base_user_detail_info').dialog('close');
									}else{
										$("#updatepassword_error_info").html(data.msg);
									}
								}
						);
					}
				},{
					iconCls:'icon-edit',
					text:'取消',
					handler:function(){
						$('#base_user_detail_info').dialog('close');
					}
				}],
				onClose:function(){
					reloadThisPage();
				}
	    });
	});
})

// 初始化左侧
function InitLeftMenu(menu) {
	var menuData = util.arr2tree(menu, "id", "pid", "menus")[0];
	$("#index-menu-accordion").empty();
	var menulist = "";
	$.each(menuData, function(i, n) {
		menulist += '<div title="' + n.menuName + '"  icon="' + n.icon
				+ '" style="overflow:auto;">';
		menulist += '<ul>';
		if(n.menus){
			$.each(n.menus, function(j, o) {
				menulist += '<li><div><a url="'+o.uri+'" href="javascript:;" ><span class="icon '
						+ o.icon + '" ></span>' + o.menuName + '</a></div></li> ';
			})
		}
		menulist += '</ul></div>';
	})
	$("#index-menu-accordion").html(menulist);
	$('#index-menu-accordion li a').click(function() {
		var tabTitle = $(this).text();
		var url = $(this).attr("url");
		
		$("#amdin_center_main").panel({
			href:url,
			title:tabTitle
		});
//		addTab(tabTitle, url);
		$('#index-menu-accordion li div').removeClass("selected");
		$(this).parent().addClass("selected");
	}).hover(function() {
		$(this).parent().addClass("hover");
	}, function() {
		$(this).parent().removeClass("hover");
	});
	$("#index-menu-accordion").accordion({
		fit : true,
		border : false
	});
	
	var type=$("#pageType").val();
	if(type==3){
		$('#index-menu-accordion li a').each(function(){
			if($(this).text()=="通知公告"){
				$(this).click();
			}
		});
	}
}

function getUserMenu(){
	var menu = [ {
		menuName : '系统管理',
		menus : [ {
			menuName : '用户管理',
			uri:"admin/user"
		}, {
			menuName : '职位管理',
			uri:"admin/work"
		}, {
			menuName : '通知公告',
			uri:"admin/news"
		} ]
	} ];
	return menu;
}

function addNews(){
	$("#amdin_center_main").panel({
		href:"admin/addNews.jsp",
		title:"添加新闻"
	});
}
