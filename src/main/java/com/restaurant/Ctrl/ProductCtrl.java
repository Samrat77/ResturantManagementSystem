package com.restaurant.Ctrl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.restaurant.Bean.ManageTableBean;
import com.restaurant.Bean.ProductBean;
import com.restaurant.DBConnect.DBConnection;
import com.restaurant.DBConnect.Validation;
import com.restaurant.Model.ManageTableDAO;
import com.restaurant.Model.ProductDAO;

/**
 * Servlet implementation class ProductCtrl
 */
@WebServlet("/ProductCtrl")
public class ProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductCtrl() {
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
		System.out.println("in do get of manage store ctrl");
		ProductDAO dao = new ProductDAO();
		ProductBean bean = new ProductBean();
		int id = Integer.parseInt(request.getParameter("id"));
		// bean=(ManageStoreBean)request.getParameter("id");
		System.out.println("id is " + id);
		if (id > 0) {
			try {
				bean = ProductDAO.getRecordById(id);
				System.out.println("Id for bean " + bean.getPid());

				request.setAttribute("bean", bean);
				request.getRequestDispatcher("editproducts.jsp").forward(request, response);
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
		if (request.getParameter("Action").equals("Add")) {
			String pname = request.getParameter("pname");
			String price = request.getParameter("price");
			String description = request.getParameter("description");
			int category = Integer.parseInt(request.getParameter("category"));
			int storename = Integer.parseInt(request.getParameter("storename"));
			String status = request.getParameter("status");

			ProductBean bean = new ProductBean();
			bean.setPname(pname);
			bean.setPrice(price);
			bean.setDescription(description);
			bean.setCategory(category);
			bean.setStorename(storename);
			bean.setStatus(status);
			if (!Validation.isValidNumber(price)) {
				request.setAttribute("no", "Enter valid Price");
				request.getRequestDispatcher("addproduct.jsp").forward(request, response);
			} else {
				ProductDAO dao = new ProductDAO();
				try {
					bean = dao.addProduct(bean);
					request.setAttribute("add", "Product added successfully");
					request.getRequestDispatcher("addproduct.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

		}

		if (request.getParameter("Action").equals("Update")) {
			System.out.println("in update ");
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("id is " + id);
			System.out.println("in update");
			ProductBean bean = new ProductBean();
			String pname = request.getParameter("pname");
			// System.out.println("store name is "+storename);
			String price = request.getParameter("price");
			// String store=request.getParameter("store");
			int storeid = Integer.parseInt(request.getParameter("storeid"));
			String status = request.getParameter("status");
			// System.out.println("store name is "+status);
			/*
			 * if(!Validation.isName(storename)) {
			 * 
			 * } else
			 */
			bean.setPid(id);
			bean.setPname(pname);
			bean.setPrice(price);
			bean.setStorename(storeid);
			bean.setStatus(status);
			ProductDAO dao = new ProductDAO();
			try {
				ProductBean bean2 = dao.updateProduct(bean);
				request.setAttribute("success", "Table edited Successfully");
				request.getRequestDispatcher("manageproducts.jsp").forward(request, response);
				System.out.println("success");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if (request.getParameter("Action").equals("Generate")) {
			ProductDAO dao=new ProductDAO();
			ArrayList arrList=null;
			try {
				arrList=(ArrayList) dao.getList();
				request.setAttribute("piList", arrList);
	            RequestDispatcher view = request.getRequestDispatcher("report.jsp");
	            view.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if(request.getParameter("Action").equals("productname"))
		{
			System.out.println("inisde product controller");
		}
	}
}
