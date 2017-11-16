<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>

<%
/*获取用户提交的注册信息*/
request.setCharacterEncoding("utf-8");
String uname = request.getParameter("uname");
String upassword = request.getParameter("upassword");
String upassword2 = request.getParameter("upassword2");
String uemail = request.getParameter("uemail");
String uaddress = request.getParameter("uaddress");
String utelephone = request.getParameter("utelephone");
if (!upassword.equals(upassword2)) {
%>
密码与确认密码不一致，
<a href="javascript:history.back(-1)">返回重新注册</a>
<%} else {
   try {
/* 建立连接 */
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        Connection conn = DriverManager.getConnection(url, "system","lucky123");
        System.out.println("数据库连接成功");
/*将用户信息添加到数据库*/
         String sql = "insert into shop_user(uname,upassword,uemail,uaddress,utelephone) values(?,?,?,?,?)";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, uname);
         ps.setString(2,upassword);
         ps.setString(3, uemail);         
ps.setString(4, uaddress);
         ps.setString(5, utelephone);
         int n = ps.executeUpdate();
         conn.close();
          if (n > 0) {/*若n>0表示注册成功，将用户名添加到session*/
                 session.setAttribute("username", uname);
                 response.sendRedirect("index.jsp");return;
           }
     } catch (Exception e) {/*出现异常，则说明注册失败*/
%>    注册失败！用户已存在，
         <a href="javascript:history.back(-1)">返回重新注册</a>
<%
          e.printStackTrace();
     }
}
%>


