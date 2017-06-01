<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	
	 <script type="text/javascript" charset="utf-8" src="${path }/resource/plugin/beditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${path }/resource/plugin/beditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${path }/resource/plugin/beditor/lang/zh-cn/zh-cn.js"></script>
    
</head>

<div class="ibox-content">
	<form class="form-horizontal" id="dataform"
		onsubmit="javascripr:return false;">
		<input type="hidden" name="tokenUrl" value="${tokenUrl}"> <input
			type="hidden" name="token" value="${token}">
		<c:if test="${obj ne null }">
			<input type="hidden" name="artId" id="artId" value="${obj.artId}">
			<input type="hidden" id="artTypeId" value="${obj.artTypeId}">
		</c:if>
		<div class="form-group">
			<label class="col-sm-2 control-label">作者名称</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name="artAuthor"
					value="<c:out value="${obj.artAuthor}" />">
			</div>
			<div class="Validform_checktip"></div>
			<label class="col-sm-2 control-label">文章类型</label>
			<div class="col-sm-3">
				<select class="select2 form-control " size="1" name="artTypeId"
					id="parentId">
					<option value="0" selected="selected">--请选择文章类型--</option>
				</select>
			</div>
			<div class="Validform_checktip"></div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">标题<span
				class="text-danger">*</span></label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name="artTitle"
					value="<c:out value="${obj.artTitle}" />" datatype="*"
					nullmsg="标题不能为空">
			</div>
			<label class="col-sm-2 control-label">排序</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name="artSort"
					value="${obj.artSort}" datatype="n" ignore="ignore"
					errormsg="排序只能为数字">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">访问量</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name="artCount"
					value="<c:out value="${obj.artCount}" />" datatype="n"
					ignore="ignore" errormsg="序号只能为数字" />
			</div>
			<label class="col-sm-2 control-label">标签</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name="artLables"
					placeholder="多个标签用中文逗号隔开"
					value="<c:out value="${obj.artLables}" />" datatype="*"
					ignore="ignore">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">文章摘要</label>
			<div class="col-sm-6">
				<input value="<c:out value="${obj.artAbstract}" />"
					datatype="*1-550" ignore="ignore" name="artAbstract"
					class="form-control" type="text" id="zy-input"
					placeholder="自动抓取为文章前面100个字符">
			</div>
			<div class="col-sm-3">
				<input class='btn radius btn-primary' type="button" value="自动抓取"
					onclick="autoZy()"> <input class='btn radius btn-primary'
					type="button" value="清空摘要" onclick="cleanZy()">
			</div>
			<div class="Validform_checktip"></div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">是否立即发布</label>
			<div class="col-sm-3">
				<c:if test="${obj ne null }">
					<div class="row">
						<div class="col-sm-2 radio radio-danger">
							<input type="radio" name="artIsPublish" id="radio1" value="是"
								<c:if test="${obj ne null && obj.artIsPublish eq '是' }"> checked="checked" </c:if>>
							<label for="radio1">是</label>
						</div>
						<div class="col-sm-2 radio radio-danger">
							<input type="radio" name="artIsPublish" id="radio2" value="否"
								<c:if test="${obj ne null && obj.artIsPublish eq '否' }"> checked="checked" </c:if>>
							<label for="radio2">否</label>
						</div>
					</div>
				</c:if>
				<c:if test="${obj eq null }">
					<div class="row">
						<div class="col-sm-2 radio radio-danger">
							<input type="radio" name="artIsPublish" id="radio1" value="是"
								checked="checked"> <label for="radio1">是</label>
						</div>
						<div class="col-sm-2 radio radio-danger">
							<input type="radio" name="artIsPublish" id="radio2" value="否">
							<label for="radio2">否</label>
						</div>
					</div>
				</c:if>
			</div>
		</div>


		<div class="form-group">
			<label class="col-sm-2 control-label">文章内容</label>
			<div class="col-sm-8">
				 
				  <script style="width: 100%; height: 500px" id="artcontent" name="artContent" type="text/plain">${obj.artContent} </script>
        
			</div>
			<div class="Validform_checktip"></div>
		</div>

		<div class="form-group">
		<label class="col-sm-2 control-label">文章预览图</label>
		<div class="col-sm-8">
		<input value="${obj.artImage }"
				name="artImage" id="artImage" class="form-control  upload-input"
				type="text" /> <a class="btn btn-primary radius upload-a"> <i
				class="fa fa-cloud-upload"></i> 上传图片
			</a>
		</div>
			 
		</div>

		


		<div class="form-group">
			<label class="col-sm-2 control-label">图集</label>
			<div class="col-sm-8">
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>序号</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="begin" value="0"></c:set>
								<c:if test="${not empty obj }">
									<c:set var="begin" value="${fn:length(obj.images) }"></c:set>
									<c:forEach items="${obj.images }" var="item" varStatus="count">
										<tr>
											<td>${count.index+1}</td>
											<td><input value="${item.path }"
												name="images[${count.index}].path" id="id${count.index}"
												class="form-control  upload-input" type="text" /> <a
												class="btn btn-primary radius upload-a"> <i
													class="fa fa-cloud-upload"></i> 上传图片
											</a></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:forEach var="item" varStatus="count" begin="${begin }"
									end="5">
									<tr>
										<td>${count.index+1}</td>
										<td><input name="images[${count.index}].path"
											id="id${count.index}" class="form-control  upload-input"
											type="text" /> <a class="btn btn-primary radius upload-a">
												<i class="fa fa-cloud-upload"></i> 上传图片
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>



		<div class="form-group ">
			<div class="col-sm-12 text-center">
				<a href="javascript:;" onclick="myForm.submit()"
					class="btn btn-success radius"><i class="fa fa-check"></i>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-danger radius"
					onclick="MTools.closeForm()">
					<i class="fa fa-close"></i>取消
				</button>
			</div>
		</div>
	</form>
</div>

</body>
<script type="text/javascript"
	src="${path }/resource/js/systools/MJsBase.js"></script>
<script type="text/javascript">
	var editor = null;
	var myForm = MForm.initForm({
		invokeUrl : "${path}/admin/webArticle/addOrModify",
		beforeSubmit : function() {
			 
		},
		afterSubmit : function() {
			parent.myGrid.serchData();
		},
	});
	 var editor=null;
	$(function() {
		$(".select2").select2({
			'width' : '100%'
		});
		MUI.initImgUpload(".upload-input");
		  editor = UE.getEditor('artcontent');
		MUI.openServiceImgSpace(function(url) {
			$("#img_1").attr("src", url).show();
			$("#hiddenImg").val(url);
		}, "#selectInServices");
		initFunctionList();
	});

	/**
	 * 初始文章类型列表
	 */
	function initFunctionList() {
		$
				.AjaxProxy({
					a : false,
					c : false
				})
				.invoke(
						"${path}/admin/webArticleType/all",
						function(loj) {
							var id = 0;
							if ($("#artTypeId").val() != null) {
								id = $("#artTypeId").val();
							}
							$("#parentId")
									.createSelectTree(
											loj.attr("result").rows,
											{
												id : "artTypeId", // 选项的值
												parent : "artTypeParentId", // 父节点值
												value : "artTypeName", // 要显示的名称
												append : false,
												defaultValue : id,
												defaultHtml : '<option value="0" selected="selected">一级文章类别</option>'
											});
						});

	}

	function autoZy() {
		var text = editor.text();
		$("#zy-input").val(text.substring(0, 100));
	}
	function cleanZy() {
		$("#zy-input").val("");
	}
</script>
</html>