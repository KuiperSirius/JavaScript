<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'edit_product.jsp' starting page</title>
    
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

    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/database";
    String uname="root";
    String upass="123456";
  Connection con=DriverManager.getConnection(url, uname,upass);
    String sql="select * from shop_product where p_id=?";
    PreparedStatement pst=con.prepareStatement(sql);
    pst.setString(1, id);
    
    ResultSet rs=pst.executeQuery();
   %>
    <form method="post" action="do_edit_product.jsp">
    商品id:
    <input type="text" name="id" value="<%=rs.getString("p_id")%>">
    <br>
    商品类别:
     <input type="text" name="type" value="<%=rs.getString("p_type")%>">
     <br>
     商品单价:
     <input type="text" name="price" value="<%=rs.getString("p_price")%>">
     <br>
    商品数量:
     <input type="text" name="quantity" value="<%=rs.getString("p_quantity")%>">
     <br> 
     <input type="submit" value="确定修改" />
     <input type="reset" name="reset" value="重置" />
    </form>




  </body>
</html>
