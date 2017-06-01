<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="matrix"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
</head>
<body>
	<div></div>
	<div class="content container-fluid">
		<!-- form-->
		<div class="  ibox-content ">
			<!-- 搜索框部分start -->
			<div style="margin-top: 10%"></div>
			<form class="form-horizontal" id="dataform"
				onsubmit="javascripr:return false;">
				<div class="form-group">
					<label class="col-sm-2 control-label">旧密码<span
						class="text-danger">*</span></label>
					<div class="col-sm-6">
						<input type="password" dataType="*"
							class="form-control text-muted" name="oldPassword">
						<div class="Validform_checktip"></div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">新密码<span
						class="text-danger">*</span></label>
					<div class="col-sm-6">
						<input type="password" dataType="*1-20" class="form-control"
							name="newPassword">
						<div class="Validform_checktip"></div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">确认密码<span
						class="text-danger">*</span></label>
					<div class="col-sm-6">
						<input class="form-control" type="password" value=""
							name="" datatype="*" recheck="newPassword"
							errormsg="您两次输入的账号密码不一致！">
						<div class="Validform_checktip"></div>
					</div>
				</div>
				<div class="form-group ">
					<div class="col-sm-12 text-center">
						<a href="javascript:;" onclick="myForm.submit()"
							class="btn btn-success radius">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${path }/resource/js/systools/MJsBase.js"></script>
<script type="text/javascript">
	var myForm = MForm.initForm({
		invokeUrl : "${path}/admin/updatePassword",
	});
</script>
</html>