package com.restaurant.Ctrl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant.Bean.ManageStoreBean;
import com.restaurant.Bean.ManageTableBean;
import com.restaurant.DBConnect.Validation;
import com.restaurant.Model.ManageStoreDAO;
import com.restaurant.Model.ManageTableDAO;

/**
 * Servlet implementation class ManageTableCtrl
 */
@WebServlet("/ManageTableCtrl")
public class ManageTableCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageTableCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("in do get of manage store ctrl");
		ManageTableDAO dao=new ManageTableDAO();
		ManageTableBean bean=new ManageTableBean();
		int id=Integer.parseInt(request.getParameter("id"));
		//bean=(ManageStoreBean)request.getParameter("id");
		System.out.println("id is "+id);
		if(id>0)
		{
			try {
			bean	=ManageTableDAO.getRecordById(id);
			System.out.println("Id for bean "+bean.getTid());
			
			request.setAttribute("bean", bean);
			request.getRequestDispatcher("edittable.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("Action").equals("Save"))
		{
			System.out.println("hello");
			String table_name=request.getParameter("tname");
			String table_cap=request.getParameter("tcap");
			String table_status=request.getParameter("status");
			int storeid=Integer.parseInt(request.getParameter("storeid"));
			
			System.out.println("here");
			
			ManageTableBean bean=new ManageTableBean();
			bean.setTable_name(table_name);
			bean.setTable_cap(table_cap);
			bean.setStatus(table_status);
			bean.setStore(storeid);
			
			
			
			System.out.println("here 14");
			
		/*	if(!Validation.isValidNumber(table_cap))
			{
				request.setAttribute("msg","Please write valid number");
				request.getRequestDispatcher("table.jsp").forward(request, response);
				
			}
			else
			{*/
				System.out.println("here 14");
				ManageTableDAO tabledao=new ManageTableDAO();
				System.out.println("after dao");
			try {
				bean=tabledao.addtable(bean);
				if(bean!=null)
				{
					request.setAttribute("tabledata","Table Added Successfully ");
					request.getRequestDispatcher("table.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		if(request.getParameter("Action").equals("Update"))
		{
			System.out.println("in update ");
			int id=Integer.parseInt(request.getParameter("id"));
			System.out.println("id is "+id);
			System.out.println("in update");
			ManageTableBean bean=new ManageTableBean();
			String tablename=request.getParameter("tname");
			//System.out.println("store name is "+storename);
			String tcap=request.getParameter("tcap");
			String status=request.getParameter("status");
			int storeid=Integer.parseInt(request.getParameter("storeid"));
			System.out.println("store name is "+status);
			/*if(!Validation.isName(storename))
			{
				
			}
			else*/
			bean.setTid(id);
			bean.setTable_name(tablename);
			bean.setTable_cap(tcap);
			bean.setStatus(status);
			bean.setStore(storeid);
			ManageTableDAO dao=new ManageTableDAO();
			try {
				ManageTableBean bean2=dao.updateTable(bean);
				request.setAttribute("success", "Table edited Successfully");
				request.getRequestDispatcher("table.jsp").forward(request, response);
				System.out.println("success");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}
		}
	
	

