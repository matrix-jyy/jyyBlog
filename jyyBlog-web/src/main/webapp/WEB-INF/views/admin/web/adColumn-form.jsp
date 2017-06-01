<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<body>
	<div class="ibox-content">
		<form class="form-horizontal" id="dataform"
			onsubmit="javascripr:return false;">
			<input type="hidden" name="tokenUrl" value="${tokenUrl}"> <input
				type="hidden" name="token" value="${token}">
			<c:if test="${obj ne null }">
				<input type="hidden" name="colId" value="${obj.colId }">
			</c:if>
			<div class="form-group">
				<label class="col-sm-2 control-label">广告栏名称<span
					class="text-danger">*</span></label>
				<div class="col-sm-8">
					<input type="text" dataType="*1-100" class="form-control"
						name="colName" value="<c:out value="${obj.colName }"></c:out>"
						datatype="*1-16" nullmsg="广告栏名称不能为空">
				</div>
			</div>
			<Mtags:debug>
			<div class="form-group">
			<label class="col-sm-2 control-label">容量<span
					class="text-danger">*</span></label>
				<div class="col-sm-4">
					<input type="text" dataType="n" class="form-control"
						name="colCapacity"
						value="<c:out value="${obj.colCapacity }"></c:out>"
						datatype="*1-16" nullmsg="容量不能为空">
				</div>
			</div>	
				<div class="form-group">
					<label class="col-sm-2 control-label">广告栏CODE<span
						class="text-danger">*</span></label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="code" dataType="*"
							value="<c:out value="${obj.code }"></c:out>">
					</div>
					<label class="col-sm-2 control-label">所属页面</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="colRemark"
							value="<c:out value="${obj.colRemark }"></c:out>">
					</div>
				</div>
			</Mtags:debug>
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
	var myForm = MForm.initForm({
		invokeUrl : "${path}/admin/webAdcolumn/addOrModify",
		afterSubmit : function() {
			parent.myGrid.serchData();
		},
	});
</script>
</body>
</html>