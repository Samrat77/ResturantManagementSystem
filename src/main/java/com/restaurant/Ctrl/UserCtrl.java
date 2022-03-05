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

import com.restaurant.Bean.ManageTableBean;
import com.restaurant.Bean.UserClass;
import com.restaurant.DBConnect.DBConnection;
import com.restaurant.DBConnect.Validation;
import com.restaurant.Model.ManageTableDAO;
import com.restaurant.Model.UserDAO;

/**
 * Servlet implementation class UserCtrl
 */
@WebServlet("/UserCtrl")
public class UserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in do get of manage store ctrl");
		UserDAO dao=new UserDAO();
		UserClass bean=new UserClass();
		int id=Integer.parseInt(request.getParameter("id"));
		
		System.out.println("id is "+id);
		if(id>0)
		{
			try {
			bean	=UserDAO.getRecordById(id);
			System.out.println("Id for bean "+bean.getId());
			
			request.setAttribute("bean", bean);
			request.getRequestDispatcher("editaddeduser.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		/*RequestDispatcher view = request.getRequestDispatcher("updateadminprofile.jsp");
		view.forward(request, response);
		System.out.println("end do get");*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("inside post");
		if (request.getParameter("Action").equals("Edit")) {
			System.out.println("indside edit section");
			String uname = request.getParameter("uname");
			String email = request.getParameter("emailid");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String phone = request.getParameter("phone");
			String choose = request.getParameter("choose");
			String password = request.getParameter("password");
			String cpassword = request.getParameter("cpassword");

			UserClass bean = new UserClass();
			bean.setUsername(uname);
			bean.setEmailid(email);
			bean.setFirstname(fname);
			bean.setLastname(lname);
			bean.setPhone(phone);
			bean.setGender(choose);
			bean.setPassword(password);
			bean.setPassword(cpassword);

			// Validation for username fname lname/////
			if (!Validation.isValid(phone)) {
				System.out.println("indside 4");
				String no = "Please enter numbers";
				request.setAttribute("no", no);
				request.getRequestDispatcher("updateadminprofile.jsp").forward(request, response);
			} else if (!Validation.isValidEmail(email)) {
				System.out.println("indside 5");
				String emailid = "Please enter Valid Email address";
				request.setAttribute("emailid", emailid);
				request.getRequestDispatcher("updateadminprofile.jsp").forward(request, response);
			} else if (!password.equals(cpassword)) {
				System.out.println("Please enter both the password same");

				String pass = "Please enter both the password same";
				request.setAttribute("pass", pass);
				request.getRequestDispatcher("updateadminprofile.jsp").forward(request, response);
			} else {
				System.out.println("helooooo");
				UserDAO dao = new UserDAO();
				try {
					bean = dao.updateUser(bean);
					request.setAttribute("edit", "Updated");
					request.getRequestDispatcher("updateadminprofile.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

		}
		if (request.getParameter("Action").equals("Save")) {
			System.out.println("indside add section");
			String uname = request.getParameter("uname");
			String email = request.getParameter("email");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String phone = request.getParameter("phone");
			String choose = request.getParameter("choose");
			String password = request.getParameter("password");
			String group = request.getParameter("group");
			System.out.println("group is" + group);
			UserClass bean = new UserClass();

			bean.setUsername(uname);
			bean.setEmailid(email);
			bean.setFirstname(fname);
			bean.setLastname(lname);
			bean.setPhone(phone);
			bean.setGender(choose);
			bean.setPassword(password);
			bean.setGroup(group);
			if (group.equals("staff")) {
				bean.setRoleid(2);
			} else {
				bean.setRoleid(3);
			}
			if (!Validation.isName(uname)) {
				System.out.println("indside 4");
				String no = "Please enter numbers";
				request.setAttribute("no", no);
				request.getRequestDispatcher("adduser.jsp").forward(request, response);
			}
			else if (!Validation.isName(fname)) {
				System.out.println("indside 5");
				String emailid = "Please enter Valid Email address";
				request.setAttribute("emailid", emailid);
				request.getRequestDispatcher("adduser.jsp").forward(request, response);
			} 
			else if (!Validation.isName(lname)) {
				System.out.println("indside 5");
				String emailid = "Please enter Valid Email address";
				request.setAttribute("emailid", emailid);
				request.getRequestDispatcher("adduser.jsp").forward(request, response);
			} 
			else if (!Validation.isValidEmail(email)) {
				System.out.println("indside 5");
				String emailid = "Please enter Valid Email address";
				request.setAttribute("emailid", emailid);
				request.getRequestDispatcher("adduser.jsp").forward(request, response);
			} 
			else if(!Validation.isValid(phone)) {
					System.out.println("indside 4");
					String no = "Please enter numbers";
					request.setAttribute("no", no);
					request.getRequestDispatcher("adduser.jsp").forward(request, response);
				
			}
			else{
			UserDAO dao = new UserDAO();
			try {
				bean = dao.addUser(bean);
				HttpSession session = request.getSession();
				session.setAttribute("bean", bean);
				request.setAttribute("useradded", "User added");
				request.getRequestDispatcher("adduser.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}}
		if (request.getParameter("Action").equals("EditUser")) { //edit added user by admin
			System.out.println("indside edit section");
			int id=Integer.parseInt(request.getParameter("id"));
			String email = request.getParameter("emailid");
			
			String phone = request.getParameter("phone");
			
			UserClass bean = new UserClass();
			bean.setId(id);
			bean.setEmailid(email);
		
		
			bean.setPhone(phone);
			

			// Validation for username fname lname/////
			if (!Validation.isValid(phone)) {
				System.out.println("indside 4");
				String no = "Please enter numbers";
				request.setAttribute("no", no);
				request.getRequestDispatcher("editaddeduser.jsp").forward(request, response);
			} else if (!Validation.isValidEmail(email)) {
				System.out.println("indside 5");
				String emailid = "Please enter Valid Email address";
				request.setAttribute("emailid", emailid);
				request.getRequestDispatcher("editaddeduser.jsp").forward(request, response);
			} else {
				System.out.println("helooooo");
				UserDAO dao = new UserDAO();
				try {
					bean = dao.updateUserByAdmin(bean);
					request.setAttribute("edit", "Updated");
					request.getRequestDispatcher("adduser.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

			}
	}
}}
