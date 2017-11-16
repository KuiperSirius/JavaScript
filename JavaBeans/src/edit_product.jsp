<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
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

		<title>My JSP 'add_product.jsp' starting page</title>

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
       String driverName="com.mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/sqldb";
    String uname="root";
    String upass="123456";
    Class.forName(driverName);
    Connection con=DriverManager.getConnection(url,uname,upass);
    String sql="select * from shop_product where p_id=?";
    PreparedStatement pst=con.prepareStatement(sql);
    pst.setString(1, id);
    ResultSet rs=pst.executeQuery();
     rs.next();
      %>
	
			
		<h3>
			商品信息编辑
		</h3>
		<form action="admin/do_edit_product.jsp" method="post">
			商品编号:
			<input type="text" name="id" value="<%=rs.getString("p_id")%>">
			<br>
			商品类别：
			<input type="text" name="type" value="<%=rs.getString("p_type")%>">
			<br>
			商品名称：
			<input type="text" name="name" value="<%=rs.getString("p_name") %>" >
			<br>
			商品单价：
			<input type="text" name="price"  value="<%=rs.getDouble("p_price")%>">
			<br>
			商品数量：
			<input type="text" name="quantity" value="<%=rs.getInt("p_quantity") %>" >
			<br>
			<input type="submit" value="确定修改">
		</form>
          <%
          rs.close();
          pst.close();
          con.close();
          
          
           %>
	</body>
</html>
