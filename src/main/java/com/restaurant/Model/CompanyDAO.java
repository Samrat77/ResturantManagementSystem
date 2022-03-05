package com.restaurant.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.restaurant.Bean.CompanyInfo;
import com.restaurant.Bean.UserClass;
import com.restaurant.DBConnect.DBConnection;

public class CompanyDAO {

	public static CompanyInfo updateCompanyInfo(CompanyInfo c) throws SQLException {
		
		System.out.println("hello in update ");
		
		Connection con=DBConnection.getConn();
		String sql="UPDATE R_COMPANY SET CNAME=?,CHARGEAMOUNT=?,VATCHARGE=?,ADDRESS=?,PHONE=?,COUNTRY=?,MESSAGE=?,CURRENCY=? WHERE ID=1";
		
		PreparedStatement preparedStatement=con.prepareStatement(sql);
		preparedStatement.setString(1,c.getCompanyname() );
		preparedStatement.setString(2, c.getChargeamount());
		preparedStatement.setString(3, c.getVat());
		preparedStatement.setString(4, c.getAddress());
		preparedStatement.setString(5, c.getPhone());
		preparedStatement.setString(6, c.getCountry());
		preparedStatement.setString(7, c.getMessage());
		preparedStatement.setString(8, c.getCurrency());
		
		int result=preparedStatement.executeUpdate();
		if(result!=0)
		{
			return c;
		}
		return c;
	}
}
