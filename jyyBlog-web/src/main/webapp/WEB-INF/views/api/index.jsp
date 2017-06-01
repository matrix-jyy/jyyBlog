<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>Matrix</title>
<link rel="shortcut icon" href="favicon.ico">
<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="text-center">
				<h1 style="color: #fff">Matrix3.0 API</h1>
			</div>
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element"></div>
						<div class="logo-element">MatrixAPI</div>
					</li>


					<li><a href="#"> <i class="fa "></i><span
							class="nav-label">起步</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem"
								href="${path }/api/redirect/introduce"><i class="fa"></i>介绍</a></li>
							<li><a class="J_menuItem" href="${path }/api/redirect/xmbs"><i
									class="fa"></i>项目部署</a></li>
							<li><a class="J_menuItem" href="${path }/api/redirect/eckf"><i
									class="fa"></i>二次开发</a></li>
						</ul></li>

					<li><a href="#"> <i class="fa "></i><span
							class="nav-label">系统js工具类</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem"
								href="${path }/api/redirect/AjaxProxy"><i class="fa"></i>AjaxProxy</a></li>
							<li><a class="J_menuItem" href="${path }/api/redirect/MGrid"><i
									class="fa"></i>MGrid</a></li>
							<li><a class="J_menuItem" href="${path }/api/redirect/MForm"><i
									class="fa"></i>MForm</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/MTools"><i class="fa"></i>MTools</a></li>
							<li><a class="J_menuItem" href="${path }/api/redirect/MUI"><i
									class="fa"></i>MUI</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/MValidform"><i class="fa"></i>MValidform</a></li>
						</ul></li>
					<li><a href="#"> <i class="fa "></i><span
							class="nav-label">常用功能</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem"
								href="${path }/api/redirect/kindeditorDemo"><i class="fa"></i>富文本编辑器</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/kindeditorShear"><i class="fa"></i>富文本粘贴剪切图片</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/upload"><i class="fa"></i>文件上传</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/childDialogDemo"><i class="fa"></i>字父表格选择</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/printDemo"><i class="fa"></i>打印</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/Ajaxproxy"><i class="fa"></i>Websocket</a></li>
						</ul></li>
					<li><a href="#"> <i class="fa "></i><span
							class="nav-label">Java工具类</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem"
								href="${path }/api/redirect/showInterface"><i class="fa"></i>字符串处理</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/sendEmail"><i class="fa"></i>发送邮件</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/sendPhone"><i class="fa"></i>短信验证</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/quartzTime"><i class="fa"></i>定时器</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/importFile"><i class="fa"></i>excel导入功能</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/exportFile"><i class="fa"></i>导出excel</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/Ajaxproxy"><i class="fa"></i>导出pdf</a></li>
						</ul></li>
					<li><a href="#"> <i class="fa "></i><span
							class="nav-label">常见问题</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem"
								href="${path }/api/redirect/showInterface"><i class="fa"></i>后台问题</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/Ajaxproxy"><i class="fa"></i>样式问题</a></li>
							<li><a class="J_menuItem"
								href="${path }/api/redirect/Ajaxproxy"><i class="fa"></i>部署问题</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i></a> <span
							class="text-primary welcomtitle">MatrixAPI</span>
					</div>

				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab"
							data-id="index_v1.html">首页</a>
					</div>
				</nav>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="${path }/common/loginOut"
					class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="${path }/api/redirect/welcome" frameborder="0"
					data-id="index_v1.html" seamless></iframe>
			</div>
			<div class="footer">
				<div style="color: #676a6c;" class="pull-right">&copy;
					Copyright©2014-2016 All Rights Reserved ZkingSoft</div>
			</div>
		</div>
		<!--右侧部分结束-->
		<!--右侧边栏开始-->
		<div id="right-sidebar">
			<div class="sidebar-container"></div>
		</div>
		<!--右侧边栏结束-->
	</div>
</body>
</html>