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
<body class="gray-bg">
	<div class="ibox-content gray-bg">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>网页参数设置</h5>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal" id="dataform"
							onsubmit="javascripr:return false;">
							<c:forEach var="item" items="${list }" varStatus="count">
								<c:choose>
									<c:when test="${count.index < 2 }">
										<div class="form-group">
										<input type="hidden" name="param[${count.index}].paramId"
													value="${item.paramId }"> <input type="hidden"
													name="param[${count.index}].paramValue2"
													value="${item.paramValue2 }"> 
											<label class="col-sm-2 control-label">${item.paramValue2 }</label>
											<div class="col-sm-6">
												
												<input 
												<c:if test="${count.index eq 1 }" > data-filetypes="ico" </c:if>
												value="${item.paramValue }"  name="param[${count.index}].paramValue" 
												 id="id${count.index}" class="form-control  upload-input"
													type="text" /> <a class="btn btn-primary radius upload-a">
													<i class="fa fa-cloud-upload"></i> 浏览文件
												</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-group ">
											<input type="hidden" name="param[${count.index}].paramValue2"
												value="${item.paramValue2 }"> <input type="hidden"
												name="param[${count.index}].paramId"
												value="${item.paramId }"> <label
												class="col-sm-2 control-label">${item.paramValue2}</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													name="param[${count.index}].paramValue"
													value="${item.paramValue }">
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<div class="form-group ">
								<div class="col-sm-12 text-center">
									<a href="javascript:;" onclick="myForm.submit()"
										class="btn btn-success radius"><i class="fa fa-check"></i>
										保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
		invokeUrl : "${path}/admin/busParameterSettings/modifyWebParam",
		afterSubmit : function() {
			parent.myGrid.serchData();
		},
	});
	MUI.initImgUpload(".upload-input");
</script>
</body>
</html>