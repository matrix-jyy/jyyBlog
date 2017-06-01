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
<title>MTools</title>
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>系统js工具类<span>&gt;</span>MTools
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
						<li><a href="#2F">handleItem</a></li>
						<li><a href="#3F">random</a></li>
						<li><a href="#4F">randomStr</a></li>
						<li><a href="#5F">redirect</a></li>
						<li><a href="#6F">toPredirect</a></li>
						<li><a href="#7F">upolad</a></li>
						<li><a href="#8F">delThis</a></li>
						<li><a href="#9F">delThisSlide</a></li>
						<li><a href="#10F">changeValidateCode</a></li>
						<li><a href="#11F">chooesFile</a></li>
						<li><a href="#12F">upFile</a></li>
						<li><a href="#13F">selectFile</a></li>
						<li><a href="#14F">autoFullSelect</a></li>
						<li><a href="#15F">ininDatetimepicker</a></li>
						<li><a href="#16F">limitStartEndTime</a></li>
						<li><a href="#17F">closeForm</a></li>
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
					<code>MTools.js </code>
					是Matrix 框架的基础js工具之一，它提供了许多常用的工具和方法
				</p>
				<br> <br>
			</div>


			<div class="row">
				<h2>
					<a class="title" id="2F">handleItem</a>
				</h2>
				<hr>
				<p>
					参数：url:远程地址&nbsp;&nbsp;&nbsp;msg:提示信息&nbsp;&nbsp;&nbsp;callbackfn:操作成功后回调函数 <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>handleItem</code>方法可以对表格中单挑数据进行处理
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					&lt;button onclick='MTools.handleItem(basePath+"/api/handleItem","是否执行？")' 
						class="btn btn-default"&gt;点击执行&lt;/button&gt;
				</pre>
				<button onclick='MTools.handleItem(basePath+"/api/handleItem","是否执行？")' 
					class="btn btn-default">点击执行</button>
<!-- 				<div class="panel panel-default"> -->
<!-- 					<div class="panel-body"> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="3F">random</a>
				</h2>
				<hr>
				<p>
					参数：无<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>random</code>方法可以获取一个随机数
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					layer.alert(MTools.random());
				</pre>
				<button class="btn btn-default" onclick="layer.alert(MTools.random())">点击执行</button>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="4F">randomStr</a>
				</h2>
				<hr>
				<p>
					参数：无<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>randomStr</code>方法可以获取一个随机字符串
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					layer.alert(MTools.randomStr());
				</pre>
				<button class="btn btn-default" onclick="layer.alert(MTools.randomStr())">点击执行</button>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="5F">redirect</a>
				</h2>
				<hr>
				<p>
					参数：url:定向页面地址<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>redirect</code>方法可以进行页面定向
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					<button class="btn btn-default" onclick="MTools.redirect(location.href);">点击执行</button>
				</pre>
				<button class="btn btn-default" onclick="MTools.redirect(location.href);">点击执行</button>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="6F">toPredirect</a>
				</h2>
				<hr>
				<p>
					参数：url:定向页面地址<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>toPredirect</code>方法可以无视iframe进行页面定向
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					<button class="btn btn-default" onclick="MTools.toPredirect(location.href);">点击执行</button>
				</pre>
				<button class="btn btn-default" onclick="MTools.toPredirect(location.href);">点击执行</button>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="7F">upolad</a>
				</h2>
				<hr>
				<p>
					参数：img_id:img元素id&nbsp;&nbsp;&nbsp;file_id:file元素id<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>upolad</code>方法可以在图片在上传的时候显示加载的gif
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					&lt;input id="fileText" type="file" multiple name="file-1" /&gt;
					&lt;img width="50" id='img_1' src="${path}/resource/images/profile_small.jpg" /&gt;
					&lt;button class="btn btn-default" onclick="MTools.upolad('img_1','fileText')" &gt;示例&lt;/button&gt;
				</pre>
