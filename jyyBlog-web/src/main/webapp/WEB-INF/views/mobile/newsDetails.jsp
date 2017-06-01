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
        .details .change-page{padding:0 5px;font-size: 0.14rem;float:right;border: 1px solid #8b8b8b;color: #8b8b8b;height:0.4rem;width: 1.62rem;
            line-height: 0.4rem;text-align: center;border-radius: 20px;display: block}
        .change-page a{color: #8b8b8b;font-size: 0.14rem;line-height: 0.4rem;height:0.4rem;display: block;}
        .change-page a.pre{float: left}
        .change-page a.next{float: right}
        .details img{max-width: 100%;margin: 0.4rem 0}
        .details  .txt{font-size: 0.2rem;padding-bottom: 0.4rem;}
        .gzh{padding-top: 20px;overflow: hidden;border-bottom: 1px solid #dddddd;padding-bottom: 20px;}
        .mt{position: relative;float: right}
        .gzh .time{font-size: 0.22rem;float: left;}
        .gzh a{color: #555555;font-size: 0.18rem;    display: block;float: left;  height: 0.4rem;line-height: 0.4rem;}
        .gzh a img{margin: 0}
        .yellow-bg{padding:0 0.03rem;width: 0.9rem;height: 0.3rem;line-height: 0.3rem;text-align: center;
            display:block;color: #ffffff;float: left;
            border-radius: 10px;background: #c6944e;font-size: 0.12rem;margin-left: 0.1rem;margin-top: 0.02rem;}
        .dot{position:absolute;top:0.16rem;left:-0.15rem;margin-right:0.1rem;width:0.06rem;height: 0.06rem;
            display: block;background:#c6944e;border-radius: 50%;float: left; }
        .share{padding:0 0.3rem;font-size:0.19rem;height: 0.76rem;line-height: 0.76rem;
            width: 100%;background: #f6f6f6;}
        .share img{margin-left: 0.2rem;}

        .news,.news .wrap  ul{padding: 0rem;}
        .news h3{font-weight: bold;font-size: 0.25rem;text-align: left;margin-top: 0.4rem}
        .tab-con{height: 2rem;}
        .news .wrap  ul li .abstract{width: 3.8rem;}
        .min-height{min-height:4rem;}

    </style>

</head>

<body class="">
	<div id="app">
		<jsp:include page="_top.jsp"></jsp:include>
		<cms:art var="art" id="${param.id }" queryAround="true"></cms:art>
		<div class="details">
			<h3 class="fl">${art.artTitle }</h3>
					<div class="fr change-page">
						<c:if test="${not empty prev }">
							<a href="${path }/mobile/redirect/newsDetails?id=${prev.artId}" class="pre">上一篇</a>
						</c:if>
						&nbsp;|&nbsp;
						<c:if test="${not empty next }">
							<a href="${path }/mobile/redirect/newsDetails?id=${next.artId}" class="next">下一篇</a>
						</c:if>

					</div>
			<div class="clr gzh">
						<a href=""><img src="${path }/resource/images/weixin.png" alt="">&nbsp;京谷粒公众号</a>
						<span class="fr mt"><span class="dot"></span><span class="time"><fmt:formatDate
									value="${art.artCreatetiem }" pattern="yyyy" /></span> <span
							class="yellow-bg">${art.artTypeName}</span></span>
					</div>
					<div class="min-height txt">${art.artContent }</div>
		</div>
		<div class="clr"></div>
		<div class="share">
			分享至&nbsp; <a href=""><img src="${path }/resource/mobile/images/share1.png" alt=""></a> <a
				href=""><img src="${path }/resource/mobile/images/share2.png" alt=""></a> <a href=""><img
				src="${path }/resource/mobile/images/share3.png" alt=""></a>
		</div>
		<div class="news">
			<div class="wrap">
				<h3>相似文章</h3>
				<ul class="tab-con">
					<li v-for="item in xgwz" v-on:click="toArticle(item.artId)"><span
								class="solid"></span> <span class="time">{{item.artCreatetiem
									| getYear}}</span> <span class="head">{{item.artTypeName}}</span> <span
								class="abstract">{{item.artTitle}}</span></li>
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
			limit : 3,
			ads:[],
			xgwz : [],
			rmtj : [],
		},
		filters : {
			getYear : function(value) {
				var data = new Date(value);
			
	return data.getFullYear();
			}
		},
		methods : {
			toArticle : function(id) {
				window.open("${path}/mobile/redirect/newsDetails?id=" + id);
			},
			selectAd : function(code) {
				$.AjaxProxy({
					c : false,
					p : {
						"code" : code
					}
				}).invoke("${path}/findAd", function(loj) {
					app.ads = loj.getValue("rows");
				});
			},
			loadOtherArt : function() {
				$.AjaxProxy({
					c : false,
					p : {
						"offset" : 0,
						"limit" : 3,
						"artTypeId" : "${art.artTypeId}"
					}
				}).invoke("${path}/findNews", function(loj) {
					app.xgwz = loj.getValue("rows");
				});
				$.AjaxProxy({
					c : false,
					p : {
						"offset" : 0,
						"limit" : 3,
						"code" : "xw"
					}
				}).invoke("${path}/findNews", function(loj) {
					app.rmtj = loj.getValue("rows");
				});
			}
		},
	});
	app.loadOtherArt();

	$(".tab li").click(function() {
		$(this).addClass("active").siblings().removeClass("active")
		$(".tab-content").find("ul").hide();
		$(".tab-content").find("ul").eq($(this).index()).show()
	})
</script>

</body>
</html>
