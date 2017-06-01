<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="matrix"%>
<%@ taglib uri="http://matrixcsm.zkingsoft.com" prefix="cms"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta http-equiv="Cache-Control" content="no-siteapp">
<title data-index="1" id="selextTitle">Matrix4J</title>
<meta name="keywords"
	content="Matrix-Java,开发框架，快速开发框架，SpingMvc+Mybatis+Mysql SSHK框架，java学习框架，中小型企业框架" />
<meta name="description"
	content="Matrix-Java  简化你的开发，让你专注于业务。Matrix-Java 是姜友瑶开发的一个实用的java快速开发框架，满足中小型项目快速搭建。
	框架自带代码生成器能够快速生成增删改查代码包括列表和表单界面。
	 集成常用的权限、用户、日志、短信验证等N多基础功能" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link
	href="${path }/resource/plugin/bootstrap-3.3.5/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${path }/resource/plugin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${path }/resource/css/styleOne/animate.min.css"
	rel="stylesheet" type="text/css" />
<link href="${path }/resource/css/visitor/base.css" rel="stylesheet"
	type="text/css">
<link href="${path }/resource/css/visitor/api.css" rel="stylesheet"
	type="text/css">
<link rel="shortcut icon" href="${浏览器logo }">

</head>
<body class="">

	<jsp:include page="../_top.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="_left.jsp"></jsp:include>
			<div class="col-md-7">

				<br>

				<div class="center-block ">
					<h3 class=" ">
						<a name="base">基础环境</a>
					</h3>
					<p>在部署matrix4J系统前请先在你的电脑上安装下列基础软件</p>
					<ol>
						<li>服务器：tomcat7.0以上版本</li>
						<li>JAVA JDK：1.7以上版本</li>
						<li>数据库：MYSQL5.6以上版本</li>
						<li>IDE：eclipse/myeclipse 或者其他IDE</li>
						<li>maven3.0以上</li>
						<li>nginx1.9以上</li>
					</ol>
				</div>

				<div class="center-block ">
					<h3 class=" ">
						<a name="step">步骤</a>
					</h3>
					<h4>一、首先获得项目源码</h4>
					<p>
						下载地址
						<code>
							<a href="http://git.oschina.net/jyyforjava/matrix3.0"
								target="_blank"> http://git.oschina.net/jyyforjava/matrix3.0</a>
						</code>
						,在码云上可以通下载zip包或者通过git命令来下载源代码
					</p>
					<p>
						方式一：通过zip包下载 <img class=" showImgBox img-responsive"
							src="${path }/resource/images/xz.png"> <span> </span>
					</p>

					<p>
						方式二：通过git命令下载
						<code>git clone http://git.oschina.net/jyyforjava/matrix3.0</code>
					</p>
					<h4>二、eclipse配置maven环境</h4>
					<p>
						<img class=" showImgBox img-responsive"
							src="${path }/resource/images/maven0.png"> <img
							class=" showImgBox img-responsive"
							src="${path }/resource/images/maven01.png"> <img
							class=" showImgBox img-responsive"
							src="${path }/resource/images/maven02.png"> <img
							class=" showImgBox img-responsive"
							src="${path }/resource/images/maven03.png">

					</p>
					<blockquote>
						注意：如果是第一次安装的maven，建议修改一下远程仓库地址，maven默认的地址下载jar会比较慢。 maven仓库地址修改是在
						<code>/maven根目录/conf/settings.xml </code>
						中设置
					</blockquote>
					<img class=" showImgBox img-responsive"
						src="${path }/resource/images/mavensetting.png">
					<p>
					<pre>&lt;mirror&gt;
   &lt;id&gt;alimaven&lt;/id&gt;
   &lt;name&gt;aliyun maven&lt;/name&gt;
   &lt;url&gt;http://maven.aliyun.com/nexus/content/groups/public/&lt;/url&gt;
   &lt;mirrorOf&gt;central&lt;/mirrorOf&gt;
&lt;/mirror&gt;
	 </pre>



					<h4>三、导入项目到eclipse</h4>
					<p>
						<img class=" showImg img-responsive"
							src="${path }/resource/images/dr1.png"> <img
							class=" showImg img-responsive"
							src="${path }/resource/images/dr2.png"> <img
							class=" showImg img-responsive"
							src="${path }/resource/images/dr3.png">
					</p>


					<div class="center-block ">
						<h3 class=" ">
							<a name="commonquestion">常见问题</a>
						</h3>
						<p>
							一、项目导入后maven就会开始下载所需要的jar包，这个可能需要比较长的时间，属于正常情况，如果没有开始下载jar包则可以手动
							<code>update maven</code>
							在eclipse中选择项目的5个工程，点击右键 选择菜单
							<code> maven>Updata project </code>
						</p>
						<p>二、jar包下载完成，项目任然报错 检查一下jdk是否是1.7版本，项目编码是否为UTF-8。
						如果一切正常应该是这样的
						 <img
							class=" showImg img-responsive"
							src="${path }/resource/images/drcg.png">
						</p>
					</div>

				</div>





			</div>
		</div>


	</div>
	<hr>

</body>

<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/resource/js/visitor/api.js"></script>


<script>
	$("#seting").addClass("active")

	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "https://hm.baidu.com/hm.js?b5e5ac44c7e4f0e28d52a6872fb94df4";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>

</body>
</html>
