package com.github.sirius.dosql;

import java.util.*;
import java.sql.*;
import com.github.sirius.beans.Product;
import com.github.sirius.dosql.impl.ProductDoSqlImpl;
import com.github.sirius.util.MyConnection;

public class ProductDoSql implements ProductDoSqlImpl{

	@Override
	public int addProduct(Product product){
		// TODO Auto-generated method stub
		int flag=0;
		try{
		Connection con=MyConnection.getConnection();
		String sql="insert into shop_product values(?,?,?,?,?,?)";
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setString(1, product.getType());
		pst.setString(2,product.getId());
		pst.setString(3, product.getName());
		pst.setDouble(4, product.getPrice());
		pst.setInt(5, product.getQuantity());
		pst.setString(6, product.getImage());
		flag=pst.executeUpdate();
		pst.close();
		con.close();}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return flag;
	}

	@Override
	public List selectProduct() {
		// TODO Auto-generated method stub
		Connection con=null;
		List products=new ArrayList();
		try{
		con=MyConnection.getConnection();
		String sql="select * from shop_product";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){
			Product product=new Product();
			product.setImage(rs.getString("p_image"));
			product.setId(rs.getString("p_id"));
			product.setName(rs.getString("p_name"));
			product.setPrice(rs.getDouble("p_price"));
			product.setQuantity(rs.getInt("p_quantity"));
			product.setType("p_type");
			products.add(products);
			
		}
		
		}catch(Exception e){
			e.printStackTrace();	
		}
		return products;
		
	}

}
