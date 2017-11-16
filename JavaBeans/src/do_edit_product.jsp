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
	    String name=request.getParameter("name");
	    String type=request.getParameter("type");
	    String price=request.getParameter("price");
	    String quantity=request.getParameter("quantity");
	    String driverName="com.mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/sqldb";
    String uname="root";
    String upass="123456";
    Class.forName(driverName);
    Connection con=DriverManager.getConnection(url,uname,upass);
    String sql="update shop_product set p_name=?,p_type=?,p_price=?,p_quantity=? where p_id=?";
    PreparedStatement pst=con.prepareStatement(sql);
    pst.setString(1,name);
    pst.setString(2,type);
    pst.setDouble(3,Double.parseDouble(price));
    pst.setInt(4,Integer.parseInt(quantity));
    pst.setString(5,id);
    int flag=pst.executeUpdate();
    if(flag>0)
       response.sendRedirect(path+"/admin/index.jsp");
	pst.close();
	con.close();
	System.out.print(path);
	
	
	
	
	
	
	 %>

	</body>
</html>
