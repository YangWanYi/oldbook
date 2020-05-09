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
		<title>店铺列表</title>
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
			.eachShop{
				float: left;
			    border: 1px solid gray;
			    border-radius: 5px;
			    padding: 5px;
			    width: 310px;
			    min-height: 360px;
			    margin: 10px;
			}
			.shopName{
				font-family: monospace;
			    font-size: 18px;
			    font-weight: bold;
			}
			.item{
				font-size: 14px;
			    font-weight: 100;
			    padding-left: 5px;
			    line-height: 25px;
			    color: gray;
			}
			.noData{
				font-size: 23px;
				color: gray;
			}
		</style>
	</head>
	<body>
		<div id="theShopList"></div>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/bootstrap-table.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/locale/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		$(function() {
			initList('/listShop.action?shopName=${requestScope.shopData.shopName}'); // 初始化店铺信息
		});
		
		function initList(url){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: url,
				acyns: false,
				success: function(s){
					var str = '';
					if(s.total>0){
						$(s.rows).each(function(m,n){
							str += '<div class="eachShop" onClick="showDetail(\''+n.id+'\');">'
								+'<div class="shopName">'+n.shopName+'</div>'
								+'<div class="item">店主：'+n.userName+'</div>'
								+'<div class="item">联系方式：'+n.contactNum+'</div>'
								+'<div class="item">店铺地址：'+n.address+'</div>'
								+'<div class="item">店铺公告：'+n.notice+'</div>'
						+'</div>';
						});
					}else{
						str = '<span class="noData">暂无数据！</span>';
					}
					$("#theShopList").html(str);
				},
				error: function(e){
					alert("数据查询失败！");
				}
			});
		}
		
		function showDetail(bookId){
			top.$("#centerFrame").attr('src','/toShopDetail.action?id='+bookId);
		}
	</script>
</html>
