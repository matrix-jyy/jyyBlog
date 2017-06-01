<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="matrix"%>
<%@ taglib uri="http://matrixcsm.zkingsoft.com" prefix="cms"%>
<cms:ad var="lxdh" code="lxdh" multi="false"></cms:ad>
<cms:ad var="lxdz" code="lxdz" multi="false"></cms:ad>
<cms:ad var="qq" code="qq" multi="false"></cms:ad>
<div class="footer">
	<br>
	<div class="container footer-txt text-center">
		<p>姜友瑶-Matrix4J</p>
		<p>宁静致远</p>
		<p>${版权信息 }</p>
	</div>
</div>