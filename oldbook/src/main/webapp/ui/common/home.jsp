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
			*{
				padding: 0 0;
				margin: 0 0;
			}
			body{
				width: 100%;
				height: 100%;
				overflow-x: hidden; 
			}
			#contentLeft{
				width: 11%;
				padding-left: 10px;
				float: left;
			}
			#contentLeft ul li{
				list-style: none;
				cursor: pointer;
				line-height: 35px;
			}
			.titleOfBook{
			    text-align: left;
			    height: 35px;
			    line-height: 35px;
			    font-family: fantasy;
			    font-size: 18px;
			    border-left: 5px solid red;
			    margin: 10px 0px;
			    margin-left: 11%;
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
			#bookList{
				padding-left: 11%;
			}
		</style>  
	</head>
	<body>
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
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/swiper/js/swiper.js"> </script>  
	<script src="https://unpkg.com/swiper/js/swiper.min.js"> </script>
	<script type="text/javascript">
		$(function(){
			showItems();
			showBookList(null);
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
				data: {'parentBookTypeName': bookTypeName},
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
			top.$("#centerFrame").attr('src','/toViewBookItemPage.action?id='+bookId);
		}
	</script>
</html>