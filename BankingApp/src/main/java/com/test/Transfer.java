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

@WebServlet("/Transfer")
public class Transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//transfer amount based on account number
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher;
		String email = (String)session.getAttribute("user_email");
		UserDetails userDetails = new UserDetails();
		Utils util =  new Utils();
	
		String to_account_no = (String)request.getParameter("account_number");
		String amt = request.getParameter("amount");
		try
		
		  {
			ResultSet rs = util.checkAccount(to_account_no);
		  while(rs.next())
		  {
			  userDetails.setUsername(rs.getString(1));
		  }
		  if(userDetails.getUsername()!=null)
		  {
			  
			  //fetching from_account balance
			  
			  
			  	String sql=null;
				ResultSet rs1=null;
			    sql="select amount from user_details where email = '"+email+"' ";
			    rs1 = Utils.getStatement().executeQuery(sql);
			    while(rs1.next())
				{
					userDetails.setAmount(rs1.getDouble(1));
				}
				 
				double total_balance1 = userDetails.getAmount()-(Double.parseDouble(amt));
				userDetails.setAmount(total_balance1);
				util.updateBalance(userDetails, email);
				
				//fetching to_account balance
				
				
				String sql1=null;
				ResultSet to_rs=null;
				int acc_no=Integer.parseInt(to_account_no);
		    	sql1="select amount,upi from user_details where acc_no= '"+acc_no+"' " ;
		    	to_rs = Utils.getStatement().executeQuery(sql1);
		    	while(to_rs.next())
				{
					userDetails.setAmount(to_rs.getDouble(1));
				}
				double total_balance = userDetails.getAmount()+(Double.parseDouble(amt));
				userDetails.setAmount(total_balance);
			 
				//Transferring amount 
				int x = util.transferAmount(userDetails, to_account_no);
				if(x>0)
				{
					
					response.sendRedirect("http://localhost:7017/BankingApp/Login?email="+session.getAttribute("user_email")+
							"&pass="+session.getAttribute("password"));
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("toaccount.jsp");
					rd.include(request, response);
				    out.println("Oops!! Error");
				}
				
		  }
		
	
		  else
			{
			  request.setAttribute("msg","AccountNumber");
				 dispatcher=request.getRequestDispatcher("toaccount.jsp");
				 dispatcher.include(request, response);
			}
		  
		  
		  //Updating transactions table 
		  String sql2 = "insert into transactions(from_acc_no, to_acc_no,  amount, dateandtime, acc_no, "
		  		+ "transcation_type, mode) values("+session.getAttribute("user_accno")+", "+Integer.parseInt(to_account_no)+", "+amt+", '"+LocalDateTime.now()+"', "+session.getAttribute("user_accno")+", 'Transfer', 'Debited')";
     		String sql3 = "insert into transactions(from_acc_no, to_acc_no, amount, dateandtime, acc_no,"
     				+ " transcation_type, mode) values("+session.getAttribute("user_accno")+", "+Integer.parseInt(to_account_no)+",  "+amt+", '"+LocalDateTime.now()+"', "+Integer.parseInt(to_account_no)+", 'Transfer', 'Credited')";
		 int y = Utils.getStatement().executeUpdate(sql2);
		 int z = Utils.getStatement().executeUpdate(sql3);
		  
		  
		  
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		 }
		  
		
		
	}

}
