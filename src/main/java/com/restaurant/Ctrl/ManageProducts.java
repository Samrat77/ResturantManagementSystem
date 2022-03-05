package com.restaurant.Ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.Bean.ManageProductsOrders;
import com.restaurant.Bean.ProductBean;
import com.restaurant.DBConnect.DBConnection;
import com.restaurant.Model.ManageProductDAO;
import com.restaurant.Model.ProductDAO;

/**
 * Servlet implementation class ManageProducts
 */
@WebServlet("/ManageProducts")
public class ManageProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//request.getRequestDispatcher("addordersbystaff.jsp").forward(request, response);
		System.out.println("in do get of manage store ctrl");
		ProductDAO dao = new ProductDAO();
		ProductBean bean = new ProductBean();
		

		int selectedItem ;
		selectedItem=Integer.parseInt(request.getParameter("productid"));
		if(request.getParameter("Action")==null)
		{
		 //  selectedItem=Integer.parseInt(request.getParameter("id"));
		  // bean=(ManageStoreBean)request.getParameter("id");
			System.out.println("id is " + selectedItem);
			if (selectedItem > 0) {
				try {
					bean = ProductDAO.getRecordById(selectedItem);
					System.out.println("Id for bean " + bean.getPid());
					
					request.setAttribute("bean", bean);
					request.setAttribute("productId",selectedItem);
					request.getRequestDispatcher("addordersbystaff.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}}
		else
		{
			System.out.println("hello");
			//int pid=Integer.parseInt(request.getParameter("id"));
			int tableid=Integer.parseInt(request.getParameter("tableid"));
			int quan=Integer.parseInt(request.getParameter("quantity"));
			String status=request.getParameter("status");	
			String price=request.getParameter("rate");
			String vat=request.getParameter("vat");
			System.out.println("quan"+quan+"price="+price+"vat="+vat);
			int vat1=Integer.parseInt(vat);
			float newprice=Integer.parseInt(price);
			//String status=request.getParameter("status");
			/*ManageProductsOrders orders=new ManageProductsOrders();
			orders.setTableid(tableid);
			orders.setQuan(quan);
			orders.setRate(newprice);
			orders.setVat(vat1);
			ManageProductDAO dao=new ManageProductDAO();
			orders=dao.CalculateTotalAmount(orders);*/
			//float newprice=Integer.parseInt(price);
			float newvat=newprice*(vat1%100);
			float totalamt=(newvat+newprice)*quan;
			
			Connection con=DBConnection.getConn();
			try {
				PreparedStatement ps=con.prepareStatement("INSERT INTO R_ORDER (PRODUCTID,TABLEID,QUANTITY,RATE,NETAMOUNT,VAT,OSTATUS) VALUES"
						+ "(?,?,?,?,?,?,?)");
				ps.setInt(1, selectedItem);
				ps.setInt(2, tableid);
				ps.setInt(3,quan);
				ps.setFloat(4, newprice);
				ps.setFloat(5, totalamt);
				ps.setInt(6, vat1);
				ps.setString(7, status);
				int i=ps.executeUpdate();
				HttpSession session=request.getSession();
				session.setAttribute("total",totalamt );
				request.setAttribute("total", totalamt);
				request.getRequestDispatcher("invoice.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*int id = Integer.parseInt(request.getParameter("id"));
		// bean=(ManageStoreBean)request.getParameter("id");
		System.out.println("id is " + id);
		if (id > 0) {
			try {
				bean = ProductDAO.getRecordById(id);
				System.out.println("Id for bean " + bean.getPid());
				
				request.setAttribute("bean", bean);
				request.getRequestDispatcher("addordersbystaff.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
		}

}
