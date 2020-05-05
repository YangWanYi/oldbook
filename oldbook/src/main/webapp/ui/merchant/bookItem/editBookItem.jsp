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
		<title>编辑书籍</title>
		<style type="text/css">
			*{
				padding: 0 0;
				margin: 0 0;
			}
			body{
				width: 90%;
				height: 90%;
				padding: 0px 5px;
			}
		</style>
	</head>
	<body>
		<form id="myForm" role="form">
			<input type="hidden" name="id" value="${requestScope.bookItemData.id}">
			<input type="hidden" name="shopId" value="${requestScope.bookItemData.shopId}">
			<input type="hidden" name="shopName" value="${requestScope.bookItemData.shopName}">
			<input type="hidden" name="cover" value="${requestScope.bookItemData.cover}">
			<input type="hidden" name="uploadTime" value="${requestScope.bookItemData.uploadTime}">
			<input type="hidden" name="pubtime" value="${requestScope.bookItemData.pubtime}">
			<input type="hidden" name="bookTypeId" value="${requestScope.bookItemData.bookTypeId}">
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">一级书籍类型</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="parentBookTypeName" name="parentBookTypeName" value="${requestScope.bookItemData.parentBookTypeName}" readonly="readonly">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">二级书籍类型</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="bookTypeName" name="bookTypeName" value="${requestScope.bookItemData.bookTypeName}" readonly="readonly">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">书籍名称</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="bookName" value="${requestScope.bookItemData.bookName}" placeholder="请输入书籍名称">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">售价（元）</label>
			    <div class="col-sm-6">
			      <input type="number" min=0 class="form-control" id="colFormLabelSm" name="salePrice" value="${requestScope.bookItemData.salePrice}" placeholder="请输入售价">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">库存（本）</label>
			    <div class="col-sm-6">
			      <input type="number" min=0 class="form-control" id="colFormLabelSm" name="amount" value="${requestScope.bookItemData.amount}" placeholder="请输入库存">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">作者</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="author" value="${requestScope.bookItemData.author}" placeholder="请输入作者">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">版次</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="edition" value="${requestScope.bookItemData.edition}" placeholder="请输入版次">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">纸张</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="paper" value="${requestScope.bookItemData.paper}" placeholder="请输入纸张">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">出版社</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="publisher" value="${requestScope.bookItemData.publisher}" placeholder="请输入出版社">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">装帧</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="graphic" value="${requestScope.bookItemData.graphic}" placeholder="请输入装帧">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">页数（页）</label>
			    <div class="col-sm-6">
			      <input type="number" min=0 class="form-control" id="colFormLabelSm" name="pagination" value="${requestScope.bookItemData.pagination}" placeholder="请输入页数">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">ISBN</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="isbn" value="${requestScope.bookItemData.isbn}" placeholder="请输入ISBN">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">开本</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="bookSize" value="${requestScope.bookItemData.bookSize}" placeholder="请输入开本">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">字数</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="wordCount" value="${requestScope.bookItemData.wordCount}" placeholder="请输入字数">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">简介</label>
			    <div class="col-sm-6">
			      <textarea class="form-control" id="colFormLabelSm" name="introduce" rows="5" placeholder="请输入简介">${requestScope.bookItemData.introduce}</textarea>
			    </div>
			</div>
		</form>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>
