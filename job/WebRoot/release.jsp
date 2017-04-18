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
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>发布新职位</title>
<script type="text/javascript">
	var ctx="<%=basePath%>"
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="theme/default/css/style.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/external.min.css" type="text/css" rel="stylesheet">
<link href="theme/default/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="theme/default/js/jquery.1.10.1.min.js"></script>
<script src="theme/default/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="theme/default/js/ajaxfileupload.js"></script>
<script src="theme/default/js/additional-methods.js" type="text/javascript"></script>
<script src="theme/default/js/jobs.min.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="theme/default/js/excanvas.js"></script>
<![endif]-->
<script src="theme/default/js/ajaxCross.json" charset="UTF-8"></script>
<style type="text/css">
.BMap_mask {
	background: transparent url(theme/default/images/img/blank.gif);
}

.BMap_noscreen {
	display: none;
}

.BMap_button {
	cursor: pointer;
}

.BMap_zoomer {
	background-image: url(theme/default/images/img/mapctrls1d3.gif);
	background-repeat: no-repeat;
	overflow: hidden;
	font-size: 1px;
	position: absolute;
	width: 7px;
	height: 7px;
}

.BMap_stdMpCtrl div {
	position: absolute;
}

.BMap_stdMpPan {
	width: 44px;
	height: 44px;
	overflow: hidden;
	background: url(theme/default/images/img/mapctrls2d0.png) no-repeat;
}

.BMap_ie6 .BMap_stdMpPan {
	background: none;
}

.BMap_ie6 .BMap_smcbg {
	left: 0;
	width: 44px;
	height: 464px;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="theme/default/images/img/mapctrls2d0.png");
}

.BMap_ie6 .BMap_stdMpPanBg {
	z-index: -1;
}

.BMap_stdMpPan .BMap_button {
	height: 15px;
	width: 15px;
}

.BMap_panN,.BMap_panW,.BMap_panE,.BMap_panS {
	overflow: hidden;
}

.BMap_panN {
	left: 14px;
	top: 0;
}

.BMap_panW {
	left: 1px;
	top: 12px;
}

.BMap_panE {
	left: 27px;
	top: 12px;
}

.BMap_panS {
	left: 14px;
	top: 25px;
}

.BMap_stdMpZoom {
	top: 45px;
	overflow: hidden;
}

.BMap_stdMpZoom .BMap_button {
	width: 22px;
	height: 21px;
	left: 12px;
	overflow: hidden;
	background-image: url(theme/default/images/img/mapctrls2d0.png);
	background-repeat: no-repeat;
	z-index: 10;
}

.BMap_ie6 .BMap_stdMpZoom .BMap_button {
	background: none;
}

.BMap_stdMpZoomIn {
	background-position: 0 -221px;
}

.BMap_stdMpZoomOut {
	background-position: 0 -265px;
}

.BMap_ie6 .BMap_stdMpZoomIn div {
	left: 0;
	top: -221px;
}

.BMap_ie6 .BMap_stdMpZoomOut div {
	left: 0;
	top: -265px;
}

.BMap_stdMpType4 .BMap_stdMpZoom .BMap_button {
	left: 0;
	overflow: hidden;
	background: -webkit-gradient(linear, 50% 0, 50% 100%, from(rgba(255, 255, 255, 0.85)),
		to(rgba(217, 217, 217, 0.85)));
	z-index: 10;
	-webkit-border-radius: 22px;
	width: 34px;
	height: 34px;
	border: 1px solid rgba(255, 255, 255, 0.5);
	-webkit-box-shadow: 0 2px 3.6px #CCC;
	display: -webkit-box;
	-webkit-box-align: center;
	-webkit-box-pack: center;
	-webkit-box-sizing: border-box;
}

.BMap_stdMpType4 .BMap_smcbg {
	position: static;
	background: url(theme/default/images/img/mapctrls2d0_mb.png) 0 0 no-repeat;
	-webkit-background-size: 24px 32px;
}

