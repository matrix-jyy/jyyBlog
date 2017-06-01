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
	.tab-con{height:2.6rem; }
	.news .wrap {margin-top: 0.4rem;}
</style>
</head>
<body class="">
	<div class="body_container" id="app">
		<jsp:include page="_top.jsp"></jsp:include>
		<cms:ad var="gttt" code="m-sxbanner"></cms:ad>
		<div class="banner">
			<div class="am-slider am-slider-default" data-am-flexslider
				id="demo-slider-0">
				<ul class="am-slides">
					<c:forEach items="${gttt }" var="item" varStatus="count">
						<li><img src="${item.adImg }" alt="${item.adTitle}" /></li>

					</c:forEach>
				</ul>
			</div>
			<ol class="am-control-nav am-control-paging">
				<c:forEach items="${gttt }" var="item" varStatus="count">
					<li><a href="#"
						<c:if test="${count.index eq 0 }">class="am-active"</c:if>
						class="am-active"></a><i></i></li>
				</c:forEach>
			</ol>
		</div>
		<div class="service">
			<h3 class="tit">我们的服务</h3>
			<h3 class="en-tit">
				<span class="line"></span>service<span class="line2"></span>
			</h3>
			<div class="tab-content">
				<ul class="service-block">
					<li v-for="item in service1" @click="toArticle(item.artId)">
						<img :src="item.artImage" alt="">
						<div class="txt">
							<span class="name">{{item.artTitle }}</span> <span class="line"></span>
							<span class="money">{{item.artAbstract }}</span>
						</div>
					</li>
				</ul>
				<div class="service-none">
					<ul>
						<li v-for="item in service2" @click="toArticle(item.artId)">
							<img :src="item.artImage" alt="">
							<div class="txt">
								<span class="name">{{item.artTitle }}</span> <span class="line"></span>
								<span class="money">{{item.artAbstract }}</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="a-wrap">
				<a href="javascript:;" class="view-more">查看更多</a>
			</div>
		</div>

		<div class="service-case gray-bg">
			<h3 class="tit">服务案例</h3>
			<h3 class="en-tit">
				<span class="line"></span>service<span class="line2"></span>
			</h3>
			<div class="cases">
				<ul class="service-case-block">
					<li v-for="item in fwal" @click="toArticle(item.artId)"><img
						:src="item.artImage" alt=""> <span class="txt">{{item.artTitle }}</span></li>
				</ul>
			</div>
			<div class="a-wrap">
				<a href="${path }/mobile/redirect/case" class="view-more ">查看更多</a>
			</div>
		</div>
		<div class="team">
			<h3 class="tit">我们的团队</h3>
			<h3 class="en-tit">
				<span class="line"></span>service<span class="line2"></span>
			</h3>
			<ul class="our_team">
				<cms:ad var="items" code="m-wmdtd"></cms:ad>
				<c:forEach var="item" items="${items }">
					<li class="w2 "><img src="${item.adImg }" alt="">
						<div class="person">
							<div class="name">${item.adTitle } </div>
							 <div class="job">${item.adInfo1 }</div>
							<div class="line"></div>
							 <div class="info">${item.adInfo2 }</div>
						</div>
						 </li> 
				</c:forEach>
			</ul>
		</div>
		<div class="news gray-bg">
			<h3 class="tit">新闻动态 & 联系我们</h3>
			<h3 class="en-tit">
				<span class="line"></span>news<span class="line2"></span>
			</h3>
			<div class="wrap">
				<div class="title">
					<span class="left"></span>
					<span class="time">新闻动态</span> <span class="right"></span>
				</div>
				<div class="tab-list">
					<cms:artType var="type" code="xw"></cms:artType>
							<c:forEach items="${type }" var="item">
								<a
									v-on:click="changeType('${item.code}','${item.artTypeName }')"
									href="javascript:;">${item.artTypeName }</a>
							</c:forEach>
				</div>
				<ul class="tab-con">
					<li v-for="item in arts" v-on:click="toArticle(item.artId)"><span
								class="solid"></span> <span class="time">{{item.artCreatetiem
									| getYear}}</span> <span class="head">{{typeName}}</span> <span
								class="abstract">{{item.artTitle}}</span></li>
				</ul>
			</div>
		</div>
		<div class="contact-us gray-bg">
			<div class="pic-wrap">
				<cms:ad var="lxwm" multi="false" code="m-lxwm"></cms:ad>
						<img alt="" src="${lxwm.adImg }"> 
					
			</div>
			<span>联系我们</span>
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
	var app=new Vue({
		el:"#app",
		data:{
			offset : 0,
			limit : 4,
			service1:[{artTitle:"artTitle"}],
			service2:[],
			fwal:[],
			arts:[],
			code : 'qydt', // 默认企业动态
			typeName : '企业动态'
		},
		filters : {
			getYear : function(value) {
				var data = new Date(value);
				return data.getFullYear();
			}
		},
		methods : {
			toArticle : function(id) {
				window.open("${path}/mobile/redirect/serviceDetails?id=" + id);
			},
			changeType : function(code, name) {
				app.code = code;
				app.typeName = name;
				app.loadArt();
			},
			loadArt : function() {
				$.AjaxProxy({
					c : false,
					p : {
						"offset" : app.offset,
						"limit" : app.limit,
						"code" : app.code
					}
				}).invoke("${path}/findNews", function(loj) {
					app.arts = loj.getValue("rows");
				});
			},
			loadService : function() {
				$.AjaxProxy({
					c : false,
					p : {
						"offset" : 0,
						"limit" : 10,
						"code" : "mfwal"
					}
				}).invoke("${path}/findNews", function(loj) {
					app.fwal = loj.getValue("rows");
				});
				$.AjaxProxy({
					c : false,
					p : {
						"offset" : 0,
						"limit" :20,
						"code" : "mservice"
					}
				}).invoke("${path}/findNews", function(loj) {
					var arts = loj.getValue("rows");
					var v1=[];
					var v2=[];
					for(var i=0;i<arts.length;i++){
						if(i<5){
							v1[i]=arts[i];
						}else{
							v2[i-5]=arts[i];
						}
					}
					app.service1=v1;
					app.service2=v2;
				});
			},
		}
		
	});
	app.loadService();
	app.loadArt();
	
	/* 我们的团队动态加样式 */
	$(".our_team").children("li").eq(0).addClass("w1").removeClass("w2")
	$(".our_team").children("li").eq(5).addClass("w1").removeClass("w2").addClass("w3")

</script>

</body>
</html>
