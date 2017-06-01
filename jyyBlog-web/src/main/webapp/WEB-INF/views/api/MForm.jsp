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
<title>MForm</title>
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
	src="${path }/resource/plugin/api/MGrid&MFormDemo.js"></script>


<!-- 界面单独引入的其他样式和脚本 -->
<script type="text/javascript"
	src="${path }/resource/plugin/syntaxhighlighter_3.0.83/scripts/shCore.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/syntaxhighlighter_3.0.83/scripts/shBrushJScript.js"></script>
<link type="text/css" rel="stylesheet"
	href="${path }/resource/plugin/syntaxhighlighter_3.0.83/styles/shCore.css" />
<link type="text/css" rel="stylesheet"
	href="${path }/resource/plugin/syntaxhighlighter_3.0.83/styles/shCoreDefault.css" />
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>系统js工具类<span>&gt;</span>MForm
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
						<li><a href="#1F">介绍</a></li>
						<li><a href="#2F">基本使用</a></li>
						<li><a href="#3F">默认属性</a></li>
						<li><a href="#4F">验证框架Validform的简单使用</a></li>
						<li><a href="#5F">toJson</a></li>
						<li><a href="#6F">reset</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">

			<div class="row">
				<h2>
					<a class="title" id="1F">介绍</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<code>MForm.js </code>
					是Matrix 框架的基础js工具之一，它对form表单做了轻量级封装<br>
					1、扩展了表单提交前和提交后的回调函数，<br> 
					2、集成了<a href="http://validform.rjboy.cn/" target="_blank">Validform</a>插件来验证表单 <br>
					3、提供了表单数据转换以及表单重置的方法
				</p>
				<br> <br>
			</div>


			<div class="row">
				<h2>
					<a class="title" id="2F">基本使用</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp; 我们用
					<code>MForm.js </code>来做一个基础的表单
				</p>
				<h3 class="text-primary">示例一：</h3>
				<h3 class="text-primary">js代码如下：</h3>
				<pre class="brush: js;" id="exp" name="code">
					//初始化表单					
					var myForm = MForm.initForm({
						invokeUrl : "${path}/api/addOrModify"
					});
				</pre>
				<h3 class="text-primary">Html代码：</h3>
				<pre class="brush: js;" id="exp" name="code">
					<form class="form-horizontal" id="dataform" onsubmit="javascripr:return false;">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名：</label>
							<div class="  col-sm-10">
								<input type="text" name="name"  
									class="form-control radius" dataType="*1-50">
								<div class="Validform_checktip"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label  ">密码：</label>
							<div class="  col-sm-10">
								<input type="text" name="password" id="password" value="123"
									class="form-control radius" dataType="*1-50">
								<div class="Validform_checktip"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label  ">确认密码：</label>
							<div class="  col-sm-10">
								<input type="text" name="password2" recheck="password" value="123"
									class="form-control radius" dataType="*1-50">
								<div class="Validform_checktip"></div>
							</div>
						</div>
						<div class="form-group ">
							<div class="col-sm-12 text-center">
								<a href="javascript:;" onclick="myForm.submit()"
									class="btn btn-success radius">保存</a>
							</div>
						</div>
					</form>
				</pre>
				<button class="btn btn-default" onclick="myFormShow()">点击执行</button>
				<div class="panel panel-default">
					<div class="panel-body">
						<div id="demo1" class="ibox-content" style="display: none;">
						    <form class="form-horizontal" id="dataform" onsubmit="javascripr:return false;">
								<div class="form-group">
									<label class="col-sm-2 control-label">姓名：</label>
									<div class="col-sm-10">
										<input type="text" name="name"  
											class="form-control radius" dataType="*1-50">
										<div class="Validform_checktip"></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label  ">密码：</label>
									<div class="  col-sm-10">
										<input type="text" name="password" id="password" value="123"
											class="form-control radius" dataType="*1-50">
										<div class="Validform_checktip"></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label  ">确认密码：</label>
									<div class="  col-sm-10">
										<input type="text" name="password2" recheck="password" value="123"
											class="form-control radius" dataType="*1-50">
										<div class="Validform_checktip"></div>
									</div>
								</div>
								<div class="form-group ">
									<div class="col-sm-12 text-center">
										<a href="javascript:;" onclick="myForm.submit()"
											class="btn btn-success radius">保存</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<h2>
					<a class="title" id="3F">默认属性</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<code>MForm.js </code>的属性的默认配置如下<br>
				</p>
				<pre class="brush: js;" id="exp">
					var option = {
						beforeSubmit : null,// 表单提交之前调用函数
						afterSubmit : null,// 刷新数据回调函数
						formSelecter : "#dataform",// 表单默认选择器
						isvalid : true,// 是否对表单进行验证
						validform : null,// 验证表单
						extendParam : {},// 需要添加到表单中的额外参数会一起提交到服务器
						invokeUrl : "",// 数据提交地址
						layerIndex : "",// layer当前窗口的index值（用来关闭ifram）
						isAutoClose : true,// 是否自动关闭
					}
				</pre>
				<p>
					初始化表单通常只需要传入 <code>invokeUrl</code>(数据提交地址)属性即可，<br>
					其他属性可以根据项目需要自行修改
				</p>
			</div>
			
			
			<div class="row">
				<h2>
					<a class="title" id="4F">验证框架Validform的简单使用</a>
				</h2>
				<hr>
				<pre class="brush: js;" id="exp">
					&lt;div class="form-group"&gt;
						&lt;label class="col-sm-2 control-label"&gt;姓名：&lt;/label&gt;
						&lt;div class="col-sm-10"&gt;
							&lt;input type="text" name="name" 
								class="form-control radius" dataType="*1-50"&gt;
							&lt;div class="Validform_checktip"&gt;&lt;/div&gt;
						&lt;/div&gt;
					&lt;/div&gt;
				</pre>
				<p>
					对需要验证的input元素加上属性<code>dataType</code>,如*1-50 代表1到50位任意字符<br>
					并在input元素下方加上<code>&lt;div class="Validform_checktip"&gt;&lt;/div&gt;</code>，用于显示验证结果<br>
					更为详细的使用请前往<a href="http://validform.rjboy.cn/" target="_blank">Validform官网</a>学习
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="5F">toJson</a>
				</h2>
				<hr>
				<p>
					参数：form 表单选择器 <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>toJson</code>

					方法可以将表单数据转换为json数据
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="6F">reset</a>
				</h2>
				<hr>
				<p>
					参数：form 表单选择器 <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>reset</code>

					方法可以置空表单内的input,select,textarea元素
				</p>
			</div>
			<br>
		</div>
	</div>
	<br>
	<br>
	<br>
	<p class="pull-right">
		Document By 毛禄广 <br> 2016-11-6
	</p>
</body>
</html>