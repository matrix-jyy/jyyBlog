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
</head>
<body>
	<div class="ibox-content">
	<div class="row" >
			<div class="col-sm-6">
				<div class="panel panel-info">
					<div class="panel-heading">java课程体系</div>
					<div class="panel-body">
						<form class="form-horizontal" id="dataform"
							onsubmit="javascripr:return false;">
							<input type="hidden" name="kc[0].cf1" value="java课程">
							<input type="hidden" name="kc[0].cf2" value="1">
							<input type="hidden" name="kc[0].cf3" value="0">
							<div class="form-group">
								<label class="col-sm-2 control-label">第一阶段标题</label>
								<div class="col-sm-8">
									<input type="text" dataType="*1-100" class="form-control"
										name="kc[0].cf4"
										value="<c:out value="${obj.paramCode }"></c:out>"
										nullmsg="编码不能为空">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">参数值<span
									class="text-danger">*</span></label>
								<div class="col-sm-8">
									<textarea class="form-control" name="paramValue" cols="8"
										datatype="*" nullmsg="值不能为空"><c:out
											value="${obj.paramValue }"></c:out></textarea>
								</div>
							</div>
							<div class="form-group ">
								<div class="col-sm-12 text-center">
									<a href="javascript:;" onclick="myForm.submit()"
										class="btn btn-success radius"><i class="fa fa-check"></i>
										保存</a>&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-danger radius"
										href="javascript:;" onclick="MTools.closeForm()"><i
										class="fa fa-close"></i> 关闭</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript"
	src="${path }/resource/js/systools/MJsBase.js"></script>
<script type="text/javascript">
	var myForm = MForm.initForm({
		invokeUrl : "${path}/admin/busParameterSettings/addOrModify",
		afterSubmit : function() {
			parent.myGrid.serchData();
		},
	});
</script>
</body>
</html>