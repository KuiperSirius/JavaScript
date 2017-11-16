<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>

<%
	/*
		request.setCharacterEncoding("utf-8");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "system";
			String pass = "lucky123";
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, pass);
			Statement st = conn.createStatement();
			String sql = "select * from shop_user where uname='" + uname
					+ "' and upassword='" + upass + "'";
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				session.setAttribute("username", uname);
				conn.close();
			}
			response.sendRedirect("index.jsp");
			return;
		} catch (Exception e) {
			System.out.println("数据库连接或访问失败");
			e.printStackTrace();

		}
	 */
%>
<%
	/*获取用户提交的登录信息*/
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("uname");
	String pass = request.getParameter("upass");
	try {
		/* 建立连接 */
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "system";
		String pwd = "lucky123";
		Connection conn = DriverManager.getConnection(url, user, pwd);
		/*查询表中的数据*/
		String sql = "select * from shop_user where uname=? and upassword=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, pass);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			session.setAttribute("username", name);
			conn.close();
			response.sendRedirect("index.jsp");
			return;
		} else {
%>

用户名或密码错误，
<a href="javascript:history.back(-1)">返回重新登录</a>
<%
	conn.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("数据库连接失败或SQL执行错误");
	}
%>