.BMap_stdMpType4 .BMap_stdMpZoomIn {
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomIn .BMap_smcbg {
	width: 24px;
	height: 24px;
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomOut {
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomOut .BMap_smcbg {
	width: 24px;
	height: 6px;
	background-position: 0 -25px;
}

.BMap_stdMpSlider {
	width: 37px;
	top: 18px;
}

.BMap_stdMpSliderBgTop {
	left: 18px;
	width: 10px;
	overflow: hidden;
	background: url(theme/default/images/img/mapctrls2d0.png) no-repeat -23px -226px;
}

.BMap_stdMpSliderBgBot {
	left: 19px;
	height: 8px;
	width: 10px;
	top: 124px;
	overflow: hidden;
	background: url(theme/default/images/img/mapctrls2d0.png) no-repeat -33px bottom;
}

.BMap_ie6 .BMap_stdMpSliderBgTop,.BMap_ie6 .BMap_stdMpSliderBgBot {
	background: none;
}

.BMap_ie6 .BMap_stdMpSliderBgTop div {
	left: -23px;
	top: -226px;
}

.BMap_ie6 .BMap_stdMpSliderBgBot div {
	left: -33px;
	bottom: 0;
}

.BMap_stdMpSliderMask {
	height: 100%;
	width: 24px;
	left: 10px;
	cursor: pointer;
}

.BMap_stdMpSliderBar {
	height: 11px;
	width: 19px;
	left: 13px;
	top: 80px;
	overflow: hidden;
	background: url(theme/default/images/img/mapctrls2d0.png) no-repeat 0 -309px;
}

.BMap_stdMpSliderBar.h {
	background: url(theme/default/images/img/mapctrls2d0.png) no-repeat 0 -320px;
}

.BMap_ie6 .BMap_stdMpSliderBar,.BMap_ie6 .BMap_stdMpSliderBar.h {
	background: none;
}

.BMap_ie6 .BMap_stdMpSliderBar div {
	top: -309px;
}

.BMap_ie6 .BMap_stdMpSliderBar.h div {
	top: -320px;
}

.BMap_zlSt,.BMap_zlCity,.BMap_zlProv,.BMap_zlCountry {
	position: absolute;
	left: 34px;
	height: 21px;
	width: 28px;
	background-image: url(theme/default/images/img/mapctrls2d0.png);
	background-repeat: no-repeat;
	font-size: 0;
	cursor: pointer;
}

.BMap_ie6 .BMap_zlSt,.BMap_ie6 .BMap_zlCity,.BMap_ie6 .BMap_zlProv,.BMap_ie6 .BMap_zlCountry
	{
	background: none;
	overflow: hidden;
}

.BMap_zlHolder {
	display: none;
	position: absolute;
	top: 0;
}

.BMap_zlHolder.hvr {
	display: block;
}

.BMap_zlSt {
	background-position: 0 -380px;
	top: 21px;
}

.BMap_zlCity {
	background-position: 0 -401px;
	top: 52px;
}

.BMap_zlProv {
	background-position: 0 -422px;
	top: 76px;
}

.BMap_zlCountry {
	background-position: 0 -443px;
	top: 100px;
}

.BMap_ie6 .BMap_zlSt div {
	top: -380px;
}

.BMap_ie6 .BMap_zlCity div {
	top: -401px;
}

.BMap_ie6 .BMap_zlProv div {
	top: -422px;
}

.BMap_ie6 .BMap_zlCountry div {
	top: -443px;
}

.BMap_stdMpType1 .BMap_stdMpSlider,.BMap_stdMpType2 .BMap_stdMpSlider,.BMap_stdMpType3 .BMap_stdMpSlider,.BMap_stdMpType4 .BMap_stdMpSlider,.BMap_stdMpType2 .BMap_stdMpZoom,.BMap_stdMpType3 .BMap_stdMpPan,.BMap_stdMpType4 .BMap_stdMpPan
	{
	display: none;
}

.BMap_stdMpType3 .BMap_stdMpZoom {
	top: 0;
}

.BMap_stdMpType4 .BMap_stdMpZoom {
	top: 0;
}

.BMap_cpyCtrl a {
	font-size: 11px;
	color: #7979CC;
}

.BMap_scaleCtrl {
	height: 23px;
	overflow: hidden;
}

.BMap_scaleCtrl div.BMap_scaleTxt {
	font-size: 11px;
	font-family: Arial, sans-serif;
}

.BMap_scaleCtrl div {
	position: absolute;
	overflow: hidden;
}

.BMap_scaleHBar img,.BMap_scaleLBar img,.BMap_scaleRBar img {
	position: absolute;
	width: 37px;
	height: 442px;
	left: 0;
}

.BMap_scaleHBar {
	width: 100%;
	height: 5px;
	font-size: 0;
	bottom: 0;
}

.BMap_scaleHBar img {
	top: -437px;
	width: 100%;
}

.BMap_scaleLBar,.BMap_scaleRBar {
	width: 3px;
	height: 9px;
	bottom: 0;
	font-size: 0;
	z-index: 1;
}

.BMap_scaleLBar img {
	top: -427px;
	left: 0;
}

.BMap_scaleRBar img {
	top: -427px;
	left: -5px;
}

.BMap_scaleLBar {
	left: 0;
}

.BMap_scaleRBar {
	right: 0;
}

.BMap_scaleTxt {
	text-align: center;
	width: 100%;
	cursor: default;
	line-height: 18px;
}

.BMap_omCtrl {
	background-color: #fff;
	overflow: hidden;
}

.BMap_omOutFrame {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
}

.BMap_omInnFrame {
	position: absolute;
	border: 1px solid #999;
	background-color: #ccc;
	overflow: hidden;
}

.BMap_omMapContainer {
	position: absolute;
	overflow: hidden;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
}

.BMap_omViewMv {
	border-width: 1px;
	border-style: solid;
	border-left-color: #84b0df;
	border-top-color: #adcff4;
	border-right-color: #274b8b;
	border-bottom-color: #274b8b;
	position: absolute;
	z-index: 600;
}

.BMap_omViewInnFrame {
	border: 1px solid #3e6bb8;
}

.BMap_omViewMask {
	width: 1000px;
	height: 1000px;
	position: absolute;
	left: 0;
	top: 0;
	background-color: #68c;
	opacity: .2;
	filter: progid:DXImageTransform.Microsoft.Alpha(opacity=20);
}

.BMap_omBtn {
	height: 13px;
	width: 13px;
	position: absolute;
	cursor: pointer;
	overflow: hidden;
	background: url(theme/default/images/img/mapctrls1d3.gif) no-repeat;
	z-index: 1210;
}

.anchorBR .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-left: 1px solid #999;
}

.quad4 .BMap_omBtn {
	background-position: -26px -27px;
}

.quad4 .BMap_omBtn.hover {
	background-position: 0 -27px;
}

.quad4 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -39px -27px;
}

.quad4 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -13px -27px;
}

