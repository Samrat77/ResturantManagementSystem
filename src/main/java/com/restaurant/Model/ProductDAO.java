package com.restaurant.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.Bean.ManageTableBean;
import com.restaurant.Bean.ProductBean;
import com.restaurant.DBConnect.DBConnection;

public class ProductDAO {

	public ProductBean addProduct(ProductBean bean) throws SQLException {
		// TODO Auto-generated method stub
		Connection con=DBConnection.getConn();
		String sql="INSERT INTO R_PRODUCT (PNAME,PRICE,DESCRIPTION,CATEGORYID,STORENAMEID,STATUS)"
				+ "VALUES (?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, bean.getPname());
		ps.setString(2, bean.getPrice());
		ps.setString(3, bean.getDescription());
		ps.setInt(4, bean.getCategory());
		ps.setInt(5,bean.getStorename());
		ps.setString(6, bean.getStatus());
		int i=ps.executeUpdate();
		if(i>0)
		{
			return bean;
		}
		
		return bean;
	}
	public static ProductBean getRecordById(int id) throws SQLException
	{
		ProductBean bean=null;
		Connection con=DBConnection.getConn();
		String sql = "SELECT * FROM R_PRODUCT where ID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			bean=new ProductBean();
			
			bean.setPid(rs.getInt(1));
			
			bean.setPname(rs.getString(2));
			
			bean.setPrice(rs.getString(3));
			bean.setDescription(rs.getString(4));
			bean.setCategory(rs.getInt(5));
			bean.setStorename(rs.getInt(6));
			bean.setStatus(rs.getString(7));
			
			//bean.setStatus(rs.getString(3));
			
		}
		return bean;
		
	}
	
	public static List getList() throws SQLException {
		ArrayList list=null;
		ArrayList pid=new ArrayList();
		/*String query="SELECT * FROM R_CATEGORY";*/
		String query="select categoryname,pname,price from r_category c inner join r_product p on c.id=p.categoryid;";
			Connection con=DBConnection.getConn();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next())
			{
				list=new ArrayList();
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				pid.add(list);
			}
			return pid;
	}

	public ProductBean updateProduct(ProductBean bean) throws SQLException {
		// TODO Auto-generated method stub
		
		int id=bean.getPid();
		String staus=bean.getStatus();
		System.out.println("id in updatestore is "+ staus);
		Connection con=DBConnection.getConn();
		String sql="UPDATE  R_PRODUCT SET PNAME=?,PRICE=?,STORENAMEID=?,STATUS=? WHERE id='"+id+"' ";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, bean.getPname());
	ps.setString(2, bean.getPrice());
	ps.setInt(3, bean.getStorename());
	ps.setString(4, bean.getStatus());
	int i=ps.executeUpdate();
	System.out.println("i is "+i);
	if(i>0)
	{
		
	}
		return bean;
		
	}
	public static List list() throws SQLException {
		Connection con=DBConnection.getConn();
		ArrayList list=null;
		ArrayList pid=new ArrayList();
		String query="SELECT * FROM R_PRODUCT";
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
