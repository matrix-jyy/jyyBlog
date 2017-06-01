<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="matrix"%>
<%@ taglib uri="http://matrixcsm.zkingsoft.com" prefix="cms"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp">
<title data-index="1" id="selextTitle">${art.artTitle }-Matrix</title>
<meta name="keywords" content="${art.artAbstract}">
<meta name="description" content="${art.artAbstract}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
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
<style>
@media screen and (min-width: 1200px) {
	.details {
		padding: 0 100px;
		padding-top: 30px;
	}
}

.txt  img {
	max-width: 100%;
	padding: 3px;
	border-radius: 5px;
	box-shadow: 2px 10px 10px -8px #ccc;
	margin: 15px auto;
}

.details h3 {
	text-align: left;
	font-size: 34px;
	font-weight: 700;
	line-height: 1.3;
}

.details .img-wrap {
	margin-bottom: 20px;
	text-align: center
}

.details .img-wrap img {
	max-width: 100%;
	max-height: 430px;
	min-height: 400px;
}

.details .txt {
	line-height: 2rem;
}

.details p {
	line-height: 28px;
	letter-spacing: 1px;
}
</style>


</head>
<body class="">
	<jsp:include page="_top.jsp"></jsp:include>
	<div class="container details ">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h3>
					<c:out value="${art.artTitle }"></c:out>
				</h3>
				<div class="artmate">
					<span>作者：${art.artAuthor } <fmt:formatDate
							value="${art.artCreatetiem }" pattern="yyyy.MM.dd" /></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>阅读：${art.artCount}</span>
					<span>评论：<span href="#SOHUCS" id="changyan_count_unit"></span></span>
				</div>
				<blockquote>
					<c:out value="${art.artAbstract }"></c:out>
				</blockquote>
				<p >
					<a class="copyright"  href="${path }/showArt/${art.artId}">版权声明：本博客文章为姜友瑶原创文章可自由转载-非商用-转载请保留本链接</a>
				</p>
				<br>
				<div class="txt">
					<p>
						<c:out value="${art.artContent }" escapeXml="false"></c:out>
					</p>
				</div>
			</div>
			<!--PC版-->
			<div id="SOHUCS" sid="art${art.artId }"></div>
			<script type="text/javascript">
				(function() {
					var appid = 'cyt1tVwvB';
					var conf = 'prod_3ba9df7421f1ebb487f9f3c24c7e29c4';
					var width = window.innerWidth
							|| document.documentElement.clientWidth;
					if (width < 960) {
						window.document
								.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id='
										+ appid
										+ '&conf='
										+ conf
										+ '"><\/script>');
					} else {
						var loadJs = function(d, a) {
							var c = document.getElementsByTagName("head")[0]
									|| document.head
									|| document.documentElement;
							var b = document.createElement("script");
							b.setAttribute("type", "text/javascript");
							b.setAttribute("charset", "UTF-8");
							b.setAttribute("src", d);
							if (typeof a === "function") {
								if (window.attachEvent) {
									b.onreadystatechange = function() {
										var e = b.readyState;
										if (e === "loaded" || e === "complete") {
											b.onreadystatechange = null;
											a()
										}
									}
								} else {
									b.onload = a
								}
							}
							c.appendChild(b)
						};
						loadJs("https://changyan.sohu.com/upload/changyan.js",
								function() {
									window.changyan.api.config({
										appid : appid,
										conf : conf
									})
								});
					}
				})();
			</script>
		</div>
	</div>
	<br>
	<br>
	<hr>
	<jsp:include page="_foot.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="https://assets.changyan.sohu.com/upload/plugins/plugins.count.js">
	
</script>
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/AjaxProxy.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/resource/plugin/syntaxhighlighter_3.0.83/scripts/shCore.js"></script>
<script type="text/javascript"
	src="/resource/plugin/syntaxhighlighter_3.0.83/scripts/shBrushJScript.js"></script>
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/syntaxhighlighter_3.0.83/styles/shCore.css" />
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/syntaxhighlighter_3.0.83/styles/shCoreDefault.css" />
<script type="text/javascript">
	//	SyntaxHighlighter.all();
</script>



<script type="text/javascript">
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
