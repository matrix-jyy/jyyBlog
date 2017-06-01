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
<title>childDialogDemo</title>
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
	
<!-- 富文本编辑器 -->
<link rel="stylesheet" type="text/css"
	href="${path }/resource/plugin/kindeditor/themes/default/default.css" />
<link rel="stylesheet" type="text/css"
	href="${path }/resource/plugin/kindeditor/plugins/code/prettify.css" />
<script type="text/javascript"
	src="${path }/resource/plugin/kindeditor/kindeditor.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript"
	src="${path }/resource/plugin/kindeditor/plugins/code/prettify.js"></script>
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>系统js工具类<span>&gt;</span>父子表格选择demo
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
						<li><a href="#1F">使用介绍</a></li>
						<li><a href="#2F">Demo</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			
			<div class="row">
				<h2>
					<a class="title" name="1F">使用介绍</a>
				</h2>
				<hr>
				<p>
				    父子表格的选择基本原理就是，在父页面触发某个时间，弹出子页面，子页面操作结束后调用父页面的某个函数，将数据传递给父页面处理。
				</p>
			</div>
			<!-- <div class="row">
				<h2>
					<a class="title" name="2F">注意事项</a>
				</h2>
				<hr>
				<p>
					这里给一个简单的例子，从子页面取出来的数据具体操作;
				</p>
			</div> -->
			<div class="row">
				<h2>
					<a class="title" name="2F">Demo</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp; 下面我们举一个从子页面选择水果列表，把选择的数据展示到父页面的例子来说明父子表格选择的使用
				</p>
				<h3 class="text-primary">1、父页面：parent.jsp，点击选择，跳转到子页面</h3>
				<h4 class="text-primary">&nbsp;&nbsp;html代码：</h4>
				<pre class="brush: js;" id="exp" name="code">
				<div class="ibox-content">
				   <form class="form-horizontal" id="dataform" onsubmit="javascripr:return false;">
					    <div class="form-group">
					        <div class="col-sm-3 col-md-offset-1">
					        <span style="font-size: 14px; font-weight: bold;"> 选择水果<span class="text-danger">*</span> </span>　
					        <button class="btn btn-primary btn-sm" onclick="openPruductList()" type="button">选择</button>
					        </div>
					    </div>
					    <div class="form-group">
					        <div class="col-sm-8 col-md-offset-2">
					            <table class="table table-striped table-hover table-bordered" id="mgrid">
					                <thead>
					                 <tr>
					                        <th>序号</th>
					                        <th>名称</th>
					                        <th>价格</th>
					                        <th>图片地址</th>
					                        <th>操作</th>
					                    </tr>
					                </thead>
					                 <tbody id="cpId">
					                 
					                 </tbody>
					                 
					            </table>
					        </div>
					      </div>
				   </form>
					</div>
				</pre>
				<br>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;js代码</h4>
				<pre class="brush: js;" id="exp" name="code">
				//接受子页面数据的变量
	            var totalGoods=[];
				//打开消耗产品界面，content为跳转路径
				function openPruductList(){
					layer.open({
						type : 2,
						title : "标题",
						area : [ MUI.SIZE_L, '400px' ],
						content : [ '${path }/api/redirect/demoShow/child']
					}); 
				}
				
				
				//回调父函数，arr为子页面传递过来的数据，在页面这个函数做处理
				function callback(arr){
					writeDate(arr);
				}
				
				 //填写数据到html
			    function writeDate(arr){
					 totalGoods=arr;
					 console.log(totalGoods);
			    	 var html="";
					for(var i=0 ; i < totalGoods.length ;i++){
						
						html+='< tr >'
						+'< td >'+(i+1)+'< /td >'
						+'< td >'+totalGoods[i].name+'< /td >'
						+'< td >'+totalGoods[i].price+'< /td >'
						+'< td >'+totalGoods[i].img+'< /td >'
						+'< td class="center"><a style="text-decoration: none" class="fa fa-trash" onClick="delSelectItem(this,'+totalGoods[i].id+')" href="javascript:;" title="删除"></a></td>'
						+'< /tr >';
					}
					$("#cpId").html(html);
			    }
			
			     //删除选中的元素
			    function delSelectItem(node,id){
			   	 for(var i=0;i < totalGoods.length;i++){
			       	 if(totalGoods[i].id==id){
			       	     totalGoods.splice(i, 1);
			       	     break;
			       	 }
			        }
			  	 //移除tr
			  	 $(node).closest('tr').remove();
			  	 $("tbody").find("tr").each(function(i){
			  		 $(this).find("td").eq(0).html(i+1);
			  	 });
			    }
				</pre>
				<h3 class="text-primary">2、子页面：child.jsp，在子页面中选择数据，点击确认选择后，数据将会在父页面展示</h3>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;html代码</h4>
				<pre class="brush: js;" id="exp" name="code">
					<div class="ibox-content">
						<table id="mgrid" data-url="" >
							<thead>
								<tr>
									<th data-checkbox="true"  ></th>
									<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
									<th data-field="name">名称</th>
									<th data-field="price" >价格</th>
									<th data-field="img" >图片地址</th>
									
								</tr>
							</thead>
						</table>
						
						<div class="row" >
								<button class="btn btn-primary center-block" onclick="selectoption()" >确认选择</button>
						</div>
					</div>
				</pre>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;js代码</h4>
				<pre class="brush: js;" id="exp" name="code">
				//接受子页面数据的变量
				var myGrid;
					$(function(){
						 myGrid=MGrid.initGrid({
							 height:300,
							 url:"${path}/api/findFruits", 
						 });
					});
					
				
					function selectoption(){
					    //bootstrap获取选中的数据行
						var arr=myGrid.initParam.$table.bootstrapTable('getSelections');
						//调用父页面的处理函数
						parent.callback(arr);
						//关闭弹窗
						parent.layer.close(parent.layer.getFrameIndex(window.name));
					}
				</pre>
				<p>
				<button class="btn btn-default" onclick="parentTest()">点击执行</button>
				
		</div>

		</div>
		 <p class="pull-right" >
			Document By 谷春霞 <br>
			2016-11-03
		 </p>
	</div>
	
</body>
	
	<script type="text/javascript">
		function parentTest(){
			 window.open("${path}/api/redirect/demoShow/parent");
		}
		
	</script>
</html>