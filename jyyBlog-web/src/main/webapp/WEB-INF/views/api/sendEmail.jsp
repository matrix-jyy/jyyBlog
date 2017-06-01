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
<title>sendEmail.jsp</title>
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
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>常用功能<span>&gt;</span>发送邮件
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
						<li><a href="#1F">邮件信息实体类</a></li>
						<li><a href="#2F">简单邮件发送器(不带附件)</a></li>
						<li><a href="#4F">Demo</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="row">
				<h2>
					<a class="title" name="1F">邮件信息实体类</a>
				</h2>
				<hr>
				<code>com.zkingsoft.actions.tools.email.MailSenderInfo</code>
				<pre class="brush: js;" id="exp" name="code">
				public class MailSenderInfo {    
				/**
				 * 常用发送邮件服务器名称及端口
				 * 163 smtp.163.com 25
				   126 smtp.126.com 25
			       qq smtp.qq.com 25 
				 */
			    // 发送邮件的服务器的IP和端口    
			    private String mailServerHost;    
			    private String mailServerPort = "25";    
			    // 邮件发送者的地址    
			    private String fromAddress;    
			    // 邮件接收者的地址    
			    private String toAddress;    
			    // 登陆邮件发送服务器的用户名和密码    
			    private String userName;    
			    private String password;    
			    // 是否需要身份验证    
			    private boolean validate = false;    
			    // 邮件主题    
			    private String subject;    
			    // 邮件的文本内容    
			    private String content;    
			    // 邮件附件的文件名    
			    private String[] attachFileNames;      
			    /**   
			      * 获得邮件会话属性   
			      */    
			    public Properties getProperties(){    
			      Properties p = new Properties();    
			      p.put("mail.smtp.host", this.mailServerHost);    
			      p.put("mail.smtp.port", this.mailServerPort);    
			      p.put("mail.smtp.auth", validate ? "true" : "false");    
			      return p;    
			    }
			    } 
			    </pre>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">简单邮件发送器(不带附件)</a>
				</h2>
				<hr>
				<code>com.zkingsoft.actions.tools.email.SimpleMailSender</code>
				
				<pre class="brush: js;" id="exp" name="code">
				@RequestMapping(value = "/sendEmail")
				public @ResponseBody AjaxResult sendEmail(MailSenderInfo mailInfo) throws Exception  {
						mailInfo.setMailServerPort("25");
						mailInfo.setValidate(true);
						// 密码正确。10 7激活
						mailInfo.setFromAddress(mailInfo.getUserName());
						mailInfo.setSubject("激活邮箱");
						mailInfo.setContent("我们已给您的邮箱发送了一封激活信，请收到后按提示操作，需要在24小时内完成激活。<br>");
						SimpleMailSender sms = new SimpleMailSender();
						//mailServerHost="smtp.163.com";//根据具体的发送方邮箱账号填写对应的邮件服务器IP
						//执行发送邮件
						String info=sms.sendHtmlMail(mailInfo);
						if(info.equals("success")){
							return new AjaxResult(AjaxResult.STATUS_OK, null, "发送成功!");
						}else{
							return new AjaxResult(AjaxResult.STATUS_ERR, null, info);
						}
				}
				</pre>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="3F">Demo</a>
				</h2>
				<hr>
				<p>
					本Demo采用的是ajax提交发送邮件,并要求填写发送方账号密码及接收方账号,发送方目前仅支持
					<code>qq</code>,<code>163</code>,<code>126</code>邮箱。(原因看邮件实体类)
				</p>
				<form class="form-horizontal" id="dataform" onsubmit="javascripr:return false;">
				<div  class="col-sm-12">
				<label class="col-sm-3 control-label">发送方邮箱账号<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<input type="text"  class="form-control" name="userName"
							value="" datatype="e" >
					<div class="Validform_checktip"></div>
				</div>
				</div>
				<br>
				
				<div  class="col-sm-12">
				<label class="col-sm-3 control-label">发送方邮箱密码<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<input type="password"  class="form-control" name="password"
							value="" datatype="*1-20" nullmsg="密码不能为空">
					<div class="Validform_checktip"></div>
				</div>
				</div>
				<br>
				
				<div  class="col-sm-12">
				<label class="col-sm-3 control-label">接收方邮箱账号<span class="text-danger">*</span></label>
				<div class="col-sm-4">
					<input type="text"  class="form-control" name="toAddress"
							value="" datatype="e" >
					<div class="Validform_checktip"></div>
				</div>
				</div>	
				<div  class="col-sm-12">
				登陆的邮箱需开启smtp服务。
				</div>	
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
		invokeUrl:"${path}/email/sendEmail",
		afterSubmit:function(loj){
			console.log(loj);
		},
	});
	</script>
</html>