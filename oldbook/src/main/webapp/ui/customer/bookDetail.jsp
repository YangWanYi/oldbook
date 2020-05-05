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
		<title>旧书交易网——书籍详情</title>
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
				width: 100%;
				padding: 5px 10px;	
				background-color: #F2F1EA;			
			}
			.logoPos {
				align-items: center;
			    padding-left: 2rem;
			}
			.webName{
			    font-size: 30px;
			    font-family: monospace;
			    color: #7d1140;
			    font-weight: 700;
			}
			#intro{
				font-size: 16px;
				text-align: center;
			    font-family: cursive;
			    color: #936666;
			}
			.topRight{
			    float: right;
			}
			.topRightBtn{
			    padding: 0px 5px;
			    cursor: pointer;
			    font-family: inherit;
			    color: #8a6b11;
			    font-weight: 400;
			}
			.centerPos{
				padding: 1%;
				width: 100%;
				height: 100%;
			}
			.bottom{
				height: 35px;
				line-height: 35px;
				bottom: 0px;
				position: fixed;
				width: 100%;
				text-align: center;
				background: #e2e0c247;
			    color: #fff;
			    font-family: cursive;
			}
			#searchItem{
				float: left;
				margin-right: 10px;
				font-size: 13px;
			}
			#searchItem ol li{
				list-style: none;
				line-height: 25px;
				cursor: pointer;
			}
			#keyWords{
    			width: 400px;
    			display: inline-block;
			}
			.active{
				border-bottom: 2px solid #b90e0e;
			}
			#searchNow{
				width: 85px;
			    background: #b90e0e;
			    color: #fff;
			    display: inline-block;
			    text-align: center;
			    height: 34px;
			    line-height: 35px;
			    border-radius: 5px;
			    font-size: 16px;
			}
			#myModal{
				margin-top: 100px;
			}
			iframe{
				border: none;
				width: 100%;
				height: 100%;
			}
			.logined, .applyShop{
				display: none;
			}
			#shopInfo{
				width: 11%;
				min-height:450px; 
				margin-left: 5px;
				padding: 10px;
				border: 1px solid #80808087;
				border-radius: 5px;
				float: left;
			}
			.shopMsg{
				line-height: 35px;
				font-size: 14px;
			}
			.shopName{
				text-align: center;
				font-weight: bold;
			}
			#bookInfo{
				width: 80%;
				min-height:400px; 
				border-radius: 5px;
				margin-left: 5%;
			}
			.bookCover{
				float: left;
				width: 400px;
				height: 450px;
				margin-right: 20px;
			}
			.bookCover img{
				width: 100%;
				height: 100%;
			}
			.bookMsg{
			}
			.bookName{
				font-size: 18px;
				font-weight: bold;
			    line-height: 40px;
				border-bottom: 1px solid #80808087;
			}
			.bookDetail{
			    width: 300px;
			    float: left;
		    	color: gray;
			}
			.introTitle{
			    font-size: 18px;
			    border-bottom: 1px solid red;
			    margin: 10px 0px;
			}
			.introInfo{
				text-indent: 2rem;
			    font-family: cursive;
			    font-size: 20px;
			    letter-spacing: 1px;
			}
			.otherBookTitle{
			    line-height: 40px;
			    font-size: 18px;
			    font-family: monospace;
			    font-weight: 600;
			    border-bottom: 2px solid #ff000042;
			    padding-top: 10px;
			    margin-top: 10px;
			    text-align: center;
			    padding: 0px 10px;
			    border-radius: 5px;
			    margin-left: 5px;
			    width: 100%;
		        margin-bottom: 10PX;
			}
			.eachBook{
				width: 300px;
				float: left;
				cursor: pointer;
				padding-left: 50px;
			}
			.bookCoverOther{
				width: 200px;
				height: 180px;
			}
			.noData{
				text-align: center;
				font-size: 28px;
				font-family: monospace;
				color: gray;
				padding-top: 5%;
			}
		</style>
	</head>
	<body>
		<div class="content">
			<div class="row top">
			    <div class="col-4 logoPos">
			    	<span class="webName">旧书交易网</span>
			    </div>
			    <div class="col-4 searchBar">
		    		<div id="searchItem">
		    			<ol>
			    			<li class="active" id="book">商品</li>
			    			<li id="shop">店铺</li>
			    		</ol>
		    		</div>
			    	<div>
			    		<input type="text" class="form-control" id="keyWords" placeholder="请输入关键字">
			    		<span id="searchNow">搜索</span>
			    	</div>
			    </div>
			    <div class="col-2">
					<span class="topRightBtn applyShop" data-toggle="modal" data-target="#shopModal">申请开店</span>
					<span class="topRightBtn logined myShop">我的店铺</span>
					<span class="topRightBtn logined myCart">购物车</span>
					<span class="topRightBtn logined myOrder">我的订单</span>
			    </div>
			   <div class="col-2">
			   		<span class="topRight">
		   				<span class="logined">
							<span class="topRightBtn personalMsg" data-toggle="modal" data-target="#myModal">${sessionScope.user.account}</span>|<span class="logout topRightBtn">退出</span>
			   			</span>
		   				<span class="noLogin">
			   				<span class="login topRightBtn" data-toggle="modal" data-target="#myModal">登录</span>|<span class="regist topRightBtn" data-toggle="modal" data-target="#myModal">注册</span>
			   			</span>
		   			</span>
			    </div>
			  </div>
			<div class="row centerPos">
				<div id="shopInfo">
					<div class="shopMsg shopName">${requestScope.shopData.shopName}</div>
					<div class="shopMsg">店主：${requestScope.shopData.userName}</div>
					<div class="shopMsg">联系方式：${requestScope.shopData.contactNum}</div>
					<div class="shopMsg">线下地址：${requestScope.shopData.address}</div>
					<div class="shopMsg">店铺公告：${requestScope.shopData.notice}</div>
				</div>
				<div id="bookInfo">
					<div class="bookCover">
						<img src="ui/imgs/upload/${requestScope.bookItemData.cover}">
					</div>
					<div class="bookMsg">
						<div class="bookName">${requestScope.bookItemData.bookName}</div>
						<div class="bookDetail">类型：${requestScope.bookItemData.parentBookTypeName}>${requestScope.bookItemData.bookTypeName}</div>
						<br/>
						<div class="bookDetail">作者：${requestScope.bookItemData.author}</div>
						<div class="bookDetail">纸张：${requestScope.bookItemData.paper}</div>
						<div class="bookDetail">尺寸：${requestScope.bookItemData.bookSize}</div>
						<br/>
						<div class="bookDetail">出版人：${requestScope.bookItemData.publisher}</div>
						<div class="bookDetail">装帧：${requestScope.bookItemData.graphic}</div>
						<div class="bookDetail">ISBN：${requestScope.bookItemData.isbn}</div>
						<br/>
						<div class="bookDetail">版次：${requestScope.bookItemData.edition}</div>
						<div class="bookDetail">页数：${requestScope.bookItemData.pagination}</div>
						<div class="bookDetail">字数：${requestScope.bookItemData.wordCount}</div>
						<br/>
						<div class="introTitle">简介</div>
						<div class="introInfo">${requestScope.bookItemData.introduce}</div>
					</div>
					<div style="clear: left;font-size: 16px;padding-top: 5px;">
						<div style="float: left;margin-right: 30px;">售价：<span style="color:red;">￥${requestScope.bookItemData.salePrice}</span></div>
						<div>库存：${requestScope.bookItemData.amount}（本）</div>
						<div style="margin-top: 10px;" id="addCart" class="btn btn-danger">加入购物车</div>
					</div>
				</div>
				<div class="otherBookTitle">当前店铺的其他书籍</div>
				<div class="otherBook"></div>
			</div>
			<div class="row bottom">
			    <div class="col-12">
			     	<span id="intro">网罗天下图书&nbsp;传承中华文明</span>
			    </div>
			</div>
		</div>
		<!-- 模态框（Modal） 个人中心  -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title" id="myModalLabel"></h4>
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		            </div>
		            <div class="modal-body">
						<iframe id="winIframe" width="100%" height="100%"></iframe>
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
		var roleTypeX = "${sessionScope.user.roleTypeX}";
		var basePath = "<%=basePath%>";
		$(function(){
			if(roleTypeX!=null&&roleTypeX.indexOf('商家')!=-1){
				$(".logined").show();
			}
			if(userId!=null&&userId!=''){
				$(".noLogin").hide();
				$(".logined").show();
			}else{
				if(roleTypeX!=null&&roleTypeX.indexOf('客户')!=-1){
					$(".applyShop").show();
				}
			}
			showOtherBook();
		});
		
		$(".myShop").click(function(){ // 我的店铺
			window.open('../merchant/index.jsp');
		});
		
		$(".myCart").click(function(){ // 购物车
			window.open('/toCustomerBookCartPage.action');
		});
		
		$(".myOrder").click(function(){ // 我的订单
			window.open('/toCustomerTradeOrderPage.action');
		});
		
		// 加入购物车
		$("#addCart").click(function(){
			if(userId==null||userId==''){
				alert("请先登录！");
				return false;
			}
			if(confirm('确定加入购物车吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/saveOrUpdateBookCart.action',
					data: {'bookId': '${requestScope.bookItemData.id}'},
					async: false,
					success: function(s){
						alert('成功加入购物车！');
					},
					error: function(e){
						alert("加入购物车失败！");
					}
				});
			}
		});
		
		function showOtherBook(){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/listBookItem.action',
				data: {'shopId': '${requestScope.bookItemData.shopId}', 'amount': '1'},
				async: false,
				success: function(s){
					var str = "";
					if(s.total>0){
						var bookName = '';
						$(s.rows).each(function(m,n){
							if(m<6){
								bookName = n.bookName;
								if(bookName.length>12){
									bookName = bookName.substring(0,12)+'...';
								}
								str += '<div class="eachBook" onClick="showDetail(\''+n.id+'\');">'
										+'<div><img class="bookCoverOther" src="ui/imgs/upload/'+n.cover+'"/></div>'
										+'<div>'+bookName+'</div>'
										+'<div style="color:gray;">作者：'+n.author+'</div>'
										+'<div style="color:red;">￥'+n.salePrice+'</div>'
									+'</div>';
							}
						});
					}else{
						str = '<div class="noData">暂无数据！</div>';
					}
					$(".otherBook").html(str);
				},
				error: function(e){
					alert("其他书籍查询失败！");
				}
			});
		}
		
		function showDetail(bookId){
			window.open('/toViewBookItemPage.action?id='+bookId);
		}
		
		var searchType = 'book';
		$("#book").click(function(){ // 搜索商品
			$("*").removeClass("active");
			$(this).addClass("active");
			searchType = 'book';
		});
		
		$("#shop").click(function(){ // 搜索店铺
			$("*").removeClass("active");
			$(this).addClass("active");
			searchType = 'shop';
		});
		
		$("#searchNow").click(function(){ // 立即搜索
			var keyWords = $("#keyWords").val();
			window.open(''); // 打开新的窗口显示搜索结果
		});
		
		$(".saveNow").click(function(){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/saveOrUpdateUser.action',
				data: $("#winIframe").contents().find("#myForm").serialize(),
				async: false,
				success: function(s){
					$('#myModal').modal('hide');
					alert("修改成功！");
				},
				error: function(e){
					alert("修改失败！");
				}
			});
		});

		$(".personalMsg").click(function(){ // 去个人中心
			if(userId!=null&&userId!=''){
				$("#winIframe").attr("src","/toUpdateUserPage.action?id="+userId);
				$('#myModal').on('shown.bs.modal', function () {
					$(this).find('.modal-content').css('height','600px');// 修改modal的高度
					$(this).find('.modal-content').css('width','500px');// 修改modal的宽度
					$(this).find('.modal-title').text('修改个人信息');// 修改modal的标题
				});
			}
		});

		$("#myModal").on("hidden.bs.modal", function() {
		    $(this).removeData("bs.modal");
		});
		

		$(".regist").click(function(){ // 去注册
			$("#winIframe").attr('src','ui/common/regist.jsp');
			$('#myModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','280px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的宽度
			});
		});
		
		$(".login").click(function(){ // 去登录
			$("#winIframe").attr('src','ui/common/login.jsp');
			$('#myModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','280px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的宽度
			});
		});
		
		$(".logout").click(function(){ // 退出
			if(confirm('确定要退出吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/logout.action',
					async: false,
					success: function(s){
						location.href= basePath; //刷新父级页面
					},
					error: function(e){
						alert("退出失败！");
					}
				});
		    }
		});
	</script>
</html>
