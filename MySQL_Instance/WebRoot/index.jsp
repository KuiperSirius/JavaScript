<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
h1{
color:black;
text-align: center;

}
body{
color:white;
background-image: url(images/Desert.jpg);

}
#footer{

color:white;
text-align: center;
font-family:Arial;
font-size: 12px;
letter-spacing: 1px;
position:fixed;
bottom: 0;
}

</style>
  </head>
  
  <body>
  <h1>Login in this page with your private ID</h1>
  <hr />
  <img src="images/Lighthouse.jpg" align=right alt="No such a picture." width="300" height="200" border="1"/>
   <form method="post" action="action.jsp">
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
