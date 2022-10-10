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

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		Utils utils = new Utils();
		int accNo = Integer.parseInt(request.getParameter("accNo"));
		try
		{
			String sql2="delete from user_details where acc_no= '"+accNo+"' ";
			int x = utils.getStatement().executeUpdate(sql2);
			if(x>0)
			{
				String sql = "update delete_users set status = '"+"deleted"+"' where acc_no = '"+accNo+"' ";
				int y = utils.getStatement().executeUpdate(sql);
				RequestDispatcher rd = request.getRequestDispatcher("admin_delete_users.jsp");
				rd.include(request, response);
				out.println("<center><font color = 'red'; weight = bolder;>User deleted successfully</font></center>");
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("admin_delete_users.jsp");
				rd.include(request, response);
				out.println("<center><font color = 'red'; weight = bolder;>Error!!Error!!</font></center>");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
}
}
