<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Health Insurances</title>
<style type="text/css">
	.btn {
		margin-left: 0;
	}
	
	label {
		font-size: 18px;
	}
	
	.form-body .label-name {
		color: #333333;
		font-size: 18px;
		font-weight: bold;
	}
</style>
</head>
<link rel="stylesheet" href="style/withdraw_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
<body>
<form action="Insurance"> 
<div id="logo"><p>SVT Finances.</p></div>

<div id="basic-accordian">
<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"> 
</div>
<div id="test-header" class="accordion_headings header_highlight">Health Insurance</div>
	  <div id="test-content">
      <div class="accordion_child">
      
      	<h2>Details on personal loan</h2>
      	<div class="form-body"> 
		<div class="form-group">
		<label  class="label-name">Please enter the applicant name</label><br>
          <input type="text" name="applicant-name" class="form-input"  placeholder="Enter name">
          <br><br>
          <label  class="label-name">Please enter the age of the applicant</label><br>
          <input type="number" name="applicant-age" class="form-input"  placeholder="Enter age">
          <br><br>
          <label  class="label-name">Does your family has any chronical diseases. If yes please select from diseases below</label><br>
      		<br>
      		<label for="diseases" >Choose disease :</label>
	    	<select name="disease-name" id="loan-amount">
	     	<option value="Cancer">Cancer</option>
	     	<option value="Heart-disease">Heart Diseases</option>
	     	<option value="Diabetes">Diabetes</option>
	     	<option value="Kidney-disease">Kidney Disease</option>
	     	<option value="None">None</option>
	   </select><br><br>
 			<label for="insurance">Choose type of premium :</label>
	    <select name="insurance-type" id="insurance-type">
	     <option value="Monthly">2000/-  Monthly</option>
	     <option value="Quarterly">6000/-  Quarterly</option>
	     <option value="Half-yearly">12000/- Half yearly</option>
	     <option value="Yearly">24000/- Yearly</option>
	   </select>
          </div>
          </div>
          
      	
	  <br>
	   
	
	  <div class="btn">
	  		<button class="button">Submit</button>
  		  	<input formaction="user_service_requests.jsp" type="submit" class="button" value="Check Status">
      </div>
	 
</div>
</div>
	</form>
	<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
	<form action ="Login">
 	<input  type="button" id="userNameButton" onclick="this.value='<%=session.getAttribute("user_name")%>'" style="float: left; background-color :#06D4EC;   font-family:'poppins',sans-serif ;
    font-size: 15px;color: black;"value="User">
	 </form>
	  <form>
	  <a href="index.jsp"> 
	 <input type="button" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
	    font-size: 15px; color:   black;" value=" Back">
	    </a>
	</form>
	</div>
</div>

</body>
</html>