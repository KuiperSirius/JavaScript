<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'do_edit_product.jsp' starting page</title>
    
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
      String id=request.getParameter("id");
    String type=request.getParameter("type");
    String name=request.getParameter("name");
    String price=request.getParameter("price");
     String quantity=request.getParameter("quantity");
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/database";
    String uname="root";
    String upass="123456";
  Connection con=DriverManager.getConnection(url, uname,upass);
    String sql="update shop_product set p_type=?,p_name=?,p_price=?,p_quantity=?";
    PreparedStatement pst=con.prepareStatement(sql);
    pst.setString(1, type);
    pst.setString(2, name);
    pst.setString(3, price);
    pst.setString(4,quantity);
    
    ResultSet rs=pst.executeQuery();
    int flag=pst.executeUpdate();
    if(flag>0){
    response.sendRedirect("index.jsp");
    }
   %>
  </body>
</html>
