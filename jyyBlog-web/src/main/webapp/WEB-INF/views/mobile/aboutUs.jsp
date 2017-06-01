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
        .company-info {padding: 0.4rem 0.3rem 0.4rem;overflow: hidden}
        .company-info .company-info-article{width: 100%;}
        .company-info h3{color: #c18a3c;font-weight: bold;font-size: 0.3rem;letter-spacing: 3px;}
        .company-info h4{color:#c18a3c;font-size: 0.24rem;margin-top: 0.12rem;font-weight: bold;
            letter-spacing: 3px;}
        .company-info .company-info-article .line{width: 100%;height:0.03rem ;background: #dab75b;
            margin: 0.3rem 0;}
        .company-info .company-info-article div{font-size: 0.2rem;}
        .company-info .company-info-img{width: 100%;}
        .company-info .company-info-img img{max-width: 100%;margin:0.3rem auto 0}
        .team{padding:0.4rem 0 0.9rem;position: relative;}
        .team ul{margin-top: 0.4rem;overflow:hidden;padding: 0 0.3rem;position: relative;}
        .team ul li{margin-bottom:0.3rem;position:relative;border-radius:2px;
            float: left;background:rgba(0,0,0,0)!important;overflow: hidden;}
        .team ul .w1{background:#FFFFFF;height:1.94rem;width: 2.0rem;margin-right: 0.1rem;float: left;position: relative}
        .team ul .w2{background:#FFFFFF;height:3.96rem;width: 3.6rem;margin-right: 0;float: right;position: relative}
        .team ul .w1 img{width: 100%;position: absolute;top: 0px;left: 0px;}
        .team ul li .person{width:90%;position: absolute;top:0.2rem;left: 0.2rem;color:#c6944e; }
        .team ul li .person .name{font-size: 0.24rem;float: left;font-weight: bold;margin-right: 0.12rem;}
        .team ul li .person .job{font-size: 0.16rem;margin-top:0.02rem;}
        .team ul li .person .info{font-size: 0.18rem; }
        .team ul .w2 .info{max-width: 3rem;margin-top: 0.2rem}
        .team ul .w2 .details{margin-top: 0.2rem;font-size: 0.2rem;color: #333333;}
    </style>
</head>
<body class="">
	<div class="body_container" id="app">
		<jsp:include page="_top.jsp"></jsp:include>
		<cms:ad var="ad" code="m-gywmBanner" multi="false"></cms:ad>
		<div class="banner">
			<img class="am-img-responsive" src="${ad.adImg }" />
		</div>
		<div class="company-info">
		<cms:ad var="js" code="gywmjs" multi="false"></cms:ad>
        <div class="company-info-article">
            <h3>${js.adTitle }</h3>
              <h4>${js.adInfo1 }</h4>
                <div class="line"></div>
                <div>${js.adInfo2 } </div>
            </div>
        <div class="company-info-img">
              <img src="${js.adImg }" alt="">
        </div>
    </div>
    <div class="team gray-bg">
        <h3 class="tit">我们的团队</h3>
        <h3 class="en-tit"><span class="line"></span>Team<span class="line2"></span></h3>
        <ul>
           <cms:ad var="items" code="wmdtdgywm"></cms:ad>
				<c:forEach var="item" items="${items }">
				<li  >
                    <div class="w1">
                        <img src="${item.adImg }" alt="">
                    </div>
                    <div class="w2">
                        <div class="person">
                            <div class="name">${item.adTitle }</div>
                            <div class="job">${item.adInfo1 }</div>
                            <p class="info">${item.adInfo2 }</p>
                            <p class="details">${item.adInfo3 }</p>
                        </div>
                    </div>
                </li>
				</c:forEach>
            <li>
        </ul>
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
	var app = new Vue({
		el : "#app",
		data : {
			offset : 0,
			limit : 4,
			cases:[],
		},
		methods : {
			toArticle : function(id) {
				window.open("${path}/mobile/redirect/serviceDetails?id=" + id);
			},
			loadService : function(id) {

				$.AjaxProxy({
					c : false,
					p : {
						"offset" : 0,
						"limit" : 200,
						"code" : "mfwal"
					}
				}).invoke("${path}/findNews", function(loj) {
					app.cases = loj.getValue("rows");
				});
			},
		}

	});
	app.loadService();
</script>

</body>
</html>
