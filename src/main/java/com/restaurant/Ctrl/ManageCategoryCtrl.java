package com.restaurant.Ctrl;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.Bean.ManageCategoryBean;

import com.restaurant.Model.ManageCategoryDAO;


/**
 * Servlet implementation class ManageCategoryCtrl
 */
@WebServlet("/ManageCategoryCtrl")
public class ManageCategoryCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageCategoryCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("in do get of manage store ctrl");
		ManageCategoryDAO dao = new ManageCategoryDAO();
		ManageCategoryBean bean = new ManageCategoryBean();
		int id = Integer.parseInt(request.getParameter("id"));
		// bean=(ManageStoreBean)request.getParameter("id");
		System.out.println("id is " + id);
		if (id > 0) {
			try {
				bean = ManageCategoryDAO.getRecordById(id);
				System.out.println("Id for bean " + bean.getCategory_id());

				request.setAttribute("bean", bean);
				request.getRequestDispatcher("editcategory.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("Action").equals("Save")) {
			System.out.println("inside cat ctrl");

			ManageCategoryBean bean = new ManageCategoryBean();
			String cname = request.getParameter("cname");
			String status = request.getParameter("status");

			System.out.println("store name " + cname);
			System.out.println("store status " + status);
			bean.setCategory_name(cname);
			bean.setCategory_status(status);
			/*
			 * if(!Validation.isName(sname)) { request.setAttribute("msg",
			 * "Please enter valid Store Name");
			 * request.getRequestDispatcher("store.jsp").forward(request,
			 * response); } else {
			 */
			System.out.println("here in cat");
			ManageCategoryDAO dao = new ManageCategoryDAO();
			try {
				ManageCategoryBean b = dao.addCategory(bean);
				if (b != null)

				{
					HttpSession session = request.getSession();
					request.setAttribute("cat", "Category Added Successfully");
					request.getRequestDispatcher("categories.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (request.getParameter("Action").equals("Update")) {
			System.out.println("in update ");
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("id is " + id);
			System.out.println("in update");
			ManageCategoryBean bean = new ManageCategoryBean();
			String catname = request.getParameter("cname");
			System.out.println("store name is " + catname);
			String status = request.getParameter("status");
			System.out.println("store name is " + status);
			/*
			 * if(!Validation.isName(storename)) {
			 * 
			 * } else
			 */
			bean.setCategory_id(id);
			bean.setCategory_name(catname);
			;
			bean.setCategory_status(status);
			;
			ManageCategoryDAO dao = new ManageCategoryDAO();
			try {
				ManageCategoryBean bean2 = dao.updateCategory(bean);
				request.setAttribute("success", "Category edited Successfully");
				request.getRequestDispatcher("categories.jsp").forward(request, response);
				System.out.println("success");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
