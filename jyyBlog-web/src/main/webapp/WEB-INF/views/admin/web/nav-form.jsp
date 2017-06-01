<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<!-- 文件上传需要的样式 -->

<link rel="stylesheet" type="text/css"
	href="${path }/resource/plugin/kindeditor/themes/default/default.css" />
<link rel="stylesheet" type="text/css"
	href="${path }/resource/plugin/kindeditor/plugins/code/prettify.css" />
<script type="text/javascript"
	src="${path }/resource/plugin/kindeditor/kindeditor.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/kindeditor/plugins/code/prettify.js"></script>

</head>
<body>
	<div class="ibox-content">
		<form class="form-horizontal " id="dataform"
			onsubmit="javascripr:return false;">
			<c:if test="${obj ne null }">
				<input type="hidden" name="navId" value="${obj.navId }">
			</c:if>
			<div class="form-group">
				<label class="col-sm-2 control-label">父级PC导航栏</label>
				<div class="col-sm-3">
					<select class="select2 form-control " size="1" name="parentId"
						id="parentId">
						<option value="0" selected="selected">一级导航栏</option>
					</select>
				</div>
				<label class="col-sm-2 control-label">导航名称</label>
				<div class="col-sm-3">
					<input id="navName" name="navName" type="text"
						class="form-control " nullmsg="导航名称不能为空" datatype="*1-50"
						errormsg="导航名称长度不能超过50">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">导航序号</label>
				<div class="col-sm-3">
					<input id="navOrderby" name="navOrderby" type="text"
						class="form-control " nullmsg="导航序号不能为空" datatype="n1-10"
						errormsg="导航序号不能超过10">
				</div>
				<div class="Validform_checktip"></div>
				<label class="col-sm-2 control-label">导航描述</label>
				<div class="col-sm-3">
					<input id="navDescription" name="navDescription" type="text"
						class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">导航类型</label>
				<div class="col-sm-3">
					<select class="form-control select2" size="1" name="navType"
										id="navType">
										<option value="PC">PC</option>
										<option value="mobile">mobile</option>
									</select>
				</div>

				<label class="col-sm-2 control-label">导航链接地址</label>
				<div class="col-sm-3">
					<input id="navUrl" name="navUrl" type="text" class="form-control "
						nullmsg="导航链接地址不能为空" datatype="*1-1000" errormsg="导航链接地址不能超过1000">
				</div>
			</div>
					
	<div class="form-group">
		<label class="col-sm-2 control-label">导航图片</label>
		<div class="col-sm-8">
		<input value="${obj.navIcon }"
				name="navIcon" id="navIcon" class="form-control  upload-input"
				type="text" /> <a class="btn btn-primary radius upload-a"> <i
				class="fa fa-cloud-upload"></i> 上传图片
			</a>
		</div>
</div>

			

			

			<div class="form-group ">
				<div class="col-12 text-center">
					<a href="javascript:;" onclick="myForm.submit()"
						class="btn btn-success radius">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-danger radius"
						onclick="MTools.closeForm()">取消</button>
				</div>
			</div>
		</form>





	</div>
	<script type="text/javascript"
		src="${path }/resource/js/systools/MJsBase.js"></script>
	<script type="text/javascript">
		var myForm;
		$(function() {
			MTools.autoFullSelect();
			$(".select2").select2({
				'width' : '100%'
			});
			myForm = MForm.initForm({
				invokeUrl : "${path}/admin/webNav/addOrModify",
				afterSubmit : function() {
					parent.initFunctionList();
				}
			});
			initFunctionList();
		});
		$(function() {
			MUI.initImgUpload(".upload-input");

		});
		/**
		 * 初始化产品列表
		 */
		function initFunctionList(id) {
			$
					.AjaxProxy()
					.invoke(
							"${path}/admin/webNav/all",
							function(loj) {
								$("#parentId")
										.createSelectTree(
												loj.attr("result").rows,
												{
													id : "navId", // 选项的值
													parent : "parentId", // 父节点值
													value : "navName", // 要显示的名称
													append : false,
													defaultValue : id,
													defaultHtml : '<option value="0" selected="selected">一级导航</option>'
												});
							});
		}
	</script>
</body>
</html>