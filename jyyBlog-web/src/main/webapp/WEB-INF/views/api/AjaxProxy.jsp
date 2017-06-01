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
<title>AjaxProxy</title>
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
						<li><a href="#2F">基本使用</a></li>
						<li><a href="#3F">循环取List中的值</a></li>
						<li><a href="#4F">getRowCount</a></li>
						<li><a href="#5F">getValue</a></li>
						<li><a href="#6F">getString</a></li>
						<li><a href="#7F">getImg</a></li>
						<li><a href="#8F">getSwitch</a></li>
						<li><a href="#9F">getDate</a></li>
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
					<code>AjaxProxy.js </code>
					是Matrix 框架的基础js工具之一，是一个用来代替jquery或者其他方式发送Ajax请求的js类。在本框架中不推荐使用
					jquery或者其他的Ajax请求。
				</p>
				<p>
					使用
					<code>AjaxProxy.js </code>
					而不用jquery或者其他方式发送Ajax请求的理由：
				</p>
				<ol>
					<li>统一编码风格</li>
					<li>标准的错误处理，如果后台抛出异常，<code>AjaxProxy.js </code>可以根据异常的类型进行异常提示，而不需要在每一个请求中编写重复的错误提示
					</li>
					<li>自动添加网页加载效果</li>
					<li>封装返回值取值方法，取值的时候更方便</li>
				</ol>
				<p>
					框架在
					<code>MBase.js</code>
					中已经引入了
					<code>AjaxProxy.js </code>
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
					&nbsp;&nbsp;&nbsp;&nbsp; 我们用
					<code>AjaxProxy.js </code>
					给后台发送一个简单的请求并且在页面上显示请求到的数据
				</p>
				<h3 class="text-primary">示例一：</h3>
				<h3 class="text-primary">js代码如下：</h3>
				<pre class="brush: js;" id="exp" name="code">
					
	var data = {
		kinds : '水果'
	};// 传到服务器的参数

	var param = {
		p : data, // p表示要传到服务器的参数
		c : true,// c表示是否在页面显示遮罩层 默认为true
		a : true // a表示是否异步请求 默认为是true
	};

	// 初始化AjaxProxy
	var ajaxProxy = $.AjaxProxy(param);
	
	// 执行请求 第一个参数是访问地址，第二个参数是回调函数
	ajaxProxy.invoke(basePath+"/api/findFruits", function(loj) {
		
		// 服务器返回参数被封装在 result 属性中
		$("#serviceParam").html(JSON.stringify(loj.attr("result")));
	
	});
				</pre>
				<h3 class="text-primary">服务端代码</h3>
				<pre class="brush: js;" id="exp" name="code">
				@RequestMapping(value = "/findFruits")
				public @ResponseBody AjaxResult findFruits(String kinds) {
					try {
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					List< Fruits > fruits=Arrays.asList(new Fruits("香蕉", "50"), new Fruits("苹果", "30"),new Fruits("梨子", "20") );
					AjaxResult result = new AjaxResult(AjaxResult.STATUS_OK, null, null, fruits, fruits.size());
					result.putInMap("time", DateUtils.getTimeMark());
					return result;
				}
				
				</pre>
				<p>
					<button class="btn btn-default" onclick="simpleTest()">点击执行</button>
				<div class="panel panel-default">
					<div class="panel-body">
						<p>
						<h3 clas s="text-primary">服务器返回参数</h3>
						<span id="serviceParam"></span>
					</div>
				</div>
				<h3 class="text-primary">接口统一返回参数说明</h3>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;服务器返回的数据是用一个叫AjaxResult类来封装的，
					这些数据被封装到一个叫loj的jQuery对象中的一个result属性中，这里介绍一下返回值代表的意义</p>
				<pre class="brush: js;" id="exp" name="code">
{
    status:"ok", 			//status 表示请求状态   ok-请求成功 , err-请求失败 , unkwonerr-后台程序报错
    info:"操作成功", 		//info 表示返回的提示信息  err状态返回错误原因，unkwonerr-返回异常的描述
    mapInfo:{
    	user:{ 
    		name:"姜友瑶",
    		qq:"935090232"
    	},
    	goods:{
    		goodsId:3,
    		count:2
    	}
    }, //map 返回的是键值对对象
    rows:[
        {
            "goodsId":1,                           //商品id
            "goodsName":"五年高考，三年模拟",        //商品名称
        },
    ],						// rows表示返回的是数组
    total:1  				//total 表示返回总的查询条数
}

		</pre>

				<br>

				<h3 class="text-primary">现在让我们来简化一下上面的js代码</h3>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;简化后的代码和上面的代码的效果是一样的，这也是我们在实际开发中的写法。上面的写法是为了方便大家学习显得有点冗余</p>
				<pre class="brush: js;" id="exp" name="code">
	$.AjaxProxy({
		
		p:{kinds : '水果'}
		
	}).invoke(basePath+"/api/findFruits", function(loj) {
	
		$("#serviceParam").html(JSON.stringify(loj.attr("result")));
		
	});
				</pre>
			</div>




			<div class="row">
				<h2>
					<a class="title" name="3F">循环取List中的值</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp; 依然以上面的请求为例现在我们需要把服务器传送过来的数据用表格的方式来显示， <b>首先我们使用原生一点的方式来演示，然后使用我们封装后的方式来演示请注意其中的区别</b>
				</p>
				<h3 class="text-primary">原生js方式代码</h3>
				<pre class="brush: js;" id="exp" name="code">
					$.AjaxProxy({
		
							p:{kinds : '水果'}
							
						}).invoke(basePath+"/api/findFruits", function(loj) {

							var result=loj.attr("result");
							var html="";
							for(var i=0; i< result.rows.length; i++){
								html+="< tr >< td > "
									+result.rows[i].name+"< /td >< td >"
									+result.rows[i].price+"< /td >< td >"
									+"< img width='100' height='100' src='"+result.rows[i].img+"'  />< /td >< /tr >";
							}
							$("#tbody1").html(html);
						});
				
				</pre>
				<button class="btn btn-default" onclick="simpleTest2()">点击执行</button>
				<table class="table">
					<thead>
						<tr>
							<th>水果名称</th>
							<th>水果价格</th>
							<th>水果图片</th>
						</tr>
					</thead>
					<tbody id="tbody1">

					</tbody>
				</table>

				<br>

				<h3 class="text-primary">封装后的js方式代码</h3>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;封装是封装了针对result对象的取值操作，这样可以使得我们的取值更便捷，可读性增强</p>
				<pre class="brush: js;" id="exp" name="code">
					$.AjaxProxy({
		
						p:{kinds : '水果'}
						
					}).invoke(basePath+"/api/findFruits", function(loj) {
						
						var html="";
						for(var i=0; i< loj.getRowCount(); i++){
							html+="< tr>< td>"
								+loj.getString(i,"name")+"< /td>< td>"
								+loj.getString(i,"price")+"< /td>< td>"
								+loj.getImg(i,"img")+"< /td>< /tr>";
						}
						$("#tbody2").html(html); });
						</pre>
				<button class="btn btn-default" onclick="simpleTest3()">点击执行</button>
				<table class="table">
					<thead>
						<tr>
							<th>水果名称</th>
							<th>水果价格</th>
							<th>水果图片</th>
						</tr>
					</thead>
					<tbody id="tbody2">

					</tbody>
				</table>
			</div>

			<br>
			<div class="row">
				<h2>
					<a class="title" name="4F">getRowCount</a>
				</h2>
				<hr>
				<p>
					参数：无 <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>getRowCount</code>

					方法可以获取返回值中rows的行数，在遍历数组的时候需要用到
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" name="5F">getValue</a>
				</h2>
				<hr>
				<p>
					参数：key 类型:String <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>getValue</code>
					可以获取result中的一级属性，在之前的代码中我们可以看到服务器会传一个请求状态
					<code>status</code>
					过来， 如果你要知道这个状态就可以这样获取
					<code>loj.getValue("status")</code>
					<br> 获取map对象
					<code>loj.getValue("map")等。。。</code>
				</p>
			</div>

			<br>
			<div class="row">
				<h2>
					<a class="title" name="6F">getString</a>
				</h2>
				<hr>
				<p>
					参数：index 类型:Number - 当前取值的行数 <br> 参数：key 类型:String - 要取值的属性名称
					<br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>getString</code>
					可以在遍历的时候
				</p>
			</div>
			<br>
			<div class="row">
				<h2>
					<a class="title" name="7F">getImg</a>
				</h2>
				<hr>
				<p>
					参数：index 类型:Number - 当前取值的行数 <br> 参数：key 类型:String - 要取值的属性名称
					<br> 参数：w 类型:String - 宽 默认100px <br> 参数：h 类型:String - 高
					默认100px <br><br> &nbsp;&nbsp;&nbsp;&nbsp;
					<code>getImg</code>
					在遍历取值的时候会把取出的值作为一个IMG 标签做为返回值。
				</p>
			</div>


		<div class="row">
				<h2>
					<a class="title" name="8F">getSwitch</a>
				</h2>
				<hr>
				<p>
					参数：index 类型:Number - 当前取值的行数 <br> 参数：key 类型:String - 要取值的属性名称
					<br> 参数：paramsStr 类型:String - 需要被判断的键值对  <br><br> 
					&nbsp;&nbsp;&nbsp;&nbsp;
					<code>getSwitch</code>首先会取出对应角标下的值，然后匹配你传入的键值对字符串，返回对应的值。
					我们常在数据库中用1,2,3,4来表示一些特殊状态，这些状态需要在前台页面显示的时候不能直接显示1234而是要显示
					对应的值，这个时候你就可以选用<code>getSwitch</code>来帮你<br>
					示例：如果你取出的值是： <code>1</code><br>
					键值对参数字符串是： <code>{1:'有效',2:'失效'}</code><br>
					返回值是： <code>"有效"</code>
				</p>
		</div>
			
		<div class="row">
				<h2>
					<a class="title" name="9F">getDate</a>
				</h2>
				<hr>
				<p>
					参数：index 类型:Number - 当前取值的行数 <br> 参数：key 类型:String - 要取值的属性名称
					  <br><br> 
					&nbsp;&nbsp;&nbsp;&nbsp;数据库返回的日期是一个数字，如果按照格式显示我们就需要对数据进行格式化
					<code>getDate</code>就是对日期进行格式化的一个方法。如果后台传入一个date类型的值，我们就需要
					在页面显示为2018-08-12 12:22 就可以直接调用<code>getDate</code>方法
				</p>
		</div>	
		</div>
	</div>
<br>
<br>
<br>
<p class="pull-right" >
			Document By 姜友瑶 <br>
			2016-9-27
</p>
</body>
</html>