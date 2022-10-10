<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Info</title>
<style type="text/css">
	.btn {
		margin-left: 42%;
	}
</style>
<link rel="stylesheet" href="style/myinfo_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/02797c332f.js" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="alert/dist/sweetalert.css">
  
</head>

<body>
<input type="hidden" id="msg" value="<%=request.getAttribute("msg")%>">

<form action = "UpdateInfo"> 
<div id="logo"><p>SVT Finances.</p></div>
<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"></div>

<div id="basic-accordian">
<div id="test-header" class="accordion_headings header_highlight">Update Info</div>
	  <div id="test-content">
      <div class="accordion_child">
	      
	      <div class="profile">
	          <img src="style/img.png" alt="USER" width="100" height="100">
				
	            <div class="name">
	                <%=session.getAttribute("user_name")%>        
	            </div>
	        </div>
	    <div class="main">
        <h2>IDENTITY</h2>
        <div class="card">
            <div class="card-body">
			<table>
                    <tbody>                          
                        <tr>
                            <td><label class="small mb-1" >Address</label></td>
                            <td>:</td>
                            <td> <input class="form-control" name="inputAddress" type="text" placeholder="Enter your location" 
                            value=" <%=session.getAttribute("user_address")%>"></td>         	
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Phone number</label></td>
                            <td>:</td>
                            <td><input class="form-control" name="inputPhone" type="tel" placeholder="Enter your phone number" 
                            value=" <%=session.getAttribute("user_phoneno")%>"></td>
                        
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Gender</label></td>
                            <td>:</td>
                            <td><input class="form-control" name="inputGender" type="text" placeholder="Enter your gender"
                             value=" <%=session.getAttribute("user_gender")%>"></td>
                        </tr>
                    </tbody>
                	</table>
                
           		</div>
        		</div>   
			</div>
		</div>
 <div class="btn">
 <button class="save_button" >Save changes</button>
</div>

 	<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"> 
		<a href="index.jsp">
 			<input type="button" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    		font-size: 15px; color:   black;" value=" Back" >
		</a>
	</div>
</div>
</div>
</form>
<script src="vendor/jquery/jquery.min.js"></script>
   <script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var status=document.getElementById("msg").value;

if(status=='Update'){
swal("Update Successfull!!");
}

</script>
</body>
</html>