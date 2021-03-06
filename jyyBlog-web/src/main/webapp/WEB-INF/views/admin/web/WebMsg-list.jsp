<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.zkingsoft.com" prefix="matrix"%>
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
<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
		<!-- 搜索框部分start -->
		<matrix:btn value="WebMsg:search">
<div class="row" >
		<div class="col-sm-12" > 
			<form class="form-inline" id="serchform">
				<div class="form-group mr-20">
					<input placeholder="请输入内容关键词" name="msgContent" type="text" class="form-control">
				</div>
				<button onclick="myGrid.serchData()" type="button"
					class="btn btn-info btn-sm">
					<i class="fa fa-search "></i> 搜索
				</button>
				<button type="reset" class="btn btn-info btn-sm" onclick="MForm.reset()">
					<i class="fa fa-refresh "></i> 重置
				</button>
			</form>
			</div>
	</div>
		</matrix:btn> 
		<!-- 搜索框部分en -->
		<div class="ibox-content radius-5 mt-5 mpanel">
		
	<div class="row" >
		<div class="col-sm-12" >
		<div class="option-bar">
			<matrix:btn value="WebMsg:dels"> 
				<button onclick="myGrid.delItems('msgId')" type="button"
					class="btn btn-danger btn-sm">
					<i class="fa fa-trash"></i>批量删除
				</button>
			</matrix:btn>
			<matrix:btn value="WebMsg:add"> 
				<button onclick="openAdd()" type="button"
					class="btn btn-success btn-sm">
					<i class="fa fa-plus"></i> 新增
				</button>
			</matrix:btn>
		</div>
		<table id="mgrid">
			<thead>
				<tr>
					<th data-checkbox="true"></th>
					<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
					<th data-field="msgType" >留言类型</th>
					<th data-field="msgUserName" >联系人名称</th>
					<th data-field="msgTel" >联系电话</th>
					<th data-field="msgAddress" >联系地址</th>
					<th data-field="msgContent" >留言内容</th>
					<th data-field="createTime" data-formatter="MGrid.getTime" >创建时间</th>
					<th data-align="center"  data-width="195px" data-field="msgId" data-formatter="buidOperate">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
</div>
</div>
<script type="text/javascript"
	src="${path }/resource/js/systools/MJsBase.js"></script>
	<script type="text/javascript">
		 var myGrid;
		$(function(){
			var delUrl="";
			<matrix:btn value="WebMsg:del"> 
			delUrl="${path}/admin/webMsg/del" ;
			</matrix:btn>
			myGrid=MGrid.initGrid({
				 url:"${path}/admin/webMsg/showList",
				 delUrl:delUrl,
			 });
			
		});
		
	 	function buidOperate(value, row, index){
			var html='';
			<matrix:btn value="WebMsg:del"> 
			html+='<a onClick="myGrid.delItem('+value+')" title="删除" class="fa fa-close option text-danger"></a>';
			</matrix:btn>
			html+=''
			return html; 
		} 
		
	</script>
</body>
</html>
