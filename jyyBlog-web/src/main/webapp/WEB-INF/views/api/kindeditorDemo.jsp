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
<title>importFile</title>
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
						<li><a href="#1F">引用文件</a></li>
						<li><a href="#2F">初始化</a></li>
						<li><a href="#3F">注意事项</a></li>
						<li><a href="#4F">Demo</a></li>
						<li><a href="http://kindeditor.net/demo.php">kindeditor官网</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="row">
				<h2>
					<a class="title" name="1F">引用文件</a>
				</h2>
				<hr>
				<pre class="brush: js;" id="exp" name="code">
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
				</pre>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">创建富文本</a>
				</h2>
				<hr>
				
				<pre class="brush: js;" id="exp" name="code">
				<textarea name="description1" id="artcontent1"></textarea>//准备一个文本域
				MUI.createEdit("description1", '100%', '500px', 'editor');//js创建富文本域
				</pre>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="3F">注意事项</a>
				</h2>
				<hr>
				<p>
					富文本如果是ajax提交数据需手动的将数据同步到文本域当中,需执行<code>editor.sync()</code>。;
				</p>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="4F">Demo</a>
				</h2>
				<hr>
				<div class="col-sm-8">
					<textarea name="description" id="artcontent">
					</textarea>
				</div>
			</div>
		</div>
		 <p class="pull-right" >
			Document By 罗凯 <br>
			2016-11-01
			</p>
	</div>
	
</body>
	
	<script type="text/javascript">
		//创建富文本编辑器
		MUI.createEdit("description", '100%', '500px', 'editor');
	</script>
</html>