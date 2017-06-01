<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE HTML>
<html> 
<head>
<meta charset="utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="../images/favicon.ico">
<!-- 本框架基本脚本和样式 -->
<script type="text/javascript"
	src="${path }/resource/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/MBase.js"></script>


<title></title>
</head>
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
	<script type="text/javascript">
	//接受子页面数据的变量
	var totalGoods=[];
	//打开消耗产品界面
	function openPruductList(){
		layer.open({
			type : 2,
			title : "标题",
			area : [ MUI.SIZE_L, '400px' ],
			content : [ '${path }/api/redirect/demoShow/child']
		}); 
	}
	
	
	//添加产品回调
	function callback(arr){
		console.log(arr);
		writeDate(arr);
	}
	
    
	 //填写数据到html
    function writeDate(arr){
		 totalGoods=arr;
		 console.log(totalGoods);
    	 var html="";
		for(var i=0 ; i<totalGoods.length;i++){
			
			html+='<tr>'
			+'<td>'+(i+1)+'</td>'
			+'<td>'+totalGoods[i].name+'</td>'
			+'<td>'+totalGoods[i].price+'<input type="hidden" name="sysProjGoodss['+i+'].skuId" value="'+totalGoods[i].id+'"</td>'
			+'<td>'+totalGoods[i].img+'</td>'
			+'<td class="center"><a style="text-decoration: none" class="fa fa-trash" onClick="delSelectItem(this,'+totalGoods[i].id+')" href="javascript:;" title="删除"></a></td>'
			+'</tr>'
		}
		$("#cpId").html(html);
    }
	
    //删除选中的元素
    function delSelectItem(node,id){
   	 for(var i=0;i<totalGoods.length;i++){
       	 if(totalGoods[i].id==id){
       	     totalGoods.splice(i, 1);
       	     break;

       	 }
        }
    console.log(totalGoods);
  	 //移除tr
  	 $(node).closest('tr').remove();
  	 $("tbody").find("tr").each(function(i){
  		 $(this).find("td").eq(0).html(i+1);
  	 });
    }

	</script>
</body>
</html>
