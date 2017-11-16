<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <h3>商品信息添加</h3>
    <form action="admin/do_add_product.jsp" method="post">
    商品id：<input type="text" name="id"><br>
    商品类别：<input type="text" name="type"><br>
    商品名称：<input type="text" name="name"><br>
    商品图片：<input type="text" name="image"><br>
    商品单价：<input type="text" name="price"><br>
    商品数量：<input type="text" name="quantity"><br>
    商品描述：<br>
    <textarea rows="6" cols="40" name="description"></textarea><br>
    <input type="submit" value="添加商品">
    </form>

  </body>
</html>
