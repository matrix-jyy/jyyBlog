<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="matrix"%>
<%@ taglib uri="http://matrixcsm.zkingsoft.com" prefix="cms"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp">

<title data-index="0" id="selextTitle">${网页标题 }-服务</title>
<meta name="keywords" content="${网页关键词}">
<meta name="description" content="${网页描述 }" />
<link rel="shortcut icon" href="${浏览器logo }">
<link rel="stylesheet"
	href="${path }/resource/plugin/font-awesome/css/font-awesome.css"
	media="screen" title="no title">
<link rel="stylesheet"
	href="${path }/resource/plugin/AmazeUI-2.7.2/css/amazeui.min.css">
<link rel="stylesheet" href="${path }/resource/mobile/css/base.css"
	media="screen" title="no title">
<link rel="stylesheet" href="${path }/resource/mobile/css/public.css">
<style>
.service-none {
	display: block;
}

.tab-content {
	margin-top: 0;
	padding-bottom: 0;
}
</style>

</head>
<body class="">
	<div class="body_container" id="app">
		<jsp:include page="_top.jsp"></jsp:include>
		<cms:ad var="ad" code="m-fwBanner" multi="false"></cms:ad>
		<div class="banner">
			<img class="am-img-responsive" src="${ad.adImg }" />
		</div>
		<div class="service">
			<div class="tab-content">
				<ul class="service-block">
					<li v-for="item in service1" @click="toArticle(item.artId)"><img
						:src="item.artImage" alt="">
						<div class="txt">
							<span class="name">{{item.artTitle }}</span> <span class="line"></span>
							<span class="money">{{item.artAbstract }}</span>
						</div></li>
				</ul>
			</div>
		</div>
	</div>

	<jsp:include page="_foot.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/AjaxProxy.js"></script>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="${path }/resource/plugin/AmazeUI-2.7.2/js/amazeui.min.js"></script>
<script src="${path }/resource/mobile/js/init.js"></script>
<script src="${path }/resource/mobile/js/index.js"></script>
<script>
	var app = new Vue({
		el : "#app",
		data : {
			offset : 0,
			limit : 4,
			service1 : [ {
				artTitle : "artTitle"
			} ],
		},
		methods : {
			toArticle : function(id) {
				window.open("${path}/mobile/redirect/serviceDetails?id=" + id);
			},
			loadService : function(id) {

				$.AjaxProxy({
					c : false,
					p : {
						"offset" : 0,
						"limit" : 200,
						"code" : "mservice"
					}
				}).invoke("${path}/findNews", function(loj) {
					app.service1 = loj.getValue("rows");
				});
			},
		}

	});
	app.loadService();
</script>

</body>
</html>
