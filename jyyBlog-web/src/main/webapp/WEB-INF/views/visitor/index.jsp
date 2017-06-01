<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="matrix"%>
<%@ taglib uri="http://matrixcsm.zkingsoft.com" prefix="cms"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta http-equiv="Cache-Control" content="no-siteapp">
<title data-index="0" id="selextTitle">${网页标题 }</title>
<meta name="keywords" content="${网页关键词}">
<meta name="description" content="${网页描述 }" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link
	href="${path }/resource/plugin/bootstrap-3.3.5/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${path }/resource/plugin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${path }/resource/css/styleOne/animate.min.css"
	rel="stylesheet" type="text/css" />
<link href="${path }/resource/css/visitor/base.css" rel="stylesheet"
	type="text/css">
<link rel="shortcut icon" href="${浏览器logo }">

</head>
<body class="">
	<jsp:include page="_top.jsp"></jsp:include>

	<div class="container">
		<cms:ad var="syBanner" code="syBanner"></cms:ad>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<c:forEach items="${syBanner }" var="item" varStatus="count">
					<li data-target="#myCarousel" data-slide-to="${count.index}"
						<c:if test="${count.index eq 0 }">class="active"</c:if>></li>
				</c:forEach>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<c:forEach items="${syBanner }" var="item" varStatus="count">
					<div class='<c:if test="${count.index eq 0 }">active</c:if> item'>
						<img src="${item.adImg }" alt="${item.adTitle}">
					</div>
				</c:forEach>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev"></a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next"> </a>
		</div>

		<div class="row content1">
			<div class="col-md-7">
		<h3 class="color_title" >	
		<c:if test="${fn:contains(currentType.artTypeName ,'博客')}"> 最近更新</c:if>
		<c:if test="${!fn:contains(currentType.artTypeName ,'博客')}"> ${currentType.artTypeName}</c:if>
				</h3>
				<hr>
				<ul>
					<c:forEach items="${artList }" var="item">
						<li class="col-md-11 artLine "><a class="title"
							href="${path }/showArt/${item.artId}"> <c:out value="${item.artTitle}"></c:out> </a>
							<p class="abstract"> <c:out value="${item.artAbstract}"></c:out> </p>
							<div class="meta">
								<span> <fmt:formatDate value="${item.artCreatetiem }"
										pattern="yyyy-MM-dd" /></span> <span>${item.artCount}阅</span> <span>
										<span id = "sourceId::art${item.artId}" class = "cy_cmt_count" ></span>
										评</span>
							</div></li>
					</c:forEach>
				</ul>
			</div>
			<div class=" col-md-offset-1 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading backRed">
						<h3 class="panel-title ">分类</h3>
					</div>
					<div class="panel-body">
						<div class="artTop">
							<a href="${path }/">最近更新 </a>
							<c:forEach items="${allType }" var="item">
								<a href="${path }/${item.code}">${item.artTypeName }</a>
								<span>(${item.artCount})</span>
							</c:forEach>
						</div>

					</div>
				</div>
				<div class="panel panel-default ">
					<div class="panel-heading  backRed " >
						<h3 class="panel-title">Top10</h3>
					</div>
					<div class="panel-body">
						<div class="artTop">
							<c:forEach items="${artPhb }" var="item" varStatus="count">
								<a href="${path }/showArt/${item.artId}">${count.index+1} 、<c:out value="${item.artTitle }"></c:out> </a>
								<span>${item.artCount }阅</span>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>




	<jsp:include page="_foot.jsp"></jsp:include>
</body>

<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/bootstrap-3.3.5/js/bootstrap.min.js"></script>

<script src="${path }/resource/js/plugin/tween.js"></script>
<script src="${path }/resource/js/plugin/util.js"></script>
<script src="${path }/resource/js/plugin/jssor.slider-21.1.6.mini.js"
	type="text/javascript"></script>
	<script id="cy_cmt_num" src="https://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cyt1tVwvB"></script>
	

<script>

	
	$(".nav-item li").eq(0).addClass("active")
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?b5e5ac44c7e4f0e28d52a6872fb94df4";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();

</script>

</body>
</html>
