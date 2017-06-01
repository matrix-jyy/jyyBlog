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
<title>quartzTime</title>
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>常用功能<span>&gt;</span>定时器
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
						<li><a href="#2F">代码</a></li>
						<li><a href="#3F">spring-mvc-context.xml配置</a></li>
						<li><a href="#4F">定时器时间配置</a></li>
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
				本框架使用的定时器是spring自带的Quartz,并已实现,需在<code>spring-mvc-context.xml</code>开启定时器
			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">代码</a>
				</h2>
				<hr>
				<code>com.zkingsoft.task.AnnotationQuartz</code>
				<pre class="brush: js;" id="exp" name="code">
				@Component
				public class AnnotationQuartz {
					@Scheduled(cron="0 0/1 *  * * ? ") 
					// 需要注意@Scheduled这个注解，它可配置多个属性：cron\fixedDelay\fixedRate
					public void excute() {
						LogUtil.inof(AnnotationQuartz.class, "定时器启动了");
					}
				}
				</pre>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="3F">spring-mvc-context.xml配置</a>
				</h2>
				<hr>
				
				<pre class="brush: js;" id="exp" name="code">
				<!-- 文件头部引入task标签 -->
				<beans xmlns:task="http://www.springframework.org/schema/task" 
				xsi:schemaLocation="http://www.springframework.org/schema/task 
				http://www.springframework.org/schema/task/spring-task-3.2.xsd">
				<!-- 启动task任务扫描注解,定时器 -->
				<task:annotation-driven/>  
				</pre>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="4F">定时器时间配置</a>
				</h2>
				<hr>
				<div class="col-sm-12">
				<code>com.zkingsoft.task.AnnotationQuartz</code>注解配置@Scheduled(cron="0 0/1 *  * * ? ") 
				<pre class="brush: js;" id="exp" name="code">
					字段 允许值 允许的特殊字符   
秒 0-59 , - * /   
分 0-59 , - * /   
小时 0-23 , - * /   
日期 1-31 , - * ? / L W C   
月份 1-12 或者 JAN-DEC , - * /   
星期 1-7 或者 SUN-SAT , - * ? / L C #   
年（可选） 留空, 1970-2099 , - * /   
表达式意义   
"0 0 12 * * ?" 每天中午12点触发   
"0 15 10 ? * *" 每天上午10:15触发   
"0 15 10 * * ?" 每天上午10:15触发   
"0 15 10 * * ? *" 每天上午10:15触发   
"0 15 10 * * ? 2005" 2005年的每天上午10:15触发   
"0 * 14 * * ?" 在每天下午2点到下午2:59期间的每1分钟触发   
"0 0/5 14 * * ?" 在每天下午2点到下午2:55期间的每5分钟触发   
"0 0/5 14,18 * * ?" 在每天下午2点到2:55期间和下午6点到6:55期间的每5分钟触发   
"0 0-5 14 * * ?" 在每天下午2点到下午2:05期间的每1分钟触发   
"0 10,44 14 ? 3 WED" 每年三月的星期三的下午2:10和2:44触发   
"0 15 10 ? * MON-FRI" 周一至周五的上午10:15触发   
"0 15 10 15 * ?" 每月15日上午10:15触发   
"0 15 10 L * ?" 每月最后一日的上午10:15触发   
"0 15 10 ? * 6L" 每月的最后一个星期五上午10:15触发   
"0 15 10 ? * 6L 2002-2005" 2002年至2005年的每月的最后一个星期五上午10:15触发   
"0 15 10 ? * 6#3" 每月的第三个星期五上午10:15触发   
每天早上6点   
0 6 * * *   
每两个小时   
0 */2 * * *   
晚上11点到早上8点之间每两个小时，早上八点   
0 23-7/2，8 * * *   
每个月的4号和每个礼拜的礼拜一到礼拜三的早上11点   
0 11 4 * 1-3   
1月1日早上4点   
0 4 1 1 *   
有些子表达式能包含一些范围或列表  
例如：子表达式（天（星期））可以为 “MON-FRI”，“MON，WED，FRI”，“MON-WED,SAT”  
“*”：字符代表所有可能的值  
因此，“*”在子表达式（月）里表示每个月的含义，“*”在子表达式（天（星期））表示星期的每一天  
“/”：字符用来指定数值的增量  
例如：在子表达式（分钟）里的“0/15”表示从第0分钟开始，每15分钟 ; 
在子表达式（分钟）里的“3/20”表示从第3分钟开始，每20分钟（它和“3，23，43”）的含义一样  
“？”：字符仅被用于天（月）和天（星期）两个子表达式，表示不指定值  
当2个子表达式其中之一被指定了值以后，为了避免冲突，需要将另一个子表达式的值设为“？”  
“L”： 字符仅被用于天（月）和天（星期）两个子表达式，它是单词“last”的缩写  
但是它在两个子表达式里的含义是不同的。  
在天（月）子表达式中，“L”表示一个月的最后一天 , 
在天（星期）自表达式中，“L”表示一个星期的最后一天，也就是SAT  
如果在“L”前有具体的内容，它就具有其他的含义了  
例如：“6L”表示这个月的倒数第６天，“ＦＲＩＬ”表示这个月的最后一个星期五  
注意：在使用“L”参数时，不要指定列表或范围，因为这会导致问题 
					</pre>
				</div>
			</div>
		</div>
		 <p class="pull-right" >
			Document By 罗凯 <br>
			2016-11-01
			</p>
	</div>
	
</body>
	
	<script type="text/javascript">
		//创建富文本编辑器
		MUI.createEdit("description", '100%', '500px', 'editor');
	</script>
</html>