package com.restaurant.Ctrl;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.Bean.UserClass;
import com.restaurant.Model.LoginDAO;

@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		System.out.println("inside post");
		UserClass userClass=new UserClass();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		if((username.equals("")) || (password.equals("")))
		{
			System.out.println("Please enter username and password ");
			String msg="Please enter username or password";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("index.jsp").forward(request, response);	
		}
		
		userClass.setUsername(username);
		userClass.setPassword(password);
		
		LoginDAO dao=new LoginDAO();
		try {
			String user=dao.CheckUser(userClass);
			
			if(user.equals("ADMIN"))
			{
				session.setAttribute("admin", username);
				response.sendRedirect("adminhome.jsp");
			}
			else if(user.equals("STAFF"))
			{
				session.setAttribute("staff", username);
				//response.sendRedirect("staffhomepage.jsp");
				request.getRequestDispatcher("staffhomepage.jsp").forward(request, response);
			}
			else if(user.equals("INVALID"))
			{
				System.out.println("Please enter username and password ");
				String msg="Please enter valid username and password";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("after if");
		
	}

}
