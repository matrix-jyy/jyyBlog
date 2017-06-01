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
<title>主页</title>
<link rel="shortcut icon" href="favicon.ico">
<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>
<style type="text/css">
.ctitle {
	color: #000;
	font-size: 16px;
}

.hkdg {
	width: 150px;
	margin: 5px;
	border: 1px solid #aeaeae;
	border-radius: 5px;
	padding: 3px;
}
.gxul li{
	padding: 10px 0px;
	border-bottom: 1px solid #efefef;
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
</style>
</head>

<body>
	<div id="yourElement" class="ibox-content animated rotateInUpLeft">

		<h2 class="text-center title">Zking Matrix V3.0</h2>
		<p class=" text-center">Welcome to use Zking Matrix .</p>
		<br>
		<div class="row">
			<div class="col-sm-6">
				<blockquote class="center-block ">
					<h2>源码</h2>
					<p>
						Matrix3.0源码地址 ：<a
							href="http://git.oschina.net/jyyforjava/matrix3.0"
							target="_blank">http://git.oschina.net/jyyforjava/matrix3.0</a>
					</p>
				</blockquote>
				<blockquote class="center-block ">
					<h2>基础Web组件</h2>
					<p class=" ">&nbsp;&nbsp;
					<p>
						<strong>UI</strong>: <a href="http://v3.bootcss.com/"
							target="_blank">Bootstrap</a> / <a
							href="http://www.zi-han.net/theme/hplus/" target="_blank">H+ui</a>
					</p>
					<p>
						<strong>表格插件</strong>：<a
							href="http://bootstrap-table.wenzhixin.net.cn/zh-cn/"
							target="_blank">Bootstrap-table</a>
					</p>
					<p>
						<strong>验证框架</strong>：<a href="http://validform.rjboy.cn/"
							target="_blank">Validform</a>
					</p>
					<p>
						<strong>弹框组件</strong>：<a href="http://layer.layui.com/"
							target="_blank">layer</a>
					</p>
					<p>
						<strong>富文本编辑器</strong>：<a href="http://kindeditor.net/demo.php"
							target="_blank">kindeditor</a>
					</p>
					<p>
						<strong>树形控件</strong>：<a
							href="http://www.ztree.me/v3/demo.php#_101" target="_blank">Ztree</a>
					</p>
					<p>
						<strong>字体样式</strong>：<a
							href="http://www.thinkcmf.com/font/icons#new" target="_blank">奥深图标</a>
					</p>
					<p>
						<strong>checkbox</strong>：<a
							href="http://awesome-bootstrap-checkbox.okendoken.com/demo/index.html"
							target="_blank">awesome-bootstrap-checkbox</a>
					</p>
					<p>
						<strong>select </strong>: <a
							href="https://select2.github.io/examples.html" target="_blank">select2</a>
					</p>
				</blockquote>
			</div>
			<div class="col-sm-6">
				<h2>更新说明</h2>
				<ul class="gxul">
					<li>
						<div>
							<span class="ctitle">新增simplemvc模式 &nbsp;&nbsp;</span> <span
								class="time">2017-01-05</span>
						</div>
						 <br> <code>
							无需遵循既定的代码结构，直接在action层调用sql语句，执行数据操作。<br>
						</code>
					</li>
					<li>
						<div>
							<span class="ctitle">代码机新增List界面和Form界面代码生成 &nbsp;&nbsp;</span> <span
								class="time">2017-01-04</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">新增地区组件&nbsp;&nbsp;</span> <span
								class="time">2017-01-04</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">新增防止表单篡改功能&nbsp;&nbsp;</span> <span
								class="time">2016-12-25</span>
								 <br> <code>防止使用网页工具或者其他方式改变表单的元素名称</code>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">  左侧功能栏的排序bug解决&nbsp;&nbsp;</span> <span
								class="time">2016-12-21</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">css 加载和js加载分离，js放在文档最后加载&nbsp;&nbsp;</span> <span
								class="time">2016-12-20</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">
								修复无按钮的功能无法编辑的bug；修复角色可登录平台与所在公司不对应的bug&nbsp;&nbsp;</span> <span
								class="time">2016-12-09</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">新增据库手动备份功能&nbsp;&nbsp;</span> <span
								class="time">2016-12-05</span>
						</div>
					</li>
					<li>
						<div>
							<span class="ctitle">Matrix3.0 发布&nbsp;&nbsp;</span> <span
								class="time">2016-11-27</span>
						</div> <br> <code>
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

		<p class="pull-right">
			Document By 姜友瑶 <br> 2016-6-26
		</p>
	</div>
</body>
<script type="text/javascript">
	$('#yourElement').addClass('animated rotateInUpLeft');
</script>
</html>