<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link href="https://cdn.bootcss.com/bootstrap-table/1.16.0/bootstrap-table.css" rel="stylesheet">
		<title>产品中心</title>
		<style type="text/css">
			*{
				padding: 0 0;
				margin: 0 0;
			}
			body{
				width: 100%;
				height: 100%;
				overflow-x: hidden; 
				padding: 0px 10px;
			}
			#productList{
				padding: 10px;
				height: 100%;
				margin: auto 2.5%;
			}
			ol li{
				width: 300px;
				height: 300px;
				margin: 30px 29px;
				float: left;
				list-style: none;
			}
			ol li:hover{
				border: 1px solid #eee;
				padding: 10px;
			}
			.fruitMsg{
			    font-size: 16px;
			    text-align: center;
			    font-family: none;
			    line-height: 35px;
			}
			.price{
				color: red;
				display: inline-block;
				padding-left: 10px;
				padding-right: 2px;
			}
			.unit{
				color: #948c8c;
			}
			.fruitImg img{
			    border-radius: 20px;
			}
			.mainPic{
				width: 300px;
				height: 300px;
			}
			.theCart{
				width: 25px;
				height: 25px;
				margin-left: 5px;
				cursor: pointer;
			}
			.searchItem{
				float: right;
				padding-right: 20px;
				height: 35px;
   				line-height: 35px;
			    margin-top: 5px;
			}
			.searchItem span,input{
				display: inline-block;
				padding: 5px 10px;
			}
			#searchNow{
			    margin-top: 4px;
   	 			margin-left: 10px;
			}
		</style>
	</head>
	<body>
		<div class="searchItem">
			<div style="float: left;">
				<span style="float: left;">水果名称</span>
			    <input type="text" class="form-control" style="width: 160px;margin-top:5px;"  id="fruitName" value="" placeholder="请输入水果名称">
			</div>
			<div id="searchNow" class="btn btn-info">立即搜索</div>
			<div id="clearSearch" class="btn btn-secondary">清空</div>
		</div>
		<div class="content">
			<ol id="productList">
			</ol>
		</div>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/bootstrap-table.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/locale/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		$(function() {
			initList('/listPurchase.action'); // 初始化商品信息
		});
		$('#searchNow').click(function(){ // 立即搜索
			var fruitName = $("#fruitName").val(); 
			initList('/listPurchase.action?fruitName='+fruitName);
		});
		$('#clearSearch').click(function(){
			$("#fruitName").val('');
			initList('/listPurchase.action');
		});
		function initList(url){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: url,
				acyns: false,
				success: function(s){
					var str = '<span class="noData">暂无数据！</span>';
					str = '';
					if(s.total>0){
						$(s.rows).each(function(m,n){
							str += '<li>'+
										'<div class="fruitImg"><img class="mainPic" src="${requestScope.path}'+n.pic+'" /><div>'+
										'<div class="fruitMsg">'+
											'<span>'+n.fruitName+'</span>'+
											'<span class="price">￥'+n.salePrice+'</span><span class="unit">/'+n.unit+'</span>'+
											'<input id="num_'+n.id+'" style="width:45px;height:25px;display:inline-block;margin-left: 5px;border-radius:5px;" type="number" title="请输入购买数量"/>'+
											'<img class="theCart" onclick="addToMyCart(\''+n.id+'\',\''+n.salePrice+'\')" title="加入购物车" src="ui/imgs/aui-icon-cart.png" />'+
										'</div>'+
									'</li>';
						});
					}
					$("#productList").html(str);
				},
				error: function(e){
					alert("数据查询失败！");
				}
			});
		}
		
		// 加入购物车
		function addToMyCart(fruitId, salePrice){
			var userId = "${sessionScope.user.id}";
			if(!userId){ // 用户未登录 跳转至登录页面
				alert("请先登录！");
				return false;
			}else{
				var buyNum = $("#num_"+fruitId).val();
				if(buyNum==null||buyNum==''||buyNum<1){
					alert("请正确输入购买数量！");
					return false;
				}
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/saveOrUpdateCart.action',
					data: {
							'userId': userId, 
							'purchaseId': fruitId,// 水果进货ID
							'purchaseNum': buyNum, // 购买数量
							'salePrice': salePrice, // 单价
						},
					async: false,
					success: function(s){
						alert("成功加入购物车！");
					},
					error: function(e){
						alert("加入购物车失败！");
					}
				});
			}
		}
	</script>
</html>
