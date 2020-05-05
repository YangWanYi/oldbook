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
		<title>新增书籍</title>
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
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">一级书籍类型</label>
			    <div class="col-sm-10">
					<select class="form-control" name="parentTypeId" id="parentTypeId" onchange="listBookTypeTwo(value);">
					
					</select>
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">二级书籍类型</label>
			    <div class="col-sm-10">
					<select class="form-control" name="bookTypeId" id="bookTypeId">
					
					</select>
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">书籍名称</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="bookName" value="" placeholder="请输入书籍名称">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">售价（元）</label>
			    <div class="col-sm-6">
			      <input type="number" min=0 class="form-control" id="colFormLabelSm" name="salePrice" value="" placeholder="请输入售价">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">库存（本）</label>
			    <div class="col-sm-6">
			      <input type="number" min=0 class="form-control" id="colFormLabelSm" name="amount" value="" placeholder="请输入库存">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">作者</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="author" value="" placeholder="请输入作者">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">版次</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="edition" value="" placeholder="请输入版次">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">纸张</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="paper" value="" placeholder="请输入纸张">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">出版社</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="publisher" value="" placeholder="请输入出版社">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">装帧</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="graphic" value="" placeholder="请输入装帧">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">页数（页）</label>
			    <div class="col-sm-6">
			      <input type="number" min=0 class="form-control" id="colFormLabelSm" name="pagination" value="" placeholder="请输入页数">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">ISBN</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="isbn" value="" placeholder="请输入ISBN">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">开本</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="bookSize" value="" placeholder="请输入开本">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">字数</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="wordCount" value="" placeholder="请输入字数">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">出版时间</label>
			    <div class="col-sm-6">
			      <input type="date" class="form-control" id="colFormLabelSm" name="pubtime" value="" placeholder="请输入出版时间">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">简介</label>
			    <div class="col-sm-6">
			      <textarea class="form-control" id="colFormLabelSm" name="introduce" rows="5" placeholder="请输入简介"></textarea>
			    </div>
			</div>
		</form>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			listBookTypeOne();
		});
		
		function listBookTypeOne(){
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
							if(m==0){
								listBookTypeTwo(n.id);
							}
							str += '<option value="'+n.id+'">'+n.typeName+'</option>';
						});
					}
					$("#parentTypeId").html(str);
				},
				error: function(e){
					alert("一级书籍类型查询失败！");
				}
			});
		}
		
		function listBookTypeTwo(pId){
			$.ajax({
				type: 'post',
				dataType: 'json',
				url: '/listBookType.action',
				data: {'pNameForSearch': pId},
				async: false,
				success: function(s){
					var str = "";
					if(s.total>0){
						$(s.rows).each(function(m,n){
							str += '<option value="'+n.id+'">'+n.typeName+'</option>';
						});
					}
					$("#bookTypeId").html(str);
				},
				error: function(e){
					alert("二级书籍类型查询失败！");
				}
			});
		}
	</script>
</html>
