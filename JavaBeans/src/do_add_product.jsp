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
	<jsp:useBean id="product" scope="session" class="com.github.sirius.beans.Product"></jsp:useBean>
	<jsp:setProperty property="*" name="product"/>
	<jsp:getProperty property="id" name="product"/><br>
	<jsp:getProperty property="type" name="product"/><br>
	<jsp:getProperty property="name" name="product"/><br>
	<jsp:getProperty property="price" name="product"/><br>

	
	
		<%
			/*获取用户提交的注册信息*/
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String type = request.getParameter("type");
			String name = request.getParameter("name");
			String image = request.getParameter("image");
			String price = request.getParameter("price");
			String quantity = request.getParameter("quantity");
			String description = request.getParameter("description");
			try {
				/* 建立连接 */
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@localhost:1521:orcl";
				String user = "system";
				String pass = "Sa123456";
				Connection conn = DriverManager.getConnection(url, user, pass);
				System.out.println("数据库连接成功");
				/*查询表中的数据*/
				String sql = "insert into shop_product(p_id,p_type,p_name,p_image,p_price,p_quantity,p_description,p_time) values(?,?,?,?,?,?,?,sysdate) ";
				PreparedStatement smt = conn.prepareStatement(sql);
				smt.setString(1, id);
				smt.setString(2, type);
				smt.setString(3, name);
				smt.setString(4, image);
				smt.setFloat(5, Float.parseFloat(price));
				smt.setInt(6, Integer.parseInt(quantity));
				smt.setString(7, description);
				int f=smt.executeUpdate();
				conn.close();
				if(f>0){
				response.sendRedirect(path+"/admin/index.jsp");
				}else{
				%>
				<a href="javascript:history.back(-1);">返回重新添加</a>
				<%
				}
		
			/*关闭连接*/
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>


	</body>
</html>
