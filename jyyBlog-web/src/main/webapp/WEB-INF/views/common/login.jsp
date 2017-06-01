<%@page import="com.zkingsoft.constance.SystemConstance"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="matrix"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>卓景京CMS建站系统登录</title>
<script>
	var isoldIE = false;
	if (navigator.userAgent.indexOf("MSIE") > 0) {
		if (navigator.userAgent.indexOf("MSIE 6.0") > 0
				|| navigator.userAgent.indexOf("MSIE 7.0") > 0
				|| avigator.userAgent.indexOf("MSIE 8.0") > 0) {
			isoldIE = true;
		}
	}
	if (isoldIE) {
		window.top.location = "${path}/common/redirect/oldIE";
	}
	if (window.top !== window.self) {
		window.top.location = window.location
	};
</script>
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
<link href="${path }/resource/css/styleOne/login.min.css"
	rel="stylesheet">
<style type="text/css">
.layui-layer-content {
	color: #000;
}
</style>
</head>

<body class="signin" onkeypress="dologin(event)">
	<div class="signinpanel">
		<div class="row">
			<div class="col-sm-7">
				<div class="signin-info">
					<div class="logopanel m-b">
						<h1>[ 卓景京CMS建站系统 ]</h1>
					</div>
					<div class="m-b"></div>
					<h4>
						欢迎使用 <strong>卓景京CMS建站系统</strong>
					</h4>
					<ul class="m-b">
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 标准化</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 安全</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 灵活</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 易用</li>
					</ul>
				</div>
			</div>
			<div class="col-sm-5">
				<form method="post" method="post" class="dataForm">
					<h2 class="no-margins text-center">登&nbsp;&nbsp;&nbsp;录</h2>
					<input id="account" type="text" placeholder="账户"
						class="form-control uname" /> <br> <input id="password"
						type="password" class="form-control pword m-b" nullmsg="密码不能为空"
						placeholder="密码" /> <a href=""> </a> <br>
					<button type="button" onclick="login()"
						class="btn btn-success btn-block">登录</button>
					<matrix:debug>
						<a type="button" href="${path }/common/debugLogin"
							class="btn btn-primary btn-block">开发快捷登录</a>
					</matrix:debug>
				</form>
			</div>
		</div>
		<div class="signup-footer">
			<div class="pull-left">
				<matrix:copyright></matrix:copyright>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${path }/resource/js/systools/MJsBase.js"></script>
<script type="text/javascript">
	function login() {
		if ($("#account").val() == "") {
			layer.tips('请输入账号！', '#account');
			return false;
		} else if ($("#password").val() == "") {
			layer.tips('请输入密码！', '#password');
			return false;
		}
		$.AjaxProxy({
			p : {
				suAccount : $("#account").val(),
				suPassword : $("#password").val()
			}
		}).invoke("${path}/common/dologin", function(loj) {
			MTools.redirect("${path}/" + loj.getValue("page"));
		});
	}
	function dologin(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			window.event.returnValue = false;
			login();
			return false;
		}
	}
</script>
</html>