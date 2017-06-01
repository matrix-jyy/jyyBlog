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
<style type="text/css">

.content1{
min-height: 500px;
}</style>
</head>
<body class="">
	<jsp:include page="_top.jsp"></jsp:include>

	<div class="container">

		<div class="row content1">
			<div class="col-md-10">
		<h3 class="color_title" >	
	 		为您找到相关结果${fn:length(searchArt)}个
				</h3>
				<hr>
				<c:if test="${fn:length(searchArt)==0 }">
					<p class="text-center " >抱歉！没有找到"${searchWord }"的相关内容。</p>
				</c:if>
				<c:if test="${fn:length(searchArt)>0 }">
				<ul id="result" >
					<c:forEach items="${searchArt }" var="item">
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
			
				</c:if>
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


				
				
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?b5e5ac44c7e4f0e28d52a6872fb94df4";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
  
  
	
  var reg = new RegExp("" + "${searchWord}" + "", "g");
  
  var str=$("#result").html();
  
  $("#result").html(str.replace(reg,
  		"<font style='color:#c00;;font-weight:700;'>"
  				+ "${searchWord}" + "</font>"));
  
  
  
  
})();

</script>

</body>
</html>
