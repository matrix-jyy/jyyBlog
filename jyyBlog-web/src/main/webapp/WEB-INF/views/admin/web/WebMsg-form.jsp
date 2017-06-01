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
		<form class="form-horizontal" id="dataform" onsubmit="javascripr:return false;">
			<input type="hidden" name="tokenUrl" value="${tokenUrl}">	 
			<input type="hidden" name="token" value="${token}">
		<c:if test="${obj ne null }">
			<input type="hidden" name="msgId" value="${obj.msgId }">
		</c:if>
			<label class="col-sm-2 control-label">留言类型<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<input type="text" dataType="*" class="form-control" name="msgType"
					value="<c:out value="${obj.msgType }"></c:out>" datatype="*1-16" nullmsg="留言类型不能为空">
			</div>
			<label class="col-sm-2 control-label">联系人名称<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<input type="text" dataType="*" class="form-control" name="msgUserName"
					value="<c:out value="${obj.msgUserName }"></c:out>" datatype="*1-16" nullmsg="联系人名称不能为空">
			</div>
			<label class="col-sm-2 control-label">联系电话<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<input type="text" dataType="*" class="form-control" name="msgTel"
					value="<c:out value="${obj.msgTel }"></c:out>" datatype="*1-16" nullmsg="联系电话不能为空">
			</div>
			<label class="col-sm-2 control-label">联系地址<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<input type="text" dataType="*" class="form-control" name="msgAddress"
					value="<c:out value="${obj.msgAddress }"></c:out>" datatype="*1-16" nullmsg="联系地址不能为空">
			</div>
			<label class="col-sm-2 control-label">留言内容<span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<input type="text" dataType="*" class="form-control" name="msgContent"
					value="<c:out value="${obj.msgContent }"></c:out>" datatype="*1-16" nullmsg="留言内容不能为空">
			</div>
			<label class="col-sm-2 control-label"><span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<input type="text" dataType="*" class="form-control" name="info1"
					value="<c:out value="${obj.info1 }"></c:out>" datatype="*1-16" nullmsg="不能为空">
			</div>
			<label class="col-sm-2 control-label"><span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<input type="text" dataType="*" class="form-control" name="info2"
					value="<c:out value="${obj.info2 }"></c:out>" datatype="*1-16" nullmsg="不能为空">
			</div>
			<label class="col-sm-2 control-label"><span class="text-danger">*</span></label>
			<div class="col-sm-4">
				<input type="text" dataType="*" class="form-control" name="info3"
					value="<c:out value="${obj.info3 }"></c:out>" datatype="*1-16" nullmsg="不能为空">
			</div>
		<div class="form-group ">
				<div class="col-sm-12 text-center">
				<a href="javascript:;" onclick="myForm.submit()"
					class="btn btn-success radius"><i class="fa fa-check"></i>  保存</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
					 class="btn btn-danger radius" href="javascript:;" onclick="MTools.closeForm()" ><i class="fa fa-close"></i> 关闭</a>
			</div>
			</div>
	</form>
	</div>
</body>
<script type="text/javascript" src="${path }/resource/js/systools/MJsBase.js"></script>
	<script type="text/javascript">
	var myForm=MForm.initForm({
		invokeUrl:"${path}/admin/webMsg/addOrModify",
		afterSubmit:function(){
			parent.myGrid.serchData();
		},
	});
	</script>
</body>
</html>