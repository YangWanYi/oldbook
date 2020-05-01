<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>首页</title>
		<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">  
		<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">  
		<style type="text/css">
			.aboutMsg{
				text-align: center;
			}
			.aboutUs{
				border-bottom: 1px solid red;
			    display: inline-block;
			    margin: 15px;
			    letter-spacing: 1px;
			    font-size: large;
			    font-family: initial;
			    font-weight: 400;
			}
			.aboutDetail{
				width: 40%;
			    display: inline-block;
			    text-indent: 3rem;
			    text-align: left;
			    color: #54220c;
			    line-height: 25px;
			}
		</style>  
	</head>
	<body>
		<div class="swiper-container">
		    <div class="swiper-wrapper">
		        <div class="swiper-slide">
					<img src="../../imgs/home-banner-01.jpeg"/>
				</div>
		        <div class="swiper-slide">
					<img src="../../imgs/home-banner-02.jpeg"/>
				</div>
		        <div class="swiper-slide">
					<img src="../../imgs/home-banner-03.jpeg"/>
				</div>
		        <div class="swiper-slide">
					<img src="../../imgs/home-banner-04.jpeg"/>
				</div>
		    </div>
		    <!-- 如果需要导航按钮 -->
		    <div class="swiper-button-prev"></div>
		    <div class="swiper-button-next"></div>
		</div>
		<div class="col-12 aboutMsg">
			<span class="aboutUs">关于我们</span>
		</div> 
		${userData.account}
		<div class="col-12 aboutMsg">
			<span class="aboutDetail">
				优易水果商城产品定位主要以中高端水果为主，目前水果品类主要涵盖三大类:进口水果、地域特色水果、时令水果三大类近100多个品种，目前与各产地水果基地建立了紧密的战略合作关系，直接基地采购的比例在逐步扩大，未来计划将建立自己的水果种植基地，相关计划已经在紧锣密鼓的准备中。欢迎关注！
			</span>
		</div> 
	</body>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/swiper/js/swiper.js"> </script>  
	<script src="https://unpkg.com/swiper/js/swiper.min.js"> </script>
	<script type="text/javascript">
		var mySwiper = new Swiper('.swiper-container', {
			autoplay: true,//可选选项，自动滑动
			navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    }
		});
	</script>
</html>