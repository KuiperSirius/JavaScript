<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
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
    String key=request.getParameter("keyword");
    String sPage=request.getParameter("page");
    String name=request.getParameter("name");
    String pass=request.getParameter("passwd");
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/database";
    String uname="root";
    String upass="123456";
    int pageSize=5;
    int totalPage;
    int currentPage;
    int totalRow;
if(sPage==null)
currentPage=1;
else
currentPage=Integer.parseInt(sPage);
    Connection con=DriverManager.getConnection(url, uname,upass);
    String sql="select * from shop_product where p_name like ?";
    PreparedStatement pst=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE);
  //    pst.setString(1, name);
  //  pst.setString(2, pass);
  pst.setString(1, "%"+key+"%");
    ResultSet rs=pst.executeQuery();
    rs.last();
    totalRow=rs.getRow();
    totalPage=totalRow%pageSize==0?totalRow%pageSize:totalRow%pageSize+1;
    rs.absolute((currentPage-1)*pageSize+1);
 
    
  out.print("<table border=2>");
  out.print("<tr><td>商品编号</td><td>商品名词</td><td>商品类别</td><td></td></tr>");
   for(int i=1;i<=pageSize;i++){
   out.print("<tr>");
   out.print("<td><img src="+rs.getString("p_image")+"></td>");
    out.print("<td>"+rs.getString("p_id")+"</td>");
    out.print("<td>"+rs.getString("p_name")+"</td>");
     out.print("<td>"+rs.getString("p_type")+"</td>");
      out.print("<td>"+rs.getString("p_price")+"</td>");
      out.print("<td><a href=edit_product.jsp?id="+rs.getString("P_id")+">编辑</a></td>");
      out.print("<td><a href=del_product.jsp?id="+rs.getString("P_id")+">删除</a></td>");
    out.print("</tr>");
    if(!rs.next()){
    break;
    }
    
   }
   out.print("</table>");
  
    if(currentPage>1){
     %>  
     <a href="index.jsp?page=1 ">首页</a>
     <a href="index.jsp?page=<%=currentPage-1%>" >上一页</a>
     <%
     }
     if(currentPage<totalPage){
      %> 
       <a href="index.jsp?page=<%=currentPage+1%>" >首页</a>
     <a href="index.jsp?page=<%=totalPage%>" onclick=return confirm('确认删除')>尾页</a>
      <%
      }
      rs.close();pst.close();con.close();
       %>
      
      
       </body>
</html>
