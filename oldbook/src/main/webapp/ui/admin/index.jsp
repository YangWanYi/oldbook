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
				background-color: #299cce;			
			}
			.logoPos {
			    cursor: pointer;
			}
			.webName{
				font-size: 30px;
			    font-family: monospace;
			    font-weight: 700;
			    color: #ece7e7;
			}
			.menuList {
			    height: 40px;
			    line-height: 40px;
			    padding-top: 8px;
			}
			.menuList ol li{
				list-style: none;
			    float: left;
			    color: #ece7e7;
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
			    color: #299cce;
		        background: #fff;
		        width: 125px;
			    text-align: center;
			    border-radius: 5px;
			}
			.topRight{
			    float: right;
			    padding-right: 30px;
			    font-family: inherit;
			    color: #ece7e7;
			    font-weight: 400;
			}
			.topRightBtn{
			    padding: 0px 5px;
			    cursor: pointer;
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
		        background: #a4c8d461;
    			color: #070808;
			    font-family: cursive;
			}
			#intro{
				font-size: 16px;
				text-align: center;
			    font-family: cursive;
			    color: #936666;
			}
		</style>
	</head>
	<body>
	<div class="content">
		<div class="row top">
		    <div class="col-3 logoPos">
		    	<span class="webName">旧书交易网</span>
		    </div>
		    <div class="col-7 menuList">
		    	<ol>
		    		<li id="bookMsg">
		    			<span class="menuOne">用户管理</span>
		    		</li>
		    		<li id="shopMsg">
		    			<span class="menuOne">店铺管理</span>
		    		</li>
		    		<li id="bookTypeMsg">
		    			<span class="menuOne">书籍类型</span>
		    		</li>
		    	</ol>
		    </div>
		    <div class="col-2">
		   		<span class="topRight">
					<span class="topRightBtn">${sessionScope.user.account}</span>|<span class="logout topRightBtn">退出</span>
	   			</span>
		    </div>
		  </div>
		<div class="row centerPos">
			<iframe id="mainIframe" src="user/userList.jsp"></iframe>
		</div>
		<div class="row bottom">
		    <div class="col-12">
		     	<span id="intro">网罗天下图书&nbsp;传承中华文明</span>
		    </div>
		</div>
	</div>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			var innerHeight = window.innerHeight;
			$("#mainIframe").css('height', innerHeight-105+'px');
		});
		
		$(".menuOne").click(function(){ // 切换菜单
			$(".menuOne").removeClass("active");
			$(this).addClass("active");
			$(".menuOne").css('color', '#ece7e7');
			$(this).css('color', '#299cce');
		});
		
		$("#bookMsg").click(function(){ // 用户管理
			$("#mainIframe").attr('src', 'user/userList.jsp');
		});
		
		$("#shopMsg").click(function(){ // 店铺管理
			$("#mainIframe").attr('src', 'shopList.jsp');
		});
		
		$("#bookTypeMsg").click(function(){ // 书籍类型
			$("#mainIframe").attr('src', 'bookType/bookTypeList.jsp');
		});
		
		$(".logout").click(function(){ // 退出
			if(confirm('确定要退出吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/logout.action',
					async: false,
					success: function(s){
						location.href = "<%=basePath%>"; 
					},
					error: function(e){
						alert("退出失败！");
					}
				});
		    }
		});
	</script>
</html>
