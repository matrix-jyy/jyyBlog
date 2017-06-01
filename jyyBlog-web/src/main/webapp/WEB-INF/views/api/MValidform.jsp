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
<title>MValidform</title>
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>系统js工具类<span>&gt;</span>MValidform
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
						<li><a href="#3F">price</a></li>
						<li><a href="#4F">zfn</a></li>
						<li><a href="#5F">idCard</a></li>
						<li><a href="#6F">pOrm</a></li>
						<li><a href="#7F">hl</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">

			<div class="row">
				<h2>
					<a class="title" name="1F">介绍</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<code>MValidform.js </code>
					MValidform是Matrix框架的基础js工具之一,主要功能是进行表单验证，继承了Validfor的优点，在Validfor的基础上提供了更丰富的datatype。
				</p>
				<p>
					框架在
					<code>MBase.js</code>
					中已经引入了
					<code>MValidform.js </code>
					不要在自己单独引用
				</p>
				<br> <br>
			</div>



			<div class="row">
				<h2>
					<a class="title" name="2F">基本使用</a>
				</h2>
				<hr>
				<p>
					验证条件及验证提示信息直接绑定到每个表单元素，凡要验证格式的元素均需绑定datatype属性，datatype可选值在Validform内置有10类，来指定不同的验证格式，本框架中扩展了几种验证格式，后面会做详细介绍。
					tiptype可用的值有：1、2、3、4。详细使用可以百度查看Validform的详细介绍
				</p>
				<h3 class="text-primary">示例一：</h3>
				<h3 class="text-primary">html代码如下：</h3>
				<pre class="brush: js;" id="exp" name="code">
					
	             <input type="text" class="form-control" name="name"
					  datatype="*1-20" nullmsg="产品名称不能为空"
					errormsg="长度不能超过20位">
				 <div class="Validform_checktip"></div>
				</pre>
				
					<!-- <button class="btn btn-default" onclick="simpleTest()">点击执行</button> -->
				
				<br>
			</div>
	       <br>
			<div class="row">
				<h2>
					<a class="title" name="3F">price</a>
				</h2>
				<hr>
				<p>
					参数：gets 类型：String - 获取到的表单元素值; <br>参数：obj 类型 :juqery对象 - 为当前表单元素;<br>参数：curform 类型 :juqery对象 -为当前验证的表单; <br>参数：regxp - 为内置的一些正则表达式的引用; <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>price</code>
                                                           验证是否为正整数，或者是小数点后两位以内的小数，通常用户验证价格
				</p>
			</div>
			
			<br>
			<div class="row">
				<h2>
					<a class="title" name="4F">zfn</a>
				</h2>
				<hr>
				<p>
					参数：gets 类型：String - 获取到的表单元素值; <br>参数：obj 类型 :juqery对象 - 为当前表单元素;<br>参数：curform 类型 :juqery对象 -为当前验证的表单; <br>参数：regxp - 为内置的一些正则表达式的引用;如获取内置的整数正则表示式用：<code>regxp.m </code><br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>zfn</code>
                                                           验证是否为整数
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" name="5F">idCard</a>
				</h2>
				<hr>
				<p>
					参数：gets 类型：String - 获取到的表单元素值; <br>参数：obj 类型 :juqery对象 - 为当前表单元素;<br>参数：curform 类型 :juqery对象 -为当前验证的表单; <br>参数：regxp - 为内置的一些正则表达式的引用;如获取内置的整数正则表示式用：<code>regxp.m </code><br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>zfn</code>
                                                           验证是否是身份证
				</p>
			</div>

			<br>
			<div class="row">
				<h2>
					<a class="title" name="6F">pOrm</a>
				</h2>
				<hr>
				<p>
					参数：gets 类型：String - 获取到的表单元素值; <br>参数：obj 类型 :juqery对象 - 为当前表单元素;<br>参数：curform 类型 :juqery对象 -为当前验证的表单; <br>参数：regxp - 为内置的一些正则表达式的引用;如获取内置的整数正则表示式用：<code>regxp.m </code><br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>pOrm</code>
                                                          验证是否是13\15\18开头的11位数字的手机号，或者格式为：3位区号-8位号码的座机号，或者格式为：4位区号-7位号码的座机号
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" name="7F">hl</a>
				</h2>
				<hr>
				<p>
					参数：gets 类型：String - 获取到的表单元素值; <br>参数：obj 类型 :juqery对象 - 为当前表单元素;<br>参数：curform 类型 :juqery对象 -为当前验证的表单; <br>参数：regxp - 为内置的一些正则表达式的引用;如获取内置的整数正则表示式用：<code>regxp.m </code><br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>hl</code>
                                                           验证是否为百分数
				</p>
			</div>

		</div>
	</div>
<br>
<br>
<br>
<p class="pull-right" >
			Document By 谷春霞 <br>
			2016-11-2
</p>
</body>
</html>