.anchorTR .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
}

.quad1 .BMap_omBtn {
	background-position: -39px -41px;
}

.quad1 .BMap_omBtn.hover {
	background-position: -13px -41px;
}

.quad1 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -26px -41px;
}

.quad1 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: 0 -41px;
}

.anchorBL .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-right: 1px solid #999;
}

.quad3 .BMap_omBtn {
	background-position: -27px -40px;
}

.quad3 .BMap_omBtn.hover {
	background-position: -1px -40px;
}

.quad3 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -40px -40px;
}

.quad3 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -14px -40px;
}

.anchorTL .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
}

.quad2 .BMap_omBtn {
	background-position: -40px -28px;
}

.quad2 .BMap_omBtn.hover {
	background-position: -14px -28px;
}

.quad2 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -27px -28px;
}

.quad2 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -1px -28px;
}

.anchorR .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	border-top: 1px solid #999;
}

.anchorL .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
	border-top: 1px solid #999;
}

.anchorB .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-left: 1px solid #999;
	border-right: 1px solid #999;
}

.anchorT .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
	border-left: 1px solid #999;
}

.anchorNon .BMap_omOutFrame,.withOffset .BMap_omOutFrame {
	border: 1px solid #999;
}

.BMap_zoomMask0,.BMap_zoomMask1 {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: transparent url(theme/default/images/img/blank.gif);
	z-index: 1000;
}

.BMap_contextMenu {
	position: absolute;
	border-top: 1px solid #adbfe4;
	border-left: 1px solid #adbfe4;
	border-right: 1px solid #8ba4d8;
	border-bottom: 1px solid #8ba4d8;
	padding: 0;
	margin: 0;
	width: auto;
	visibility: hidden;
	background: #fff;
	z-index: 10000000;
}

.BMap_cmShadow {
	position: absolute;
	background: #000;
	opacity: .3;
	filter: alpha(opacity = 30);
	visibility: hidden;
	z-index: 9000000;
}

div.BMap_cmDivider {
	border-bottom: 1px solid #adbfe4;
	font-size: 0;
	padding: 1px;
	margin: 0 6px;
}

div.BMap_cmFstItem {
	margin-top: 2px;
}

div.BMap_cmLstItem {
	margin-bottom: 2px;
}

.BMap_shadow img {
	border: 0 none;
	margin: 0;
	padding: 0;
	height: 370px;
	width: 1144px;
}

.BMap_pop .BMap_top {
	border-top: 1px solid #ababab;
	background-color: #fff;
}

.BMap_pop .BMap_center {
	border-left: 1px solid #ababab;
	border-right: 1px solid #ababab;
	background-color: #fff;
}

.BMap_pop .BMap_bottom {
	border-bottom: 1px solid #ababab;
	background-color: #fff;
}

.BMap_shadow,.BMap_shadow img,.BMap_shadow div {
	-moz-user-select: none;
	-webkit-user-select: none;
}

.BMap_checkbox {
	background: url(theme/default/images/img/mapctrls1d3.gif);
	vertical-align: middle;
	display: inline-block;
	width: 11px;
	height: 11px;
	margin-right: 4px;
	background-position: -14px 90px;
}

.BMap_checkbox.checked {
	background-position: -2px 90px;
}

.BMap_pop .BMap_top img,.BMap_pop .BMap_center img,.BMap_pop .BMap_bottom img
	{
	display: none;
}

@media print {
	.BMap_noprint {
		display: none;
	}
	.BMap_noscreen {
		display: block;
	}
	.BMap_mask {
		background: none;
	}
	.BMap_pop .BMap_top img,.BMap_pop .BMap_center img,.BMap_pop .BMap_bottom img
		{
		display: block;
	}
}

.BMap_vectex {
	cursor: pointer;
	width: 11px;
	height: 11px;
	position: absolute;
	background-repeat: no-repeat;
	background-position: 0 0;
}

.BMap_vectex_nodeT {
	background-image: url(theme/default/images/img/nodeT.gif);
}

.BMap_vectex_node {
	background-image: url(theme/default/images/img/node.gif);
}

.iw {
	width: 100%;
	-webkit-box-sizing: border-box;
	border: .3em solid transparent;
	-webkit-background-clip: padding;
}

.iw_rt {
	position: relative;
	height: 46px;
	width: 195px;
	-webkit-box-sizing: border-box;
	display: -webkit-box;
	-webkit-box-align: center;
	margin: 2px 5px 0 2px;
	background-color: rgba(0, 0, 0, 0.8);
	-webkit-box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.3);
	-webkit-border-radius: 2px;
	color: #fff;
}

.iw_rt:after {
	content: "";
	position: absolute;
	left: 50%;
	bottom: -8px;
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-top: 8px solid rgba(0, 0, 0, 0.8);
	border-right: 5px solid transparent;
	margin: 0 0 0 -6px;
}

.iw_s {
	text-align: center;
	vertical-align: middle;
	height: 100%;
	-webkit-box-sizing: border-box;
}

.iw_rt .iw_s1 {
	color: #cbcbcb;
}

.iw_rt b {
	color: #fff;
	font-weight: bold;
}

.iw_rt_gr {
	margin-left: -4px;
}

