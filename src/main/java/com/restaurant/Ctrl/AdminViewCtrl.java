package com.restaurant.Ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.Bean.UserClass;
import com.restaurant.DBConnect.DBConnection;

/**
 * Servlet implementation class AdminViewCtrl
 */
@WebServlet("/AdminViewCtrl")
public class AdminViewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminViewCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in doget");
		HttpSession httpSession=request.getSession();
		String username=(String)httpSession.getAttribute("admin");
		UserClass bClass=new UserClass();
		//String username =request.getParameter("uname");
		System.out.println(username);
		ArrayList userlist = null;
		ArrayList list = new ArrayList<>();

		Connection con = DBConnection.getConn();
		String query = "SELECT * FROM R_USER WHERE USERNAME='" + username + "'";
		Statement statement;
		try {
			statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				userlist=new ArrayList<>();
				userlist.add(rs.getString(2));
				userlist.add(rs.getString(3));
				userlist.add(rs.getString(4));
				userlist.add(rs.getString(5));
				userlist.add(rs.getString(6));
				userlist.add(rs.getString(7));
				userlist.add(rs.getString(8));
				list.add(userlist);
			}
			System.out.println("name is "+userlist.add(rs.getString(2)));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		request.setAttribute("list", list);
        RequestDispatcher view = request.getRequestDispatcher("adminprofile.jsp");
        view.forward(request, response);
        System.out.println("end do get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
