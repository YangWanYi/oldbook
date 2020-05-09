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
		<title>旧书交易网——${sessionScope.shop.shopName}</title>
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
			iframe{
				border: none;
				width: 100%;
				height: 100%;
			}
			#shopModal{
				margin-top: 5%;
			}
		</style>
	</head>
	<body>
		<div class="content">
			<div class="row top">
			    <div class="col-3 logoPos">
			    	<span class="webName">旧书交易网——${sessionScope.shop.shopName}</span>
			    </div>
			    <div class="col-7 menuList">
			    	<ol>
			    		<li id="bookMng">
			    			<span class="menuOne">书籍管理</span>
			    		</li>
			    		<li id="orderMng">
			    			<span class="menuOne">订单管理</span>
			    		</li>
			    		<li id="emailMng">
			    			<span class="menuOne">邮件管理</span>
			    		</li>
			    		<li id="shopInfo" data-toggle="modal" data-target="#shopModal">
			    			<span class="menuOne">店铺信息</span>
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
				<iframe id="mainIframe" src="/toBookItemListPage.action"></iframe>
			</div>
			<div class="row bottom">
			    <div class="col-12">
			     	<span id="intro">网罗天下图书&nbsp;传承中华文明</span>
			    </div>
			</div>
		</div>
		<!-- 模态框（Modal） 店铺信息  -->
		<div class="modal fade" id="shopModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title" id="myModalLabel"></h4>
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		            </div>
		            <div class="modal-body">
						<iframe id="shopIframe" width="100%" height="100%"></iframe>
					</div>
					 <div class="modal-footer">
		                <div class="btn btn-default" data-dismiss="modal">关闭</div>
		                <div class="btn saveShop btn-primary">确定</div>
		            </div>
		        </div>
		    </div>
		</div>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var userId = "${sessionScope.user.id}";
		var basePath = "<%=basePath%>";
		$(function(){
			$(".webName").click(function(){
				location.href=basePath;
			});
			if(userId == null || userId == ''){
				location.href=basePath;
			}
			var innerHeight = window.innerHeight;
			$("#mainIframe").css('height', innerHeight-105+'px');
		});
		
		$(".menuOne").click(function(){ // 切换菜单
			$(".menuOne").removeClass("active");
			$(this).addClass("active");
			$(".menuOne").css('color', '#ece7e7');
			$(this).css('color', '#299cce');
		});
		
		$("#bookMng").click(function(){ // 书籍管理
			$("#mainIframe").attr('src', '/toBookItemListPage.action');
		});
		
		$("#orderMng").click(function(){ // 订单管理
			$("#mainIframe").attr('src', 'tradeOrder/tradeOrderList.jsp');
		});
		
		$("#emailMng").click(function(){ // 邮件管理
			$("#mainIframe").attr('src', '/toEmailList.action');
		});
		
		$(".saveShop").click(function(){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/saveOrUpdateShop.action',
				data: $("#shopIframe").contents().find("#myForm").serialize(),
				async: false,
				success: function(s){
					$('#shopModal').modal('hide');
					alert("修改成功！");
				},
				error: function(e){
					alert("修改失败！");
				}
			});
		});

		$("#shopInfo").click(function(){ // 店铺信息
			$("#shopIframe").attr("src","shopLMsg.jsp");
			$('#shopModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','600px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的宽度
				$(this).find('.modal-title').text('店铺信息');// 修改modal的标题
			});
		});
		
		$("#shopModal").on("hidden.bs.modal", function() {
		    $(this).removeData("bs.modal");
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