<!-- 				<button class="btn btn-default" onclick="MTools.toPredirect(location.href);">点击执行</button> -->
				<div class="panel panel-default">
					<div class="panel-body">
					<input id="fileText" type="file" multiple name="file-1" />
					<img width="50" id='img_1' src="${path}/resource/images/profile_small.jpg" />
					<button class="btn btn-default" onclick="MTools.upolad('img_1','fileText')" >示例</button>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="8F">delThis</a>
				</h2>
				<hr>
				<p>
					参数：id:要删除的元素的id<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>delThis</code>方法可以删除指定元素
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					&lt;p&gt;段落文本&lt;span id="span1" style="color:red;"&gt;span1&lt;/span&gt;&lt;/p&gt;
					&lt;button class="btn btn-default" onclick="MTools.delThis('span1')" &gt;删除span1&lt;/button&gt;
				</pre>
				<div class="panel panel-default">
					<div class="panel-body">
					<p>段落文本<span id="span1" style="color:red;">span1</span></p>
					<button class="btn btn-default" onclick="MTools.delThis('span1')" >删除span1</button>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="9F">delThisSlide</a>
				</h2>
				<hr>
				<p>
					参数：id:要删除的元素的id<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>delThisSlide</code>方法可以删除指定元素，并带上滑效果
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					&lt;p&gt;段落文本&lt;span id="span2" style="color:red;"&gt;span2&lt;/span&gt;&lt;/p&gt;
					&lt;button class="btn btn-default" onclick="MTools.delThisSlide('span2')" &gt;删除span&lt;/button&gt;
				</pre>
				<div class="panel panel-default">
					<div class="panel-body">
					<p>段落文本<span id="span2" style="color:red;">span2</span></p>
					<button class="btn btn-default" onclick="MTools.delThisSlide('span2')" >删除span2</button>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="10F">changeValidateCode</a>
				</h2>
				<hr>
				<p>
					参数：id:img元素id<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>changeValidateCode</code>方法可以更换验证码图片
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					&lt;img width="100" id='img_2' src="${path}/common/validateImg?rand=MTools.random()" /&gt;
					&lt;button class="btn btn-default" onclick="MTools.changeValidateCode('img_2')" &gt;更换&lt;/button&gt;
				</pre>
<!-- 				<button class="btn btn-default" onclick="MTools.toPredirect(location.href);">点击执行</button> -->
				<div class="panel panel-default">
					<div class="panel-body">
					<img width="100" id='img_2' src="${path}/common/validateImg?rand=MTools.random()" />
					<button class="btn btn-default" onclick="MTools.changeValidateCode('img_2')" >更换</button>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="11F">chooesFile</a>
				</h2>
				<hr>
				<p>
					参数：fileElmentId:file元素选择器<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>chooesFile</code>方法可以绑定file元素点击事件
				</p>
				<h3 class="text-primary">示例：</h3>
				<pre class="brush: js;" id="exp">
					&lt;input id="fileChoose" type="file" multiple name="file-1" /&gt;
					&lt;img width="100" id='img_3' src="${path}/resource/images/profile_small.jpg" /&gt;
					&lt;button class="btn btn-default" onclick="MTools.chooesFile('#img_3')" &gt;选择&lt;/button&gt;
				</pre>
