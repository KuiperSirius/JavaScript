<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Format.jsp' starting page</title>
    
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
  <form method="post" action="index.jsp">
    <table>
    <tr>
    <td>Please input your name:</td>
    <td><input type="text" name="name" /></td>
    </tr>
    <tr>
    <td>Please input your password:</td>
    <td><input type="password" name="passwd" /></td>
    </tr>
    <tr>
    
    <td><input type="submit" name="Submit" value="Submit" /></td>
    <td><input type="reset" name="reset" value="Reset" /></td>
    </tr>
    </table>
    </form>
  </body>
</html>