.iw_busline {
	margin: 32px 0 0 -3px;
}

.iw_busline .iw_cc {
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	padding: 0 6px;
}

.iw_r {
	-webkit-box-ordinal-group: 3;
}

.iw_r,.iw_l {
	height: 100%;
	font-size: 4.5em;
	text-align: center;
	color: #747474;
	border: none;
	-webkit-box-sizing: border-box;
	-webkit-border-radius: 0;
	line-height: .7em;
	border: 1px solid rgba(255, 255, 255, 0.2);
	width: 41px;
}

.iw_r {
	border-style: none none none solid;
}

.iw_l {
	border-style: none solid none none;
}

.iw_search,.iw_l {
	background:
		url("theme/default/images/img/u20LgruGtNFM8lqnNtfK2JqN3CVeW1gzWj9jThd0xd59R8BBgAAiefGO1Bt1gAAAABJRU5ErkJggg==")
		no-repeat 50% 50%;
	-webkit-background-size: 19px 19px;
}

.iw_line_s,.iw_r {
	background:
		url("theme/default/images/img/wCKLRHq20vjSoVNKWunH4rTBDv5Cv7NKeKfvvU2nINzHAuexzUA7KQTkoB6UxDicKvcqfQQYABaiUBxugCsr20AAAAAElFTkSuQmCC")
		no-repeat 50% 50%;
	-webkit-background-size: 19px 19px;
}

.iw_line {
	height: 64px;
	width: 228px;
	padding: 0 11px;
	line-height: 20px;
}

.iw_bustrans .iw_cc {
	text-align: center;
}

.iw_c {
	color: #FFFFFF;
	text-decoration: none;
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-align: center;
	-webkit-box-flex: 1;
}

.iw_cc {
	-webkit-box-sizing: border-box;
	width: 100%;
	border: none;
}

.gray_background {
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5
}

.light_gray_background {
	filter: alpha(opacity = 70);
	-moz-opacity: 0.7;
	-khtml-opacity: 0.7;
	opacity: 0.7
}

.panoInfoBox {
	cursor: pointer;
}

.panoInfoBox {
	position: relative;
	width: 323px;
	height: 101px;
	margin-bottom: 4px;
	cursor: pointer;
}

.panoInfoBox .panoInfoBoxTitleBg {
	width: 323px;
	height: 19px;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: 2;
	background-color: #000;
	opacity: .7;
}

.panoInfoBox .panoInfoBoxTitleContent {
	font-size: 12px;
	color: #fff;
	position: absolute;
	bottom: 2px;
	left: 5px;
	z-index: 3;
	text-decoration: none;
}

.RouteAddressOuterBkg {
	position: relative;
	padding: 32px 4px 4px 3px;
	background-color: #ffdd99;
}

.RouteAddressInnerBkg {
	padding: 3px 5px 8px 8px;
	background-color: #ffffff;
}

#RouteAddress_DIV1 {
	margin-top: 5px;
}

.RouteAddressTip {
	position: absolute;
	width: 340px;
	top: 0px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	color: #994c00;
}

.route_tip_con {
	position: absolute;
	top: 145px;
}

.route_tip_con .route_tip {
	position: absolute;
	width: 233px;
	height: 29px;
	color: #803300;
	text-align: center;
	line-height: 29px;
	border: #cc967a solid 1px;
	background: #fff2b2;
	z-index: 100000;
}

.route_tip_con .route_tip span {
	position: absolute;
	top: 0;
	right: 0;
	_right: -1px;
	width: 14px;
	height: 13px;
	background: url(theme/default/images/img/addrPage.png) no-repeat 0 -121px;
	cursor: pointer;
}

.route_tip_con .route_tip_shadow {
	width: 233px;
	height: 29px;
	position: absolute;
	left: 1px;
	top: 1px;
	background: #505050;
	border: 1px solid #505050;
	opacity: 0.2;
	filter: alpha(opacity = 20)
}

.sel_body_body_page {
	margin: 5px 0
}

.sel_n {
	margin-top: 5px;
	overflow: hidden;
}

.sel_n .sel_top {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -418px;
	height: 4px;
	font-size: 0px;
}

.sel_n .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(theme/default/images/img/addrPage.png) no-repeat 0 -41px;
}

.sel_n .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
}

.sel_n .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(theme/default/images/img/bgs.gif) no-repeat -79px -387px;
}

.sel_n .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_n .sel_body_button {
	float: left;
	width: 55px;
	margin-left: -55px;
	padding-top: 8px;
}

.sel_n .sel_body_button a {
	
}

.sel_n .sel_bottom {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -415px;
	height: 4px;
	font-size: 0px;
}

.sel_n .sel_body_body {
	padding: 3px 0 0 0
}

.sel_n1 {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_n1 .sel_top {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -418px;
	height: 4px;
	font-size: 0px;
}

.sel_n1 .sel_body_top {
	height: 31px;
	width: 100%;
	background: url(theme/default/images/img/sel_body_n_top.gif) repeat-x;
}

.sel_n1 .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(theme/default/images/img/addrPage.png) no-repeat 0 -41px
}

.sel_n1 .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_n1 .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(theme/default/images/img/bgs.gif) no-repeat -79px -387px;
}

