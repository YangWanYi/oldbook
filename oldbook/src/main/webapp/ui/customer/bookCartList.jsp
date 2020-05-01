<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>购物车</title>
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
			#searchCart{
			    margin-top: 4px;
   	 			margin-left: 10px;
			}
		</style>
	</head>
	<body>
	
		<div id="toolbar">
			<div id="deleteCart" class="btn btn-danger">删除</div>
			<div id="submitOrder" class="btn btn-primary">提交订单</div>
			
		</div>
		<div class="searchItem">
			<span>水果</span>
		    <input type="text" class="form-control" style="width: 160px;margin-top:5px;"  id="fruitName" value="" placeholder="请输入水果">
			<div id="searchCart" class="btn btn-info">立即搜索</div>
			<div id="clearSearch" class="btn btn-secondary">清空</div>
		</div>
		
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
			initTable('/listCart.action?userId='+userId);
		});
		
		$('#searchCart').click(function(){ // 立即搜索
			var fruitName = $("#fruitName").val();
			initTable('/listCart.action?userId='+userId+'&fruitName='+fruitName);
		});
		$('#clearSearch').click(function(){
			$("#title").val('');
			initTable('/listCart.action');
		});
		$('#deleteCart').click(function(){
			var row = $table.bootstrapTable('getSelections');
			if(row.length == 0){
				alert("请选择数据！");
				return false;
			}
			var ids = "";
			for(var i=0;i<row.length;i++){
				if(row[i].state==1){
					alert('已提交订单不可删除！');
					ids = '';
					break;
				}
				ids += row[i].id+',';
			}
			if(ids!=''&&confirm('确定删除吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/deleteCart.action',
					data: {'ids': ids},
					async: false,
					success: function(s){
						initTable('/listCart.action?userId='+userId); // 重新加载数据
					},
					error: function(e){
						alert("删除失败！");
					}
				});
		    }
		});
		$('#submitOrder').click(function(){
			var row = $table.bootstrapTable('getSelections');
			if(row.length == 0){
				alert("请选择数据！");
				return false;
			}
			var ids = "";
			for(var i=0;i<row.length;i++){
				if(row[i].state==1){
					alert('不可重复提交订单！');
					ids = '';
					break;
				}
				ids += row[i].id+',';
			}
			if(ids!=''&&confirm('确定提交订单吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/saveOrUpdateOrder.action',
					data: {'ids': ids},
					async: false,
					success: function(s){
						alert("订单提交成功，请前往订单中心支付！");
						initTable('/listCart.action?userId='+userId); // 重新加载数据
					},
					error: function(e){
						alert("订单提交失败！");
					}
				});
		    }
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
			          field: 'id',
			          align: 'center',
			          valign: 'middle',
			          visible: false,
			        }, {
			          title: '水果',
			          field: 'fruitName',
			          align: 'center',
			          width: 100
			        },{
			          title: '价格',
			          field: 'salePrice',
			          halign: 'center',
			          width: 300,
			        },{
			          title: '数量',
			          field: 'purchaseNum',
			          halign: 'center',
			          width: 300,
			        },{
			          title: '是否提交订单',
			          field: 'state',
			          halign: 'center',
			          width: 300,
			          formatter: function (value, row, index) {
		                if (0==value) {
		                    return '否'; 
		                }else if (1==value) {
		                    return '是';
		                }
		              }
			        }
		        ]]
		    });
		  }
	</script>
</html>