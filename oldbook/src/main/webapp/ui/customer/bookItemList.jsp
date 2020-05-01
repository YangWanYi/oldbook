<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的订单</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link href="https://cdn.bootcss.com/bootstrap-table/1.16.0/bootstrap-table.css" rel="stylesheet">
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
			#winIframe{
				height: 100%;
				width: 100%;
				border: none;
			}
			.modal{
				margin: 5% auto;
			}
			#toolbar{
				float: left;
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
				float: left;
				padding: 5px 10px;
			}
			#searchOrder{
			    margin-top: 4px;
   	 			margin-left: 10px;
			}
		</style>
	</head>
	<body>
        
		<!-- 模态框（Modal） -->
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
		<table
		  id="table"
		  data-toolbar="#toolbar"
		  data-pagination="true"
		  data-id-field="id"
		  data-page-list="[20, 25, 50, 100, all]"
		  data-show-footer="false"
		  data-side-pagination="server">
		</table>
		
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/bootstrap-table.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/locale/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		var $table = $('#table');
		var userId = "${sessionScope.user.id}";
		$(function() {
			initTable('/listOrder.action?userId='+userId);
		});

		function initTable(url) {
			$table.bootstrapTable('destroy').bootstrapTable({
				height:$(window).height(),
				url: url,
				columns: [[
					{
			          checkbox: true,
			          align: 'center',
					}, {
			          title: '单号',
			          field: 'id',
			          align: 'center',
			          valign: 'middle',
			        }, {
			          title: '订单状态',
			          field: 'orderState',
			          align: 'center',
			          valign: 'middle',
			          width: 100,
			          formatter: function (value, row, index) {
			        	  if("1"==value){
			        		  value = "已支付";
			        	  }else if("0"==value){
			        		  value = "未支付"
			        	  }
	                    return value;
		              }
			        },{
			          title: '下单总额（元）',
			          field: 'totalPrice',
			          align: 'center',
			          valign: 'middle',
			          width: 300,
			        },{
			          title: '邮费（元）',
			          field: 'postage',
			          align: 'center',
			          valign: 'middle',
			          width: 300,
			        },{
			          title: '下单时间',
			          field: 'createTime',
			          align: 'center',
			          valign: 'middle',
			          width: 300,
			          formatter: function (value, row, index) {
			        	  if(value){
			        		  return value.replace('T', ' ');
			        	  }
		              }
			        },{
			          title: '预计送达时间',
			          field: 'planDeliveryTime',
			          align: 'center',
			          valign: 'middle',
			          width: 300,
			          formatter: function (value, row, index) {
			        	  if(value){
			        		  return value.replace('T', ' ');
			        	  }
		              }
			        },{
			          title: '付款时间',
			          field: 'payTime',
			          align: 'center',
			          valign: 'middle',
			          width: 300,
			          formatter: function (value, row, index) {
			        	  if(value){
			        		  return value.replace('T', ' ');
			        	  }
		              }
			        },{
		        	  title: '操作',
			          field: 'rec',
			          align: 'center',
			          valign: 'middle',
			          width: 500,
			          formatter: function (value, row, index) {
			        	var sum = (row.postage==null?0:row.postage)+(row.totalPrice==null?0:row.totalPrice);
	                    var text = '<a onclick="showFruits(\''+row.id+'\');" style="margin-right: 10px;color:#fff;" class="btn btn-primary"  data-toggle="modal" data-target="#myModal">查看相关水果<a/>'
	                    		if(row.orderState!='1'){
	                    			text += '<a onclick="payNow(\''+row.id+'\',\''+sum+'\');" style="color:#fff;margin-right: 10px;" class="btn btn-success">立即支付<a/>'
		                    		text += '<a onclick="deleteOrder(\''+row.id+'\');" style="color:#fff;" class="btn btn-danger">删除订单<a/>'
	                    		}
	                    return text;
		              }
			        }
		        ]]
		    });
		  }
		function showFruits(id){
			$("#winIframe").attr("src","/toorderFruitListPage.action?id="+id);
			$('#myModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','600px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的标题
				$(this).find('.modal-title').text('订单相关水果');// 修改modal的标题
			});
		}
		
		function payNow(orderId,sum){
			var balance = "${sessionScope.user.balance}";
			var myMoney = balance==null?0:parseInt(balance);
			if(myMoney<sum){
				alert('余额不足，请先充值！');
				return false;
			}
			if(confirm('总计'+sum+'元,确定支付吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/payOrder.action',
					data: {'id': orderId},
					async: false,
					success: function(s){
						alert("支付成功，请耐心等待水果到家！");
						initTable('/listOrder.action?userId='+userId); // 重新加载数据
					},
					error: function(e){
						alert("支付失败！");
					}
				});
		    }
		}
		function deleteOrder(orderId){
			if(confirm('确定删除吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/deleteOrder.action',
					data: {'id': orderId},
					async: false,
					success: function(s){
						alert("删除成功！");
						initTable('/listOrder.action?userId='+userId); // 重新加载数据
					},
					error: function(e){
						alert("删除失败！");
					}
				});
		    }
		}
	</script>
</html>