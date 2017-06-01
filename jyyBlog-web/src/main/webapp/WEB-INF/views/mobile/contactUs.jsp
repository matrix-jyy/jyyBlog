<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="matrix"%>
<%@ taglib uri="http://matrixcsm.zkingsoft.com" prefix="cms"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp">

<title data-index="0" id="selextTitle">${网页标题 }</title>
<meta name="keywords" content="${网页关键词}">
<meta name="description" content="${网页描述 }" />
<link rel="shortcut icon" href="${浏览器logo }">
<link rel="stylesheet"
	href="${path }/resource/plugin/font-awesome/css/font-awesome.css"
	media="screen" title="no title">
<link rel="stylesheet"
	href="${path }/resource/plugin/AmazeUI-2.7.2/css/amazeui.min.css">
<link rel="stylesheet" href="${path }/resource/mobile/css/base.css"
	media="screen" title="no title">
<link rel="stylesheet" href="${path }/resource/mobile/css/public.css">
 <style>
        .company-info {padding: 0.4rem 0 0;}
        .select,.select dd ul{width: 100%;}
        .select dd{margin-left: 0.3rem;width: 90.5%;}
        .select dd ul{padding: 0 0.5rem;}
        .select dd ul li{width: 50%;float: left;}
        .map{width: 100%;padding: 0 0.3rem;}
        .map img{width: 100%}
        .info{width: 100%;color: #c59350;padding: 0.4rem 0.3rem 0;}
        .info .tit{font-size: 0.24rem;letter-spacing: 2px;font-weight: bold;color:#c59350 }
        .info .en-tit{font-size: 0.18rem;letter-spacing: 2px;margin: 0.1rem 0 0;}
        .info .line{height: 0.01rem ;width:1.16rem;background: #c59350;display:block;margin: 0.25rem 0 }
        .info li{height: 0.65rem;font-size: 0.2rem;}
        .info li img{margin-right: 0.18rem;width:0.25rem;height:0.25rem;}
        .select dd ul li a{font-size:0.18rem;}
    </style>
</head>
<body class="">
	<div class="body_container" id="app">
		<jsp:include page="_top.jsp"></jsp:include>
		<cms:ad var="ad" code="m-lxwmBanner" multi="false"></cms:ad>
		<div class="banner">
			<img class="am-img-responsive" src="${ad.adImg }" />
		</div>
		 <div class="company-info">
		    <cms:ad var="items" code="gsdz"></cms:ad>
        <dl class="select">
        <c:forEach var="item" items="${items }"  begin="0" end="0">
            <dt>${item.adTitle }</dt>
         </c:forEach>
            <dd>
                <ul class="change-item">
					<c:forEach var="item" items="${items }" varStatus="count">
					 <li>	<a onclick="showContent('content${count.index }')" >${item.adTitle }</a></li>
					</c:forEach>
                </ul>
            </dd>
        </dl>
        <div class="clr"></div>
      
      
        <c:forEach var="item" items="${items }" varStatus="count" >
        <div id="content${count.index }" class="contentsss"
				<c:if test="${count.index eq 0 }"> 
						style="display:block"</c:if>
				<c:if test="${count.index ne 0 }"> 
						style="display:none"</c:if>>
        <div class="map">
            <img src="${item.adImg}" alt="">
        </div>
        <div class="info">
            <h3 class="tit">公司地址</h3>
            <h3 class="en-tit">Our Offices</h3>
            <span class="line"></span>
            <ul>
                <li><img src="${path }/resource/images/address.png" alt=""><span>北京市大兴区庆祥南路29号院2号楼814室</span></li>
                <li>
                    <img src="${path }/resource/images/tell.png" alt="">
                    <span>分公司座机 ：  ${item.adInfo2}</span>
                    <span style="display: block;margin-left: 43px;">业务热线： 	${item.adInfo3}</span>
                </li>
                <li><img src="${path }/resource/images/qq.png" alt=""><span>业务QQ ： 309269235</span></li>
            </ul>
        </div></div>
        </c:forEach>
    </div>

	</div>

	<jsp:include page="_foot.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="${path }/resource/js/plugin/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${path }/resource/js/systools/AjaxProxy.js"></script>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="${path }/resource/plugin/AmazeUI-2.7.2/js/amazeui.min.js"></script>
<script src="${path }/resource/mobile/js/init.js"></script>
<script src="${path }/resource/mobile/js/index.js"></script>
<script>
function showContent(id) {
	$(".contentsss").hide();
	$("#" + id).show();
}
</script>

</body>
</html>
