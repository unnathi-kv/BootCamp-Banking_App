<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Info</title>
<link rel="stylesheet" href="style/myinfo_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/02797c332f.js" crossorigin="anonymous"></script>
<style type="text/css">
	table tr td {
		text-align: left;
		padding-left: 15px;
	}
</style>
</head>

<body>
<form action = "Login"> 
<div id="logo"><p>SVT Finances.</p></div>
<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"></div>

<div id="basic-accordian">
<div id="test-header" class="accordion_headings header_highlight">My Info</div>
	  <div id="test-content">
      <div class="accordion_child">
	      
	      <div class="profile">
	          <img src="style/img.png" alt="USER" width="100" height="100">
				
	            <div class="name">
	                <%=session.getAttribute("user_name")%>       
	            </div>
	        </div>
	    <div class="main">
        <h2>Profile</h2>
        <div class="card">
            <div class="card-body">
            <a href="updateinfo.jsp">
          	<button style="float: right; background-color : #06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 18px; color: black; border: none;" type="button"><i class="fa fa-pen-to-square"></i></button>
    </a>
			<table>
                    <tbody>
                    
                     <tr>
                            <td><label class="small mb-1" >Name </label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_full_name")%></td>
                        </tr>
                        
                        <tr>
                            <td><label class="small mb-1" >Email address</label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_email")%></td>
                            
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Address</label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_address")%></td>
                        	
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Phone number</label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_phoneno")%></td>
                        	
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Gender</label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_gender")%></td>
                        	
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Aadhar number</label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_aadharno")%></td>
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Account number</label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_accno")%></td>
                        	
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Account Type</label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_acctype")%></td>
                        	
                        </tr>
                        <tr>
                            <td><label class="small mb-1" >Card number</label></td>
                            <td>:</td>
                            <td><%=session.getAttribute("user_cardno")%></td>
                        	
                        </tr>
                        
                        
                        
                    </tbody>
                	</table>
                
            </div>
        </div>
	        
      
      
</div>
</div>


 <div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
<form>
 <input type="button" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 15px; color:   black;" value=" Back" onclick="history.back()">
</form>
</div>
</div>
</div>
</form>
</body>
</html>