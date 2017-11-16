package com.github.sirius.util;
import java.sql.*;


public class MyConnection {
private static Connection con;
public static Connection getConnection() throws Exception{
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/sqldb";
	String name="root";
	String pass="123456";
	Class.forName(driver);
	Connection con=DriverManager.getConnection(url,name,pass);
	return con;
	
}



}
