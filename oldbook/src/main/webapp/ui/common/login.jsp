<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户登录</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style type="text/css">
			body{
				width: 100%;
				height: 100%;
			}
			form{
				width: 30%;
				text-align: center;
				margin: 5% auto;
				border: 1px solid #eee;
				border-radius: 5px;
				padding: 10px;
			}
		</style>
	</head>
	<body>
		<form id="myForm">
			<div class="form-group">
				<label for="exampleInputAccount">用户名</label>
				<input type="text" class="form-control" id="exampleInputAccount" name="account">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword">密码</label>
				<input type="password" class="form-control" id="exampleInputPassword" name="password">
			</div>
			<input type="button" id="loginNow" class="btn btn-primary" value="登录"/>
		</form>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$("#loginNow").click(function(){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/login.action',
					data: $("#myForm").serialize(),
					async: false,
					success: function(s){
						if(s.userId){
							parent.location.reload(); //刷新父级页面
						}else{
							alert("登录失败！");
						}
					},
					error: function(e){
						alert("登录失败！");
					}
				});
			});
		});
	</script>
</html>