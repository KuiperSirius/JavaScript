<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户注册</title>
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
		<h3>用户注册</h3><hr>
<form action="do_reg.jsp" method="post"> 
用户名：　<input type="text" name="uname"><br> 
密　码：　<input type="password" name="upassword"><br> 
确认密码：<input type="password" name="upassword2"><br> 
Email:　　<input type="text" name="uemail"><br> 
地址：　　<input type="text" name="uaddress"><br> 
电话：　　<input type="text" name="utelephone"><br>
<input type="submit" value="注册">&nbsp;
<input type="reset" value="重置">
</form>
		


	</body>
</html>
