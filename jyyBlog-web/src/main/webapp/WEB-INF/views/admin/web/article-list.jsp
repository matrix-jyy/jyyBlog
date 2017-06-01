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
		<matrix:btn value="WebArticle:search">
<div class="row" >
		<div class="col-sm-12" > 
			<form class="form-inline" id="serchform">
				<div class="form-group mr-20">
					<select class="select2 form-control autoFull" name="artTypeId" id="parentId">
					<option value="0" selected="selected">--请选择文章类型--</option>
					</select>
				</div>
				<div class="form-group mr-20">
					<label for="exampleInputName2" class="center">文章标题</label>
					<input name="artTitle" type="text" class="form-control">
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
			<matrix:btn value="WebArticle:dels"> 
				<button onclick="myGrid.delItems('artId')" type="button"
					class="btn btn-danger btn-sm">
					<i class="fa fa-trash"></i>批量删除
				</button>
			</matrix:btn>
			<matrix:btn value="WebArticle:add"> 
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
					<th data-field="artTitle">文章标题</th>
					<th data-field="artIsPublish">发布状态</th>
					<th data-field="artTypeName" >所属栏目</th>
					<th data-field="artAuthor" >作者</th>
					<th data-field="artCount" >访问量</th>
					<th data-field="artLables" >标签</th>
					<th data-field="artSort" >排序</th>
					<th data-field="artCreatetiem" data-sortable="true" data-formatter="MGrid.getTime">发布时间</th>
					<th data-align="center"  data-width="195px" data-field="artId" data-formatter="buidOperate">操作</th>
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
			<matrix:btn value="WebArticle:del"> 
			delUrl="${path}/admin/webArticle/del" ;
			</matrix:btn>
			myGrid=MGrid.initGrid({
				 url:"${path}/admin/webArticle/showList",
				 delUrl:delUrl,
			 });
			$(".select2").select2();
			MTools.autoFullSelect();
			initFunctionList();
		});
	
		
		
	 	function buidOperate(value, row, index){
			var html=[];
			<matrix:btn value="WebArticle:publish"> 
			if(row.artIsPublish=='否'){
				html[0]='<a onClick="publish('+value+',1)" title="发布" class="fa  fa-level-up option text-info"></a>';
			}else{
				html[0]='<a onClick="publish('+value+',2)" title="撤回" class="fa fa-level-down option text-info"></a>';
			}
			
			</matrix:btn>
			<matrix:btn value="WebArticle:edit"> 
			html[1]='<a  onClick="openEdit('+value+')"  title="编辑" class="fa fa-edit option"></a>'
			</matrix:btn>
			<matrix:btn value="WebArticle:del"> 
			html[2]='<a onClick="myGrid.delItem('+value+')" title="删除" class="fa fa-close option text-danger"></a>';
			</matrix:btn>
			
			return html.join(""); 
		} 
	 	
	<matrix:btn value="WebArticle:publish"> 
	//发布或撤回
	function publish(id,status){
		$.AjaxProxy({p:{id:id,status:status}}).invoke("${path}/admin/webArticle/publish",function(loj){
			layer.msg(loj.getValue("info"),{icon:1});
			myGrid.serchData();
		});
		}
	</matrix:btn>
			
			
		//打开添加界面
		<matrix:btn value="WebArticle:add"> 
		function openAdd() {
			layer.full(layer.open({
				type : 2,
				title : "添加文章",
				area : [ MUI.SIZE_L, '660px' ],
				maxmin : true,
				content : [ '${path}/admin/webArticle/editForm']
			})); 
		}
		</matrix:btn>
		
		//打开编辑界面
		<matrix:btn value="WebArticle:edit"> 
		function openEdit(id) {
			layer.full(layer.open({
				type : 2,
				title : "编辑文章",
				area : [ MUI.SIZE_L, '660px' ],
				maxmin : true,
				content : [ '${path}/admin/webArticle/editForm?id=' + id]
			}));
		}
		</matrix:btn>
		
		/**
		 * 初始化文章类型列表
		 */
		function initFunctionList() {
			$.AjaxProxy({c:false}).invoke("${path}/admin/webArticleType/all", function(loj) {
				$("#parentId").createSelectTree(loj.attr("result").rows,{	
					id : "artTypeId",		// 选项的值
					parent : "artTypeParentId",	// 父节点值
					value : "artTypeName",	// 要显示的名称
					append : true,
				});
			});
		}
	</script>
</body>
</html>
