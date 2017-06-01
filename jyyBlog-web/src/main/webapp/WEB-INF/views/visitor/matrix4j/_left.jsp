<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div class="col-md-2 ">
	<ul class="menu-box">
		<li>
			<a id="index" class="title" href="${path }/redirect/matrix4j/index">介绍</a>
			<ul   >
				<li><a href="#structure">结构</a></li>
				<li><a href="#down">下载</a></li>
				<li><a href="#new">更新</a></li>
			</ul>
		</li>
		<li>
			<a id="seting" class="title" href="${path }/redirect/matrix4j/seting">部署</a>
			<ul   >
				<li><a href="#base">基础环境</a></li>
				<li><a href="#step">步骤</a></li>
				<li><a href="#commonquestion">常见问题</a></li>
			</ul>
		</li>
	</ul>
</div>

