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
<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
<!-- 富文本js和样式  -->
<script type="text/javascript"
	src="${path }/resource/plugin/kindeditor/kindeditor.js"></script>
<link rel="stylesheet" type="text/css"
	href="${path }/resource/plugin/kindeditor/themes/default/default.css">
<!-- 文件上传需要的样式 -->

<link rel="stylesheet"
	href="${path }/resource/plugin/kindeditor/themes/default/default.css" />
<link rel="stylesheet"
	href="${path }/resource/plugin/kindeditor/plugins/code/prettify.css" />
<script src="${path }/resource/plugin/kindeditor/kindeditor.js"></script>
<script src="${path }/resource/plugin/kindeditor/lang/zh_CN.js"></script>
<script
	src="${path }/resource/plugin/kindeditor/plugins/code/prettify.js"></script>

</head>
<body>

	<div class="ibox-content">
		<form class="form-horizontal" id="dataform"
			onsubmit="javascripr:return false;">
			<c:if test="${obj ne null }">
				<input type="hidden" name="adId" value="${obj.adId }">
			</c:if>
			<div class="form-group">
				<label class="col-sm-2 control-label">所属栏目<span
					class="text-danger">*</span></label>
				<div class="col-sm-3">
				
					<select class="select2 form-control autoFull" data-filed="colName"
						data-value="colId" name="adColumn"
						data-url="${path}/admin/webAdcolumn/all" datatype="*"
						nullmsg="所属栏目不能为空" 
							<c:if test="${obj ne null }">
									data-def="${obj.adColumn}"
							</c:if>
							<c:if test="${param.columId ne null }">
								data-def="${param.columId}"
							</c:if>
						>
						<option value="">-- 请选择所属栏目 --</option>
					</select>
				</div>
				<div class="Validform_checktip"></div>
				<label class="col-sm-2 control-label">栏目内容词</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="adTitle"
						value="${obj.adTitle }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">排序</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="adSequence"
						ignore="ignore" value="${obj.adSequence }" datatype="n1-10"
						nullmsg="排序不能为空" errormsg="序号只能为长度小于10位的数字">
				</div>
				<label class="col-sm-2 control-label">链接地址</label>
				<div class="col-sm-3">
					<c:choose>
						<c:when test="${obj ne null }">
							<input value="${obj.adUrl}" datatype="*1-1000" id="adUrl"
								ignore="ignore" name="adUrl" class="form-control" type="text">
						</c:when>
						<c:otherwise>
							<input value="http://" datatype="*1-1000" id="adUrl"
								ignore="ignore" name="adUrl" class="form-control" type="text">
						</c:otherwise>
					</c:choose>

				</div>
			</div>
			
	<div class="form-group">
		<label class="col-sm-2 control-label">展示图片</label>
		<div class="col-sm-8">
		<input value="${obj.adImg }"
				name="adImg" id="adImg" class="form-control  upload-input"
				type="text" /> <a class="btn btn-primary radius upload-a"> <i
				class="fa fa-cloud-upload"></i> 上传图片
			</a>
		</div>
</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">展示信息一</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="adInfo1">${obj.adInfo1 }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">展示信息二</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="adInfo2">${obj.adInfo2 }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">展示信息三</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="adInfo3">${obj.adInfo3 }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">展示信息四</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="adInfo4">${obj.adInfo4 }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">展示信息五</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="adInfo5">${obj.adInfo5 }</textarea>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">展示信息六</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="adInfo6">${obj.adInfo6 }</textarea>
				</div>
			</div>




			<div class="form-group ">
				<div class="col-sm-12 text-center">
					<a href="javascript:;" onclick="myForm.submit()"
						class="btn btn-success radius"><i class="fa fa-check"></i> 保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-danger radius" href="javascript:;"
						onclick="MTools.closeForm()"><i class="fa fa-close"></i> 关闭</a>
				</div>
			</div>
		</form>
	</div>

	


</body>
<script type="text/javascript"
	src="${path }/resource/js/systools/MJsBase.js"></script>
<script type="text/javascript">
	MTools.autoFullSelect();
	var myForm = MForm.initForm({
		invokeUrl : "${path}/admin/webAd/addOrModify",
		afterSubmit : function() {
			parent.myGrid.serchData();
		},
	});
	$(".select2").select2();
	MUI.initImgUpload(".upload-input");
</script>
</body>
</html>