package com.test;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class BankLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		session.setAttribute("user_email", email);
		String password= request.getParameter("pass");
		session.setAttribute("password", password);
		UserDetails userDetails = new UserDetails();

		
		List<UserDetails> list = new ArrayList<UserDetails>();
		try
		{
			//checking if user is present in database 
			
			String sql="select * from user_details where email = '"+email+"' ";
			ResultSet rs = Utils.getStatement().executeQuery(sql);
			while(rs.next())
			{
				userDetails.setUsername(rs.getString(1));
				userDetails.setEmail(rs.getString(2));
				userDetails.setPassword(rs.getString(3));
				userDetails.setFname(rs.getString(4));
				userDetails.setLname(rs.getString(5));
				userDetails.setPhoneno(rs.getString(6));
				userDetails.setAddress(rs.getString(7));
				userDetails.setAadharno(rs.getString(8));
				userDetails.setUpi(rs.getString(9));
				userDetails.setAcc_type(rs.getString(10));
				userDetails.setCardno(rs.getString(11));
				Integer id = rs.getInt(12);
  				userDetails.setAcc_no(id.toString());
  				userDetails.setGender(rs.getString(13));
				userDetails.setAmount(rs.getDouble(14));
				
				list.add(userDetails);
			}
			
			 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		
		}
		
		
		for(UserDetails u : list)
		{
			
			if(email.equals(u.getEmail()) && password.equals(u.getPassword()))
				{
					//System.out.println(u.getEmail());
					//System.out.println(u.getPassword());
				
					session.setAttribute("user_name", userDetails.getUsername());
					session.setAttribute("user_full_name", (userDetails.getFname()+" "+userDetails.getLname()));
					session.setAttribute("user_phoneno", userDetails.getPhoneno());
					session.setAttribute("user_address", userDetails.getAddress());
					session.setAttribute("user_aadharno", userDetails.getAadharno());
					session.setAttribute("user_upi", userDetails.getUpi());
					session.setAttribute("user_cardno", userDetails.getCardno());
					session.setAttribute("user_accno", userDetails.getAcc_no());
					session.setAttribute("user_acctype", userDetails.getAcc_type());
					session.setAttribute("user_gender", userDetails.getGender());
					session.setAttribute("user_balance",userDetails.getAmount());
					
					
					
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
					
				    out.println("Logged in successfully");
				}
			else
				{
					RequestDispatcher rd = request.getRequestDispatcher("login.html");
					rd.include(request, response);
					out.println("Invalid email or password!! Please check");
				}
		}
		
		
		
		
		//Admin login 
		
		AdminDetails adminDetails = new AdminDetails();
		List<AdminDetails> list1 = new ArrayList<AdminDetails>();
		try
		{
			String sql="select * from admin where admin_name = '"+email+"' ";
			ResultSet rs = Utils.getStatement().executeQuery(sql);
			while(rs.next())
			{
				adminDetails.setAdmin(rs.getString(1));
				adminDetails.setAdmin_password(rs.getString(2));
				list1.add(adminDetails);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		
		}
		for(AdminDetails a : list1)
		{
			if(email.equals(a.getAdmin())&& password.equals(a.getAdmin_password()))
			{
				session.setAttribute("adminUser", a.getAdmin());
				RequestDispatcher rd = request.getRequestDispatcher("admin_page.html");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("text.html");
				rd.forward(request, response);
				out.println("Wrong username and password");
			}
		}
		
		
	}

}
