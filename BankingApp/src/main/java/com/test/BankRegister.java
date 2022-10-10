package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.Iterator;

import org.apache.el.util.Validation;

import com.exceptions.Validations;


@WebServlet("/BankRegister")
public class BankRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher;
		UserDetails userDetails = new UserDetails();
		Utils util =  new Utils();
		String card_no=null;
		//Get parameters from register.jsp 
		
		String username = (String)request.getParameter("username");
		String fname = (String)request.getParameter("firstname");
		String lname = (String)request.getParameter("lastname");
		String password = (String)request.getParameter("password");
		String repassword = (String)request.getParameter("confirm-password");
		String address = (String)request.getParameter("address");
		String aadhar_no = (String)request.getParameter("aadharno");
		String acc_type = (String)request.getParameter("account_type");
		String card = (String)request.getParameter("card");
		String gender = (String)request.getParameter("gender");
		String email = (String)request.getParameter("email");
		String phoneno = (String)request.getParameter("phoneno");
		String amount = (String)request.getParameter("amount");
		
		
	
	
		try {
		  	  
			 
				if(card.equals("yes"))
				{
				 card_no=Utils.generateCardNo();
				}
				else
				{
					card_no = "NA";
				}
				
				//validating password, phone number, aadhar number and minimum balance
				
				Validations.checkPassword(password, repassword);
				Validations.checkPhoneno(phoneno);
				Validations.checkAadharno(aadhar_no);
				Validations.checkMinBalance(Double.parseDouble(amount));
				
				
				userDetails.setAadharno(aadhar_no);
				// userDetails.setAcc_no(acc_type);
				userDetails.setAcc_type(acc_type);
				userDetails.setAddress(address);
				userDetails.setCardno(card_no);
				userDetails.setUsername(username);
				userDetails.setFname(fname);
				userDetails.setLname(lname);
				userDetails.setPassword(password);
				userDetails.setRepassword(repassword);
				userDetails.setGender(gender);
				userDetails.setPhoneno(phoneno);
				userDetails.setEmail(email);
				userDetails.setAmount(Double.parseDouble(amount));
					
				String upi = Utils.generateUPI(userDetails);
				userDetails.setUpi(upi);
				// System.out.println(upi);
				
				
				// Inserting new user values into database
				int x = util.registerUser(userDetails);
				
				if(x>0)
				{
						
					 request.setAttribute("msg","Registered");
					 dispatcher=request.getRequestDispatcher("login.jsp");
					 dispatcher.forward(request, response);
				}
				else
				 {
					
					request.setAttribute("msg","Username");
					 dispatcher=request.getRequestDispatcher("register.jsp");
					 dispatcher.include(request, response);
				 }
			
		 }
		
		catch(Exception e)
		{
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.include(request, response);
			out.println("<br><br><center><font color = 'red'; weight = bolder;>" + e.getMessage() + "</font></center>");
			e.printStackTrace();
		}
				
	}
	
}
