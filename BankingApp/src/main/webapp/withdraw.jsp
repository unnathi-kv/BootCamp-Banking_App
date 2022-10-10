<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw</title>

<style type="text/css">
	.btn {
		margin-left: 42%;
	}
</style>
</head>

<link rel="stylesheet" href="style/withdraw_style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript" src="style/accordian.pack.js"></script>

<body>
<input type="hidden" id="msg" value="<%=request.getAttribute("msg")%>">
<form action="Withdraw"> 
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
<div id="test-header" class="accordion_headings header_highlight">Withdraw</div>
	<div id="test-content">
      <div class="accordion_child">
      <h3 style="float : left; ">Branch:XXXXXX</h3>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nunc ligula nisl, egestas non, pharetra vel, scelerisque accumsan, lacus. Proin nibh. Aenean dapibus. Quisque facilisis, ligula ut blandit hendrerit, purus neque rhoncus ipsum, 
      	sit amet ultrices mauris augue non arcu. Donec et sem nec libero viverra accumsan.</p> 
		</div>
		<div class="form-body"> 
		<div class="form-group">
		<label  class="label-title">Amount to withdraw*</label><br>
          <input type="text" name="amount" class="form-input" min =1 placeholder="Enter your amount" required="required">
          </div>
          </div>
        <div class="btn">	
          <button class="button">Withdraw</button>
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
</form>
 <script src="vendor/jquery/jquery.min.js"></script>
   <script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var status=document.getElementById("msg").value;

if(status=='Balance'){
swal("Insufficent Balance!!");
}

</script>
</body>
</html>