.sel_n1 .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_n1 .sel_body_button {
	float: left;
	width: 20px;
	height: 31px;
	margin-left: -23px;
	background: url(theme/default/images/img/bgs.gif) no-repeat -253px -382px;
	overflow: hidden;
	zoom: 1;
	cursor: pointer;
}

.sel_n1 .sel_body_button a {
	display: none;
}

.sel_n1 .sel_body_body {
	display: none
}

.sel_n1 .sel_bottom {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -415px;
	height: 4px;
	font-size: 0px;
}

.sel_y {
	margin-top: 5px;
	overflow: hidden;
}

.sel_y .sel_top {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -439px;
	height: 4px;
	zoom: 1;
	font-size: 0px;
}

.sel_y .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(theme/default/images/img/addrPage.png) no-repeat 0 0
}

.sel_y .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_y .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(theme/default/images/img/bgs.gif) no-repeat -167px -384px;
}

.sel_y .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #5B7BCB;
}

.sel_y .sel_body_button {
	float: left;
	width: 20px;
	height: 31px;
	margin-left: -20px;
	background: url(theme/default/images/img/bgs.gif) no-repeat -269px -297px;
	cursor: pointer;
}

.sel_y .sel_body_button a {
	display: none;
}

.sel_y .sel_body_body {
	display: none;
	height: 0px
}

.sel_y .sel_body_body_div {
	
}

.sel_y .sel_bottom {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -436px;
	height: 4px;
	font-size: 0px;
}

.sel_y .sel_body_body_page {
	display: none;
	height: 0px;
}

.sel_x {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_x .sel_top {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -418px;
	height: 4px;
	font-size: 0px;
}

.sel_x .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(theme/default/images/img/addrPage.png) no-repeat 0 -41px;
}

.sel_x .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
}

.sel_x .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(theme/default/images/img/bgs.gif) no-repeat -122px -384px;
}

.sel_x .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_x .sel_body_button {
	float: left;
	width: 55px;
	margin-left: -55px;
	padding-top: 8px;
}

.sel_x .sel_body_button a {
	
}

.sel_x .sel_body_body {
	
}

.sel_x .sel_body_body_div {
	padding: 5px 5px 0 5px;
}

.sel_x .sel_bottom {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -415px;
	height: 4px;
	font-size: 0px;
}

.sel_x1 {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_x1 .sel_top {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -418px;
	height: 4px;
	font-size: 0px;
}

.sel_x1 .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(theme/default/images/img/addrPage.png) no-repeat 0 -41px
}

.sel_x1 .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_x1 .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(theme/default/images/img/bgs.gif) no-repeat -122px -384px;
}

.sel_x1 .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_x1 .sel_body_button {
	float: left;
	width: 55px;
	height: 31px;
	margin-left: -55px;
}

.sel_x1 .sel_body_button a {
	display: none;
}

.sel_x1 .sel_body_body {
	display: none;
	height: 0px;
}

.sel_x1 .sel_body_body_div {
	padding: 5px 5px 0 5px;
}

.sel_x1 .sel_bottom {
	background: url(theme/default/images/img/bgs.gif) no-repeat 0 -415px;
	height: 4px;
	font-size: 0px;
}

.sel_body_citylist {
	height: 100px;
	padding: 0 0 0 5px
}

.sel_body_resitem {
	table-layout: fixed;
	overflow-x: hidden;
	overflow-y: hidden;
}

.sel_body_resitem table {
	margin-right: 5px;
}

.sel_body_resitem tr {
	cursor: pointer;
}

.sel_body_resitem th {
	padding-top: 5px;
	padding-left: 5px;
	text-align: left;
	vertical-align: top;
	width: 22px;
}

.sel_body_resitem th div.iconbg {
	background: url(theme/default/images/img/markers_new_ie6.png) no-repeat scroll 0
		0;
	height: 29px;
	width: 24px;
}

.sel_body_resitem th div.icon {
	cursor: pointer
}

.sel_body_resitem th div#no_0_1,.sel_body_resitem th div#no_1_1 {
	background-position: 0 -64px
}

.sel_body_resitem th div#no_0_2,.sel_body_resitem th div#no_1_2 {
	background-position: -24px -64px
}

.sel_body_resitem th div#no_0_3,.sel_body_resitem th div#no_1_3 {
	background-position: -48px -64px
}

.sel_body_resitem th div#no_0_4,.sel_body_resitem th div#no_1_4 {
	background-position: -72px -64px
}

.sel_body_resitem th div#no_0_5,.sel_body_resitem th div#no_1_5 {
	background-position: -96px -64px
}

.sel_body_resitem th div#no_0_6,.sel_body_resitem th div#no_1_6 {
	background-position: -120px -64px
}

.sel_body_resitem th div#no_0_7,.sel_body_resitem th div#no_1_7 {
	background-position: -144px -64px
}

.sel_body_resitem th div#no_0_8,.sel_body_resitem th div#no_1_8 {
	background-position: -168px -64px
}

.sel_body_resitem th div#no_0_9,.sel_body_resitem th div#no_1_9 {
	background-position: -192px -64px
}

.sel_body_resitem th div#no_0_10,.sel_body_resitem th div#no_1_10 {
	background-position: -216px -64px
}

.sel_body_resitem td {
	line-height: 160%;
	padding: 3px 0 3px 3px;
	vertical-align: top;
}

.sel_body_resitem div.ra_td_title {
	float: left;
	margin-right: 40px;
}

