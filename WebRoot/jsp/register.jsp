<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="resources/layui/css/layui.css">
	<script>
		layui.use(['form'],function(){})
	</script>
	<style>
		center{
		margin-left:35%;
		margin-top:10%;
		max-width:30%;
		background-color:#FFB800;
		}
		form{
		position:relative;
		margin-top:10%;
		}
	</style>
  </head>
  
  <body class="layui-bg-green">
    <center class="layui-icon">
    	<form class="layui-form" name="registerform" action="" method="post">
    		<div class="layui-form-item" style="">
			    <label class="layui-form-label">&#xe66f;用户名</label>
			    <div class="layui-input-block">
			      <input type="text" name="username" maxlength="10" required  lay-verify="required" placeholder="请输入不长于10个字符的用户名" autocomplete="off" class="layui-input">
			    </div>
			</div>
			 <div class="layui-form-item">
			    <label class="layui-form-label">&#xe673;密码</label>
			    <div class="layui-input-inline">
			      <input type="password" name="userpassword" maxlength="16" required lay-verify="required" placeholder="请输入不长于16位的密码" autocomplete="off" class="layui-input">
			    </div>
			    <div class="layui-form-mid layui-word-aux">辅助文字</div>
			 </div>
    		<div class="layui-form-item">
			    <label class="layui-form-label">&#xe673;确认密码</label>
			    <div class="layui-input-inline">
			      <input type="password" name="reuserpassword" maxlength="16" required lay-verify="required" placeholder="请输入不长于16位的密码" autocomplete="off" class="layui-input">
			    </div>
			    <div class="layui-form-mid layui-word-aux">辅助文字</div>
			 </div>
			 <div>
			 	<input type="submit" class="layui-btn layui-btn-lg layui-btn-normal"></input>
			 </div>
			 	<a href="jsp/login.jsp"><button class="layui-btn layui-btn-primary">已有账号</button></a>
    	</form>
    		
    </center>
  </body>
</html>
