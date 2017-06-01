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
<title>MUI</title>
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
<body class="gray-bg">
	<nav class="huiNav">
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>系统js工具类<span>&gt;</span>MUI
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
						<li><a href="#3F">createSelectTree</a></li>
						<li><a href="#4F">省市地区三级联动</a></li>
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
					<code>MUI.js </code>
					MUI是Matrix框架的自定义组件库
				</p>
				<p>
					框架在
					<code>MBase.js</code>
					中已经引入了
					<code>MUI.js </code>
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
					自定的组件库主要包括：树形结构的的下拉框和省份城市地区的三级联动
				</p>
			</div>
	       <br>
			<div class="row">
				<h2>
					<a class="title" name="3F">createSelectTree</a>
				</h2>
				<hr>
				<p>
				参数：options - 传递过来的集合 <br>
				参数：seting 类型：json - 配置的一些参数; <br>
				 &nbsp;&nbsp;&nbsp;&nbsp;
					<code>createSelectTree</code>
                                                         创建属性结构的数据
				<h1>
					 &nbsp;&nbsp;&nbsp;&nbsp;<a class="title" name="3F">seting配置的参数说明</a>
				</h1>
					 &nbsp;&nbsp;&nbsp;&nbsp;参数：id 类型：String - 选项option的value值; <br>
					 &nbsp;&nbsp;&nbsp;&nbsp;参数：parent 类型 :String - 父节点的取值,父节点取值的属性;<br>
					 &nbsp;&nbsp;&nbsp;&nbsp;参数：value 类型 :String - 要显示的名称,对应option的html内容; <br>
					 &nbsp;&nbsp;&nbsp;&nbsp;参数：append 类型:boolean - 是否为追加 ，默认值为false(不追加) ;  <br>
					 &nbsp;&nbsp;&nbsp;&nbsp;参数：defaultValue 类型 :String - 默认选中值;<br>
					 &nbsp;&nbsp;&nbsp;&nbsp;参数：defaultHtml 类型 :String - 默认option;<br>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" name="4F">三级联动</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp; 下面我们举一个省市区域三级联动的例子
				</p>
				<h3 class="text-primary">1、页面</h3>
				<h4 class="text-primary">&nbsp;&nbsp;html代码</h4>
				<pre class="brush: js;" id="exp" name="code">
				  	<div class="margin col-sm-9 col-xs-7 " id="div"></div>
				</pre>
				<br>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;js代码</h4>
				<pre class="brush: js;" id="exp" name="code">
	$(function() {
		$.AjaxProxy({a:false}).invoke("${path}/address/toAddress",function(loj){
			var html="";
			for(var i = 0; i < loj.getRowCount(); i++){
				if($("#orderId").val() !=''){
					html=html+"< tr class='addresstr'>"	
				}else{
					html=html+"< tr class='addresstr'>"
				}
				html=html+"< td onclick='addOrderAddress(\""+loj.getString(i, 'address')+"\")'>"+loj.getString(i,"receiptUserName")+"< /td >"
						+"< td onclick='addOrderAddress(\""+loj.getString(i, 'address')+"\")'>"+loj.getString(i,"area").name+"< /td >"
						+"< td onclick='addOrderAddress(\""+loj.getString(i, 'address')+"\")'>"+loj.getString(i,"address")+"< /td >"
						+"< td onclick='addOrderAddress(\""+loj.getString(i, 'address')+"\")'>"+loj.getString(i,"zipCode")+"< /td >"
						+"< td onclick='addOrderAddress(\""+loj.getString(i, 'address')+"\")'>"+loj.getString(i,"receiptUserTel")+"< /td >"
						+"< td>"
						+"< a href='javascript:void(0)' class=' mr-5' onClick='openEdit("+loj.getString(i,"id")+")'  title='编辑'>< i class='fa fa-bars'>< /i>< /a>" 
						+"&nbsp;&nbsp;< a href='javascript:void(0)' onClick='delItem("+loj.getString(i,"id")+")' title='删除'>< i class='fa fa-lg fa-trash-o'>< /i>< /a>"
						+"< /td>"
					if(loj.getString(i,"isDefault")=='是'){
						html=html+"< td  >< span class='btn btn-default btn-sm mr-5'>当前默认地址< /span>< /td>"
					}else{
						html=html+"< td >< button class='btn-address btn  btn-default btn-sm mr-5'  onClick='isDefault("+loj.getString(i,"id")+")'>设为默认地址</button></td>"
					}
					html=html+"< /tr >"
				$("#address").empty().html(html);
			}
		})
	})
	
	
	//地区级联 
	$(function() {
			$.AjaxProxy({a:false}).invoke("${path}/address/queryProvinceAddress",function(loj){
				var html = "< select class='select select-box areaBox margin2 col-sm-3' name='province' onchange='changArea(this)' dataType='s' nullmsg='省不能为空'>" + "<option value='-1'>--省份--</option>";
				for (var i = 0; i < loj.getRowCount(); i++) {
					html = html + '< option value=' + loj.getString(i, "id") + ' >' + loj.getString(i, "name") + '< /option>';
				}
				html += "< /select >" 
						+"< select class='select select-box areaBox margin2 col-sm-3' name='city' id='city'  onchange='changArea(this)' dataType='s' nullmsg='市不能为空'>" + " <option value='-1' >--城市--</option></select>" 
						+"< select class='select select-box areaBox margin2 col-sm-3' name='quyu' id='quyu'>" + "< option value='-1' >--地区--< /option >" + "< /select >"
				$("#div").empty().html(html);
			});
		});
				</pre>
				
				<!-- <h3 class="text-primary">3、服务端java代码</h3>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;查询数据的controller方法，在页面作展示使用，注意此查询方法与导出中使用的查询方法要一样。</h4>
				<pre class="brush: js;" id="exp" name="code">
				/**根据水果名称查询水果列表
				 * @param name
				 * @return
				 */
				@RequestMapping(value = "/queryFruits")
				public @ResponseBody AjaxResult queryFruits(String name) {
					List< Fruits > fruits=new ArrayList< >();
					for(Fruits f:getFruits()){
						if(f.getName().contains(name)){
							fruits.add(f);
						}
					}
					AjaxResult result = new AjaxResult(AjaxResult.STATUS_OK, null, null, fruits, fruits.size());
					result.putInMap("time", DateUtils.getTimeMark());
					return result;
				}
				</pre>
			     -->
				<p>
<!-- 				 <button class="btn btn-default" onclick="parentTest()">点击执行</button> 
 -->				
		</div>
			<br>
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