package com.restaurant.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.restaurant.Bean.UserClass;
import com.restaurant.DBConnect.DBConnection;

public class LoginDAO {

	public String CheckUser(UserClass userClass) throws SQLException {
		
		
		String username=userClass.getUsername();
		String pass=userClass.getPassword();
		
		Connection con=DBConnection.getConn();
		String sql="SELECT * FROM R_USER WHERE USERNAME='"+username+"' AND PASSWORD='"+pass+"'";
		Statement statement=con.createStatement();
		ResultSet rs=statement.executeQuery(sql);
		int roledb=0;
		String passdb=null;
		String usernamdb=null;
		while(rs.next())
		{
			usernamdb=rs.getString("username");
			 passdb=rs.getString("password");
			 roledb=rs.getInt(9);
			 if(username.equals(usernamdb) && pass.equals(passdb) && roledb==1)
				 return "ADMIN";
			 
			 else if(username.equals(usernamdb) && pass.equals(passdb) && roledb==2)
				 return "STAFF";
		}
		
		return "INVALID";
		
		
		
		
		
	}

}
