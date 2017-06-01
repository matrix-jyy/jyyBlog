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
<LINK rel="Bookmark" href="../images/favicon.ico">
<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
</head>
<body class="gray-bg">
	<div class="ibox-content">
	<!-- 搜索框部分start -->
	<matrix:btn value="BusParameterSettings:search">
		<form class="form-inline" id="serchform">
			<div class="form-group mr-20">
				<label for="exampleInputName2">参数code</label>
				<input name="paramCode" type="text" class="form-control">
			</div>
			<button  onclick="myGrid.serchData()" type="button" class="btn btn-info btn-sm"><i class="fa fa-search " ></i> 搜索</button>
			<button  type="reset" class="btn btn-info btn-sm"><i class="fa fa-refresh " ></i> 重置</button>
		</form>
		</matrix:btn>
		<div class="option-bar" >
		<matrix:btn value="BusParameterSettings:dels">
			<button onclick="myGrid.delItems('paramId')" type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash" ></i>批量删除</button>
		</matrix:btn>
		<matrix:btn value="BusParameterSettings:add">
			<button onclick="openAdd()" type="button" class="btn btn-success btn-sm"><i class="fa fa-plus" ></i>  新增</button>
		</matrix:btn>
		</div>
	<!-- 搜索框部分en -->
		<table id="mgrid" >
			<thead>
				<tr>
					<th data-checkbox="true"  ></th>
					<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
					<th data-field="paramCode" data-sortable="true">参数编码</th>
					<th data-field="paramValue" data-sortable="true">参数值</th>
					<th data-align="center"  data-width="150px" data-field="paramId" data-formatter="buidOperate">操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<script type="text/javascript"
	src="${path }/resource/js/systools/MJsBase.js"></script>
	<script type="text/javascript">
	var myGrid;
	
		$(function(){
			var delPath="";
			<matrix:btn value="BusParameterSettings:del">
			delPath="${path}/admin/busParameterSettings/del";
			</matrix:btn>
			 myGrid=MGrid.initGrid({
				 url:"${path}/admin/busParameterSettings/showList",
				 delUrl:delPath
			 });
		});
		function buidOperate(value, row, index){
			var html=[];
			<matrix:btn value="BusParameterSettings:edit">
			html[0]='<button class="btn btn-default btn-sm mr-5" onClick="openEdit('+value+')"  title="编辑"><i class="fa fa-edit"></i></buttoun>'
			</matrix:btn>
			<matrix:btn value="BusParameterSettings:del">
			html[1]='<button class="btn btn-default btn-sm" onClick="myGrid.delItem('+value+')" title="删除"><i class="fa fa-lg fa-trash-o"></i></buttoun>';
			</matrix:btn>
			return html.join(""); 
		}
		<matrix:btn value="BusParameterSettings:add">
		//打开添加界面
		function openAdd() {
			layer.open({
				type : 2,
				title : "添加数据字典类型",
				maxmin : true,
				area : [ MUI.SIZE_L, '400px' ],
				content : [ '${path}/admin/busParameterSettings/editForm']
			}); 
		}
		</matrix:btn>
		<matrix:btn value="BusParameterSettings:edit">
		//打开编辑界面
		function openEdit(id) {
			layer.open({
				type : 2,
				title : "编辑数据字典类型",
				area : [ MUI.SIZE_L, '400px' ],
				maxmin : true,
				content : [ '${path}/admin/busParameterSettings/editForm?id=' + id]
			});
		}
		</matrix:btn>
	</script>
</body>
</html>
