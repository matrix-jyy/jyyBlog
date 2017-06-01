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
<title>importFile.jsp</title>
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
<body class="gray-bg">
	<nav class="huiNav">
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>java工具类<span>&gt;</span>导入
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
						<li><a href="#2F">引入文件</a></li>
						<li><a href="#3F">注意事项</a></li>
						<li><a href="#4F">Demo</a></li>
						
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
				 导入是将excel的数据导入到数据库中，Excel中第一个sheet页的数据导入到对应的表中。由于excel的格式与数据库表结构有一定的关系，因此导入前我们提供好模板，先下载模板再进行导入。
				</p>
			</div>
			
			<div class="row">
				<h2>
					<a class="title" name="2F">引用文件上传的js文件</a>
				</h2>
				<hr>
				<pre class="brush: js;" id="exp" name="code">
				<script type="text/javascript" src="${path }/resource/plugin/ajaxfileupload.js"></script>
				</pre>
			</div>
			
			 <div class="row">
				<h2>
					<a class="title" name="3F">注意事项</a>
				</h2>
				<hr>
				<p>
					使用了文件上传的插进，因此在进行导入的页面本例中的importDailog.jsp中要注意引入js文件：ajaxfileupload.js
				</p>
			</div> 
			
			<div class="row">
				<h2>
					<a class="title" name="4F">Demo</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp; 下面我们举一个将水果信息导入到数据库中的例子
				</p>
				<h3 class="text-primary">1、弹出导入数据页面</h3>
				<h4 class="text-primary">&nbsp;&nbsp;html代码：</h4>
				<pre class="brush: js;" id="exp" name="code">
				  			<button onclick="openImport()" type="button" class="btn btn-default btn-sm"><i class="fa fa-upload" ></i> 批量导入数据</button>
				</pre>
				<br>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;js代码</h4>
				<pre class="brush: js;" id="exp" name="code">
				//弹出导入数据的页面
				function  openImport(){
					//弹出修改框
				    layer.open({
						type : 2,
						title : "批量导入",
						area : [ MUI.SIZE_L, '400px' ],
						maxmin : true,
						content : [ '${path}/api/redirect/demoShow/importDialog']
					});
				}
				</pre>
				<h3 class="text-primary">2、导入数据页面：importDailog.jsp</h3>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;html代码</h4>
				<pre class="brush: js;" id="exp" name="code">
				   <div class="ibox-content">
					<form class="form-horizontal" id="dataform">
					
					   <div class="form-group">
					        <label class="col-sm-2 control-label"></label>
					        <div class="col-sm-2">
					               <a href='${path}/api/download' class="btn btn-primary radius"><i class="fa fa-cloud-download"></i>下载模板 </a>
					       </div>
					   </div>
						<div class="form-group">
						
							<label class="col-sm-2 control-label">上传文件</label>
							<div class="col-sm-9">
								<input onclick="importChances()"
									class="input-text upload-url radius form-control" type="text" id="showFileName"
									readonly style="width: 30%;display: inline;"> 
									<a onclick="importChances()" class="btn btn-primary radius"> 
									<i class="fa fa-cloud-upload"></i> 浏览文件 </a> 
								<input type="file" name="file" type="hidden" id="chanceUploadId" style="display:none">
				
							</div>
						</div>
				
						<div class="form-group ">
							<div class="col-sm-12 text-center">
								<button type="button"onclick="submitData()" class="btn btn-success radius">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;
								<button onclick="MTools.closeForm()" class="btn btn-danger radius">取消</button>
				
							</div>
						</div>
					</form>
						<table id="mgrid" >
							<thead>
								<tr>
									<th data-checkbox="true"  ></th>
									<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
									<th data-field="name" >名称</th>
									<th data-field="price" data-sortable="true">价格</th>
								</tr>
							</thead>
						</table>
				</div>
				</pre>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;js代码</h4>
				<pre class="brush: js;" id="exp" name="code">
				
				
				//绑定文件的点击事件
				function importChances(){
					var file=$("#chanceUploadId").click();
				}
				//选中文件，文件名字显示在文本框中
				$("#chanceUploadId").change(function(){
					$("#showFileName").val($(this).val());
				})
				//提交文件，调用文件上传插件
				function submitData(){
					$.ajaxFileUpload({
						url : "${path}/api/importDemo",
						type : "POST",
						secureuri : false,// 一般设置为false
						fileElementId : "chanceUploadId",// 文件上传空间的id属性 <input type="file" id="uploadId" />
						dataType : "json",
						success : function(data) {
							console.log(data.rows);
							 var icon=0;
							 if(data.status=='ok'){
								 layer.msg(data.info,{icon:1},function(layIndex){
									var  myGrid=MGrid.initGrid({
										data:data.rows
									 });
								 });
							 }
							 else{
								 layer.msg(data.info,{icon:2});
			                  }
							
						}
					});
				}
				</pre>
				
				
				<h3 class="text-primary">3、服务端java代码</h3>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;SysChanceInfo实体类</h4>
				<pre class="brush: js;" id="exp" name="code">
				class Fruits{
				String name;
				String price;
				String img;
				public String getImg() {
					return img;
				}
			
				public void setImg(String img) {
					this.img = img;
				}
			
				public Fruits() {
					
				}
				//此处  省略get和set，使用的过程中自行生成
	
	            }
				</pre>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;下载模板的controller</h4>
				<pre class="brush: js;" id="exp" name="code">
				/**
				 * 下载模版
				 * @param response
				 * @throws Exception
				 */
				@RequestMapping(value = "/download")
				public void assemblyInputModle_zh( HttpServletResponse response)
						throws Exception {
					String path=WebUtil.getResourceRealPath( "WEB-INF/views/api/demoShow/import_demo.xlsx");
					FileDownload.fileDownload(response, path, "导入模板.xlsx");
	                 }
				</pre>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;提交导入数据的controller</h4>
				<pre class="brush: js;" id="exp" name="code">
					/**导入数据
	 * @param response
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/importDemo")
	public @ResponseBody AjaxResult importChance(HttpServletResponse response,
		      HttpServletRequest request,
		      @RequestParam(value = "file", required = false) MultipartFile file){
	     //记录成功的导入多少条数据
		int count=0;
		//构造对象的集合
		List< Fruits > fruitsList=new ArrayList< Fruits >();
		response.setContentType("text/html;charset=UTF-8");
	    String fileName=file.getOriginalFilename();
		String extension = fileName.lastIndexOf(".") == -1 ? "" : fileName
	            .substring(fileName.lastIndexOf(".") + 1);
	        if (!extension.equals("xls") && !extension.equals("xlsx")) {
	    		return new AjaxResult(AjaxResult.STATUS_OK, null, "请选择excel文件！！！");

			        }
		    try {
		    	 String dirPath = request.getSession().getServletContext().getRealPath("/")
							+ "fileupload";
		    	 File fileDir = new File(dirPath);
		 		if (!fileDir.exists()) {
		 			if (fileDir.mkdirs()) {
		 			} 
		 		}
		 		File saveFile = new File(dirPath+"/"+fileName);
		 		file.transferTo(saveFile);
				List< List< Object >  list=ExcelImport.readExcel(saveFile, fileName, null, 4);
				
				
				//由于读取excel的工具类会从标题行开始读取，因此，list=null或者size=1表示只有标题行说明没有数据可以导入
				if(list==null || list.size()<=1){
					throw new GlobleException("没有数据可导入");
				}
				for (int i=1;i< list.size();i++) {
					Fruits fruits=new Fruits();
					List< Object > objList=list.get(i);
					fruits.setName((String) objList.get(0));
					fruits.setPrice((String) objList.get(1));
					fruitsList.add(fruits);
				  }
				
				//实际应用中你可以调用service,作批量导入。这里做demo直接返回数据
				//count=currentService.importChances(chanceList);
				count=fruitsList.size();
			} catch (IOException e) {
				LogUtil.error(this.getClass(),"导入异常");
			}
		    if(count>0){
		    	return new AjaxResult(AjaxResult.STATUS_OK, null, "成功导入"+count+"条数据!", fruitsList, fruitsList.size());
		    }
		    else{
		 		return new AjaxResult(AjaxResult.STATUS_ERR, null, "导入失败!");
		    }
			}
			
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
			 window.open("${path}/api/redirect/demoShow/importDialog");
		}
		
	</script>
</html>