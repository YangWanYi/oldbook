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
		<title>书籍管理</title>
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
			#searchBookItem{
			    margin-top: 4px;
   	 			margin-left: 10px;
			}
		</style>
	</head>
	<body>
	
		<div id="toolbar">
			<div id="addBookItem" class="btn btn-primary" data-toggle="modal" data-target="#myModal">新增书籍</div>
			<div id="editBookItem" class="btn btn-success" data-toggle="modal" data-target="#myModal">编辑书籍</div>
			<div id="deleteBookItem" class="btn btn-danger">删除书籍</div>
			<div id="uploadPic" class="btn btn-warning" data-toggle="modal" data-target="#uploadModal">上传图片</div>
			
		</div>
		<div class="searchItem">
			<span>类型名称</span>
		    <input type="text" class="form-control" style="width: 160px;margin-top:5px;"  id="bookTypeName" value="" placeholder="请输入类型名称">
			<span>书籍名称</span>
		    <input type="text" class="form-control" style="width: 160px;margin-top:5px;"  id="bookName" value="" placeholder="请输入书籍名称">
			<div id="searchBookItem" class="btn btn-info">立即搜索</div>
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
		
		<!-- 模态框（Modal）上传图片  -->
		<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title" id="myModalLabel"></h4>
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		            </div>
		            <div class="modal-body">
						<iframe id="uploadIframe" width="100%" height="100%"></iframe>
					</div>
		            <div class="modal-footer">
		                <div class="btn btn-default" data-dismiss="modal">关闭</div>
		                <div class="btn uploadNow btn-primary">确定</div>
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
	<script src="https://cdn.bootcss.com/jquery.form/4.2.2/jquery.form.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/bootstrap-table.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-table/1.16.0/locale/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
		var $table = $('#table');
		$(function() {
			initTable('/listBookItem.action');
		});
		
		$('#searchBookItem').click(function(){ // 立即搜索
			var bookTypeName = $("#bookTypeName").val(); 
			var bookName = $("#bookName").val(); 
			initTable('/listBookItem.action?bookTypeName='+bookTypeName+'&bookName='+bookName);
		});
		$('#clearSearch').click(function(){
			$("#bookTypeName").val('');
			$("#bookName").val('');
			initTable('/listBookItem.action');
		});
		$('#addBookItem').click(function(){
			$("#winIframe").attr("src","/toAddBookItemPage.action");
			$('#myModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','600px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的标题
				$(this).find('.modal-title').text('新增书籍');// 修改modal的标题
			});
		});
		$('#deleteBookItem').click(function(){
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
					url: '/deleteBookItem.action',
					data: {'ids': ids},
					async: false,
					success: function(s){
						initTable('/listBookItem.action'); // 重新加载数据
					},
					error: function(e){
						alert("删除失败！");
					}
				});
		    }
		});
		$('#uploadPic').click(function(){ // 上传图片
			var row = $table.bootstrapTable('getSelections');
			if(row.length == 0){
				alert("请选择数据！");
				return false;
			}
			if(row.length > 1){
				alert("只能选择一条数据！");
				return false;
			}
			$("#uploadIframe").attr("src","/toUploadPage.action?id="+row[0].id);
			$('#uploadModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','500px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的标题
				$(this).find('.modal-title').text('上传书籍封面');// 修改modal的标题
			});
		});
		
		$('#editBookItem').click(function(){
			var row = $table.bootstrapTable('getSelections');
			if(row.length == 0){
				alert("请选择数据！");
				return false;
			}
			if(row.length > 1){
				alert("只能选择一条数据！");
				return false;
			}
			$("#winIframe").attr("src","/toUpdateBookItemPage.action?id="+row[0].id);
			$('#myModal').on('shown.bs.modal', function () {
				$(this).find('.modal-content').css('height','600px');// 修改modal的高度
				$(this).find('.modal-content').css('width','500px');// 修改modal的标题
				$(this).find('.modal-title').text('编辑书籍');// 修改modal的标题
			});
		});
		
		$(".saveNow").click(function(){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/saveOrUpdateBookItem.action',
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
		
		$(".uploadNow").click(function(){
			$("#uploadIframe").contents().find("#myUploadForm").submit();
			$('#uploadModal').modal('hide');
		});
		
		$("#myModal,#uploadModal").on("hidden.bs.modal", function() {
		    $(this).removeData("bs.modal");
		    initTable('/listBookItem.action'); // 重新加载数据
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
			          title: '父类型名称',
			          field: 'parentBookTypeName',
			          align: 'center',
			        }, {
			          title: ' 类型名称',
			          field: 'bookTypeName',
			          align: 'center',
			        }, {
			          title: '书名',
			          field: 'bookName',
			          align: 'center'
			        }, {
			          title: '封面',
			          field: 'cover',
			          align: 'center',
			          formatter: function (value, row, index) {
		                if (value) {
		                    return '<img onclick="showPic(\''+value+'\');" style="width: 50px;height:50px;" src="${requestScope.path}'+value+'"/>';
		                }
		              }
			        }, {
			          title: '售价',
			          field: 'salePrice',
			          align: 'center'
			        },{
			          title: '库存',
			          field: 'amount',
			          align: 'center'
			        },{
			          title: '作者',
			          field: 'author',
			          align: 'center'
			        },{
			          title: '版次',
			          field: 'edition',
			          align: 'center'
			        },{
			          title: '纸张',
			          field: 'paper',
			          align: 'center'
			        },{
			          title: '出版社',
			          field: 'publisher',
			          align: 'center'
			        },{
			          title: '装帧',
			          field: 'graphic',
			          align: 'center'
			        },{
			          title: '页数',
			          field: 'pagination',
			          align: 'center'
			        },{
			          title: 'ISBN',
			          field: 'isbn',
			          align: 'center'
			        },{
			          title: '开本',
			          field: 'bookSize',
			          align: 'center'
			        },{
			          title: '字数',
			          field: 'wordCount',
			          align: 'center'
			        },{
			          title: '简介',
			          field: 'introduce',
			          align: 'center'
			        },{
			          title: '出版时间',
			          field: 'pubtime',
			          align: 'center',
			          formatter: function (value, row, index) {
			        	  if(value){
			        		  return value.replace('T', ' ');
			        	  }
		              }
			        },{
			          title: '上架时间',
			          field: 'uploadTime',
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
