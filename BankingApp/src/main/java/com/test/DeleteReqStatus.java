package com.test;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteReqStatus")
public class DeleteReqStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			response.setContentType("text/html");
			
			RequestDispatcher dispatcher;
			
			
			
			HttpSession session = request.getSession();
			
			String userName = (String) session.getAttribute("user_name");
			
			if(userName != null)
			{	
				String sql = "select * from services where delete_user = 1 and username = '" + userName + "';";
				ResultSet rs = Utils.getStatement().executeQuery(sql);
				
				if(rs.next())
				{
//					boolean status =  rs.getBoolean("delete_user");
//					System.out.println(status);
//					
//					if(status)
//					{
						request.setAttribute("msg","DeleteStatApplied");
						dispatcher=request.getRequestDispatcher("index.jsp");
						dispatcher.forward(request, response);
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("delete.jsp");
					rd.forward(request, response);
				}
					
				}
//				else
//				{
////					RequestDispatcher rd = request.getRequestDispatcher("delete.jsp");
////					rd.forward(request, response);
//					response.sendRedirect("delete.jsp");
//				}
				
			
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
