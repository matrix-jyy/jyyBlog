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
		<matrix:btn value="WebAd:search">
<div class="row" >
		<div class="col-sm-12" > 
			<form class="form-inline" id="serchform">
				<div class="form-group mr-20">
					<select class="select2 form-control autoFull" data-filed="colName" data-value="colId" name="adColumn" 
					data-url="${path}/admin/webAdcolumn/all" datatype="*" nullmsg="所属栏目不能为空"
					data-def="${obj.adColumn}">
					<option value="">-- 请选择所属栏目 --</option>
				</select>
				</div>
				<div class="form-group mr-20">
					<input placeholder="栏目内容标题" name="adTitle" type="text" class="form-control">
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
			<matrix:btn value="WebAd:dels"> 
				<button onclick="myGrid.delItems('adId')" type="button"
					class="btn btn-danger btn-sm">
					<i class="fa fa-trash"></i>批量删除
				</button>
			</matrix:btn>
			<matrix:btn value="WebAd:add"> 
				<button onclick="openAdd()" type="button"
					class="btn btn-success btn-sm">
					<i class="fa fa-plus"></i> 新增栏目内容
				</button>
			</matrix:btn>
		</div>
		<table id="mgrid">
			<thead>
				<tr>
					<th data-checkbox="true"></th>
					<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
					<th data-field="adTitle">栏目内容标题</th>
					<th data-field="colName">所属栏目</th>
					<th data-field="adUrl">链接地址</th>
					<th data-field="adImg" data-formatter="MGrid.getImage">栏目内容图片</th>
					<th data-field="adTime" data-formatter="MGrid.getTime">创建时间</th>
					<th data-field="adSequence" >排序</th>
					<th data-align="center"  data-width="195px" data-field="adId" data-formatter="buidOperate">操作</th>
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
			<matrix:btn value="WebAd:del"> 
			delUrl="${path}/admin/webAd/del" ;
			</matrix:btn>
			myGrid=MGrid.initGrid({
				 url:"${path}/admin/webAd/showList",
				 delUrl:delUrl,
			 });
			$(".select2").select2();
			MTools.autoFullSelect();
		});
	
		
		
	 	function buidOperate(value, row, index){
			var html='';
			<matrix:btn value="WebAd:edit"> 
			html+='<a  onClick="openEdit('+value+')"  title="编辑" class="fa fa-edit option"></a>'
			</matrix:btn>
			<matrix:btn value="WebAd:del"> 
			html+='<a onClick="myGrid.delItem('+value+')" title="删除" class="fa fa-close option text-danger"></a>';
			</matrix:btn>
			html+=''
			return html; 
		} 
		//打开添加界面
		<matrix:btn value="WebAd:add"> 
		function openAdd() {
			layer.open({
				type : 2,
				title : "添加栏目内容",
				area : [ MUI.SIZE_L, '400px' ],
				maxmin : true,
				content : [ '${path}/admin/webAd/editForm']
			}); 
		}
		</matrix:btn>
		
		//打开编辑界面
		<matrix:btn value="WebAd:edit"> 
		function openEdit(id) {
			layer.open({
				type : 2,
				title : "编辑栏目内容",
				area : [ MUI.SIZE_L, '400px' ],
				maxmin : true,
				content : [ '${path}/admin/webAd/editForm?id=' + id]
			});
		}
		</matrix:btn>
		
		
	</script>
</body>
</html>
