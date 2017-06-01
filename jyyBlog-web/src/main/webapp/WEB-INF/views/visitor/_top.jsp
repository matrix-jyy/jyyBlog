<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div class="navbar navbar-default navbar-top">
	<div class="container">
		<div class="navbar-header">
		<a href="${path}/">	<img alt="" src="${logo }"></a>
			<button type="button" class="navbar-toggle collapsed btn-collapse"
			data-toggle="collapse" data-target="#navbar-top"
			aria-expanded="false">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		</div>
		<div class="collapse navbar-collapse" id="navbar-top">
			<ul class="nav-item" id="nav">
				<li><a href="${path}/">首页</a></li>
				 	<li><a target="blank"  href="${path }/redirect/matrix4j/index" >Matrix4J</a></li>
					<li><a target="blank" href="http://git.oschina.net/jyyforjava/codegen3.0">代码生成器</a></li> 
					<li class="search" > 
				
						<div class="form-group">
						<form action="${path}/search" method="post" class="form-inline" >
							<input type="search" class="form-control" name="searchWord" id="searchWord" value="${searchWord }"
								placeholder="输入关键词">
							<button class="btn  btn-default">搜索</button></form>
						</div>
					
				</li>
			</ul>
			
		</div>
	</div>
</div>
