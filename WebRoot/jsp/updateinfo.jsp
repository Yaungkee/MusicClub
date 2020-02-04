<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h3>个人资料</h3>
    <hr>
    <div>
    	<form action="updateinfo" method="post">
    		用户名：<input type="text" name="username"/><br>
    		个人介绍：<input type="text" name"introduce"/><br>
    		<input type="radio" name="sex" value="男">男
			<input type="radio" name="sex" value="女">女
			<input type="radio" name="sex" value="保密">保密<br>
    		<input type="submit" name="submit" value="保存">
    	<form>
    </div>
  </body>
</html>
