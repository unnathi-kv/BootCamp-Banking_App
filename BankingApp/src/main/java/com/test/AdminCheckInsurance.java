package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AdminCheckInsurance")
public class AdminCheckInsurance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int accNo = Integer.parseInt(request.getParameter("accNo"));
		String loan_time = request.getParameter("loan_type");
		double insurance_amount = 0;
		
		
		try {
			if(loan_time.equals("Monthly"))
			{
				insurance_amount = 2000;
			}
			else if(loan_time.equals("Quarterly"))
			{
				insurance_amount = 6000;
			}
			else if(loan_time.equals("Half-yearly"))
			{
				insurance_amount = 12000;
			}
			else
			{
				insurance_amount=24000;
			}
		
		String s= "select * from user_details where acc_no ='"+accNo+"' ";
		ResultSet rs = Utils.getStatement().executeQuery(s);
		while(rs.next())
		{
			double balance = rs.getDouble("amount");
			if(balance>insurance_amount)
			{
				String sql1="update user_details set amount = '"+(balance-insurance_amount)+"' where acc_no='"+accNo+"' " ;
				int x=Utils.getStatement().executeUpdate(sql1);
				String sql2 = "update insurance set status = '"+"Accepted"+"' where acc_no = '"+accNo+"' ";
				int y = Utils.getStatement().executeUpdate(sql2);
				RequestDispatcher rd = request.getRequestDispatcher("admin_service_requests.jsp");
				 rd.include(request, response);
				 out.println("<center><font color = 'red'; font-size=15px; weight = bolder;>Request accepted succsfully!!</font></center>");
			}
			else
			{
				String sql3 = "update insurance set status = '"+"Denied"+"' where acc_no = '"+accNo+"' ";
				int z = Utils.getStatement().executeUpdate(sql3);
				RequestDispatcher rd = request.getRequestDispatcher("admin_service_requests.jsp");
				 rd.include(request, response);
				 out.println("<center><font color = 'red'; font-size=15px; weight = bolder;>Insufficent Balance in user's account can not accept"
				 		+ "the request</font></center>");	
			}
		}
		} 
		
		
		catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
