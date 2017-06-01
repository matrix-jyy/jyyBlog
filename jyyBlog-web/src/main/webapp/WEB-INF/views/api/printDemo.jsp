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
<title>printDemo.jsp</title>
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
<script type="text/javascript" src="${path }/resource/js/LodopFuncs.js"></script>
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>系统js工具类<span>&gt;</span>AjaxProxy
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
						<li><a href="#2F">引用文件</a></li>
						<li><a href="#3F">打印内容</a></li>
						<li><a href="#4F">调用打印js</a></li>
						<li><a href="#5F">SET_PRINT_PAGESIZE</a></li>
						<li><a href="#6F">ADD_PRINT_TEXT</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col-sm-8">
		<div class="row">
				<h2>
					<a class="title" name="1F">Lodop介绍</a>
				</h2>
				<hr>
				是专业WEB控件,用它既可裁剪输出页面内容，又可用程序代码直接实现
				<br>
				复杂打印。控件功能强大,却简单易用,所有调用如同JavaScript扩展语句,主要接口函数如下：
				<br>
				●	PRINT_INIT(strPrintTaskName)打印初始化
				<br>
				●	SET_PRINT_PAGESIZE(intOrient,intPageWidth,intPageHeight,strPageName)设定纸张大小
				<br>
				●	ADD_PRINT_HTM(intTop,intLeft,intWidth,intHeight,strHtml)增加超文本项
				<br>
				●	ADD_PRINT_TEXT(intTop,intLeft,intWidth,intHeight,strContent)增加纯文本项
				<br>
				●	ADD_PRINT_TABLE(intTop,intLeft,intWidth,intHeight,strHtml)增加表格项
				<br>
				●	ADD_PRINT_SHAPE(intShapeType,intTop,intLeft,intWidth,intHeight,intLineStyle,intLineWidth,intColor)画图形
				<br>
				●	SET_PRINT_STYLE(strStyleName, varStyleValue)设置对象风格
				<br>
				●	PREVIEW打印预览
				<br>
				●	PRINT直接打印
				<br>
				●	PRINT_SETUP打印维护
				<br>
				●	PRINT_DESIGN打印设计
				<br>
				<strong>
				本api主要讲述
				<code>SET_PRINT_PAGESIZE</code>(设置纸张大小),<code>ADD_PRINT_HTM</code>(设置边距)函数,其他详见<a href="http://www.lodop.net/">lodop官网</a>
				</strong>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">引用js</a>
				</h2>
				<hr>
					  
				<pre class="brush: js;" id="exp" name="code">
				<script type="text/javascript" src="${path }/resource/js/LodopFuncs.js"></script>
				</pre>
			</div>
		
			<div class="row">
				<h2>
					<a class="title" name="3F">打印内容</a>
				</h2>
				<hr>
				打印内容是 id为print的html内容,可识别css,但必须放在div内部。
				<pre class="brush: js;" id="exp" name="code">
			<div id="print" style="display: none;"> 
<style midia="print" >
.table1 {
	width: 500px;
	font-size: 10px;
	border-top: 1px solid #333;
	margin-top: 40px;
}
.table2 {
	margin-bottom: 100px;
}

.table1 td {
	height: 20px;
}

.table2 td {
	height: 20px;
}

.table1 tr {
	height: 30px;
}

.table3 {
	position: absolute;
	bottom: 20px;
}
.tittl {
	text-align: center;
	font-size: 20px;
}
</style>
	<h1 class="tittl">美度收银单</h1>
	<table class="table1">

		<tr>
			<td>会员姓名:李四</td>
			<td>联系电话:13888888888</td>
			<td>打印日期:2016-06-06</td>
		</tr>
		<tr>
			<td>会员编号:No.19978</td>
			<td>健康顾问:王婷</td>
		</tr>
		<tr>
			<td>订单编号:20160000000000</td>
			<td>收银人:王婷</td>
		</tr>
	</table>
	<table class="table2 table1">
		<tr>
			<td>套餐</td>
			<td>数量</td>
			<td>单价</td>
			<td>折后价</td>
		</tr>
	
			<tr>
			<td>套餐</td>
			<td>数量</td>
			<td>单价</td>
			<td>折后价</td>
			</tr>
			</table>

	<table class="table1 table3">
		<tr>
			<td colspan="4">备注:</td>
		</tr>
		<tr>
			<td>缴纳金额:1000</td>
			<td>现金:1000</td>
			<td>划扣:10000</td>
			<td>本次欠款:1000</td>
		</tr>
	</table>
</div>
</pre>
<div class="row">
				<h2>
					<a class="title" name="4F">调用打印JS</a>
				</h2>
				<hr>
				需去官网下载<a href="http://www.lodop.net/download.html">Lodop经典历史版</a>
				并安装<code>install_lodop32.exe(install_lodop64.exe)</code>
