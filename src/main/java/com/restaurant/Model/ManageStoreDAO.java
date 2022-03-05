package com.restaurant.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.restaurant.Bean.ManageStoreBean;
import com.restaurant.DBConnect.DBConnection;

public class ManageStoreDAO {

	public ManageStoreBean addStore(ManageStoreBean bean) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection con=DBConnection.getConn();
		String sql="INSERT INTO R_STORE (SNAME,STATUS) VALUES(?,?)  ";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, bean.getStore_name());
	ps.setString(2, bean.isStatus());
	ps.executeUpdate();
		return bean;
	}

	public ManageStoreBean updateStore(ManageStoreBean bean) throws SQLException {
		// TODO Auto-generated method stub
		int id=bean.getId();
		System.out.println("id in updatestore is "+ id);
		Connection con=DBConnection.getConn();
		String sql="UPDATE  R_STORE SET SNAME=?,STATUS=? WHERE id='"+id+"' ";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, bean.getStore_name());
	ps.setString(2, bean.isStatus());
	//ps.setInt(3, bean.getId());
	int i=ps.executeUpdate();
	System.out.println("i is "+i);
	if(i>0)
	{
		
	}
		return bean;
	}

	
	public static ManageStoreBean getRecordById(int id) throws SQLException
	{
		ManageStoreBean bean=null;
		Connection con=DBConnection.getConn();
		String sql = "SELECT * FROM R_STORE where ID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			bean=new ManageStoreBean();
			
			bean.setId(rs.getInt(1));
			bean.setStore_name(rs.getString(2));
			bean.setStatus(rs.getString(3));
			
		}
		return bean;
		
	}
	public static ManageStoreBean getRecordByStoreName(String storename) throws SQLException
	{
		ManageStoreBean bean=null;
		Connection con=DBConnection.getConn();
		String sql = "SELECT * FROM R_STORE where SNAME=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1, bean.getStore_name());
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			bean=new ManageStoreBean();
			
			bean.setId(rs.getInt(1));
			bean.setStore_name(rs.getString(2));
			bean.setStatus(rs.getString(3));
			
		}
		return bean;
		
	}
	
	public static List list() throws SQLException {
		Connection con=DBConnection.getConn();
		ArrayList list=null;
		ArrayList pid=new ArrayList();
		String query="SELECT * FROM R_STORE";
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next())
			{
				list=new ArrayList();
				list.add(rs.getInt(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				pid.add(list);
			}
			//System.out.println();
			/*request.setAttribute("piList", pid);
            RequestDispatcher view = request.getRequestDispatcher("addproduct.jsp");
            view.forward(request, response);*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pid;
	}
}
