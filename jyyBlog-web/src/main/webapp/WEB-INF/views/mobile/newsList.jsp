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

<title data-index="0" id="selextTitle">${网页标题 }-新闻</title>
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
.news .wrap {
	margin-top: 0;
}

.select {
	margin: 0 0.3rem 0.15rem;
	position: relative;
	float: left;
	z-index: 100;
	padding: 0;
	width: 2.8rem;
	height: 0.48rem;
	line-height: 0.48rem;
}

.news .wrap  ul {
	padding: 0px;
}

.tab-con {
	clear: both;
}

.pages {
	text-align: center;
	height: 0.34rem;
	line-height: 0.34rem;
	overflow: hidden;
	width: 1.17rem;
	position: relative;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	margin: 0.8rem auto 0.3rem;
}

.pages a {
	float: left;
	margin-right: 0.05rem;
	width: 0.34rem;
	height: 0.34rem;
	line-height: 0.34rem;
	font-size: 0.26rem;
	text-align: center;
	background: #e7d094;
	color: #ffffff;
	display: block;
	border-radius: 4px;
}

.pages a.active {
	background: #c6944e
}
</style>


</head>
<body class="">
	<div class="body_container" id="app">
		<jsp:include page="_top.jsp"></jsp:include>
		<cms:ad var="ad" code="m-newsBanner" multi="false"></cms:ad>
		<div class="banner">
			<img class="am-img-responsive" src="${ad.adImg }" />
		</div>
		<cms:artType var="type" code="xw"></cms:artType>
		<div class="news">
			<dl class="select">
				<dt>
					<c:forEach items="${type }" var="item" begin="0" end="0">
				${item.artTypeName }
			</c:forEach>
				</dd>
				<!-- <dt>北京分公司</dt> -->
				<dd>
					<ul class="change-item">

						<c:forEach items="${type }" var="item">
							<li><a
								v-on:click="changeType('${item.code}','${item.artTypeName }')"
								href="javascript:;">${item.artTypeName }</a></li>
						</c:forEach>
					</ul>
				</dd>
			</dl>

			<div class="wrap">
				<ul class="tab-con">
					<li v-for="item in arts" v-on:click="toArticle(item.artId)"><span
						class="solid"></span> <span class="time">{{item.artCreatetiem
							| getYear}}</span> <span class="head">{{item.artTypeName}}</span> <span
						class="abstract">{{item.artTitle}}</span></li>
				</ul>
			</div>
			<div class="pages">
				<a  v-for="i in pageCount" href="Javascript:void(0)" @click="changePage(i)" >{{i}}</a>
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
		el : '#app',
		data : {
			offset : 0,
			limit : 10,
			pageCount : 0,
			arts : [],
			jzbz : [],
			zzxkz : [],
			ads : [],
			bgzx : [],
			fwal : [],
			code : "xw", // 默认新闻
			typeName : '企业动态'
		},
		filters : {
			getYear : function(value) {
				var data = new Date(value);
				return data.getFullYear();
			}
		},
		methods : {
			selectAd : function(code) {
				$.AjaxProxy({
					c : false,
					p : {
						"code" : code
					}
				}).invoke("${path}/findAd", function(loj) {
					app.ads = loj.getValue("rows");
				});
			},
			changeType : function(code, name) {
				app.code = code;
				app.typeName = name;
				app.loadArt();
			},
			toArticle : function(id) {
				window.open("${path}/mobile/redirect/newsDetails?id=" + id);
			},
			changePage : function(i) {
				app.offset = (i - 1) * app.limit;
				app.loadArt();
			},
			loadArt : function() {

				$.AjaxProxy({
					c : false,
					p : {
						"offset" : app.offset,
						"limit" : app.limit,
						"code" : app.code
					}
				}).invoke("${path}/findNews", function(loj) {
					var rowcount = loj.getValue("total");
					if (rowcount % app.limit == 0) {
						app.pageCount = rowcount / app.limit;
					} else {
						app.pageCount = parseInt(rowcount / app.limit) + 1;
					}
					app.arts = loj.getValue("rows");
				});

			},

		},
	});
	app.loadArt();

	$(".change-item li").click(function() {

	})
</script>

</body>
</html>
