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
<body class="gray-bg">
	<nav class="huiNav">
		<i class="fa fa-home"></i> 首页 <span>&gt;</span>java工具类<span>&gt;</span>导出excel
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
				 导出是将数据库中的数据导入到excel中，我们主要实现方式是，根据搜索条件，将符合条件的数据读取出来，定义好标题列，根据标题列的顺序把取出来的数据放到新的集合中，然后调用Excel导出工具类实现数据的导出。
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
					导入过程中的查询条件，如果输入的是中文，在提交前需要用encodeURI编码，传递到服务端后用URLDecoder.decode解码
				</p>
			</div> 
			
			<div class="row">
				<h2>
					<a class="title" name="4F">Demo</a>
				</h2>
				<hr>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp; 下面我们举一个将水果信息导出到excel的例子
				</p>
				<h3 class="text-primary">1、导出数据的页面</h3>
				<h4 class="text-primary">&nbsp;&nbsp;html代码：根据搜索条件，将查询出来的数据导出</h4>
				<pre class="brush: js;" id="exp" name="code">
				  	<div class="ibox-content">
						<!-- 搜索框部分start -->
							<form class="form-inline" id="serchform">
								 <div class="form-group mr-20">
									<label>水果名称</label>
									<input name="orderNo" type="text" class="form-control" id="orderNo">
								 </div>
								<button  onclick="myGrid.serchData()" type="button" class="btn btn-info btn-sm"><i class="fa fa-search " ></i> 搜索</button>
								<button  type="reset" class="btn btn-info btn-sm"><i class="fa fa-refresh " ></i> 重置</button>
							</form>
						<!-- 搜索框部分en -->
							<div class="option-bar" >
							<button onclick="exportExcel()" type="button" class="btn btn-default btn-sm"><i class="fa fa-download" ></i> 导出</button>
							</div>
							<table id="mgrid" data-url="" >
								<thead>
									<tr>
										<th data-checkbox="true"  ></th>
										<th data-formatter="MGrid.indexfn" data-align="center"  data-width="30px" >序号</th>
										<th data-field="orderNo" >水果名称</th>
										<th data-field="source" >价格</th>
									</tr>
								</thead> 
							</table>
						</div>
				</pre>
				<br>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;js代码</h4>
				<pre class="brush: js;" id="exp" name="code">
				var  myGrid;
			    $(function(){
			    	 myGrid=MGrid.initGrid({
						 url:"${path}/api/queryFruits",
						 sortName:"name",
						 sortOrder:"desc"});
			    	
			    })
			    //导出
				function exportExcel(){
					var fruitName = $("#fruitName").val();
					window.location.href="${path}/api/exportExcel?name="+encodeURI(encodeURI(fruitName));
					}
				</pre>
				
				<h3 class="text-primary">3、服务端java代码</h3>
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;SysChanceInfo实体类</h4>
				<pre class="brush: js;" id="exp" name="code">
				  public class ShoppingOrder implements Serializable{

					private static final long serialVersionUID = 1L; 
					
					private Long  id;
							
					
					/**
					 * 订单时间
					 */
					private Date  orderTime;
					/**
					 * 订单编号
					 */
					private String  orderNo;
							
					/**
					 * 来源（PC商城/微信商城）
					 */
					private String source;
					
				</pre>
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
			    
				<h4 class="text-primary">&nbsp;&nbsp;&nbsp;&nbsp;提交导入数据的controller</h4>
				<pre class="brush: js;" id="exp" name="code">
				/**导出数据
				 * @param model
				 * @param request
				 * @param response
				 * @param fruit
				 * @return
				 */
			    @RequestMapping(value = "/exportExcel")
				public @ResponseBody ModelAndView report(ModelMap model, HttpServletRequest request, HttpServletResponse response,
						Fruits fruit) {
					try {
						if (fruit.getName() != null && !(fruit.getName().equals(""))) {
							fruit.setName(java.net.URLDecoder.decode(fruit.getName(), "UTF-8"));
						}
						
					} catch (UnsupportedEncodingException e1) {
						e1.printStackTrace();
					}
					// 查询符合条件的数据，同上查询方法
					//List< Fruits > dataList = currentService.findByVo(Fruits, null);
					List< Fruits > dataList=new ArrayList< >();
					for(Fruits f:getFruits()){
						if(f.getName().contains(fruit.getName())){
							dataList.add(f);
							}
						}
					//把数据组装成我们要的数据，外面的list表示一行数据，也就是一个对象的信息，对应到excel的一行数据。里面的list表示对象的一个属性，对应excel的单元格
					List< List< Object > > list = new ArrayList< >();
						for (Fruits obj : dataList) {
							List< Object > temp = new ArrayList< >();
							temp.add(obj.getName());
							temp.add(obj.getPrice());
							temp.add(obj.getImg());
							list.add(temp);
						}
						
						//调用我们的excel工具类，导出数据
					HSSFWorkbook workbook = ExcelUtil.generateExcel("水果列表",
							new String[] { "名称","价格","图片地址"}, list);
					try {
						ViewExcel.buildExcel(null, workbook, request, response, "水果.xls");
					} catch (Exception e) {
						e.printStackTrace();
					}
					return new ModelAndView(new ViewExcel(), model);
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
			 window.open("${path}/api/redirect/demoShow/exportDialog");
		}
		
	</script>
</html>