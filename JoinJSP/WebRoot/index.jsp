<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
  </head>
  
  <body>
    <%
    String userName=request.getParameter("name");
    String password=request.getParameter("passwd");
    if(userName==null){
     %>
    <h1>You don't have the access to login in the page.</h1>
    <h2>Please click<a href="Format.jsp">Login</a>,it will jump automatically in 3 seconds.</h2>
    <% 
    response.setHeader("refresh", "3;url=Format.jsp");
    }
    else{ %>
    
    <h2><%=userName%>,Congratulations.</h2>
   <%  
   session.setAttribute("USERNAME",userName);
   session.setAttribute("PSSWORD",password);
   response.setHeader("refresh", "4;url=Checkin.jsp");}
    %>
    
    
    
    
    
  </body>
</html>
