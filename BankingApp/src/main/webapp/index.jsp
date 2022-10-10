<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>SVT Finances</title>
  <link rel="stylesheet" href="style/style.css" type="text/css" media="screen" />
  <script type="text/javascript" src="style/accordian.pack.js"></script>
  <link rel="stylesheet" href="alert/dist/sweetalert.css">
  <style type="text/css">
	.btn {
		margin-left: 0;
	}
	</style>
  
</head>
<body onload="new Accordian('basic-accordian',5,'header_highlight');">
<input type="hidden" id="msg" value="<%=request.getAttribute("msg")%>">


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
<div id="test-header" class="accordion_headings header_highlight">Home</div>
	  <div id="test-content">
      <div class="accordion_child">
      
      <img class="logo-img" src="style/banklogo.jpg" width="130" height="130">
      	<h1>Welcome to SVT Finances.</h1>
      	<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nunc ligula nisl, egestas non, pharetra vel, scelerisque accumsan, lacus. Proin nibh. Aenean dapibus. Quisque facilisis, ligula ut blandit hendrerit, purus neque rhoncus ipsum, 
      	sit amet ultrices mauris augue non arcu. Donec et sem nec libero viverra accumsan.</p>
		</div>
		</div>
<div id="test1-header" class="accordion_headings"> Services </div>
      <div id="test1-content">
      <div class="accordion_child">
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nunc ligula nisl, egestas non, pharetra vel, scelerisque accumsan, lacus</p>
        <a href="payandtransfer.jsp"> 
        <button class="button">Pay & Transfer</button>
        </a>
         <a href="transcations.jsp"> 
		<button class="button">Account Overview</button>
		</a>
		 <a href="InsuranceCheckStatus"> 
		<input type ="submit" class="button" value="Health Insurance">
		</a>
	  </div>
      </div>
      
<div id="test2-header" class="accordion_headings">Profile</div>
    <div id="test2-content">
      <div class="accordion_child">
      	 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nunc ligula nisl, egestas non, pharetra vel, scelerisque accumsan, lacus</p>
      	<div class="btn">
      	<a href="myinfo.jsp"> 
      	<button class="button">My Info</button>
      	</a>
      	<a href="DeleteReqStatus">
      	<input type ="submit" class="button" value="Delete Account">
      	</a>
      	
      	<!-- <form action ="DeleteReqStatus">      	
	    <input type ="submit" class="button" value="Delete Account">
        </form> -->
        </div>
        
        
      </div>
     </div>
     
 
 <div id="test3-header" class="accordion_headings">Contact Us</div>
    <div id="test3-content">
      <div class="accordion_child">
        <p>FAQ's</p>
        <p>Phone number : +91 9398341502</p>
      </div>
     </div>  
     <div id="test4-header" class="accordion_headings">About Us</div>
    <div id="test4-content">
      <div class="accordion_child">
        <h1>SVT Finances.</h1>
        <p>Started in 2015 and we are here now.</p>
      </div>
     </div>
    <div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
    <form action ="Login">
 	<input  type="button" id="userNameButton" onclick="this.value='<%=session.getAttribute("user_name")%>'" style="float: left; background-color :#06D4EC;   font-family:'poppins',sans-serif ;
    font-size: 15px;color: black;"value="User">
	 </form>
    <form action="Logout"> 
 	<button style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 15px; color: black;">Logout</button>
    </form>
</div>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
   <script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var status=document.getElementById("msg").value;

if(status=='Insurance'){
swal("Request Submitted. Check status for request details!!");
}
if(status=='DeleteStatApplied')
	{
	swal("Delete request already submitted!! You can not access the services for the time being!!");
	}
if(status=='Delete'){
	swal("Delete request submitted successfully!!");
	}
	if(status=='InsuranceStat')
		{
		swal("You have requested for deletion of account!!You can not access the services for the time being!!");
		}

</script>

</body>
</html>