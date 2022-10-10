<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style/withdraw_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
  <link rel="stylesheet" href="alert/dist/sweetalert.css">

<title>Delete</title>
<style type="text/css">
	.btn {
		margin-left: 45%;
	}
</style>
</head>

<body>
<input type="hidden" id="msg" value="<%=request.getAttribute("msg")%>">

<form action="DeleteAccount"> 

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
<div id="test-header" class="accordion_headings header_highlight">Delete Account</div>
	<div id="test-content">
      <div class="accordion_child">
      
      	 <div class="form-body">
       <div class="form-group">
          <label for="address" class="label-title">Account number to be deleted*</label><br>
          <input type="text" name="account_no" class="form-input" placeholder="Enter your account number" value="<%=session.getAttribute("user_accno")%>"disabled>        
        </div>
       
        <div class="horizontal-group">
        <div class="form-group">
            <label class="label-title">Enter your username to confirm your account deletion*:</label>
            <div class="input-group">
             <input type="text" name="username" class="form-input" placeholder="Enter your username" required="required" />          
            </div>
          </div>
         </div> 
        </div>
	</div>
	 <div class="btn">
	    <input type="submit"  class="button" value="Submit">
	 </div>
	</div>
	
 	<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
    	<form action ="Login">
 	<input  type="button" id="userNameButton" onclick="this.value='<%=session.getAttribute("user_name")%>'" style="float: left; background-color :#06D4EC;   font-family:'poppins',sans-serif ;
    font-size: 15px;color: black;"value="User">
	 </form>
<a href="index.jsp">
 <input type="button" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 15px; color:   black;" value=" Back">
 </a> 	
 	</div> 
</div>
</form>
<script src="vendor/jquery/jquery.min.js"></script>
   <script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var status=document.getElementById("msg").value;

if(status=='Delete'){
swal("Delete request submitted successfully!!");
}

</script>
</body>
</html>