.sel_body_resitem div.ra_td_button {
	float: right;
	width: 40px;
}

.sel_body_resitem div.ra_td_button input {
	height: 18px;
	font-size: 12px;
	width: 40px;
}

.sel_body_resitem div.clear {
	clear: both;
	height: 0px;
	width: 100%;
}

.sel_body_resitem td .selBtn {
	width: 70px;
	height: 29px;
	background: url(theme/default/images/img/addrPage.png) no-repeat -21px -81px;
	text-align: center;
	line-height: 29px;
	visibility: hidden;
	color: #b35900;
	display: inline-block;
	*display: inline;
	*zoom: 1;
}

.sel_body_resitem td .list_street_view_poi {
	display: inline-block;
	float: none;
	margin-right: 6px;
	position: static;
	*vertical-align: -3px;
	_vertical-align: -5px;
	*display: inline;
	*zoom: 1;
}

.selInfoWndBtn {
	width: 70px;
	height: 29px;
	background: url(theme/default/images/img/addrPage.png) no-repeat -21px -81px;
	text-align: center;
	line-height: 29px;
	margin: 0 auto;
	cursor: pointer;
	color: #b35900
}

.sel_body_body td a {
	text-decoration: none;
	cursor: auto;
}

.sel_body_body td a:hover,.sel_body_body td a:focus {
	text-decoration: underline;
}
</style>
<link rel="stylesheet" href="theme/default/css/ui.css">
<link rel="stylesheet" href="theme/default/css/window.css">
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
						<li class="current"><a href="release" rel="nofollow">发布职位</a></li>
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
					<dd>
						<a href="work/list">有效职位</a>
					</dd>
				</dl>
			</div>
			<!-- end .sidebar -->
			<div class="content">
				<dl class="company_center_content">
					<dt>
						<h1>
							<em></em> 发布新职位
						</h1>
					</dt>
					<dd>
						<div class="ccc_tr">
						</div>
						<form action="${work==null?'work/add':'work/update' }" method="post" id="jobForm">
							<input type="hidden" value="${work.id }" name="work.id"> 
							<table class="btm">
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td width="85">职位类别</td>
										<td>
											<input type="hidden" id="positionType" value="${work.type}" name="work.type"> 
											<input type="button" value='${work==null?"请选择职位类别":work.type }' id="select_category" class="selectr selectr_380">
											<div class="dn" id="box_job" style="display: none;">
												<dl>
													<dt>技术</dt>
													<dd>
														<ul class="reset job_main">
															<li><span>后端开发</span>
																<ul class="reset job_sub dn">
																	<li>Java</li>
																	<li>C++</li>
																	<li>PHP</li>
																	<li>数据挖掘</li>
																	<li>C</li>
																	<li>C#</li>
																	<li>.NET</li>
																	<li>Hadoop</li>
																	<li>Python</li>
																	<li>Delphi</li>
																	<li>VB</li>
																	<li>Perl</li>
																	<li>Ruby</li>
																	<li>Node.js</li>
																</ul></li>
															<li><span>移动开发</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -160px;">
																	<li>HTML5</li>
																	<li>Android</li>
																	<li>iOS</li>
																	<li>WP</li>
																</ul></li>
															<li><span>前端开发</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -310px;">
																	<li>web前端</li>
																	<li>Flash</li>
																	<li>html5</li>
																	<li>JavaScript</li>
																	<li>U3D</li>
																	<li>COCOS2D-X</li>
																</ul></li>
															<li><span>测试</span>
																<ul class="reset job_sub dn">
																	<li>测试工程师</li>
																	<li>自动化测试</li>
																	<li>功能测试</li>
																	<li>性能测试</li>
																	<li>测试开发</li>
																</ul></li>
															<li><span>运维</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -160px;">
																	<li>运维工程师</li>
																	<li>运维开发工程师</li>
																	<li>网络工程师</li>
																	<li>系统工程师</li>
																	<li>IT支持</li>
																</ul></li>
															<li><span>DBA</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -310px;">
																	<li>MySQL</li>
																	<li>SQLServer</li>
																	<li>Oracle</li>
																	<li>DB2</li>
																	<li>MongoDB</li>
																</ul></li>
															<li><span>项目管理</span>
																<ul class="reset job_sub dn">
																	<li>项目经理</li>
																</ul></li>
															<li><span>高端技术职位</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -160px;">
																	<li>技术经理</li>
																	<li>技术总监</li>
																	<li>测试经理</li>
																	<li>架构师</li>
																	<li>CTO</li>
																	<li>运维总监</li>
																</ul></li>
														</ul>
													</dd>
												</dl>
												<dl>
													<dt>产品</dt>
													<dd>
														<ul class="reset job_main">
															<li><span>产品经理</span>
																<ul class="reset job_sub dn">
																	<li>产品经理</li>
																	<li>网页产品经理</li>
																	<li>移动产品经理</li>
																	<li>产品助理</li>
																	<li>数据产品经理</li>
																	<li>电商产品经理</li>
																	<li>游戏策划</li>
																</ul></li>
															<li><span>产品设计师</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -160px;">
																	<li>网页产品设计师</li>
																	<li>无线产品设计师</li>
																</ul></li>
															<li><span>高端产品职位</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -310px;">
																	<li>产品部经理</li>
																	<li>产品总监</li>
																</ul></li>
														</ul>
													</dd>
												</dl>
												<dl>
													<dt>设计</dt>
													<dd>
														<ul class="reset job_main">
															<li><span>视觉设计</span>
																<ul class="reset job_sub dn">
																	<li>视觉设计师</li>
																	<li>网页设计师</li>
																	<li>Flash设计师</li>
																	<li>APP设计师</li>
																	<li>UI设计师</li>
																	<li>平面设计师</li>
																	<li>美术设计师（2D/3D）</li>
																	<li>广告设计师</li>
																	<li>多媒体设计师</li>
																	<li>原画师</li>
																	<li>游戏特效</li>
																	<li>游戏界面设计师</li>
																	<li>游戏场景</li>
																	<li>游戏角色</li>
																	<li>游戏动作</li>
																</ul></li>
															<li><span>交互设计</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -160px;">
																	<li>交互设计师</li>
																	<li>无线交互设计师</li>
																	<li>网页交互设计师</li>
																	<li>硬件交互设计师</li>
																</ul></li>
															<li><span>用户研究</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -310px;">
																	<li>数据分析师</li>
																	<li>用户研究员</li>
																	<li>游戏数值策划</li>
																</ul></li>
															<li><span>高端设计职位</span>
																<ul class="reset job_sub dn">
																	<li>设计经理/主管</li>
																	<li>设计总监</li>
																	<li>视觉设计经理/主管</li>
																	<li>视觉设计总监</li>
																	<li>交互设计经理/主管</li>
																	<li>交互设计总监</li>
																	<li>用户研究经理/主管</li>
																	<li>用户研究总监</li>
																</ul></li>
														</ul>
													</dd>
												</dl>
												<dl>
													<dt>运营</dt>
													<dd>
														<ul class="reset job_main">
															<li><span>运营</span>
																<ul class="reset job_sub dn">
																	<li>用户运营</li>
																	<li>产品运营</li>
																	<li>数据运营</li>
																	<li>内容运营</li>
																	<li>活动运营</li>
																	<li>商家运营</li>
																	<li>品类运营</li>
																	<li>游戏运营</li>
																	<li>网络推广</li>
																</ul></li>
															<li><span>编辑</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -160px;">
																	<li>副主编</li>
																	<li>内容编辑</li>
																</ul></li>
															<li><span>客服</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -310px;">
																	<li>售前咨询</li>
																	<li>售后客服</li>
																</ul></li>
															<li><span>高端运营职位</span>
																<ul class="reset job_sub dn">
																	<li>主编</li>
																	<li>运营总监</li>
																	<li>COO</li>
																</ul></li>
														</ul>
													</dd>
												</dl>
												<dl>
													<dt>市场与销售</dt>
													<dd>
														<ul class="reset job_main">
															<li><span>市场/营销</span>
																<ul class="reset job_sub dn">
																	<li>市场营销</li>
																	<li>市场策划</li>
																	<li>市场顾问</li>
																	<li>市场推广</li>
																	<li>SEO</li>
																	<li>SEM</li>
																	<li>商务渠道</li>
																	<li>商业数据分析</li>
																	<li>活动策划</li>
																</ul></li>
															<li><span>公关</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -160px;">
																	<li>媒介经理</li>
																	<li>广告协调</li>
																	<li>品牌公关</li>
																</ul></li>
															<li><span>销售</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -310px;">
																	<li>销售专员</li>
																	<li>销售经理</li>
																	<li>客户代表</li>
																	<li>大客户代表</li>
																	<li>BD经理</li>
																	<li>商务渠道</li>
																	<li>渠道销售</li>
																	<li>代理商销售</li>
																</ul></li>
															<li><span>高端市场职位</span>
																<ul class="reset job_sub dn">
																	<li>市场总监</li>
																	<li>销售总监</li>
																	<li>商务总监</li>
																	<li>CMO</li>
																	<li>公关总监</li>
																</ul></li>
														</ul>
													</dd>
												</dl>
												<dl>
													<dt>职能</dt>
													<dd>
														<ul class="reset job_main">
															<li><span>人力资源</span>
																<ul class="reset job_sub dn">
																	<li>人力资源</li>
																	<li>招聘</li>
																	<li>HRBP</li>
																	<li>人事/HR</li>
																	<li>培训经理</li>
																	<li>薪资福利经理</li>
																	<li>绩效考核经理</li>
																</ul></li>
															<li><span>行政</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -160px;">
																	<li>助理</li>
																	<li>前台</li>
																	<li>法务</li>
																	<li>行政</li>
																</ul></li>
															<li><span>财务</span>
																<ul class="reset job_sub dn"
																	style="margin-left: -310px;">
																	<li>会计</li>
																	<li>出纳</li>
																	<li>财务</li>
																</ul></li>
															<li><span>高端职能职位</span>
																<ul class="reset job_sub dn">
																	<li>行政总监/经理</li>
																	<li>财务总监/经理</li>
																	<li>HRD/HRM</li>
																	<li>CFO</li>
																</ul></li>
														</ul>
													</dd>
												</dl>
											</div>
										</td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>职位名称</td>
										<td>
											<input type="text" placeholder="请输入职位名称，如：产品经理" value="${work.name }" name="work.name" id="positionName">
										</td>
									</tr>
									<tr>
										<td></td>
										<td>所属部门</td>
										<td>
											<input type="text" placeholder="请输入所属部门" value="${work.department }" name="work.department" id="department">
										</td>
									</tr>
								</tbody>
							</table>

							<table class="btm">
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td width="85">工作性质</td>
										<td>
											<ul class="profile_radio clearfix reset">
												<li ${work.nature=="全职"?"class='current'":"" }>全职<em></em> 
													<input type="radio"  ${work.nature=="全职"?"checked='checked'":"" } name="work.nature" value="全职">
												</li>
												<li  ${work.nature=="兼职"?"class='current'":"" }>兼职<em></em> 
													<input type="radio" ${work.nature=="兼职"?"checked='checked'":"" } name="work.nature" value="兼职">
												</li>
												<li ${work.nature=="实习"?"class='current'":"" }>实习<em></em> 
													<input type="radio" ${work.nature=="实习"?"checked='checked'":"" } name="work.nature" value="实习">
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>月薪范围</td>
										<!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
										<td>
											<div class="salary_range">
												<div>
													<input type="text" placeholder="最低月薪" value="${salaryMin }"
														id="salaryMin" name="salaryMin"> <span>k</span>
												</div>
												<div>
													<input type="text" placeholder="最高月薪" value="${salaryMax }"
														id="salaryMax" name="salaryMax"> <span>k</span>
												</div>
												<span>只能输入整数，如：9</span>
											</div>
										</td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>工作城市</td>
										<td>
											<input type="text" placeholder="请输入工作城市，如：北京" value="${work.city }" name="work.city" id="workAddress">
										</td>
									</tr>
								</tbody>
							</table>

							<table class="btm">
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td width="85">工作经验</td>
										<td>
											<input type="hidden" id="experience" value="${work.workExp }" name="work.workExp"> 
											<input type="button" value="${work==null?'请选择工作经验':work.workExp }" id="select_experience" class="selectr selectr_380">
											<div class="boxUpDown boxUpDown_380 dn" id="box_experience" style="display: none;">
												<ul>
													<li>不限</li>
													<li>应届毕业生</li>
													<li>1年以下</li>
													<li>1-3年</li>
													<li>3-5年</li>
													<li>5-10年</li>
													<li>10年以上</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>学历要求</td>
										<!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
										<td>
											<input type="hidden" id="education" value="${work.education }" name="work.education"> 
											<input type="button" value="${work==null?'请选择学历要求':work.education }" id="select_education" class="selectr selectr_380">
											<div class="boxUpDown boxUpDown_380 dn" id="box_education" style="display: none;">
												<ul>
													<li>不限</li>
													<li>大专</li>
													<li>本科</li>
													<li>硕士</li>
													<li>博士</li>
												</ul>
											</div></td>
									</tr>
								</tbody>
							</table>

							<table class="btm">
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td width="85">职位诱惑</td>
										<td>
											<input type="text" placeholder="20字描述该职位的吸引力，如：福利待遇、发展前景等" value="${work.advantage }" name="work.advantage" class="input_520" id="positionAdvantage">
										</td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>职位描述</td>
										<td><span class="c9 f14">(建议分条描述工作职责等。请勿输入公司邮箱、联系电话及其他外链，否则将自动删除)</span>

											<textarea name="work.describe" id="positionDetail"
												class="tinymce" aria-hidden="true">${work.describe }</textarea>
										</td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>工作地址</td>
										<td>
											<input type="text" placeholder="请输入详细的工作地址" value="${work.address }" name="work.address" class="input_520" id="positionAddress">
										</td>
									</tr>
								</tbody>
							</table>

							<table>
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td colspan="2">接收简历邮箱： <span id="receiveEmailVal">admin@admin.com</span>
											<input type="hidden" value="admin@admin.com"
											id="receiveEmail" name="email">
										</td>
									</tr>
									<tr>
										<td width="25"></td>
										<td colspan="2">
											<input type="submit" value="发布" id="formSubmit" class="btn_32">
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</dd>
				</dl>
			</div>
			</div>
			<!------------------------------------- end ----------------------------------------->
			<!-- <script type="text/javascript" src="theme/default/js/tinymce.min.js"></script>
