package com.restaurant.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.restaurant.Bean.ManageCategoryBean;

import com.restaurant.DBConnect.DBConnection;

public class ManageCategoryDAO {
	public ManageCategoryBean addCategory(ManageCategoryBean bean) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection con=DBConnection.getConn();
		String sql="INSERT INTO R_CATEGORY (CATEGORYNAME,CATEGORYSTATUS) VALUES(?,?)  ";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, bean.getCategory_name());
	ps.setString(2, bean.getCategory_status());
	ps.executeUpdate();
		return bean;
	}

	public ManageCategoryBean updateCategory(ManageCategoryBean bean) throws SQLException {
		// TODO Auto-generated method stub
		int id=bean.getCategory_id();
		System.out.println("id in updatestore is "+ id);
		Connection con=DBConnection.getConn();
		String sql="UPDATE  R_CATEGORY SET CATEGORYNAME=?,CATEGORYSTATUS=? WHERE id='"+id+"' ";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, bean.getCategory_name());
	ps.setString(2, bean.getCategory_status());
	//ps.setInt(3, bean.getId());
	int i=ps.executeUpdate();
	System.out.println("i is "+i);
	if(i>0)
	{
		
	}
		return bean;
	}

	
	public static ManageCategoryBean getRecordById(int id) throws SQLException
	{
		ManageCategoryBean bean=null;
		Connection con=DBConnection.getConn();
		String sql = "SELECT * FROM R_CATEGORY where ID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			bean=new ManageCategoryBean();
			
			bean.setCategory_id(rs.getInt(1));
			bean.setCategory_name(rs.getString(2));
			bean.setCategory_status(rs.getString(3));
			
		}
		return bean;
		
	}
}
