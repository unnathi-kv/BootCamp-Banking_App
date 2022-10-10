package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String email = (String)session.getAttribute("user_email");
		RequestDispatcher dispatcher;
		String user_name = request.getParameter("username");
		UserDetails userDetails = new UserDetails();
		Utils utils = new Utils();
//		String flag = "true";
		
			
		
		try
		{
		if( user_name.equals(session.getAttribute("user_name")))
		{
			session.setAttribute("userName",user_name);
			String sql = "select acc_no from user_details where username = '"+user_name+"' ";
			ResultSet rs = Utils.getStatement().executeQuery(sql);
			while(rs.next())
			{
				String acc_no=String.valueOf(rs.getInt(1));
				userDetails.setAcc_no(acc_no);
			}
			
			session.setAttribute("user_acc_no", userDetails.getAcc_no());
			
			
			
			String sql1="insert into `services` (`acc_no`,`delete_user`,`username`) values('"+userDetails.getAcc_no()+"',"+1+", '"+session.getAttribute("user_name")+"') ";
			int x =Utils.getStatement().executeUpdate(sql1);
			
			String sql2 = "insert into `delete_users` (`user_name`,`acc_no`,`status`) values('"+session.getAttribute("user_name")+"',"
					+ "'"+userDetails.getAcc_no()+"','"+"waiting"+"' )";
			int y = Utils.getStatement().executeUpdate(sql2);
//			//String flag = (String)request.getAttribute("flag");
//			flag = "false";
//			request.setAttribute("flag", flag);
			
			request.setAttribute("msg","Delete");
			 dispatcher=request.getRequestDispatcher("index.jsp");
			 dispatcher.include(request, response);
//			out.println("<center><font color = 'red'; weight = bolder;><p>Request submitted!!</p></font></center>");
			
			
			
		}
					
		else 
		{
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		    
		}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
