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

		<title>用户登录与注册案例</title>
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
    String driverName="com.mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/sqldb";
    String uname="root";
    String upass="123456";
    Class.forName(driverName);
    Connection con=DriverManager.getConnection(url,uname,upass);
    String sql="select * from shop_product";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery(sql);
    out.print("<table border=1>");
    out.print("<tr><td>商品图片</td><td>商品类别</td><td>商品名称</td><td>商品价格</td><td>商品数量</td><td>操作</td></tr>");
    while(rs.next()){
       out.print("<tr>");
       out.print("<td><img src="+rs.getString("p_image")+"></td>");
       out.print("<td>"+rs.getString("p_type")+"</td>");
       out.print("<td>"+rs.getString("p_name")+"</td>");
       out.print("<td>"+rs.getDouble("p_price")+"</td>");
       out.print("<td>"+rs.getInt("p_quantity")+"</td>");
       out.print("<td><a href=admin/edit_product.jsp?id="+rs.getString("p_id")+">编辑</a>");
       out.print("<a href=admin/del_product.jsp?id="+rs.getString("p_id")+">删除</a></td></tr>");
    
    }
    
    rs.close();st.close();con.close();
    
     %>
		
		
		
		
		
		
		
		
	</body>
</html>
