<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.oldbook.domain.UserDo;"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<title>旧书交易网</title>
		<style type="text/css">
			*{
				padding: 0 0;
				margin: 0 0;
			}
			body{
				width: 100%;
				height: 100%;
				overflow-x: hidden; 
			}
			.top{
				height: 70px;
				line-height: 55px;
				padding: 5px 10px;	
				background-color: gold;			
			}
			.logoPos {
				align-items: center;
			}
			.logoPos img{
				width: 70px;
			    height: 60px;
			    border-radius: 5px;
			}
			.webName{
				font-size: 20px;
			    font-family: cursive;
			    color: #7d1140;
			}
			.menuList {
			    height: 40px;
			    line-height: 40px;
			    padding-top: 8px;
			}
			.menuList ol li{
				list-style: none;
			    float: left;
			    color: #8a6b11;
			    font-size: 20px;
			    font-weight: 400;
			    font-family: inherit;
			    width: 125px;
			    margin: auto 5px;
			    text-align: center;
			    cursor: pointer;
			}
			.active{
				display:inline-block;
			    color: #7d1140;
		        background: #ece7e7;
		        width: 125px;
			    text-align: center;
			    border-radius: 5px;
			}
			.topRight{
			    float: right;
			    padding-right: 30px;
			    font-family: inherit;
			    color: #8a6b11;
			    font-weight: 400;
			}
			.topRightBtn{
			    padding: 0px 5px;
			}
			.topRightBtn:hover{
			    color: #fff;
			}
			.centerPos{
				padding: 0px 10px;
			}
			#mainIframe{
				width: 100%;
				border: none;
			}
			.bottom{
				height: 35px;
				line-height: 35px;
				bottom: 0px;
				position: fixed;
				width: 100%;
				text-align: center;
				background: #776710;
			    color: #fff;
			    font-family: cursive;
			}
			#alreadyLogin{
				display: none;
			}
			.dropdown-item{
				line-height: 35px;
			}
			.dropdown-item:hover{
				color: #cc800d;
			}
		</style>
	</head>
	<body>
	<div class="content">
		<div class="row top">
		    <div class="col-4 logoPos">
		    	<img alt="logo" src="ui/imgs/LOGO.png">
		    	<span class="webName">优易水果商城</span>
		    </div>
		    <div class="col-5 menuList">
		    	<ol>
		    		<li id="index">
		    			<span class="active">首页</span>
		    		</li>
		    		<li id="newsCenter">
		    			<span>商品促销</span>
		    		</li>
		    		<li id="productCenter">
		    			<span>产品中心</span>
		    		</li>
		    		<li id="myCart">
		    			<span>购物车</span>
		    		</li>
		    	</ol>
		    </div>
		    <div class="col-3">
		   		<span class="topRight">
		   			<span id="noLogin">
		   				<span class="login topRightBtn">登录</span>|<span class="regist topRightBtn">注册</span>
		   			</span>
		   			<span id="alreadyLogin">
			   			<span class="dropdown">
							<span class="topRightBtn btn dropdown-toggle" id="dropdownMenuLink" data-toggle="dropdown">${sessionScope.user.account}</span>|<span class="logout topRightBtn">退出</span>
							<span class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<span class="dropdown-item personal">个人中心</span>
								<span class="dropdown-item modifyPwd">修改密码</span>
								<span class="dropdown-item recharge">我要充值</span>
								<span class="dropdown-item myOrder">我的订单</span>
							</span>
						</span>
		   			</span>
	   			</span>
		    </div>
		  </div>
		<div class="row centerPos">
			<iframe id="mainIframe" src="ui/common/home/home.jsp"></iframe>
		</div>
		<div class="row bottom">
		    <div class="col-12">
		     	 优易水果商城，致力于带给您新鲜实惠的水果！联系电话：1234567
		    </div>
		</div>
	</div>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var userId = "${sessionScope.user.id}";
		$(function(){
			if(userId){ // 用户已登录
				$("#alreadyLogin").show();
				$("#noLogin").hide();
				// 判断用户角色 进入不同的界面
				var roleId = "${sessionScope.user.roleId}"; // 用户角色ID 2：客户 1：管理员
				if("1" == roleId){ // 管理员界面
					location.href = 'ui/admin/index.jsp';
				} // 默认是客户的界面 所以不用调整
			}
			var innerHeight = window.innerHeight;
			$("#mainIframe").css('height', innerHeight-105+'px');
		});
		
		$(".menuList ol li span").click(function(){ // 切换菜单
			$("*").removeClass("active");
			$(this).addClass("active");
			$(".menuList ol li span").css('color', '#8a6b11');
			$(this).css('color', '#7d1140');
		});
		
		$("#index").click(function(){ // 首页
			$("#mainIframe").attr('src', 'ui/common/home/home.jsp');
		});
		
		$("#newsCenter").click(function(){ // 商品促销中心
			$("#mainIframe").attr('src', 'ui/customer/news/news.jsp');
		});
		
		$("#productCenter").click(function(){ // 产品中心
			$("#mainIframe").attr('src', '/toGoodsListPage.action');
// 			$("#mainIframe").attr('src', '/ui/customer/goods/goods.jsp');
		});
		
		$("#myCart").click(function(){ // 购物车
			if(!userId){ // 用户未登录 跳转至登录页面
				$("#mainIframe").attr('src','ui/common/login/login.jsp');
			}else{
// 				$("#mainIframe").attr('src', '/toOrderListPage.action');
				$("#mainIframe").attr('src', '/ui/customer/cart/cartList.jsp');
			}
		});
		
		$(".regist").click(function(){ // 去注册
			$("#mainIframe").attr('src','ui/common/regist/regist.jsp');
		});
		
		$(".login").click(function(){ // 去登录
			$("#mainIframe").attr('src','ui/common/login/login.jsp');
		});
		
		$(".personal").click(function(){ // 去个人中心
			$("#mainIframe").attr('src','ui/customer/personal/personal.jsp');
		});
		
		$(".modifyPwd").click(function(){ // 去修改密码 
			$("#mainIframe").attr('src','ui/customer/modifyPwd/modifyPwd.jsp');
		});
		
		$(".myOrder").click(function(){ // 去订单中心
			$("#mainIframe").attr('src','ui/customer/order/orderList.jsp');
		});
		
		$(".recharge").click(function(){ // 我要充值
			var money = prompt("请输入充值金额");
			if(money){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/recharge.action',
					data: {'id': userId, 'balance': money},
					async: false,
					success: function(s){
						alert("充值成功！");
					},
					error: function(e){
						alert("充值失败！");
					}
				});
			}
		});
		
		$(".logout").click(function(){ // 退出
			if(confirm('确定要退出吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/logout.action',
					async: false,
					success: function(s){
						location.reload(); //刷新父级页面
					},
					error: function(e){
						alert("退出失败！");
					}
				});
		    }
		});
	</script>
</html>
