<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>二次开发</title>
<link rel="shortcut icon" href="favicon.ico">
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

img{
	margin: 20px auto;
	padding: 5px;
	border: 1px solid #aeaeae;
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
<body class="gray-bg">

	<div class="row">
		<div class="col-sm-3 ">
			<div class="ibox float-e-margins flow">
				<div class="ibox-title">
					<h5>目录</h5>
				</div>
				<div class="ibox-content">
					<ul>
						<li><a href="#1F">二次开发说明</a></li>
						<li><a href="#2F">二次开发步骤</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">

			<div class="row">
				<h2>
					<a class="title" name="1F">二次开发说明</a>
				</h2>
				<hr>
				<div class="center-block ">
					<p>
						Matrix是一个扩展性强的系统，系统默认提供了权限管理，用户管理，功能管理，
						等通用的功能，除此之外还提供了大量的工具和组件，让开发者在matrix的基础上扩展功能，进行二次开发，方便快捷<br>
						matrix不仅仅可作为web服务程序的后台还可以作为App程序后台为app提供JSON数据接口。<br> <br>
					</p>
				</div>

				<div class="row">
					<h2>
						<a class="title" name="2F">二次开发步骤</a>
					</h2>
					<hr>
					<div class="center-block ">
						<h2 class="text-primery">1、数据库表设计</h2>
						<p>在进行开发前我们一般都会先设计数据库，matrix的最佳实践数据库是mysql所以建议选择mysql数据库。
							在数据库设计上要求按照公司的标准进行设计数据表</p>
						<h2 class="text-primery">2、代码生成</h2>
						<p>
							建好数据表后我们就可以Matrix的代码生成器来生成对表操作的代码<br> 代码生成地址：<a
								target="blank" href="http://10.0.0.7:8200/codegen">http://10.0.0.7:8200/codegen</a>
							值得注意的是：如果要使用代码生成器那么数据表就要按照一定的规律来设计<br>
							1、需要在界面显示的字段一定要有注释且注释用[ ]包裹如：[姓名]<br> 2、如果在表单操作时该字段是必填字段则在[
							]里加*号如：[姓名*]<br>
						</p>
						<img style="max-width: 100%"
							src="${path }/resource/images/dmj1.png"> <img
							style="max-width: 100%" src="${path }/resource/images/dmj2.png">
						<p>代码生成后你会得到一个zip包，包中包含了针对数据表操作的，dao代码，service代码，action代码，以及列表显示和
							新增编辑界面代码。你需要把对应的类或者jsp文件拷贝到matrix项目中对应的包中。</p>
						<h2 class="text-primery">3、权限配置</h2>
						<p>
							代码复制完成后，就可以开始访问你的功能了，那么如何进入你的功能呢？<br>
							matrix的所有功能都通过权限来管理，你需要用一个特殊管理账号来分配功能的访问权限
							，这个账号叫开发者账号，用来管理系统的功能和按钮
							<code>zking,默认密码：123</code>
							<br> 用zking 登录后就进入了功能管理，在功能管理中新增一个功能，填写好表单中所需要的数据，到此一个功能
							就等于注册到了matrix的权限系统 。<br> <img width=100%
								src="${path }/resource/images/xzgl.png"> <br>
						</p>
						<p>
							功能注册成功后，需要分配到admin这个用户所在的公司，这样admin才能使用。给公司分配权限我们使用的是
							超级管理员账号，这个账号是
							<code> super ,密码123</code>
							<br> <img style="max-width: 100%"
								src="${path }/resource/images/super1.png"><br>
						</p>
						<p>权限分配好后在用admin进行登录，你就能在菜单栏看到你所创建的功能了</p>
						<code>注意:生成的action默认跳转路径为"/admin/你的类名",如果你不是直接放在admin文件夹中，则需要改一下
							action的跳转路径方法</code>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>