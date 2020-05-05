<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.oldbook.domain.BookItemDo;"%>
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
		<title>书籍类型</title>
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
			#winIframe,#uploadIframe{
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
			#searchBookType{
			    margin-top: 4px;
   	 			margin-left: 10px;
			}
		</style>
	</head>
	<body>
	
		<div id="toolbar">
			<div id="addBookType" class="btn btn-primary" data-toggle="modal" data-target="#myModal">新增书籍类型</div>
			<div id="editBookType" class="btn btn-success" data-toggle="modal" data-target="#myModal">编辑书籍类型</div>
			<div id="deleteBookType" class="btn btn-danger">删除书籍类型</div>
			
		</div>
		<div class="searchItem">
			<span>类型名称</span>
		    <input type="text" class="form-control" style="width: 160px;margin-top:5px;"  id="typeName" value="" placeholder="请输入类型名称">
			<span>父类型名称</span>
		    <input type="text" class="form-control" style="width: 160px;margin-top:5px;"  id="parentTypeName" value="" placeholder="请输入父类型名称">
			<div id="searchBookType" class="btn btn-info">立即搜索</div>
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
		  data-pagination="false"
		  data-id-field="id"
		  data-page-list="[20, 25, 50, 100, all]"
		  data-show-footer="false"
		  data-side-pagination="server">
		</table>
		
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery.form/4.2.2/jquery.form.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/bootstrap-table.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/locale/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		var $table = $('#table');
		$(function() {
			initTable('/listBookType.action');
		});
		
		$('#searchBookType').click(function(){ // 立即搜索
			var parentTypeName = $("#parentTypeName").val(); 
			var typeName = $("#typeName").val(); 
			initTable('/listBookType.action?parentTypeName='+parentTypeName+'&typeName='+typeName);
		});
		$('#clearSearch').click(function(){
			$("#parentTypeName").val('');
			$("#typeName").val('');
			initTable('/listBookType.action');
		});
		$('#addBookType').click(function(){
			$("#winIframe").attr("src","addBookType.jsp");
			$('#myModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','600px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的标题
				$(this).find('.modal-title').text('新增书籍类型');// 修改modal的标题
			});
		});
		$('#deleteBookType').click(function(){
			var row = $table.bootstrapTable('getSelections');
			if(row.length == 0){
				alert("请选择数据！");
				return false;
			}
			var ids = "";
			$(row).each(function(m,n){
				ids += n.id+',';
			});
			if(confirm('确定删除吗？')){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/deleteBookType.action',
					data: {'ids': ids},
					async: false,
					success: function(s){
						initTable('/listBookType.action'); // 重新加载数据
					},
					error: function(e){
						alert("删除失败！");
					}
				});
		    }
		});
		
		$('#editBookType').click(function(){
			var row = $table.bootstrapTable('getSelections');
			if(row.length == 0){
				alert("请选择数据！");
				return false;
			}
			if(row.length > 1){
				alert("只能选择一条数据！");
				return false;
			}
			$("#winIframe").attr("src","/toUpdateBookTypePage.action?id="+row[0].id);
			$('#myModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','600px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的标题
				$(this).find('.modal-title').text('编辑书籍类型');// 修改modal的标题
			});
		});
		
		$(".saveNow").click(function(){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/saveOrUpdateBookType.action',
				data: $("#winIframe").contents().find("#myForm").serialize(),
				async: false,
				success: function(s){
					$('#myModal').modal('hide');
				},
				error: function(e){
					alert("保存失败！");
				}
			});
		});
		
		$("#myModal").on("hidden.bs.modal", function() {
		    $(this).removeData("bs.modal");
		    initTable('/listBookType.action'); // 重新加载数据
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
			        },{
			          title: ' 父类型名称',
			          field: 'parentTypeName',
			          align: 'center',
			        },{
			          title: ' 类型名称',
			          field: 'typeName',
			          align: 'center',
			        },{
			          title: '创建时间',
			          field: 'createTime',
			          align: 'center',
			          formatter: function (value, row, index) {
			        	  if(value){
			        		  return value.replace('T', ' ');
			        	  }
		              }
			        },{
			          title: '修改时间',
			          field: 'updateTime',
			          align: 'center',
			          formatter: function (value, row, index) {
			        	  if(value){
			        		  return value.replace('T', ' ');
			        	  }
		              }
			        }
		        ]]
		    });
		  }
		
		function showPic(value){
			window.open('${requestScope.path}'+value);
		}
	</script>
</html>
