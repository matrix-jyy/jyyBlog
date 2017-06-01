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
<title>富文本粘贴剪切图片</title>
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
						<li><a href="#1F">创建富文本</a></li>
						<li><a href="#2F">修改插件</a></li>
						<li><a href="#3F">base64图片上传解码</a></li>
						<li><a href="#4F">注意事项</a></li>
						<li><a href="http://kindeditor.net/demo.php">kindeditor官网</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="row">
				<h2>
					<a class="title" name="1F">创建富文本</a>
				</h2>
				<hr>
				<p>
					参考文章《富文本编辑器》;<a href="${path}/api/redirect/kindeditorDemo">链接</a>
				</p>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="2F">修改插件</a>
				</h2>
				<hr>
				<p>
					找到富文本的kindeditor.js插件并打开
				</p>
				<pre class="brush: js;" id="exp" name="code">
					//找到粘贴访问事件
					K(doc.body).bind('paste', function(e){
						//添加以下代码
						
						var imgReader = function( item ){
					        var blob = item.getAsFile(),
					        reader = new FileReader();
					     	// 读取文件后将其显示在网页中
					        reader.onload = function( e ){
					            var img = new Image();
					            //base64图片
					            img.src = e.target.result;
					            //$("#imgSrc").val(img.src);直接将base64图片显示到页面
					            /*
					             *将base64图片解码为.png 图片
					             */
					            var url=basePath+"/admin/base64Image/imgSrc";
					            $.AjaxProxy({a : false,c : false,p:{imgSrc:img.src}}).invoke(url,function(loj){
					            	 //将返回结果加载到富文本编辑器中
					            	 self.insertHtml("<img src='"+loj.attr("result").info+"' >", true);	
					            })
					        };
					        // 读取文件
					        reader.readAsDataURL( blob );
					    };
						
						
					 	//添加到事件对象中的访问系统剪贴板的接口
					    var clipboardData = e.event.clipboardData,
					        i = 0,
					        items, item, types;
			
					    if( clipboardData ){
					        items = clipboardData.items;
			
					        if( !items ){
					            return;
					        }
			
					        item = items[0];
					        // 保存在剪贴板中的数据类型
					        types = clipboardData.types || [];
			
					        for( ; i < types.length; i++ ){
					            if( types[i] === 'Files' ){
					                item = items[i];
					                break;
					            }
					        }
					        // 判断是否为图片数据
					        if( item && item.kind === 'file' && item.type.match(/^image\//i) ){
					        	 // 读取该图片      
					            imgReader( item );
					        }
					    }
					}
				</pre>
				
			</div>
			
			
			<div class="row">
				<h2>
					<a class="title" name="3F">base64图片上传解码</a>
				</h2>
				<hr>
				<pre class="brush: js;" id="exp" name="code">
					// 本地文件上传配置
					//	String SAVE_PATH = "d:/webresources/uploadeFile/";
					//	String SAVE_URL = "http://127.0.0.1:1088/uploadeFile/";
					// 服务器文件上传配置
					 String SAVE_PATH = "/home/admini/static/uploadeFile/";
					 String SAVE_URL = "http://static.zkingsoft.com/uploadeFile/";
				
				
					/**base64转换
					 * @param imgSrc base64图片
					 * @return
					 */
					@RequestMapping(value = "/imgSrc")
					public @ResponseBody AjaxResult showForm(String imgSrc) {
						//图片解码
						String url=ImageUtil.base64Tomage(imgSrc, Dictionary.SAVE_PATH);
						//将图片的上传路径全部都改为访问路径
						url=url.replace(Dictionary.SAVE_PATH,Dictionary.SAVE_URL);
						//将访问路径结果返回给富文本编辑器
						AjaxResult result=new AjaxResult(AjaxResult.STATUS_OK, null, url);
						return result;
					}
					
					/**base64转换成Image
					 * @param imgSrc  base64图片
					 * @param url     上传路径
					 * @return
					 */
					public static String base64Tomage(String imgSrc,String saveUrl){
						if(imgSrc != null && imgSrc != ""){
							
							SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
							String ymd = sdf.format(new Date());
							saveUrl += "image/"+ymd + "/";
							File dirFile = new File(saveUrl);
							if (!dirFile.exists()) {
								dirFile.mkdirs();
							}
							BASE64Decoder decoder = new BASE64Decoder();
							  try {
								String imgName=new Date().getTime()+"_"+new Random().nextInt(1000)+".png";
								saveUrl=saveUrl+imgName;
								  // 解密
								byte[] b = decoder.decodeBuffer(imgSrc.replace("data:image/png;base64,",""));
								  // 处理数据
								  for (int i = 0; i < b.length; ++i) {
									  if (b[i] < 0) {
										  b[i] += 256;
									  }
								  }
								  OutputStream out = new FileOutputStream(saveUrl);
								  out.write(b);
								  out.flush();
								  out.close();
								  return saveUrl;
							  } catch (Exception e) {
								  return null;
							  }
						}
						return null;
					}
				</pre>
			</div>
			<div class="row">
				<h2>
					<a class="title" name="4F">注意事项</a>
				</h2>
				<hr>
				<p>
					方法 showForm 在 Base64ToImageContorller 类中 ;<br>
					方法 base64Tomage 在 ImageUtil 类中;
				</p>
			</div>
		</div>
		 <p class="pull-right" style="margin-right: 20px">
			Document By 陈才     <br>
			2016-1-11
			</p>
	</div>
	
</body>
	
	<script type="text/javascript">
		//创建富文本编辑器
		MUI.createEdit("description", '100%', '500px', 'editor');
	</script>
</html>