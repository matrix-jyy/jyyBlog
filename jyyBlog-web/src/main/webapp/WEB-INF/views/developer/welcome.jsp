<%@page import="com.zkingsoft.constance.SystemConstance"%>
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
<title>主页</title>
<link rel="shortcut icon" href="favicon.ico">
<!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>

<script type="text/javascript"
	src="${path }/resource/plugin/bootstrap-3.3.5/js/bootstrapSwitch.js"></script>
<link rel="stylesheet"
	href="${path }/resource/plugin/bootstrap-3.3.5/css/bootstrapSwitch.css">
</head>

<body>
	<div class="ibox-content">
		<blockquote class="center-block bg-primary">
			<h1>开发者账号主页</h1>
		</blockquote>
		<blockquote class="center-block ">
			<p class="center-block">开发者登录后可以在本页面中管理系统的功能 ，配置功能的按钮。</p>
			<p class="center-block">功能可以分配给不同的企业</p>
			<p class="center-block">每个功能有多个按钮，这些功能和按钮都会被权限管理起来</p>
		</blockquote>

		<form class="form-horizontal " id="dataform"
			onsubmit="javascripr:return false;">
			<div class="form-group">

				<label class="col-sm-2 control-label">DUBUG模式开关</label>
				<div class="col-sm-4">
					<div class="switch" data-on="success" id="state-switch"
						data-off="warning" data-on-label="开启" data-off-label="关闭">
						<input type="checkbox" id="fnIsDisable" />
					</div>
				</div>
			</div>
			
<%
	request.setAttribute("debug", SystemConstance.DEBUG);
%>

		</form>
	<script type="text/javascript"
	src="${path }/resource/js/systools/MJsBase.js"></script>
		<script type="text/javascript">
			$(function() {
				var debug=false;
				<c:if test="${debug }">debug=true;</c:if>
				if(debug){
					$('#state-switch').bootstrapSwitch('setState', true);
				}else{
					$('#state-switch').bootstrapSwitch('setState', false);
				}
				
				
				//设置关闭点击事件
				$('#fnIsDisable').change(
						function() {
							var path = "";
							var $fnIsDisable = $('#fnIsDisable');
							var checked = document
									.getElementById("fnIsDisable").checked;
							if (checked) {
								//启用
								path = "openDebug";
							} else {
								//禁用
								path = "closeDebug";
							}
							$.AjaxProxy().invoke("${path}/developer/" + path,
									function(loj) {
										layer.msg(loj.getValue("info"), {
											icon : 1,
											time : 1000
										});
										return false;
									});

						});
			})
		</script>

	</div>
</body>
</html>