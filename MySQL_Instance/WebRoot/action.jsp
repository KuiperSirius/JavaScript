<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'action.jsp' starting page</title>
    
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
    
    String name=request.getParameter("name");
    String pass=request.getParameter("passwd");
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/database_name";
    String uname="root";
    String upass="123456";
    
    session.setAttribute("sName", name);
    session.setAttribute("sPass", pass);
    Connection con=DriverManager.getConnection(url, uname,upass);
   try{ 
    
     String sql="select * from user where uname=? and upass=?";
    session.setAttribute("sName", name);
    session.setAttribute("sPass", pass);
    PreparedStatement pst=con.prepareStatement(sql);
    pst.setString(1, name);
    pst.setString(2, pass);
    ResultSet rs=pst.executeQuery();
    if(rs.next()){
    response.sendRedirect("success.jsp");
    
    }else
    
     response.sendRedirect("index.jsp");
    }catch(SQLException e){
    System.out.println(e.toString());
    }
 
     con.close();
    
    
     %>   
       </body>
</html>
