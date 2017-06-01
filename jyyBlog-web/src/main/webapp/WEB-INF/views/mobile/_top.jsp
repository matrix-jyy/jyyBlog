<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://matrixcsm.zkingsoft.com" prefix="cms"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<cms:nav var="navs" type="mobile"></cms:nav>
 <div class="top"></div>
    <header class="header">
        <div class="logo"><img src="${logo}" alt=""></div>
        <div class="icons">
            <span class="search-icon">
                <i class="fa fa-search"></i>
            </span>
            <span class="nav-icon">
                <i class="fa fa-navicon"></i>
            </span>
        </div>
    </header>
    <div class="box-none">
        <ul class="nav">
            <c:forEach var="item" items="${navs}">
              <li><a href="${path }/mobile/redirect/${item.navUrl}">${item.navName}</a></li>
              </c:forEach>
        </ul>
        <div class="search">
            <input type="text">
            <button>搜索</button>
        </div>
    </div>
    
    