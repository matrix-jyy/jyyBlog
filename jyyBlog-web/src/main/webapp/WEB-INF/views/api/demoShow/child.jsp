<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("fnId", request.getAttribute("fnId"));
	pageContext.setAttribute("userPwoer", request.getSession().getAttribute("userPwoer"));
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="../images/favicon.ico">
<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
</head>
<body class="gray-bg">
	

	<div class="ibox-content">
	
		<table id="mgrid" data-url="" >
			<thead>
				<tr>
					<th data-checkbox="true"  ></th>
					<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
					<th data-field="name">名称</th>
					<th data-field="price" >价格</th>
					<th data-field="img" >图片地址</th>
					
				</tr>
			</thead>
		</table>
		
		<div class="row" >
				<button class="btn btn-primary center-block" onclick="selectoption()" >确认选择</button>
		</div>
	</div>
	<script type="text/javascript">
	var myGrid;
		$(function(){
			 // 设置产品类型,此处由于父窗口goodsAttr=''的时候$.query.get('goodsAttr')==true
			 myGrid=MGrid.initGrid({
				 height:300,
				 url:"${path}/api/findFruits",
			 });
		});
		
	
		function selectoption(){
			var arr=myGrid.initParam.$table.bootstrapTable('getSelections');
			parent.callback(arr);
			parent.layer.close(parent.layer.getFrameIndex(window.name));
		}
	</script>
</body>
</html>
