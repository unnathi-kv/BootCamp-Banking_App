package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UpdateInfo")
public class UpdateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher;
		 String email = (String)session.getAttribute("user_email");
		 String address = (String)request.getParameter("inputAddress");
		 String phone_no = (String)request.getParameter("inputPhone");
		 String gender = (String)request.getParameter("inputGender"); 
		 UserDetails userDetails = new UserDetails();
		 Utils utils = new Utils();
		 userDetails.setAddress(address);
		 userDetails.setPhoneno(phone_no);
		 userDetails.setGender(gender);
		 int x = utils.updateUser(userDetails,email);
		 if(x>0)
		 {
			 request.setAttribute("msg","Update");
			 dispatcher=request.getRequestDispatcher("updateinfo.jsp");
			 dispatcher.include(request, response);
			 response.sendRedirect("http://localhost:7017/BankingApp/Login?email="+session.getAttribute("user_email")+
						"&pass="+session.getAttribute("password"));
		 }
		 else
		 {
			 RequestDispatcher rd = request.getRequestDispatcher("updateinfo.jsp");
			rd.include(request, response);
			out.println("<p>Oops!! Error</p>");
		 }
		 
		
	}

}
