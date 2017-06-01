<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="Mtags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>主页</title>
<link rel="shortcut icon" href="favicon.ico">
<!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>

<!-- 界面单独引入的其他样式和脚本 -->
<link rel="stylesheet"
	href="${path }/resource/plugin/zTree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${path }/resource/plugin/zTree/jquery.ztree.core-3.5.min.js"></script>

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

<body class="gray-bg">

	<div class="wrapper wrapper-content  animated fadeInRight">
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>导航栏列表</h5>
						<div class="pull-right ">
							<a class="f-r text-success " onclick="openForm()"><i
								class="fa fa-plus c-success"></i> 添加导航栏</a>
						</div>
					</div>
					<div id="treeDemo" class="ibox-content ztree"
						style="min-height: 400px"></div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>编辑导航栏</h5>
						<div class="ibox-tools"></div>
					</div>
					<div class="ibox-content" style="min-height: 400px">
						<form style="display: none;" class="form-horizontal dataform "
							id="dataform">
							<input type="hidden" name="navId" id="navId">
							<div class="form-group">
								<label class="col-sm-3 control-label">父级导航栏</label>
								<div class="col-sm-3">
									<select class="select2 form-control " size="1" name="parentId"
										id="parentId">
									</select>
								</div>
								<label class="col-sm-3 control-label">导航名称</label>
								<div class="col-sm-3">
									<input id="navName" name="navName" type="text"
										class="form-control " nullmsg="导航名称不能为空" datatype="*1-50"
										errormsg="导航名称长度不能超过50">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">导航排序</label>
								<div class="col-sm-3">
									<input id="navOrderby" name="navOrderby" type="text"
										class="form-control " nullmsg="导航序号不能为空" datatype="n1-10"
										errormsg="导航序号不能超过10">
								</div>
								<label class="col-sm-3 control-label">导航描述</label>
								<div class="col-sm-3">
									<input id="navDescription" name="navDescription" type="text"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">导航类型</label>
								<div class="col-sm-3">
									<div id="navTypeText" class="form-control-static"  ></div>
								<Mtags:debug>
									<select class="form-control select2" size="1" name="navType"
										id="navType">
										<option value="PC">PC</option>
										<option value="mobile">mobile</option>
									</select>
									</Mtags:debug>
								</div>

								<label class="col-sm-3 control-label">导航链接地址</label>
								<div class="col-sm-3">
									<input id="navUrl" name="navUrl" type="text"
										class="form-control " nullmsg="导航链接地址不能为空" datatype="*1-1000"
										errormsg="导航链接地址不能超过1000">
								</div>
							</div>
							
	<div class="form-group">
		<label class="col-sm-3 control-label">导航图片</label>
		<div class="col-sm-8">
		<input value="1"
				name="navIcon" id="navIcon" class="form-control  upload-input"
				type="text" /> <a class="btn btn-primary radius upload-a"> <i
				class="fa fa-cloud-upload"></i> 上传图片
			</a>
		</div>
</div>

							
							<div class="form-group">
								<div class="col-sm-12 text-center">
									<a class="btn btn-success radius" onclick="updateFunction()">保存</a>
									<a class="btn btn-danger  radius" onclick="delFunction()">删除</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript"
		src="${path }/resource/js/systools/MJsBase.js"></script>
	<script type="text/javascript">
		var Huiform = null;
		$(function() {
			MUI.initImgUpload(".upload-input");
			initFunctionList();
			$(".select2").select2({
				'width' : '100%'
			});
			Huiform = MValidform.validform("#dataform");
		});

		/**
		 * 初始化文章类别列表
		 */
		function initFunctionSelected(id) {
			$.AjaxProxy().invoke("${path}/admin/webNav/all", function(loj) {
				$("#parentId").createSelectTree(loj.attr("result").rows, {
					id : "navId", // 选项的值
					parent : "parentId", // 父节点值
					value : "navName", // 要显示的名称
					append : false,
					defaultValue : id,
					defaultHtml : '<option value="0" >  一级导航栏  </option>'
				});
			});
		}

		function initFunctionList() {
			var zNodes = new Array();
			$.AjaxProxy().invoke(
					"${path}/admin/webNav/all",
					function(loj) {
						for (var i = 0; i < loj.getRowCount(); i++) {
							zNodes[i] = createNode(loj.getString(i, "navId"),
									loj.getString(i, "parentId"), loj
											.getString(i, "navName"));
						}
						initTree(zNodes);
					});
		}

		function updateFunction() {
			var myForm = MForm.initForm({
				invokeUrl : "${path}/admin/webNav/addOrModify",
				afterSubmit : function() {
					initFunctionList();
				},
			});
			myForm.submit();
		}

		function initTree(zNodes) {
			var setting = {
				view : {
					dblClickExpand : false,
					showLine : false,
					selectedMulti : false
				},
				data : {
					simpleData : {
						enable : true,
						idKey : "id",
						pIdKey : "pId",
						rootPId : ""
					}
				},
				callback : {
					onClick : zTreeOnClick
				}
			};
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		}

		// 点击加载节点信息
		function zTreeOnClick(event, treeId, treeNode) {
			$("#dataform").show();
			Huiform.resetForm();
			$.AjaxProxy({
				p : {
					id : treeNode.id
				},
				a : false,
				c : true
			}).invoke(
					"${path}/admin/webNav/findById",
					function(loj) {
						// 初始化功能基本信息
						initFunctionSelected(loj.getString(0, "parentId"));
						$("#navId").val(loj.getString(0, "navId"));
						$("#navName").val(loj.getString(0, "navName"));
						$("#navOrderby").val(loj.getString(0, "navOrderby"));
						$("#navDescription").val(
								loj.getString(0, "navDescription"));
						
						$("#navUrl").val(loj.getString(0, "navUrl"));
						
						$("#navIcon_hide").val(loj.getString(0, "navIcon"));
						$("#navIcon").val(loj.getString(0, "navIcon"));
						$("#navIcon_img").attr("src",loj.getString(0, "navIcon")).show();
						$("#navTypeText").html(loj.getString(0, "navType"));
						
						
						//设置选中值
						$("#navType").val(loj.getString(0, "navType")).trigger(
								"change");

					});
		};

		function createNode(navId, parentId, navName) {
			var o = new Object();
			o.id = navId;
			o.pId = parentId;
			o.name = navName;
			o.open = true;
			return o;
		}
		function showIcon() {
			layer.open({
				type : 2,
				title : "选择图标",
				area : [ '80%', '80%' ],
				fix : true, // 不固定
				maxmin : true,
				content : '${path}/common/redirect/icons'
			});
		}

		function delFunction() {
			var id = $("#navId").val();
			if (id != null && id != '') {
				layer.confirm('确认删除导航栏吗？', {
					icon : 3,
					title : '提示'
				}, function(index) {
					layer.close(index);
					var id = $("#navId").val();
					$.AjaxProxy({
						p : {
							keys : id
						}
					}).invoke("${path}/admin/webNav/del", function(loj) {
						layer.alert('删除成功！', {
							icon : 1
						}, function(index) {
							$("#dataform").hide();
							layer.close(index);
							initFunctionList();
						});
						return false;
					});
				});
			} else {
				layer.alert("请先选中要删除的功能！");
			}
		}

		function openForm() {
			layer.open({
				type : 2,
				title : "添加导航",
				area : [ MUI.SIZE_L, '400px' ],
				content : '${path}/admin/webNav/editForm'
			});
		}
	</script>

</body>
</html>