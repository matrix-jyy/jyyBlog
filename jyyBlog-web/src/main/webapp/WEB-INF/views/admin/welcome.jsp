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
<!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
<style type="text/css">
.hkdg{
	width:150px; 
	margin: 5px;
	border: 1px solid #aeaeae;
	border-radius:5px;
	padding: 3px; 
}
blockquote{
font-size: 14px;
line-height: 25px;
}
.title{
color: #6f5499;
font-size: 32px;
text-shadow:2px 3px 2px #ababab;

}
.iframe{
	border: none;
	width: 100% !important;
	height: 100% !important;
	
}




</style>
</head>

<body>
	<iframe src="http://cms.jyymatrix.cc/redirect/cmswelcome" class="iframe" ></iframe>
</body>
<script type="text/javascript">
$('#yourElement').addClass('animated rotateInUpLeft');
</script>
</html>