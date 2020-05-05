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
		<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">  
		<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">  
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
			.logined{
				display: none;
			}
			#contentLeft{
				width: 11%;
				min-height:830px; 
				padding-left: 10px;
			}
			#contentLeft ul li{
				list-style: none;
				cursor: pointer;
			}
			#contentRight{
				width: 89%;
				min-height:830px; 
			}
			.titleOfBook{
			    text-align: left;
			    height: 35px;
			    line-height: 35px;
			    width: 85%;
			    font-family: fantasy;
			    font-size: 18px;
			    border-left: 5px solid red;
			    margin: 10px 0px;
			    padding-left: 5px;
			}
			.eachBook{
				width: 300px;
				float: left;
				margin-left: 25px;
				margin-bottom: 10px;
				cursor: pointer;
			}
			.bookCover{
				width: 300px;
				height: 300px;
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
						<span class="topRightBtn personalMsg" data-toggle="modal" data-target="#myModal">${sessionScope.user.account}</span>|<span class="logout topRightBtn">退出</span>
		   			</span>
			    </div>
			  </div>
			<div class="row centerPos">
				<div id="contentLeft">
					
				</div>
				<div id="contentRight">
					<div class="swiper-container">
					    <div class="swiper-wrapper">
					        <div class="swiper-slide">
								<img src="../imgs/banner_01.jpg"/>
							</div>
					        <div class="swiper-slide">
								<img src="../imgs/banner_02.jpg"/>
							</div>
					        <div class="swiper-slide">
								<img src="../imgs/banner_03.jpg"/>
							</div>
					        <div class="swiper-slide">
								<img src="../imgs/banner_04.jpg"/>
							</div>
					    </div>
					   <div class="swiper-pagination"></div><!--分页器。如果放置在swiper-container外面，需要自定义样式。-->
					</div>
					<div class="titleOfBook">书籍列表</div>
					<div id="bookList">
						
					</div>
				</div>
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
					 <div class="modal-footer">
		                <div class="btn btn-default" data-dismiss="modal">关闭</div>
		                <div class="btn saveNow btn-primary">确定</div>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- 模态框（Modal） 申请开店  -->
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
	<script src="https://unpkg.com/swiper/js/swiper.js"> </script>  
	<script src="https://unpkg.com/swiper/js/swiper.min.js"> </script>
	<script type="text/javascript">
		var userId = "${sessionScope.user.id}";
		var roleTypeX = "${sessionScope.user.roleTypeX}";
		var basePath = "<%=basePath%>";
		$(function(){
			showItems();
			showBookList(null);
			if(userId==null||userId==''){
				location.href= basePath; 
			}
			if(roleTypeX!=null&&roleTypeX.indexOf('商家')!=-1){
				$(".logined").show();
				$(".applyShop").hide();
			}
			var mySwiper = new Swiper('.swiper-container', {
				autoplay: true,//可选选项，自动滑动
			    pagination: {
			        el: '.swiper-pagination',
		        },
			});
		});
		function showItems(){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/listBookType.action',
				data: {'parentTypeId': 0},
				async: false,
				success: function(s){
					var str = "";
					if(s.total>0){
						$(s.rows).each(function(m,n){
							str += '<ul>'
										+'<li><a onClick="showBookList(\''+n.typeName+'\');">'+n.typeName+'</a></li>'
									+'</ul>';
						});
					}
					$("#contentLeft").html(str);
				},
				error: function(e){
					alert("书籍类型查询失败！");
				}
			});
		}
		function showBookList(bookTypeName){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/listBookItem.action',
				data: {'parentBookTypeName': bookTypeName, 'amount': '1'},
				async: false,
				success: function(s){
					var str = "";
					if(s.total>0){
						var bookName = '';
						$(s.rows).each(function(m,n){
							bookName = n.bookName;
							if(bookName.length>17){
								bookName = bookName.substring(0,17)+'...';
							}
							str += '<div class="eachBook" onClick="showDetail(\''+n.id+'\');">'
										+'<div><img class="bookCover" src="../imgs/upload/'+n.cover+'"/></div>'
										+'<div>'+bookName+'</div>'
										+'<div style="color:gray;">作者：'+n.author+'</div>'
										+'<div style="color:red;">￥'+n.salePrice+'</div>'
									+'</div>';
						});
					}else{
						str = '<div class="noData">暂无数据！</div>';
					}
					$("#bookList").html(str);
				},
				error: function(e){
					alert("书籍查询失败！");
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
		
		$(".myShop").click(function(){ // 我的店铺
			window.open('../merchant/index.jsp');
		});
		
		$(".myCart").click(function(){ // 购物车
			window.open('/toCustomerBookCartPage.action');
		});
		
		$(".myOrder").click(function(){ // 我的订单
			window.open('/toCustomerTradeOrderPage.action');
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
		$(".saveShop").click(function(){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/saveOrUpdateShop.action',
				data: $("#shopIframe").contents().find("#myForm").serialize(),
				async: false,
				success: function(s){
					$('#shopModal').modal('hide');
					alert("申请成功！");
				},
				error: function(e){
					alert("申请失败！");
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

		$(".applyShop").click(function(){ // 申请开店
			if(userId!=null&&userId!=''){
				$("#shopIframe").attr("src","applyShop.jsp");
				$('#shopModal').on('shown.bs.modal', function () {
					$(this).find('.modal-content').css('height','600px');// 修改modal的高度
					$(this).find('.modal-content').css('width','500px');// 修改modal的宽度
					$(this).find('.modal-title').text('申请开店');// 修改modal的标题
				});
			}
		});
		
		$("#myModal,#shopModal").on("hidden.bs.modal", function() {
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
