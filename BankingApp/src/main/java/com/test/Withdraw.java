package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Withdraw")
public class Withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher;
		String email = (String)session.getAttribute("user_email");
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
	        
		if(userDetails.getAmount()<=0)
			{
			request.setAttribute("msg","Balance");
			 dispatcher=request.getRequestDispatcher("withdraw.jsp");
			 dispatcher.include(request, response);

			}
		else {
		 
		double total_balance = userDetails.getAmount()-(Double.parseDouble(amt));
		userDetails.setAmount(total_balance);
		
		int x = util.updateBalance(userDetails, email);
		if(x>0)
		{
			
			response.sendRedirect("http://localhost:7017/BankingApp/Login?email="+session.getAttribute("user_email")+
					"&pass="+session.getAttribute("password"));
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
			rd.include(request, response);
			out.println("<center><font color = 'red'; weight = bolder;>Oops!! Error</font></center>");	
		}
		String sql1 = "insert into transactions(from_acc_no, to_acc_no, amount, dateandtime, acc_no, "
				+ "transcation_type, mode) values('"+session.getAttribute("user_accno")+"', 0, '"+amt+"', "
						+ "'"+LocalDateTime.now()+"', '"+session.getAttribute("user_accno")+"', 'Withdraw', 'Debited')";
	
			int y = Utils.getStatement().executeUpdate(sql1);
		
        }
		 }
        catch(Exception e)
        {
        	e.printStackTrace();   	
        }
		
		
		}
		
		
		
		
		
	       
	}


