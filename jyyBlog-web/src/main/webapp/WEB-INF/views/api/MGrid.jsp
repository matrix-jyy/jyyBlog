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
<title>MGrid</title>
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>系统js工具类<span>&gt;</span>MGrid
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
						<li><a href="#4F">搜索表单</a></li>
						<li><a href="#5F">indexfn</a></li>
						<li><a href="#6F">getUrl</a></li>
						<li><a href="#7F">getImage</a></li>
						<li><a href="#8F">getTime</a></li>
						<li><a href="#9F">自定义格式化数据</a></li>
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
					<code>MGrid.js </code>
					是Matrix 框架的基础js工具之一，它是对<a
						href="http://bootstrap-table.wenzhixin.net.cn/zh-cn/"
						target="_blank">bootstrap-table</a>的轻量级封装<br>
					1、对bootstrap-table的属性进行一些默认的配置，<br> 2、扩展了对搜索按钮、go按钮 <br>
					3、处理搜索表单的值添加到bootstrap-table 的默的queryParams中 <br>4、提供一些与表单相关的操作
				</p>
				<p>
					使用<code>MGrid.js </code>之前一定要自己去官方网站学会使用bootstrap-table
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
					<code>MGrid.js </code>来做一个基础的数据表格显示
				</p>
				<h3 class="text-primary">示例一：</h3>
				<h3 class="text-primary">js代码如下：</h3>
				<pre class="brush: js;" id="exp" name="code">
					//初始化表格					
					var myGrid=MGrid.initGrid({
							 url:"${path}/api/showList",  //数据加载地址
							 delUrl:"${path}/api/del"  //数据删除地址
						 });
				</pre>
				<h3 class="text-primary">Html代码：</h3>
				<pre class="brush: js;" id="exp" name="code">
					&lt;div class="ibox-content" &gt;
						&lt;div class="option-bar" &gt;
							&lt;button onclick="myGrid.delItems()" type="button" class="btn btn-danger btn-sm"&gt;&lt;i class="fa fa-trash" &gt;&lt;/i&gt;批量删除&lt;/button&gt;
						&lt;/div&gt;
						&lt;table id="mgrid" &gt;
							&lt;thead&gt;
								&lt;tr&gt;
									&lt;th data-checkbox="true"  &gt;&lt;/th&gt;
									&lt;th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" &gt;序号&lt;/th&gt;
									&lt;th data-field="name" &gt;用户姓名&lt;/th&gt;
									&lt;th data-field="email" &gt;Email&lt;/th&gt;
									&lt;th data-field="registerTime" data-formatter="MGrid.getTime" data-sortable="true" &gt;注册时间&lt;/th&gt;
								&lt;/tr&gt;
							&lt;/thead&gt;
						&lt;/table&gt;
					&lt;/div&gt;
				</pre>
				<button class="btn btn-default" onclick="myGridShow()">点击执行</button>
				<div class="panel panel-default">
					<div class="panel-body">
						<div id="demo1" class="ibox-content" style="display: none;">
						    <div class="option-bar" >
						        <button onclick="myGrid.delItems();" type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash" ></i>批量删除</button>
						    </div>
						    <table id="mgrid" >
						        <thead>
						            <tr>
						                <th data-checkbox="true"  ></th>
						                <th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
						                <th data-field="name" >用户姓名</th>
						                <th data-field="email" >Email</th>
						                <th data-field="registerTime" data-formatter="MGrid.getTime" data-sortable="true" >注册时间</th>
						            </tr>
						        </thead>
						    </table>
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
					<code>MGrid.js </code>对
					<a href="http://bootstrap-table.wenzhixin.net.cn/zh-cn/"
						target="_blank">bootstrap-table</a>的属性进行一些默认的配置<br>
				</p>
				<pre class="brush: js;" id="exp">
					/** 表格默认属性 */
					var option = {
						tableSelecter : "#mgrid",// 表格选择器 请保持唯一
						serchFormSelecter : "#serchform",// 搜索表单选择器
						$table : null,// 当前表单的jQuery对象
						pagination : true,// 显示分页栏
						sidePagination : 'server',// 服务器分页
						dataSearch : true,// 显示搜索框
						selectItemName : "keys", // 设置checkbox的值
						pageList : [ 10, 20, 50, 100, 500 ],// 设置分页显示条数下拉控件的值
						showColumns : true,// 显示选择显示列按钮
						showRefresh : true,// 显示刷新按钮
						showToggle : true,// 显示卡片切换
						clickToSelect : true,// 点击行时选中
						delUrl : "",// 数据删除地址
						queryParams : function(params) {
							return $.extend(params, MForm
									.toJson(this.serchFormSelecter));
						},// 添加搜索值
						method : "post",// 数据提交方式
						contentType : "application/x-www-form-urlencoded",
					};
				</pre>
				<p>
					初始化表格通常只需要传入 url(数据加载地址) 与 delUrl(数据删除地址) 两个属性即可，<br>
					其他属性可以根据项目需要自行修改
				</p>
			</div>
			
			
			<div class="row">
				<h2>
					<a class="title" id="4F">搜索表单</a>
				</h2>
				<hr>
				<p>
					搜索表单选择器可在serchFormSelecter属性中设置；默认为"#serchform"
				</p>
				<pre class="brush: js;" id="exp">
					&lt;form class="form-inline" id="serchform"&gt;
						&lt;div class="form-group mr-20"&gt;
							&lt;label for="exampleInputName2"&gt;账号&lt;/label&gt;
							&lt;input name="account" type="text" class="form-control"&gt;
						&lt;/div&gt;
						&lt;button  onclick="myGrid.serchData()" type="button" class="btn btn-info btn-sm"&gt;&lt;i class="fa fa-search " &gt;&lt;/i&gt; 搜索&lt;/button&gt;
						&lt;button  type="reset" class="btn btn-info btn-sm"&gt;&lt;i class="fa fa-refresh " &gt;&lt;/i&gt; 重置&lt;/button&gt;
					&lt;/form&gt;
				</pre>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="5F">indexfn</a>
				</h2>
				<hr>
				<p>
					参数：无 <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>indexfn</code>

					方法可以获取表格的序号
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="6F">getUrl</a>
				</h2>
				<hr>
				<p>
					参数：无 <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>getUrl</code>

					方法可以格式化url数据，转为a标签
				</p>
				<pre class="brush: js;" id="exp">
					return "<a href=" + value + " target='blanck' >" + value + "</a>";
				</pre>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="7F">getImage</a>
				</h2>
				<hr>
				<p>
					参数：无 <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>getImage</code>

					方法可以把图片链接格式化为可见的图片
				</p>
				<pre class="brush: js;" id="exp">
					return "<a href=" + value + " target='blanck' >" + value + "</a>";
				</pre>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="8F">getTime</a>
				</h2>
				<hr>
				<p>
					参数：无 <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>getTime</code>

					方法可以格式化时间数据，格式为"yyyy-MM-dd hh:mm"
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="9F">自定义格式化数据</a>
				</h2>
				<hr>
				<p>
					我们可以自定义方法，来格式化数据，如缩写长数据
				</p>
				<pre class="brush: js;" id="exp">
					/** 获取缩写 */
					function getAbbreviation(value, row, index) {
						var temp = "";
						try {
							temp = value;
						    if(temp.length > 15){
								return temp.substring(0, 15) + "...";
							}else{
								return temp;
							}
						} catch (e) {
							console.err('MGrid getAbbreviation执行失败');
						}
						return temp;
					},
				</pre>
			</div>
			<br>
		</div>
	</div>
	<br>
	<br>
	<br>
	<p class="pull-right">
		Document By 毛禄广 <br> 2016-11-1
	</p>
</body>
</html>