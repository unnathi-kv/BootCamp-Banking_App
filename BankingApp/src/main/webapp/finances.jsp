<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Finances</title>
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
<div id="test-header" class="accordion_headings header_highlight">Finances</div>
	  <div id="test-content">
      <div class="accordion_child">
      <h3 style="float : left; ">Branch:XXXXXX</h3>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nunc ligula nisl, egestas non, pharetra vel, scelerisque accumsan, lacus. Proin nibh. Aenean dapibus. Quisque facilisis, ligula ut blandit hendrerit, purus neque rhoncus ipsum, 
      	sit amet ultrices mauris augue non arcu. Donec et sem nec libero viverra accumsan.</p>   	
      	<button class="button">Account Overview</button>
		<button class="button">Account Activity</button>
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