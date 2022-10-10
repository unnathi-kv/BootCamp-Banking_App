<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Total Users</title>
<link rel="stylesheet" href="style/myinfo_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/02797c332f.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="logo"><p>SVT Finances.</p></div>
<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"></div>

<div id="basic-accordian">
<div id="test-header" class="accordion_headings header_highlight">Total Users</div>
	  <div id="test-content">
      <div class="accordion_child">
     
<h1 align="center">User Details</h1>
<%
Connection con = null;
try{
	Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_app?autoReconnect=true&useSSL=false", "root", "password");
    PreparedStatement ps = con.prepareStatement("select * from user_details");
    ResultSet rs = ps.executeQuery();
    %>
    <table align="center" cellpadding="15" border="1" style="background-color: ffffcc;">
    <tr>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Phone No.</th>
    <th>Account Type</th>
    <th>Account No</th>
    <th>UPI Id</th>
    <th>Balance</th>
    </tr>
    <%
    while(rs.next()){
    %>
    <tr>
   <td style= "color: black;"><%=rs.getString("fname") %></td>
    <td><%=rs.getString("lname") %></td>
    <td><%=rs.getString("phoneno") %></td>
    <td><%=rs.getString("acc_type") %></td>
    <td><%=rs.getInt("acc_no") %></td>
    <td><%=rs.getString("upi") %></td>
    <td><%=rs.getDouble("amount") %></td>
    </tr>
    <%} %>
    <%
    rs.close();
    con.close();
}catch(Exception e){
	out.println("Unable to connect to database");
}
%>
    </table>
       </div>
      </div>
      <div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
    	
<form>
 <input type="button" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 15px; color:   black;" value=" Back" onclick="history.back()">
</form>   	
 	</div> 
   </div>
</body>
</html>