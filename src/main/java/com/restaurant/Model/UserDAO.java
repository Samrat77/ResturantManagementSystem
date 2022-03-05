package com.restaurant.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.restaurant.Bean.ManageTableBean;
import com.restaurant.Bean.UserClass;
import com.restaurant.DBConnect.DBConnection;

public class UserDAO {

	public ArrayList getUserDeatils(UserClass bClass) throws SQLException {
		String username = bClass.getUsername();
		ArrayList userlist = null;
		ArrayList list = new ArrayList<>();

		Connection con = DBConnection.getConn();
		String query = "SELECT * FROM R_USER WHERE USERNAME='" + username + "'";
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery(query);
		while (rs.next()) {
			userlist = new ArrayList<>();
			userlist.add(rs.getString(2));
			list.add(userlist);
		}

		return list;
	}

	public static UserClass updateUser(UserClass userClass) throws SQLException {
		String sql = null;
		PreparedStatement preparedStatement = null;
		System.out.println("hello in update ");
		String username = userClass.getUsername();
		String password = userClass.getPassword();
		System.out.println("username is " + username);
		System.out.println("Password is " + password);
		Connection con = DBConnection.getConn();
		if (password.equals("")) {
			System.out.println("inside full password");
			sql = "UPDATE R_USER SET EMAIL=?,PHONE=? WHERE ID=1 ";
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, userClass.getEmailid());
			preparedStatement.setString(2, userClass.getPhone());

		} else {
			System.out.println("inside nukll password");
			sql = "UPDATE R_USER SET EMAIL=?,PHONE=?,PASSWORD=? WHERE ID=1 ";
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, userClass.getEmailid());
			preparedStatement.setString(2, userClass.getPhone());
			preparedStatement.setString(3, userClass.getPassword());
		}

		int i = preparedStatement.executeUpdate();
		if (i > 0) {
			return userClass;
		}
		return userClass;

	}

	public UserClass addUser(UserClass bean) throws SQLException {
		// TODO Auto-generated method stub
		String group = bean.getGroup();
		System.out.println("group in dao" + group);
		Connection con = DBConnection.getConn();
		String sql = "INSERT INTO R_USER (USERNAME,EMAIL,FNAME,LNAME,PHONE,GENDER,PASSWORD,ROLEID,GROUPNAME) VALUES (?,?,?,?,?,?,?,?,?)";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bean.getUsername());
		ps.setString(2, bean.getEmailid());
		ps.setString(3, bean.getFirstname());
		ps.setString(4, bean.getLastname());
		ps.setString(5, bean.getPhone());
		ps.setString(6, bean.getGender());
		ps.setString(7, bean.getPassword());
		ps.setInt(8, bean.getRoleid());
		ps.setString(9, bean.getGroup());
		int i = ps.executeUpdate();
		System.out.println(i);
		return bean;
	}

	public static UserClass getRecordById(int id) throws SQLException {
		UserClass bean = null;
		Connection con = DBConnection.getConn();
		String sql = "SELECT * FROM R_USER where ID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			bean = new UserClass();

			bean.setId(rs.getInt(1));

			bean.setUsername(rs.getString(2));

			bean.setEmailid(rs.getString(3));
			bean.setPhone(rs.getString(6));

		}
		return bean;
	}

	public UserClass updateUserByAdmin(UserClass bean) throws SQLException {
		// TODO Auto-generated method stub
		Connection con=DBConnection.getConn();
		int id=bean.getId();
		String sql="UPDATE R_USER SET EMAIL=?,PHONE=? WHERE ID='"+id+"'";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, bean.getEmailid());
		ps.setString(2, bean.getPhone());
		ps.executeUpdate();
		return bean;
	}
}
