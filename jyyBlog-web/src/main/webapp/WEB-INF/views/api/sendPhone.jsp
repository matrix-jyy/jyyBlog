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
<title>sendPhone.jsp</title>
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>常用功能<span>&gt;</span>短信验证
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
						<li><a href="#3F">Demo</a></li>
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
				本框架集成的<a href="http://www.ihuyi.com/">互亿无线</a>短信服务平台,官网<code>http://www.ihuyi.com/</code>.
			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">代码</a>
				</h2>
				<hr>
				<code>com.zkingsoft.actions.tools.sendPhone.sendsms</code>
				<pre class="brush: js;" id="exp" name="code">
				public class sendsms {

	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

	/**
	 * 发送并返回短信验证码
	 * 
	 * @param
	 * @return Result
	 * @throws @date
	 *             2016-03-05 17:35
	 * @author Matrix-J
	 * @param tel 
	 */
	public static String sendSms(String tel) {
		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(Url);
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");
		int mobile_code = (int) ((Math.random() * 9 + 1) * 100000);
 		String content = new String("欢迎参与最美系部评选活动您的校验码是：【" + mobile_code + "】。请不要把效验码泄露给其他人。如非本人操作，可不用理会！");
		NameValuePair[] data = { //
				new NameValuePair("account", "cf_rwkj"), new NameValuePair("password", "123456"),
				new NameValuePair("mobile", tel), new NameValuePair("content", content), };
		method.setRequestBody(data);

		try {
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();
			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();
			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);

			if ("2".equals(code)) {
				System.out.println("success message");
			}
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return mobile_code + "";
	}

}
				</pre>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="3F">Demo</a>
				</h2>
				<hr>
				<form class="form-horizontal" id="dataform" onsubmit="javascripr:return false;">
				<div  class="col-sm-12">
				<label class="col-sm-3 control-label">手机号<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<input type="text"  class="form-control" name="phone"
							value="" datatype="m" >
					<div class="Validform_checktip"></div>
				</div>
				</div>
				<br>
				<div  class="col-sm-12">
				<div class="col-sm-12 ">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:;" onclick="myForm.submit()"
						class="btn btn-success radius">发送</a>&nbsp;&nbsp;&nbsp;&nbsp;
				 </div>
				</div>			
				</form>
			</div>
		</div>
		 <p class="pull-right" >
			Document By 罗凯 <br>
			2016-11-01
			</p>
	</div>
	
</body>
	
	<script type="text/javascript">
	//表单提交
	var myForm=MForm.initForm({
		invokeUrl:"${path}/phone/sendMsg",
		afterSubmit:function(loj){
			console.log(loj);
		},
	});
	</script>
</html>