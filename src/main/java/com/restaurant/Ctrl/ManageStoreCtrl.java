package com.restaurant.Ctrl;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.Bean.ManageStoreBean;
import com.restaurant.DBConnect.Validation;
import com.restaurant.Model.ManageStoreDAO;

/**
 * Servlet implementation class ManageStoreCtrl
 */
@WebServlet("/ManageStoreCtrl")
public class ManageStoreCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public ManageStoreCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
					
		System.out.println("in do get of manage store ctrl");
		ManageStoreDAO dao=new ManageStoreDAO();
		ManageStoreBean bean=new ManageStoreBean();
		int id=Integer.parseInt(request.getParameter("id"));
		//bean=(ManageStoreBean)request.getParameter("id");
		System.out.println("id is "+id);
		if(id>0)
		{
			try {
			bean	=ManageStoreDAO.getRecordById(id);
			System.out.println("Id for bean "+bean.getId());
			
			request.setAttribute("bean", bean);
			request.getRequestDispatcher("edit.jsp").forward(request, response);
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
			System.out.println("inside store ctrl");
		
		ManageStoreBean bean=new ManageStoreBean();
		String sname=request.getParameter("sname");
		String status=request.getParameter("status");
		
		System.out.println("store name "+sname);
		System.out.println("store status "+status);
		bean.setStore_name(sname);
		bean.setStatus(status);
		/*if(!Validation.isName(sname))
		{
			request.setAttribute("msg", "Please enter valid Store Name");
			request.getRequestDispatcher("store.jsp").forward(request, response);
		}
		else
		{*/
			System.out.println("here in store");
			ManageStoreDAO dao=new ManageStoreDAO();
			try {
				ManageStoreBean b=dao.addStore(bean);
				if(b!=null)
					
				{
					HttpSession session=request.getSession();
					request.setAttribute("store", "Store Added Successfully");
					request.getRequestDispatcher("store.jsp").forward(request, response);
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
		ManageStoreBean bean=new ManageStoreBean();
		String storename=request.getParameter("sname");
		System.out.println("store name is "+storename);
		String status=request.getParameter("status");
		System.out.println("store name is "+status);
		/*if(!Validation.isName(storename))
		{
			
		}
		else*/
		bean.setId(id);
		bean.setStore_name(storename);
		bean.setStatus(status);
		ManageStoreDAO dao=new ManageStoreDAO();
		try {
			ManageStoreBean bean2=dao.updateStore(bean);
			request.setAttribute("success", "Store edited Successfully");
			request.getRequestDispatcher("store.jsp").forward(request, response);
			System.out.println("success");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}
}
