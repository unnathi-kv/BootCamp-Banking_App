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
 * Servlet implementation class Deposit
 */
@WebServlet("/Deposit")
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String email = (String)session.getAttribute("user_email");
		//System.out.println(email);
		String amt = request.getParameter("amount");
		UserDetails userDetails = new UserDetails();
		Utils util = new Utils();
		String sql=null;
		ResultSet rs=null;
		 try {
	        	sql="select amount from user_details where email = '"+email+"' ";
	        	rs = Utils.getStatement().executeQuery(sql);
	        	while(rs.next())
				{
					userDetails.setAmount(rs.getDouble(1));
				}
	        	
	        }
	        catch(Exception e)
	        {
	        	e.printStackTrace();   	
	        }
		 
		double total_balance = userDetails.getAmount()+(Double.parseDouble(amt));
		userDetails.setAmount(total_balance);
		int x = util.updateBalance(userDetails, email);
		if(x>0)
		{
			
//			out.println("Amount deposited successfully");
			response.sendRedirect("http://localhost:7017/BankingApp/Login?email="+session.getAttribute("user_email")+
					"&pass="+session.getAttribute("password"));
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("deposit.jsp");
			rd.include(request, response);
		    out.println("Oops!! Error");
		}
		String sql1 = "insert into transactions(from_acc_no, to_acc_no,  amount, dateandtime,"
				+ " acc_no, transcation_type, mode) values(0, "+session.getAttribute("user_accno")+", "+amt+", '"+LocalDateTime.now()+"', "
						+ ""+session.getAttribute("user_accno")+", 'Deposit', 'Credited')";
		try {
			int y = Utils.getStatement().executeUpdate(sql1);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
