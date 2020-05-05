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
				overflow: hidden;
			}
			form{
				width: 100%;
				text-align: center;
			}
			#loginNow{
				margin-top: 5px;
			}
			.form-group{
				margin-top: 10px;
			}
		</style>
	</head>
	<body>
		<form id="myForm">
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="roleTypeX" id="roleTypeX" value="管理员" checked="checked">
			  <label class="form-check-label" for="inlineRadio1">管理员</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="roleTypeX" id="roleTypeX" value="商家">
			  <label class="form-check-label" for="inlineRadio2">商家</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="roleTypeX" id="roleTypeX" value="客户">
			  <label class="form-check-label" for="inlineRadio3">客户</label>
			</div>
			<div class="form-group row">
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="account" name="account" value="" placeholder="请输入用户名">
			    </div>
			</div>
			<div class="form-group row">
			    <div class="col-sm-6">
			      <input type="password" class="form-control" id="password" name="password" value="" placeholder="请输入密码">
			    </div>
			</div>
			<input type="button" id="loginNow" class="btn btn-primary" value="确定登录"/>
		</form>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$("#loginNow").click(function(){
				var roleTypeX = $('input[name="roleTypeX"]:checked').val(); 
				var account = $("#account").val();
				var password = $("#password").val();
				if(roleTypeX==null||roleTypeX==''){
					alert("请选择角色！");
					return false;
				}
				if(account==null||account==''){
					alert("请输入账户名！");
					return false;
				}
				if(password==null||password==''){
					alert("请输入密码！");
					return false;
				}
				$.ajax({
					type: 'post',
					dataType: 'json',
					url: '/login.action',
					data: $("#myForm").serialize(),
					async: false,
					success: function(s){
						if(roleTypeX.indexOf("管理员")!=-1){ // 跳转至管理员界面
							parent.location.href = '../admin/index.jsp';
						}else if(roleTypeX.indexOf("商家")!=-1){ // 跳转至商家界面
							parent.location.href = '../merchant/index.jsp';
						}else if(roleTypeX.indexOf("客户")!=-1){ // 跳转至客户界面
// 							parent.location.href = '../customer/index.jsp';
							parent.location.reload();
						}
					},
					error: function(e){
						alert("登录失败，可能是角色选错，或用户名、密码错误！");
					}
				});
			});
		});
	</script>
</html>