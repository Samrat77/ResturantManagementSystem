package com.restaurant.Ctrl;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.Bean.CompanyInfo;
import com.restaurant.DBConnect.Validation;
import com.restaurant.Model.CompanyDAO;

/**
 * Servlet implementation class CompanyCtrl
 */
@WebServlet("/CompanyCtrl")
public class CompanyCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CompanyCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("addcompany.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in post");
		if(request.getParameter("Action").equals("Save"))
		{
			System.out.println("inside action edit ");
			String cname=request.getParameter("cname");
			String camt=request.getParameter("camt");
			String vat=request.getParameter("vat");
			String address=request.getParameter("address");
			String phone=request.getParameter("phone");
			String country=request.getParameter("country");
			String message=request.getParameter("msg");
			String currency=request.getParameter("choose");
			// Validation
			
			CompanyInfo bean=new CompanyInfo();
			bean.setCompanyname(cname);
			bean.setChargeamount(camt);
			bean.setVat(vat);
			bean.setAddress(address);
			bean.setPhone(phone);
			bean.setCountry(country);
			bean.setMessage(message);
			bean.setCurrency(currency);
			
			
			
			if(!Validation.isValidNumber(vat))
			{
				System.out.println("insisde company validation");
				String msg="Please enter valid Number";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("addcompany.jsp").forward(request, response);
			}
			else if(!Validation.isValid(phone))
				{
					System.out.println("indside 4");
					String no="Please enter numbers";
					request.setAttribute("no", no);
					request.getRequestDispatcher("addcompany.jsp").forward(request, response);
				}
			else
			{
				HttpSession httpSession=request.getSession();
				System.out.println("heelllooo");
				CompanyDAO dao=new CompanyDAO();
				
				
				try {
					bean=dao.updateCompanyInfo(bean);
					String vat1=bean.getVat();
					request.setAttribute("updated", "Successfully Updated");
					//httpSession.setAttribute("updated", "Successfully updated!!!");
					httpSession.setAttribute("amountvat", vat1);
					request.getRequestDispatcher("addcompany.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		}
		
	}

}
