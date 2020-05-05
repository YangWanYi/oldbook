<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.oldbook.domain.UserDo;"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<title>编辑用户</title>
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
		<form id="myForm">
			<input type="hidden" name="id" value="${requestScope.userData.id}">
			<input type="hidden" name="createTime" value="${requestScope.userData.createTime}">
			<input type="hidden" name="password" value="${requestScope.userData.password}">
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">姓名</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="userName" value="${requestScope.userData.userName}" placeholder="请输入姓名">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">性别</label>
			    <div class="col-sm-10">
					<select class="form-control" name="gender" id="gender">
						<option value="0">男</option>
						<option value="1">女</option>
					</select>
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">角色</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="roleTypeX" value="${requestScope.userData.roleTypeX}" readonly="readonly">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">用户名</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="colFormLabelSm" name="account" value="${requestScope.userData.account}" placeholder="请输入用户名">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">联系方式</label>
			    <div class="col-sm-10">
			      <input type="number" maxlength="11" class="form-control" id="colFormLabelSm" name="phoneNum" value="${requestScope.userData.phoneNum}" placeholder="请输入您的联系方式">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">邮箱地址</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" id="colFormLabelSm" name="email" value="${requestScope.userData.email}" placeholder="请输入邮箱地址">
			    </div>
			</div>
			<div class="form-group row">
			    <label for="colFormLabelSm" class="col-sm-2 col-form-label">收货地址</label>
			    <div class="col-sm-10">
			    	<textarea class="form-control" id="exampleFormControlTextarea1" name="address" rows="9" placeholder="请输入收货地址">${requestScope.userData.address}</textarea>
			    </div>
			</div>
		</form>
	</body>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$('#gender').find('option[value="${requestScope.userData.gender}"]').attr('selected','selected'); // 性别回显
		});
	</script>
</html>
