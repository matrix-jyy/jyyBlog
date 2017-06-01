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
        .details{margin-top: 0.4rem;padding: 0px 0.3rem}
        .details h3{margin-top:-0.05rem;font-size: 0.3rem;font-weight: normal;float: left;}
        .details .change-page{padding:0 0.2rem;font-size: 0.14rem;float:right;border: 1px solid #8b8b8b;color: #8b8b8b;height:0.4rem;width: 1.62rem;
            line-height: 0.4rem;text-align: center;border-radius: 20px;display: block}
        .change-page a{color: #8b8b8b;font-size: 0.14rem;line-height: 0.4rem;height:0.4rem;display: block;}
        .change-page a.pre{float: left}
        .change-page a.next{float: right}
        .details img{max-width: 100%;margin: 0.4rem 0}
        .details  .txt{font-size: 0.2rem;padding-bottom: 0.4rem;border-bottom: 0.02rem solid #cbcbcb;}

        .details .abstract{font-size:0.2rem;line-height: 0.5rem;letter-spacing: 1px;
            padding-bottom: 0.12rem;padding-top: 0.25rem;color: #9d9d9d;border-bottom: 0.02rem solid #cbcbcb;}
        .details .abstract li span{font-weight: bold;color: #222222;margin-right: 0.3rem;width: 1rem;}

        .contact{width: 1.52rem;height:0.36rem;line-height: 0.36rem;text-align: center;
            background: #c18a3c;color: #ffffff;
            display: block;float: left;border-radius: 20px;margin-top: 0.4rem;font-size: 0.2rem}
        .contact:hover{color: #ffffff;}
        .share{height:0.4rem;float:right;margin-top: 0rem;font-size: 0.17rem;display: block}
        .share a{color: #555555;margin-left: 0.1rem}
        .service-block{display: block}
</style>

</head>
<body class="">
	<div class="body_container" id="app">
		<jsp:include page="_top.jsp"></jsp:include>
		<cms:art var="art" id="${param.id }" queryAround="true"></cms:art>
		 <div class="details">
        <h3 class="fl">${art.artTitle }</h3>
         <div class="fr change-page">
            <c:if test="${not empty prev }"> <a href="${path }/mobile/redirect/serviceDetails?id=${prev.artId}" class="pre">上一篇</a></c:if>
          &nbsp;|&nbsp;
            <c:if test="${not empty next }"> <a href="${path }/mobile/redirect/serviceDetails?id=${next.artId}" class="next">下一篇</a></c:if>
           </div>
        <img src="${art.artImage }" alt="">
          <div class="txt"> ${art.artContent } </div>
        <a href="" class="contact">联系我们</a>
        <div class="fr share" ><img src="${path }/resource/mobile/images/share.png" alt=""><a href="">分享</a></div>
    </div>
    <div class="clr"></div>
    <div class="service">
        <h3 class="tit">我们的服务</h3>
        <h3 class="en-tit"><span class="line"></span>service<span class="line2"></span></h3>
        <div class="tab-content">
            <ul class="service-block">
                  
                    <li v-for="item in xgxm" @click="toArticle(item.artId)"><img :src="item.artImage" alt="">
						<div class="txt">
							<span class="name">{{item.artTitle }}</span> <span class="line"></span>
							<span class="money">{{item.artAbstract }}</span>
						</div></li>
                
            </ul>
        </div>
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
	el : '#app',
	data : {
		offset : 0,
		limit : 100,
		xgxm : [],
	},
	
	methods : {
		toArticle : function(id) {
			window.open("${path}/mobile/redirect/serviceDetails?id=" + id);
		},
		loadOtherArt : function() {
			$.AjaxProxy({
				c : false,
				p : {
					"offset" : 0,
					"limit" : 5,
					"artTypeId" : "${art.artTypeId}"
				}
			}).invoke("${path}/findNews", function(loj) {
				app.xgxm = loj.getValue("rows");
			});
		}
	},
});
app.loadOtherArt();
</script>

</body>
</html>
