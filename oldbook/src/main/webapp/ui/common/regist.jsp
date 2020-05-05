<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户注册</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style type="text/css">
			body{
				width: 100%;
				height: 100%;
				overflow: hidden;
			}
			form{
				width: 100%;
				text-align: center;
			}
			#registNow{
				margin-top: 15px;
			}
		</style>
	</head>
	<body>
		<form id="myForm">
			<!-- 默认注册为客户 -->
			<input type="hidden" name="roleType" value="2">
			<input type="hidden" name="roleTypeX" value="客户">
			<div class="form-group row">
			    <div class="col-sm-6">
			      <input type="text" class="form-control" autocomplete="off" id="account" name="account" value="" placeholder="请输入用户名">
			    </div>
			</div>
			<div class="form-group row">
			    <div class="col-sm-6">
			      <input type="password" class="form-control" autocomplete="off" id="password" name="password" value="" placeholder="请输入密码">
			    </div>
			</div>
			<input type="button" id="registNow" class="btn btn-primary" value="免费注册"/>
		</form>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$("#registNow").click(function(){
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/saveOrUpdateUser.action',
					data: $("#myForm").serialize(),
					async: false,
					success: function(s){
						parent.location.reload(); //刷新父级页面
					},
					error: function(e){
						alert("注册失败！");
					}
				});
			});
		});
	</script>
</html>