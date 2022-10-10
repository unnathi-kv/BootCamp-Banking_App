<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.test.Utils"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction Details</title>
<link rel="stylesheet" href="style/withdraw_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/02797c332f.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="logo"><p>SVT Finances.</p></div>
<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"></div>

<div id="basic-accordian">
<div id="test-header" class="accordion_headings header_highlight">Transaction Details</div>
	  <div id="test-content">
      <div class="accordion_child">
    
<h1 align="center">User Transactions details</h1>

       <%
     try {
			response.setContentType("text/html");
					
			RequestDispatcher dispatcher;
			
			session = request.getSession();
			
		/* 	String adminUserName = (String) session.getAttribute("adminUser");
			
			if(adminUserName != null)
			{ */
		
				
				
				String acc_no = request.getParameter("account_number");
				int user_account_no = Integer.parseInt(acc_no);
				
				if(user_account_no != 0)
				{
					String sql = "select * from transactions where acc_no = '"+ user_account_no +"' ";
					ResultSet rs = Utils.getStatement().executeQuery(sql);
				
				%>
				
    		<table id ="transaction_table" align="center" cellpadding="15" border="1" style="background-color: ffffcc;">
							
				<%
						if(!rs.next()) {
				%>
								<tr>
									<td colspan=4 align="center">User has not made any transactions yet!</td>
								</tr>
				<%
						}
						else
						{
				%>
							<tr>
									<th>Transaction ID</th>
									<th>From</th>
									<th>To</th>
									<th>Amount</th>
									<th>Type of transaction</th>
									<th>Date and Time</th>
							</tr>
								
							<tr>
								<td><%= rs.getInt("transcation_id") %></td>
								<td><%= rs.getInt("from_acc_no") %></td>
								<td><%= rs.getInt("to_acc_no") %></td>
								<td><%= rs.getDouble("amount") %></td>
								<td><%= rs.getString("transcation_type") %></td>
								<td><%= rs.getString("dateandtime") %></td>
							</tr>
								
				<%
					
							
							while(rs.next()) {
							
				%>
								
								<tr>
									<td><%= rs.getInt("transcation_id") %></td>
									<td><%= rs.getInt("from_acc_no") %></td>
									<td><%= rs.getInt("to_acc_no") %></td>
									<td><%= rs.getDouble("amount") %></td>
									<td><%= rs.getString("transcation_type") %></td>
									<td><%= rs.getString("dateandtime") %></td>
								</tr>
				<%
							}
						}
			}
	       else
	       {
	    	   RequestDispatcher rd = request.getRequestDispatcher("user_transactions.jsp");
	  			rd.include(request, response);
	  			out.println("<br><center><font color = 'red'; weight = bolder;>Enter the account number!</font></center>");
	    	  
	       }
			
		/* } */
			
     }
       catch (Exception e) {
		e.printStackTrace();
	}
	%>
     </table>
     <button class="button" onclick="ExportToExcel('xlsx')">Download</button>
     </div>
     </div>
          <div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
   
<form>
 <input type="button" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 15px; color:   black;" value=" Back" onclick="history.back()">
</form>   	
 	</div> 
     </div>
 <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
<script type="text/javascript">
	function ExportToExcel(type, fn, dl) {
	    var elt = document.getElementById('transaction_table');
	    var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
	    return dl ?
	    	XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }):
	      	XLSX.writeFile(wb, fn || ('Transactions.' + (type || 'xlsx')));
	}
</script>    
</body>
</html>