<script>
$(function(){
		
	/*textarea 编辑器*/
	tinymce.init({
	    selector: "textarea.tinymce",
	    // width: 100,
	    height: 225,
		language: "zh_CN",
		content_css: ctx + "/js/tinymce4/content.css",
		plugins: "contextmenu autolink code paste searchreplace",
	    contextmenu: "copy cut paste",
	    // paste_word_valid_elements: "",
	    paste_as_text: true,
	    // paste_webkit_styles: "color",//all | none
	    // paste_retain_style_properties: "font-size",//
	    menubar: false,
	    statusbar: false,
	    toolbar: [
	    	"undo redo | bold italic underline strikethrough | bullist numlist | alignleft aligncenter alignright | removeformat | code"
	    ],
	    save_enablewhendirty: function(e) {
	        console.log('dirty',e);
	    },
	    save_onsavecallback: function(e){
	        console.log('save',e);
	    },
	    setup: function (editor) {
	        editor.on('keyup', function (e) {  
	        	tinyMCE.triggerSave();
	        	var editorContent = tinyMCE.get(editor.id).getContent();
			    if(editorContent.length > 20){
					$("#" + editor.id).valid();
			    }
	        });
	    }
	});
});
</script> -->
	<div class="clear"></div>
			<input type="hidden" value="c29d4a7c35314180bf3be5eb3f00048f"
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