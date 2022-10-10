package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TransferUPI
 */
@WebServlet("/TransferUPI")
public class TransferUPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			//transfer amount based on UPI_id
		
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			HttpSession session=request.getSession();
			UserDetails userDetails = new UserDetails();
			Utils util =  new Utils();
			String email = (String)session.getAttribute("user_email");	
			String to_upi_id = (String)request.getParameter("upi_id");
			String amt = request.getParameter("amount");
			String sql=null;
			ResultSet rs=null;
			 try {
		        	sql="select amount from user_details where email = '"+email+"' ";
		        	rs = Utils.getStatement().executeQuery(sql);
		        	while(rs.next())
					{
						userDetails.setAmount(rs.getDouble(1));
					}
		       
			 
			double total_balance1 = userDetails.getAmount()-(Double.parseDouble(amt));
			userDetails.setAmount(total_balance1);
			util.updateBalance(userDetails, email);
			String sql1=null;
			ResultSet to_rs=null;
			
		        	sql1="select amount from user_details where upi= '"+to_upi_id+"' " ;
		        	to_rs = Utils.getStatement().executeQuery(sql1);
		        	while(to_rs.next())
					{
						userDetails.setAmount(to_rs.getDouble(1));
					}
		        	
			
			double total_balance = userDetails.getAmount()+(Double.parseDouble(amt));
			userDetails.setAmount(total_balance);
			int x = util.transferAmountUPI(userDetails, to_upi_id);
			if(x>0)
			{
				out.println("Amount transfered successfully");
				response.sendRedirect("http://localhost:7017/BankingApp/Login?email="+session.getAttribute("user_email")+
						"&pass="+session.getAttribute("password"));
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("deposit.jsp");
				rd.include(request, response);
			    out.println("Oops!! Error");
			}
		 
	}
			 
			 
    catch(Exception e)
    {
    	e.printStackTrace();   	
    }

	}

}
