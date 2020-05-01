<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改密码</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style type="text/css">
			body{
				width: 100%;
				height: 100%;
			}
			form{
				width: 35%;
				height: 200px;
				text-align: center;
				margin: 10% auto;
				border: 1px solid #eee;
				border-radius: 5px;
				padding-top: 4%;
				padding-right: 1%;
			}
		</style>
	</head>
	<body>
		<form id="myForm">
			<input type="hidden" name="id" value="${sessionScope.user.id}">
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">新密码</label>
			    <div class="col-sm-8">
					<input type="text" class="form-control" id="colFormLabelSm" name="password" placeholder="请输入新的密码">
			    </div>
			    <div class="col-sm-2">
					<input type="button" id="updateNow" class="btn btn-primary" value="确定修改"/>
			    </div>
			</div>
		</form>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$("#updateNow").click(function(){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/updatePwd.action',
					data: $("#myForm").serialize(),
					async: false,
					success: function(s){
						alert("密码更新成功！");
						parent.location.reload(); //刷新父级页面
					},
					error: function(e){
						alert("密码更新失败！");
					}
				});
			});
		});
	</script>
</html>