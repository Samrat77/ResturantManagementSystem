package com.restaurant.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.Bean.ManageStoreBean;
import com.restaurant.Bean.ManageTableBean;
import com.restaurant.DBConnect.DBConnection;

public class ManageTableDAO {

	public ManageTableBean addtable(ManageTableBean bean) throws SQLException {
		System.out.println("inside");
		Connection con=DBConnection.getConn();
		String sql="INSERT INTO R_TABLE (TNAME,TCAPACITY,TSTATUS,TSTOREID) VALUES"
				+ "(?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, bean.getTable_name());
		ps.setString(2, bean.getTable_cap());
		ps.setString(3, bean.getStatus());
		ps.setInt(4, bean.getStore());
		int i=ps.executeUpdate();
		System.out.println("i is "+i);
		return bean;
		
		
	}
	
	public static ManageTableBean getRecordById(int id) throws SQLException
	{
		ManageTableBean bean=null;
		Connection con=DBConnection.getConn();
		String sql = "SELECT * FROM R_TABLE where ID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			bean=new ManageTableBean();
			
			bean.setTid(rs.getInt(1));
			
			bean.setTable_name(rs.getString(2));
			
			bean.setTable_cap(rs.getString(3));
			bean.setStatus(rs.getString(4));
			bean.setStore(rs.getInt(5));
			//bean.setStatus(rs.getString(3));
			
		}
		return bean;
		
	}

	public static List list() throws SQLException {
		ArrayList list=new ArrayList<>();
		Connection con=DBConnection.getConn();
		PreparedStatement ps=con.prepareStatement("SELECT * FROM R_TABLE");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			ManageTableBean bean=new ManageTableBean();
			bean.setTid(rs.getInt(1));
			bean.setTable_name(rs.getString(2));
			bean.setTable_cap(rs.getString(3));
			bean.setStatus(rs.getString(4));
			bean.setStore(rs.getInt(5));
			list.add(bean);
		}
		return list;
	}

	public ManageTableBean updateTable(ManageTableBean bean) throws SQLException {
		// TODO Auto-generated method stub
		
		int id=bean.getTid();
		System.out.println("id in updatestore is "+ id);
		Connection con=DBConnection.getConn();
		String sql="UPDATE  R_TABLE SET TNAME=?,TCAPACITY=?,TSTATUS=?,TSTOREid=? WHERE id='"+id+"' ";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, bean.getTable_name());
	ps.setString(2, bean.getTable_cap());
	ps.setString(3, bean.getStatus());
	ps.setInt(4, bean.getStore());
	int i=ps.executeUpdate();
	System.out.println("i is "+i);
	if(i>0)
	{
		
	}
		return bean;
	}
}
