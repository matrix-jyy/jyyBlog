<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
	src="${path }/resource/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
<script type="text/javascript" src="${path }/resource/plugin/ajaxfileupload.js"></script>


<title></title>
</head>
<div class="ibox-content">
	<form class="form-horizontal" id="dataform">
	
	   <div class="form-group">
	        <label class="col-sm-2 control-label"></label>
	        <div class="col-sm-2">
	               <a href='${path}/api/download' class="btn btn-primary radius"><i class="fa fa-cloud-download"></i>下载模板 </a>
	       </div>
	   </div>
		<div class="form-group">
		
			<label class="col-sm-2 control-label">上传文件</label>
			<div class="col-sm-9">
				<input onclick="importChances()"
					class="input-text upload-url radius form-control" type="text" id="showFileName"
					readonly style="width: 30%;display: inline;"> 
					<a onclick="importChances()" class="btn btn-primary radius"> 
					<i class="fa fa-cloud-upload"></i> 浏览文件 </a> 
				<input type="file" name="file" type="hidden" id="chanceUploadId" style="display:none">

			</div>
		</div>

		<div class="form-group ">
			<div class="col-sm-12 text-center">
				<button type="button"onclick="submitData()" class="btn btn-success radius">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button onclick="MTools.closeForm()" class="btn btn-danger radius">取消</button>

			</div>
		</div>
	</form>
		<table id="mgrid" >
			<thead>
				<tr>
					<th data-checkbox="true"  ></th>
					<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
					<th data-field="name" >名称</th>
					<th data-field="price" data-sortable="true">价格</th>
				</tr>
			</thead>
		</table>
</div>
<script type="text/javascript">

	//绑定文件的点击事件
	function importChances(){
		var file=$("#chanceUploadId").click();
	}
	//选中文件，文件名字显示在文本框中
	$("#chanceUploadId").change(function(){
		$("#showFileName").val($(this).val());
	})
	
	//提交文件
	function submitData(){
		$.ajaxFileUpload({
			url : "${path}/api/importDemo",
			type : "POST",
			secureuri : false,// 一般设置为false
			fileElementId : "chanceUploadId",// 文件上传空间的id属性 <input type="file" id="uploadId" />
			dataType : "json",
			success : function(data) {
				console.log(data.rows);
				 var icon=0;
				 if(data.status=='ok'){
					 layer.msg(data.info,{icon:1},function(layIndex){
						var  myGrid=MGrid.initGrid({
							data:data.rows
						 });
					 });
				 }
				 else{
					 layer.msg(data.info,{icon:2});
                  }
				
			}
		});
	}
</script>
</body>
</html>