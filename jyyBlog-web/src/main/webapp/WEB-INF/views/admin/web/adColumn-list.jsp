<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.zkingsoft.com" prefix="matrix"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="Mtags"%>
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
		<matrix:btn value="WebAdcolumn:search">
<div class="row" >
		<div class="col-sm-12" > 
			<form class="form-inline" id="serchform">
				<div class="form-group mr-20">
				<select class="form-control autoFull"  
				data-url="${path}/admin/webAdcolumn/page"	 
				data-value="colRemark"
				data-filed="colRemark"
				data-def="${obj.roleIds}"  
				name="colRemark">  
					<option value="" >--请选择所属页面--</option>
				</select>
				</div>
				<div class="form-group mr-20">
					<input placeholder="广告栏标题" name="colName" type="text" class="form-control">
				</div>
				<button onclick="myGrid.serchData()" type="button"
					class="btn btn-info btn-sm">
					<i class="fa fa-search "></i> 搜索
				</button>
				<button type="reset" class="btn btn-info btn-sm"  onclick="MForm.reset()">
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
			<matrix:btn value="WebAdcolumn:dels"> 
				<button onclick="myGrid.delItems('colId')" type="button"
					class="btn btn-danger btn-sm">
					<i class="fa fa-trash"></i>批量删除
				</button>
			</matrix:btn>
			<matrix:btn value="WebAdcolumn:add"> 
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
					<th data-field="colRemark" >所属页面</th>
					<th data-field="colName">广告栏标题</th>
					<Mtags:debug>
					<th data-field="code">广告栏code</th>
					</Mtags:debug>
					<th data-field="colCapacity">容量</th>
					<th data-align="center"  data-width="195px" data-field="colId" data-formatter="buidOperate">操作</th>
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
			//有删除权限
			var delUrl="";
			<matrix:btn value="WebAdcolumn:del"> 
			delUrl="${path}/admin/webAdcolumn/del" ;
			</matrix:btn>
			myGrid=MGrid.initGrid({
				 url:"${path}/admin/webAdcolumn/showList",
				 delUrl:delUrl,
			 });
			MTools.autoFullSelect();
		});
	
		
		
	 	function buidOperate(value, row, index){
			var html='';
			<matrix:btn value="WebAdcolumn:edit"> 
			html+='<a  onClick="openEdit('+value+')"  title="编辑" class="fa fa-edit option"></a>'
			</matrix:btn>
			<matrix:btn value="WebAdcolumn:nrgl"> 
			html+='<a  href="${path}/admin/redirect/web/ad-list2?id='+value+'"  title="内容管理" class="fa fa-align-justify option"></a>'
			</matrix:btn>
			<matrix:btn value="WebAdcolumn:del"> 
			html+='<a onClick="myGrid.delItem('+value+')" title="删除" class="fa fa-close option text-danger"></a>';
			</matrix:btn>
			
			html+=''
			return html; 
		} 
		//打开添加界面
		<matrix:btn value="WebAdcolumn:add"> 
		function openAdd() {
			layer.open({
				type : 2,
				title : "添加广告栏",
				area : [ MUI.SIZE_L, '400px' ],
				maxmin : true,
				content : [ '${path}/admin/webAdcolumn/editForm']
			}); 
		}
		</matrix:btn>
		
		//打开编辑界面
		<matrix:btn value="WebAdcolumn:edit"> 
		function openEdit(id) {
			layer.open({
				type : 2,
				title : "编辑广告栏",
				area : [ MUI.SIZE_L, '400px' ],
				maxmin : true,
				content : [ '${path}/admin/webAdcolumn/editForm?id=' + id]
			});
		}
		</matrix:btn>
		
		
	</script>
</body>
</html>
