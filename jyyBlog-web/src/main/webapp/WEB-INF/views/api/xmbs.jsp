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
<title>项目部署</title>
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
						<li><a href="#1F">项目部署</a></li>
						<li><a href="#2F">常见问题</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">

			<div class="row">
				<h2>
					<a class="title" name="1F">项目部署</a>
				</h2>
				<hr>
				<div class="center-block ">
					<h2>基础环境搭建</h2>
					<blockquote>
						<p>在部署matrix系统前请先在你的电脑上安装下列基础软件</p>
						<ol>
							<li>服务器：tomcat7.0以上版本</li>
							<li>JAVA JDK：1.7以上版本</li>
							<li>数据库：MYSQL5.6以上版本</li>
							<li>编辑器：eclipse</li>
							<li>maven3.0以上</li>
							<li>nginx1.9以上(可选)</li>
							<li>Git(可选)</li>
						</ol>
					</blockquote>
				</div>
				<div class="center-block ">
					<h2>导入项目</h2>
					<blockquote>
						<p>通过Git或者下载直接matrix框架zip包获得项目源码</p>
						Matrix3.0源码地址 ：<a
							href="http://git.oschina.net/jyyforjava/matrix3.0"
							target="_blank">http://git.oschina.net/jyyforjava/matrix3.0</a>
						<code>注：只有通过公司授权后才有下载权限</code>
						<p>
							下载后通eclipse导入工程<br> <img alt="" width="300px"
								src="${path }/resource/images/dr1.png"> <br> <img
								alt="" width="500px" src="${path }/resource/images/dr2.png"><br>
							<img alt="" width="500px" src="${path }/resource/images/dr3.png"><br>
						</p>
						<p>
							导入后maven会开始下载项目所需要的jar包，在下载完成前项目会报错，耐心等待下载吧。。。。 <br>如果你的maven下载jar包非常慢建议你修改maven的配置文件，换一个远程仓库，下面提供一个速度比较好的
							远程仓库（如果不会，请百度。。。）
						</p>
						<pre>
&lt;mirror&gt;
   &lt;id&gt;alimaven&lt;/id&gt;
   &lt;name&gt;aliyun maven&lt;/name&gt;
   &lt;url&gt;http://maven.aliyun.com/nexus/content/groups/public/&lt;/url&gt;
   &lt;mirrorOf&gt;central&lt;/mirrorOf&gt;
&lt;/mirror&gt;
   					 </pre>
						<p>jar包下载完成后，在eclipse中选择项目的5个工程，点击右键 选择菜单maven>Updata project
							更新一下项目，到此项目应该停止报错一切正常。如果还报错，就检查一下jdk是否是1.7，项目编码是否为UTF-8。</p>
					</blockquote>
				</div>
				<div class="center-block ">
					<h2>修改配置</h2>
					<blockquote>
						<p>项目不报错后就可以修改一下系统配置然后就可以运行项目了</p>
						<p>1、创建数据库</p>
						<p>数据库初始化脚本在文件夹<code>/matrix-web/src/main/resources/config/matrix.sql</code>中有。
						请在mysql数据库中创建一个名称为matrix的数据库，然后执行matrix.sql脚本
						</p>
						<p>2、修改数据库配置</p>
						<p>数据库配置在文件夹<code>/matrix-web/src/main/resources/config/db.properties</code>中。
						打开文件后修改数据库的账号和密码，把默认的数据库和账号修改成你本地的数据库账号和密码
						</p>
						<p>3、发布项目和访问</p>
						<p>如果项目不报错到这一步，你就可以在tomcat中部署你的项目了<br/>
						首页地址：<a target="blank" href="http://localhost:8080/matrix-web/">localhost:8080/matrix-web/</a>
						</p>
						<p>默认账号：admin，密码：123</p>
					</blockquote>
				</div>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">常见问题</a>
				</h2>
				<hr>
				<div class="center-block ">
					<ol>
						
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