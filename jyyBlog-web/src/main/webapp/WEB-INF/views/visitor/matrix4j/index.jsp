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

				<img   class="showImg"
					src="http://gzh.tdsx114.com:1088/uploadeFile/jyyBlog/image/20170521/QQ20170520-205316@2x%E5%89%AF%E6%9C%AC_76.png">
				<br>



				<div class="center-block ">
					<h3 id="me" class=" ">介绍</h3>
					<p class=" ">
						&nbsp;&nbsp;设计Matrix4J
						的目地是建立一个标准化，灵活易用支持团队快速开发的Java开发框架。目前Matrix4J配合代码生成器一起使用已经能够满足小、微、软件公司的
						java快速开发需求，能够节省大量基础开发工作节约企业人力成本。框架完全开源，可以免费使用。本框架已经应用在多个商业项目中，大家可以放心使用，如有疑问欢迎加QQ群交流：
						<code>315766651</code>
					</p>
					<p>
						&nbsp;&nbsp;Matrix4J我觉得还有很大的成长空间，但是光凭我一个人的力量是远远不够的，所以我想开源这个框架，希望和各位朋友们一起做好这个框架，让他能够更强大，更健壮；
						能解决更多领域的问题，提高程序员的工作效率，减少基础代码的编写，为我们腾出更多的时间来享受生活。</p>
					<img alt="" src="${path}/resource/images/hkdg.jpg"
						class="img-responsive hkdg">
					</p>
					<code>Matrix</code>
					一词灵感来源于电影《黑客帝国》
					在电影中，Matrix是一套极其复杂的模拟系统程序是黑客们苦苦找寻的母体，它由具有人工智能的机器建立的，模拟了人类的世界，虽然Matrix在电影中
					是个反派角色但是其实Matrix的本意是子宫、母体、孕育生命的地方。
					取用Matrix这个名字一方面表示希望这个框架能够茁壮成长,能够包罗万象成为一个很强大的框架，另一方面希望这个框架能够孕育出更多优秀的项目为公司添砖加瓦,让框架本身实现价值。
					<br> &nbsp;&nbsp;在此特别感谢为Matrix4J添砖加瓦的我的朋友们， 毛毛、春、凯 Matrix4J
					的完善和成长需要每一位朋友的智慧，希望更多的朋友愿意付出自己宝贵的时间可以加入到这份有意义的工作中。
					如果你有好idea或者NB的功能你觉得可以加入到Matrix框架中，欢迎与我交流我的邮箱
					<code>935090232@qq.com</code>
					</p>
				</div>
				<div class="center-block ">
					<h3 class=" ">
						<a name="structure">结构</a>
					</h3>
						<img  class="showImg" src="${path }/resource/images/kjjg.png">
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
						<li>前端展示部分组件：
							<ul>
								<li><strong>UI</strong>: <a href="http://v3.bootcss.com/"
									target="_blank">Bootstrap</a> / <a
									href="http://www.zi-han.net/theme/hplus/" target="_blank">H+ui</a>
								</li>
								<li><strong>表格插件</strong>：<a
									href="http://bootstrap-table.wenzhixin.net.cn/zh-cn/"
									target="_blank">Bootstrap-table</a></li>
								<li><strong>验证框架</strong>：<a
									href="http://validform.rjboy.cn/" target="_blank">Validform</a>
								</li>
								<li><strong>弹框组件</strong>：<a href="http://layer.layui.com/"
									target="_blank">layer</a></li>
								<li><strong>富文本编辑器</strong>：<a
									href="http://kindeditor.net/demo.php" target="_blank">kindeditor</a>
								</li>
								<li><strong>树形控件</strong>：<a
									href="http://www.ztree.me/v3/demo.php#_101" target="_blank">Ztree</a>
								</li>
								<li><strong>字体样式</strong>：<a
									href="http://www.thinkcmf.com/font/icons#new" target="_blank">奥深图标</a>
								</li>
								<li><strong>checkbox</strong>：<a
									href="http://awesome-bootstrap-checkbox.okendoken.com/demo/index.html"
									target="_blank">awesome-bootstrap-checkbox</a></li>
								<li><strong>select </strong>: <a
									href="https://select2.github.io/examples.html" target="_blank">select2</a>
								</li>
							</ul>

						</li>
					</ol>
				</div>

				<div class="center-block ">
					<h3 class=" ">
						<a name="down">下载</a>
					</h3>
					<a href=" http://git.oschina.net/jyyforjava/matrix3.0"
						target="_blank"> 框架源码 ：</a><a
						href="http://git.oschina.net/jyyforjava/matrix3.0" target="_blank">
						http://git.oschina.net/jyyforjava/matrix3.0</a> <br> <a
						href=" http://www.jyymatrix.cc/matrix-web/common/redirect/login"
						target="_blank"> 项目演示地址 ： </a> <a
						href=" http://www.jyymatrix.cc/matrix-web/common/redirect/login"
						target="_blank"> http://www.jyymatrix.cc/matrix-web </a> <br>
					<a href="http://git.oschina.net/jyyforjava/codegen3.0"
						target="_blank"> 代码生成器地址 ： </a> <a
						href="http://git.oschina.net/jyyforjava/codegen3.0"
						target="_blank">http://git.oschina.net/jyyforjava/codegen3.0</a>

				</div>
				<div class="center-block ">
					<h3 class=" ">
						<a name="new">更新</a>
					</h3>
					 <ul class="gxul">
					<li>
						<div>
							<span class="ctitle">新增simplemvc模式 &nbsp;&nbsp;</span> <span class="time">2017-01-05</span>
						</div>
						  <code>
							无需遵循既定的代码结构，直接在action层调用sql语句，执行数据操作。<br>
						</code>
					</li>
					<li>
						<div>
							<span class="ctitle">代码机新增List界面和Form界面代码生成 &nbsp;&nbsp;</span> <span class="time">2017-01-04</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">新增地区组件&nbsp;&nbsp;</span> <span class="time">2017-01-04</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">新增防止表单篡改功能&nbsp;&nbsp;</span> <span class="time">2016-12-25</span>
								 <br> <code>防止使用网页工具或者其他方式改变表单的元素名称</code>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">  左侧功能栏的排序bug解决&nbsp;&nbsp;</span> <span class="time">2016-12-21</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">css 加载和js加载分离，js放在文档最后加载&nbsp;&nbsp;</span> <span class="time">2016-12-20</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">
								修复无按钮的功能无法编辑的bug；修复角色可登录平台与所在公司不对应的bug&nbsp;&nbsp;</span> <span class="time">2016-12-09</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">新增据库手动备份功能&nbsp;&nbsp;</span> <span class="time">2016-12-05</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">Matrix3.0 发布&nbsp;&nbsp;</span> <span class="time">2016-11-27</span>
						</div>  <code>
							3.0相对于之前2.0更新了很多重要内容：<br> 1、功能分模块管理<br>
							2、配置文件集中到web项目的config文件夹<br> 3、权限管理全面改造升级，权限可以控制到任意界面功能和按钮<br>
							4、新增服务器权限验证<br> 5、新增debug模式<br> 6、新增高频请求拦截器<br>
							7、新增自定义jsp标签<br> 8、更新数据update方式<br> 9、新增代码机生成方法<br>
							10、ajax请求时登录超时跳出<br>
						</code>
					</li>

				</ul>

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
	$("#index").addClass("active")
		
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
