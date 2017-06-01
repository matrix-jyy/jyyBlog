<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript" src="${path }/resource/plugin/ajaxfileupload.js"></script>


<title></title>
</head>
	<div class="ibox-content">
	<!-- 搜索框部分start -->
		<form class="form-inline" id="serchform">
			 <div class="form-group mr-20">
				<label>水果名称</label>
				<input name="name" type="text" class="form-control" id="fruitName">
			 </div>
			<button  onclick="myGrid.serchData()" type="button" class="btn btn-info btn-sm"><i class="fa fa-search " ></i> 搜索</button>
			<button  type="reset" class="btn btn-info btn-sm"><i class="fa fa-refresh " ></i> 重置</button>
		</form>
	<!-- 搜索框部分en -->
		<div class="option-bar" >
		<button onclick="exportExcel()" type="button" class="btn btn-default btn-sm"><i class="fa fa-download" ></i> 导出</button>
		</div>
		<table id="mgrid" data-url="" >
			<thead>
				<tr>
					<th data-checkbox="true"  ></th>
					<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
					<th data-field="name" >水果名称</th>
					<th data-field="price" >价格</th>
				</tr>
			</thead> 
		</table>
   </div>
<script type="text/javascript">
    var  myGrid;
    $(function(){
    	 myGrid=MGrid.initGrid({
			 url:"${path}/api/queryFruits",
			 sortName:"name",
			 sortOrder:"desc"});
    	
    })
    //导出
	function exportExcel(){
		var fruitName = $("#fruitName").val();
		window.location.href="${path}/api/exportExcel?name="+encodeURI(encodeURI(fruitName));
		}
</script>
</body>
</html>