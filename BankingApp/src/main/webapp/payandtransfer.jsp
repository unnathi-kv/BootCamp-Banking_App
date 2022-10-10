<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pay & Transfer</title>
</head>
<link rel="stylesheet" href="style/style.css" type="text/css" media="screen" />
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
<div id="test-header" class="accordion_headings header_highlight">Pay & Transfer</div>
	  <div id="test-content">
      <div class="accordion_child">
      
      	<a href="withdraw.jsp"> 
      	<button class="button">Withdraw</button>
      	</a>
      	<a href="deposit.jsp">
		<button class="button">Deposit</button>
		</a>
		<a href="transfer.jsp"> 
		<button class="button">Transfer</button>
		</a>
</div>
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
</body>
</html>