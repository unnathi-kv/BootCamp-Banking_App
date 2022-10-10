package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Insurance")
public class Insurance extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher;
		String email = (String)session.getAttribute("user_email");
		UserDetails userDetails = new UserDetails();
		Utils util = new Utils();
		
		String applicant_name =request.getParameter("applicant-name");
		String age = request.getParameter("applicant-age");
		String chronic_disease = request.getParameter("disease-name");
		String insurance_type = request.getParameter("insurance-type"); 
		
		
		
		try
		{
			String sql = "insert into `insurance`(`applicant_name`,`age`,`chronic_disease`,`loan_type`,`acc_no`,`user_name`,`status`) values('"+applicant_name+"','"+Integer.parseInt(age)+
					"','"+chronic_disease+"','"+insurance_type+"','"+Integer.parseInt((String) session.getAttribute("user_accno"))+"','"+session.getAttribute("user_name")+"', '"+"waiting"+"'  )";
			int x = Utils.getStatement().executeUpdate(sql);
			if(x>0)
			{
				request.setAttribute("msg","Insurance");
				 dispatcher=request.getRequestDispatcher("index.jsp");
				 dispatcher.forward(request, response);
//				 out.println("<center><font color = 'red'; font-size=15px; weight = bolder;>Request Submitted!!</font></center>");
			}
			
			String sql1 = "insert into `services`(`insurance`,`username`,`acc_no`) values('"+1+"','"+session.getAttribute("user_name")+"','"+Integer.parseInt((String) session.getAttribute("user_accno"))+"' )";
			int y = Utils.getStatement().executeUpdate(sql1);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
