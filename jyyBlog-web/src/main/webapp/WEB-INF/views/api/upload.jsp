<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<title>upload.jsp</title>
<link rel="shortcut icon" href="favicon.ico">
<!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
<style type="text/css">
* {
	font-size: 14px;
}

.bgfont {
	font-size: 16px;
}
</style>



<script type="text/javascript"
	src="${path }/resource/plugin/api/AjaxProxyDemo.js"></script>


<!-- 界面单独引入的其他样式和脚本 -->
<script type="text/javascript"
	src="${path }/resource/plugin/syntaxhighlighter_3.0.83/scripts/shCore.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/syntaxhighlighter_3.0.83/scripts/shBrushJScript.js"></script>
<link type="text/css" rel="stylesheet"
	href="${path }/resource/plugin/syntaxhighlighter_3.0.83/styles/shCore.css" />
<link type="text/css" rel="stylesheet"
	href="${path }/resource/plugin/syntaxhighlighter_3.0.83/styles/shCoreDefault.css" />
	
<!-- 富文本编辑器 -->
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
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
<style type="text/css">
.hkdg {
	width: 100px;
	height: 100px;
	margin: 5px;
	border: 1px solid #aeaeae;
	border-radius: 5px;
	padding: 3px;
	margin: 5px;
}

blockquote {
	font-size: 14px;
	line-height: 25px;
}

.title {
	color: #6f5499;
	font-size: 32px;
	text-shadow: 2px 3px 2px #ababab;
}

.flow {
	position: fixed;
	top: 50px;
	width: 20%;
	left: 10px;
}
</style>
</head>
<!-- <pre class="brush: js;" id="exp" name="code">
					$.AjaxProxy({
						p:{name:"123"}
					}).invoke("",function(){
						console.log(1);
					} );
				</pre -->

<body class="gray-bg">
	<nav class="huiNav">
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>系统js工具类<span>&gt;</span>AjaxProxy
		<a class="btn btn-info  btn-sm pull-right"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="fa fa-refresh"></i></a>
	</nav>




	<div class="row">
		<div class="col-sm-3 ">
			<div class="ibox float-e-margins flow">
				<div class="ibox-title">
					<h5>目录</h5>
				</div>
				<div class="ibox-content">
					<ul>
						<li><a href="#1F">代码</a></li>
						<li><a href="#2F">注意事项</a></li>
						<li><a href="#3F">Demo</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="row">
				<h2>
					<a class="title" name="1F">代码</a>
				</h2>
				<hr>
				隐藏的文件上传表单
				<br>
				url:<code>${path }/upload/upload?dir=image</code>
				<br>
				提交地址参数说明：
				<br>
				1.<code>dir</code> 存放文件夹,并在文件上传uploadFileControl中限制了相应的格式，可以自己配置。
				<br>
				2.<code>callBack</code> 回调函数名
					  
				<pre class="brush: js;" id="exp" name="code">
<div class="col-sm-8">
	<form class="form form-horizontal" method="post" style="display: none;"
		enctype="multipart/form-data" target="blankFrame" 
		action="${path }/upload/upload?dir=image">
		<input id="fileText2" type="file" multiple name="file-1"	onchange="MTools.selectFile('#showFileName2','#fileText2','#submitBtn2')" /> 
		<input type="submit" id="submitBtn2"/>
	</form>
</div>
				</pre>
				上传按钮
				<br>
				该段代码主要是为了页面美观，实际是通过<code>MTools.chooesFile('#fileText2')</code>调用了上传文件表单的选择文件时间,
				以及集成了富文本的远程图库功能，可以获取远程文件的地址。
				<pre class="brush: js;" id="exp" name="code">
<div class="form-group">
		<label class="col-sm-2 control-label">上传图片</label>
		<div class="col-sm-9">
			<input onclick="MTools.chooesFile('#fileText2')"
				class="input-text upload-url radius form-control" type="text" id="showFileName2"
				readonly style="width: 30%;display: inline;"> 
				<a onclick="MTools.chooesFile('#fileText2')" class="btn btn-primary radius"> 
				<i class="fa fa-cloud-upload"></i> 浏览文件 </a> 
<!-- 								<input type="button" class='btn btn-primary radius'
								onclick="MTools.upFile('#submitBtn2')" value="上传"> -->
				 <a id="selectInServices" class="btn btn-primary radius"> 
				 <i class="fa fa-cloud"></i> 远程图库
			</a>
		</div>
</div>
				
				</pre>
				iframe框架页
				<br>
				文件上传表单提交的目标指向iframe,来实现一个类似ajax的效果,避免本身网页的跳转。
				<pre class="brush: js;" id="exp" name="code">
				<iframe src="" name="blankFrame" id="blankFrame"
			style="height: 100px; width: 100px; display: none;"> 
			</iframe>
				</pre>
				
				抓取远程图库的js
				<br>
				<pre class="brush: js;" id="exp" name="code">
					MUI.openServiceImgSpace(function(url) {
						$("#img_2").attr("src", url).show();
						$("#hiddenImg2").val(url);
					}, "#selectInServices");
				</pre>

			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">注意事项</a>
				</h2>
				<hr>
				<p>
				<br>
					1.文件上传form的提交数据类型需设为<code>  enctype="multipart/form-data"。</code>
				<br>
					2.该文件上传的限制大小为5MB
				<br>
					3.对文件夹存放文件做了扩展名限制
				<br>
					4.详细查看 <code>com.zkingsoft.actions.tools.UploadFileController</code>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="3F">Demo</a>
				</h2>
				 <div class="form-group">
						<label class="col-sm-2 control-label">上传图片</label>
						<div class="col-sm-9">
							<input onclick="MTools.chooesFile('#fileText2')"
								class="input-text upload-url radius form-control" type="text" id="showFileName2"
								readonly style="width: 30%;display: inline;"> 
								<a onclick="MTools.chooesFile('#fileText2')" class="btn btn-primary radius"> 
								<i class="fa fa-cloud-upload"></i> 浏览文件 </a> 
<!-- 								<input type="button" class='btn btn-primary radius'
								onclick="MTools.upFile('#submitBtn2')" value="上传"> -->
								 <a id="selectInServices2" class="btn btn-primary radius"> 
								 <i class="fa fa-cloud"></i> 远程图库
							</a>
						</div>
				</div>
				<hr>
				<div class="col-sm-8">
					<form class="form form-horizontal" method="post" style="display: none;"
						enctype="multipart/form-data" target="blankFrame" 
						action="${path }/upload/upload?dir=image&flag=img_2&hiddenImg=hiddenImg2">
						<input id="fileText2" type="file" multiple name="file-1"	onchange="MTools.selectFile('#showFileName2','#fileText2','#submitBtn2')" /> 
						<input type="submit" id="submitBtn2"/>
					</form>
				</div>
				<iframe src="" name="blankFrame" id="blankFrame"
				style="height: 100px; width: 100px; display: none;"> </iframe>
				</div>
			</div>
		</div>
		 <p class="pull-right" >
			Document By 罗凯 <br>
			2016-11-01
			</p>
	
</body>
	
	<script type="text/javascript">
		//创建富文本编辑器
		//抓取远程图片
		MUI.openServiceImgSpace(function(url) {
			$("#img_2").attr("src", url).show();
			$("#hiddenImg2").val(url);
		}, "#selectInServices2");
	</script>
</html>