<pre class="brush: js;" id="exp" name="code">
var LODOP;
function print() {
	CreateOneFormPage();
	LODOP.PRINTA();
}
function CreateOneFormPage() {
	LODOP = getLodop();
	LODOP.SET_LICENSES("湖***", "4DCD4C250*********C0B04F2","", "");//打印控件的key
	LODOP.SET_PRINT_STYLE("FontSize", 18);//设置字体大小
	LODOP.SET_PRINT_PAGESIZE(0, 1300, 1945, "");//纸张大小：单位为微米 1300：宽 1945位高
	strCenterStyle = "<style/>table {width:100%}</style>";
	LODOP.ADD_PRINT_HTM(5, "9%", "82%", 600, strCenterStyle
			+ document.getElementById("print").innerHTML); //内容居中左右边距9%,上边距5pt
	LODOP.SET_PRINT_STYLE("Bold", 1);
	/* 	LODOP.ADD_PRINT_HTM(30,30,650,600,document.getElementById("print").innerHTML); */

};
</pre>
<button class="btn btn-default" onclick="print()">点击执行</button>
</div>


</div>
<div class="row">
				<h2>
					<a class="title" name="5F">SET_PRINT_PAGESIZE</a>
				</h2>
				<hr>
<p>
格式：<code>SET_PRINT_PAGESIZE(intOrient,intPageWidth,intPageHeight,strPageName); </code>
<br>
功能：设置纸张大小及打印方向
<br>
参数含义： 
<br>
<code>intOrient：</code>
打印方向及纸张类型
<br>
值为1---纵向打印，固定纸张； 
<br>
值为2---横向打印，固定纸张；  
<br>
值为3---纵向打印，宽度固定，高度按打印内容的高度自适应；
<br>
0(或其它)----打印方向由操作者自行选择或按打印机缺省设置。
<br>
<code>intPageWidth：</code>
纸张宽，单位为0.1mm 譬如该参数值为45，则表示4.5mm,计量精度是0.1mm。
<br>
<code>intPageHeight：</code>
<br>
固定纸张时该参数是纸张高；高度自适应时该参数是纸张底边的空白高，计量单位与纸张宽一样。
<br>
<code>strPageName：</code>

纸张名，必须intPageWidth等于零时本参数才有效，有如下选择：
<br>
Letter, LetterSmall, Tabloid, Ledger, Legal,Statement, Executive, 
<br>
A3, A4, A4Small, A5, B4, B5, Folio, Quarto, qr10X14, qr11X17, Note, 
<br>
Env9, Env10, Env11, Env12,Env14, Sheet, DSheet, ESheet
</p>
</div>

<div class="row">
				<h2>
					<a class="title" name="6F">ADD_PRINT_HTM</a>
				</h2>
				<hr>
<p>
<br>
格式：<code>ADD_PRINT_HTM(Top,Left,Width,Height,strContent)  </code>
<br>
功能：
设定该打印项在纸张内的位置和区域大小(调整边距)，文本内容在该区域内 自动折行，当内容超出区域高度时，如果对象被设为“多页文档”则会自动分页继续打印，否则内容被截取。 
<br>
参数：
<br>
<code>Top：</code>
 打印项在纸张内的上边距，整数或字符型，整数时缺省长度单位为px。字符型时可包含单位名：in(英寸)、cm(厘米) 、mm(毫米) 、pt(磅)、px(1/96英寸) 、%(百分比)，如“10mm”表示10毫米。当上边距超过纸张高度时，打印项被输出在下一页(或更下页)。 
<br>
<code>Left：</code>
打印项在纸张内的左边距，整数或字符型，整数时缺省长度单位为px。字符型时可包含单位名：in(英寸)、cm(厘米) 、mm(毫米) 、pt(磅)、px(1/96英寸) 、%(百分比)，如“10mm”表示10毫米。 Width：  打印区域的宽度，整数或字符型，整数时缺省长度单位为px。字符型时可包含单位名：in(英寸)、cm(厘米) 、mm(毫米) 、pt(磅)、px(1/96英寸) 、%(百分比)，如“10mm”表示10毫米。本参数可以用RightMargin关键字转义为打印区域相对于纸张的“右边距”。 
<br>
<code>Height： </code>
 打印区域的高度，整数或字符型，整数时缺省长度单位为px。字符型时可包含单位名：in(英寸)、cm(厘米) 、mm(毫米) 、pt(磅)、px(1/96英寸) 、%(百分比)，如“10mm”表示10毫米。本参数可以用BottomMargin关键字转义为打印区域相对于纸张的“下边距”。 
<br>
<code>strContent：</code>
  纯文本内容，字符型，未限制长度。
</p>
</div>

</div>
</div>
		 <p class="pull-right" >
			Document By 罗凯 <br>
			2016-11-01
			</p>
	
</body>
	<script type="text/javascript">
	var LODOP;
	function print() {
		CreateOneFormPage();
		LODOP.PRINTA();
	}
	function CreateOneFormPage() {
		LODOP = getLodop();
		LODOP.SET_LICENSES("湖南卓景京信息技术有限公司", "4DCD4C2508498B1DDD6CD498AC0B04F2","", "");
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_表单一");
		LODOP.SET_PRINT_STYLE("FontSize", 18);
		LODOP.SET_PRINT_PAGESIZE(0, 1300, 1945, "");
		strCenterStyle = "<style/>table {width:100%}</style>";
		LODOP.ADD_PRINT_HTM(5, "9%", "82%", 600, strCenterStyle
				+ document.getElementById("print").innerHTML);
		LODOP.SET_PRINT_STYLE("Bold", 1);

	};
	</script>
</html>