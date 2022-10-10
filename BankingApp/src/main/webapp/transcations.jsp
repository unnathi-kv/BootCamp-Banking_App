<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.Utils"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <title>Account Transactions</title>
</head>
<link rel="stylesheet" href="style/withdraw_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
<body>
<div id="logo"><p>SVT Finances.</p></div>

<div id="basic-accordian">
<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"> 
	<form action ="Login">
 	<input  type="button" id="accountTypeButton" onclick="this.value='<%=session.getAttribute("user_acctype")%>: <%=session.getAttribute("user_accno")%>'" style="float: left; background-color :#06D4EC;   font-family:'poppins',sans-serif ;
    font-size: 15px;color: black;"value="Account">
	 </form>
	<input type="button" id="balanceButton" onclick="this.value='<%=session.getAttribute("user_balance")%>'" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 15px; color: black;" value="Balance">
   
</div>
<div id="test-header" class="accordion_headings header_highlight">Account Overview</div>
	<div id="test-content">
      <div class="accordion_child">
   		<h2>Transaction History</h2>
        <%
	try {
		response.setContentType("text/html");
		
		RequestDispatcher dispatcher;
		Utils util = new Utils();
		session = request.getSession();
		String userName = (String) session.getAttribute("user_name");
		
		if(userName != null)
		{
			
			
			String sql = "select * from user_details where username = '" + userName + "';";
			ResultSet rs1 = Utils.getStatement().executeQuery(sql);
			double balance = 0;
			if(rs1.next())
			{
				balance = rs1.getDouble("amount");
			}
			
			sql = "select * from transactions where acc_no = (select acc_no from user_details where username = '" + userName + "');";
			ResultSet rs = Utils.getStatement().executeQuery(sql);
	%>
	
			<table  id ="transaction_table" align="center" cellpadding="15" border="1" style="background-color: ffffcc;">
			
	<%
			if(!rs.next()) {
	%>
					<tr>
						<td colspan=4 align="center">You have not made any transactions yet!</td>
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
					<th>Mode</th>
					<th>Date and Time</th>
				</tr>
				
				<tr>
					<td><%= rs.getInt("transcation_id") %></td>
					<td><%= rs.getInt("from_acc_no") %></td>
					<td><%= rs.getInt("to_acc_no") %></td>
					<td><%= rs.getDouble("amount") %></td>
					<td><%= rs.getString("mode") %></td>
					<td><%= rs.getString("dateandtime") %></td>
				</tr>
		<%
				while(rs.next()) {
					//System.out.println("inside trans");
		%>
							
					<tr>
						<td><%= rs.getInt("transcation_id") %></td>
						<td><%= rs.getInt("from_acc_no") %></td>
						<td><%= rs.getInt("to_acc_no") %></td>
						<td><%= rs.getDouble("amount") %></td>
						<td><%= rs.getString("mode") %></td>
						<td><%= rs.getString("dateandtime") %></td>
					</tr>
		<%
					}
			}
			/* con.close();
			stmt.close(); */
		}
		else
		{
			request.setAttribute("msg","NotLoggedin");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
   catch (Exception e)
    {
		e.printStackTrace();
	}
	%>
	</table>
	 <button class="button" onclick="ExportToExcel('xlsx')">Download</button>
  </div>
 	<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
    		<form action ="Login">
 	<input  type="button" id="userNameButton" onclick="this.value='<%=session.getAttribute("user_name")%>'" style="float: left; background-color :#06D4EC;   font-family:'poppins',sans-serif ;
    font-size: 15px;color: black;"value="User">
	 </form>
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