<!-- 				<button class="btn btn-default" onclick="MTools.toPredirect(location.href);">点击执行</button> -->
				<div class="panel panel-default">
					<div class="panel-body">
					<input id="fileChoose" type="file" multiple name="file-1" />
					<img width="100" id='img_3' src="${path}/resource/images/profile_small.jpg" />
					<button class="btn btn-default" onclick="MTools.chooesFile('#fileChoose')" >选择</button>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="12F">upFile</a>
				</h2>
				<hr>
				<p>
					参数：submitBtn:提交按钮选择器<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>upFile</code>方法可以绑定提交按钮点击事件
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="13F">selectFile</a>
				</h2>
				<hr>
				<p>
					参数：node:存放文件名的元素选择器,fileTextId:文件元素选择器,submitNode:提交按钮选择器<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>selectFile</code>方法可以获取选择的文件名
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="14F">autoFullSelect</a>
				</h2>
				<hr>
				<p>
					参数：无<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>autoFullSelect</code>方法可以根据autoFull的css类自动填充select框里面的option
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="15F">ininDatetimepicker</a>
				</h2>
				<hr>
				<p>
					参数：initParam 属性集合<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>ininDatetimepicker</code>方法可以初始化时间控件<br>
				</p>
				<h3>使用方法</h3>
				<h5>HTML代码</h5>
				<pre class="brush: js;" id="exp">
					&lt;input id="timedemo" type="text" class="datetimepicker"&gt;
				</pre>
				<h5>js代码</h5>
				<pre class="brush: js;" id="exp">
					MTools.ininDatetimepicker({
						format : "yyyy-mm-dd hh:ii"
					});
				</pre>
				<h4>试一试</h4>
				<div class="panel panel-default">
					<div class="panel-body">
						<input id="timedemo" type="text" class="datetimepicker">
						<button id="timebtn" onclick="MTools.ininDatetimepicker({ format : 'yyyy-mm-dd hh:ii' });$('#timebtn').css('display','none')">加载时间控件</button>
					</div>
				</div>
				<h3>默认属性</h3>
				<pre class="brush: js;" id="exp">
					/** 表格默认属性 */
					var initParam = {
						format : "yyyy-mm-dd", //默认显示年与日，如果想显示十分秒:"yyyy-mm-dd hh:ii:ss"
						maxView: 4, //日期时间选择器最高能展示的选择范围视图。
						minView: "month", 	//"month",只显示年月日的选择,不会再跳转去选择时分秒；如果想要选择时分秒的:"hour"
						autoclose: true,	//true,选择完是否自动关闭，如果不关闭，改为:false
						minuteStep: 5,	//此数值被当做步进值用于构建小时视图。对于每个 minuteStep 都会生成一组预设时间（分钟）用于选择
						weekStart : 1, //一周从哪一天开始。0（星期日）到6（星期六）
						timeSelecter: ".datetimepicker",  //时间选择器的类名
						state : "none", //none,不做限制，beforeToday：只能选择当前日期之前，aferToday：只能选择当前日期之后
						listenBlur:false //由于validform当输入日期后还提示输入，因此 时间按控件当日期更改后，触发该类元素的blur事件，validfrom会验证
					}
				</pre>
				<p>更多的属性请前往datetimepicker官网学习</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="16F">limitStartEndTime</a>
				</h2>
				<hr>
				<p>
					参数：beginTimeId:开始时间选择器，默认为#beginTime&nbsp;&nbsp;&nbsp;endTimeId:结束时间选择器，默认为#endTime<br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<code>limitStartEndTime</code>方法可以让结束时间不小于开始时间
				</p>
				<h3>使用方法</h3>
				<h5>HTML代码</h5>
				<pre class="brush: js;" id="exp">
					&lt;input name="beginTime" id="beginTime" type="text" class="form-control datetimepicker"&gt;—
					&lt;input name="endTime" id="endTime" type="text" class="form-control datetimepicker"&gt;
				</pre>
				<h5>js代码</h5>
				<pre class="brush: js;" id="exp">
					MTools.limitStartEndTime({});
				</pre>
				<h4>试一试</h4>
				<div class="panel panel-default">
					<div class="panel-body">
						开始时间：<input name="beginTime" id="beginTime" type="text" class="form-control datetimepicker">—
						结束时间：<input name="endTime" id="endTime" type="text" class="form-control datetimepicker">
						<button id="timebtn2" onclick="MTools.ininDatetimepicker({ format : 'yyyy-mm-dd hh:ii' });$('#timebtn2').css('display','none');$('#timeSTbtn2').css('display','block')">加载控件</button>
						<button id="timeSTbtn2" style="display:none;" onclick="MTools.limitStartEndTime({});$('#timeSTbtn2').css('display','none')">控制前后时间</button>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" id="17F">closeForm</a>
				</h2>
				<hr>
				<p>
					参数：无<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>closeForm</code>方法可以关闭弹出的窗口
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