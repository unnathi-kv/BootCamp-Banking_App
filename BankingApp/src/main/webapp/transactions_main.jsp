<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.test.Utils"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta charset="UTF-8">
<title>User Transactions</title>
<link rel="stylesheet" href="style/withdraw_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/02797c332f.js" crossorigin="anonymous"></script>
</head>
<body>

<div id="logo"><p>SVT Finances.</p></div>
<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"></div>

<div id="basic-accordian">
<div id="test-header" class="accordion_headings header_highlight">User Transactions</div>
	  <div id="test-content">
      <div class="accordion_child">
    
<h1 align="center">User Details</h1>
 <form action="user_transactions.jsp">
<div class="form-body"> 
		<div class="form-group">
		<label  class="label-title">Enter account number*</label><br>
          <input type="number" name="account_number" class="form-input"  placeholder="Enter account number" required="required">
          </div>
          
          </div>
         
           <input type="submit" class="button"  value="Submit">
    	</form>
   
   
   
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