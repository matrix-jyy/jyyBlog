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
<title>介绍</title>
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
						<li><a href="#1F">Matrix框架介绍</a></li>
						<li><a href="#2F">技术选型</a></li>
						<li><a href="#3F">框架结构</a></li>
						<li><a href="#4F">主要功能</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">

			<div class="row">
				<h2>
					<a class="title" name="1F">Matrix框架介绍</a>
				</h2>
				<hr>
				<div class="center-block ">
					<p class=" ">&nbsp;&nbsp;Matrix由zking同事姜友瑶发起，Matrix的目标是建立一个标准化，灵活易用支持快速开发的Java开发框架，满足公司的快速增长的业务需求。</p>
					<img alt="" src="${path}/resource/images/hkdg.jpg"
						class="img-responsive hkdg">
					<code>Matrix</code>
					一词灵感来源于电影《黑客帝国》
					在电影中，Matrix是一套极其复杂的模拟系统程序是黑客们苦苦找寻的母体，它由具有人工智能的机器建立的，模拟了人类的世界，虽然Matrix在电影中
					是个反派角色但是其实Matrix的本意是子宫、母体、孕育生命的地方。
					取用Matrix这个名字一方面表示希望这个框架能够茁壮成长,能够包罗万象成为一个很强大的框架，另一方面希望这个框架能够孕育出更多优秀的项目为公司添砖加瓦,让框架本身实现价值。
					<br> &nbsp;&nbsp;在此公司特别感谢为Matrix添砖加瓦的同事们。Matrix
					的完善和成长需要每一位Zking同事的智慧，希望更多的同事愿意付出自己宝贵的时间可以加入到这份有意义的工作中。
					如果你有好idea或者NB的功能你觉得可以加入到Matrix框架中，欢迎与框架维护组联系。
				</div>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">技术选型</a>
				</h2>
				<hr>
				<div class="center-block ">
					<ol>
						<li>服务器：tomcat7.0以上版本</li>
						<li>JAVA JDK：1.7以上版本</li>
						<li>数据库：MYSQL5.6以上版本</li>
						<li>数据源：Druid数据库连接池</li>
						<li>持久层：mybatis持久化</li>
						<li>MVC： 基于spring mvc注解</li>
						<li>日志：log4j打印日志</li>
						<li>项目构建工具：maven</li>
						<li>文件上传代理：nginx</li>
						<li>UI框架：Bootstrap</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="3F">框架结构</a>
				</h2>
				<hr>
				<div class="center-block ">
					<img width="100%" src="${path }/resource/images/kjjg.png">
				</div>
				<h2 class=" text-primary">请求时序图</h2>
				<img width="100%" src="${path }/resource/images/qqsxt.png">
			</div>
			<div class="row">
				<h2>
					<a class="title" name="4F">主要功能</a>
				</h2>
				<hr>
				<div class="center-block ">
					<ol>
						<li>Ajax代理请求</li>
						<li>权限体系</li>
						<li>数据拦截</li>
						<li>代码自动生成</li>
						<li>全局异常处理</li>
						<li>数据对比更新</li>
						<li>Debug模式</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<p class="pull-right">
		Document By 姜友瑶 <br> 2016-9-27
	</p>
</body>
</html>