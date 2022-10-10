<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
  <head>
    <meta charset="utf-8">
    <title>Register Form</title>
    <link rel="stylesheet" href="style/register_style.css">
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
  </head>
   
  <body>
  <input type="hidden" id="msg" value="<%=request.getAttribute("msg")%>">
    <form class="signup-form" action="BankRegister">

      <!-- form header -->
      <div class="form-header">
        <h1>Create Account</h1>
      </div>

      <!-- form body -->
      <div class="form-body">

        <!-- Firstname and Lastname -->
        <div class="horizontal-group">
          <div class="form-group left">
            <label for="firstname" class="label-title">First name *</label>
            <input type="text" name="firstname" class="form-input" placeholder="Enter your first name" required="required" />
          </div>
          <div class="form-group right">
            <label for="lastname" class="label-title">Last name</label>
            <input type="text" name="lastname" class="form-input" placeholder="Enter your last name" />
          </div>
        </div>
        <div class="horizontal-group">
        <!-- Username -->
          <div class="form-group left">
            <label for="username" class="label-title">Username *</label>
            <input type="text" name="username" class="form-input" placeholder="Enter your username" required="required" />
          </div>
 
        <!-- Email -->
        <div class="form-group right">
          <label for="email" class="label-title">Email*</label>
          <input type="email" name="email" class="form-input" placeholder="Enter your email" required="required">
        </div>
		</div>
        <!-- Password and confirm password -->
        <div class="horizontal-group">
          <div class="form-group left">
            <label for="password" class="label-title">Password *</label>
            <input type="password" id ="psw" name="password"  class="form-input" placeholder="Enter your password" required="required">
          	
          </div>
          <div class="form-group right">
            <label for="confirm-password" class="label-title">Confirm Password*</label>
            <input type="password" class="form-input" name="confirm-password" placeholder="Enter your password again" required="required">
          </div>
        </div>
        
         <div class="form-group">
          <label for="phoneno" class="label-title">Phone number*</label>
          <input type="number" name="phoneno" class="form-input"   placeholder="Enter your phone number" required="required">
        </div>
        
        <div class="form-group">
          <label for="aadharno" class="label-title">Aadhar Card Number*</label>
          <input type="number" name="aadharno" class="form-input" placeholder="Enter your aadhar card number" required="required">
        </div>
        
         <div class="form-group">
          <label for="address" class="label-title">Address(as per aadhar card)*</label>
          <input type="text" name="address" class="form-input" placeholder="Enter your address" required="required">
        </div>
        <div class="form-group">
          <label for="address" class="label-title">Balance Amount*</label>
          <input type="text" name="amount" class="form-input" placeholder="Enter your amount" required="required">
        </div> 

        <!-- Gender and Hobbies -->
        <div class="horizontal-group">
        <div class="form-group left">
            <label class="label-title">Account Type:</label>
            <div class="input-group">
              <label ><input type="radio" name="account_type" value="Savings" > Savings</label>
              <label ><input type="radio" name="account_type" value="Current"> Current</label>

            </div>
          </div>
          <div class="form-group right">
            <label class="label-title">Gender:</label>
            <div class="input-group">
              <label ><input type="radio" name="gender" value="Male" id="male"> Male</label>
              <label ><input type="radio" name="gender" value="Female" id="female"> Female</label>
              <label><input type="radio" name="gender" value="Others" id="others"> Others</label>   
            </div>
          </div>
          <div class="form-group left">
            <label class="label-title">Card</label>
            <div class="input-group">
              <label><input type="radio" name="card" value="yes" > Yes</label>
              <label ><input type="radio" name="card" value="no" > No</label>
            </div>
          </div>
        </div>
      <!-- form-footer -->
      <div class="form-footer ">
        <button type="submit"  class="btn">Create</button>
      </div>
    
    </form>
    
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

      var rangeLabel = document.getElementById("range-label");
      var experience = document.getElementById("experience");
  
      function change() {
      rangeLabel.innerText = experience.value + "K";
      }
      var status=document.getElementById("msg").value;

      if(status=='PasswordIncorrect'){
      swal("Please re enter your password correctly!!");
      }
      if(status=='Phoneno'){
    	  swal("Phone number should be of 10 digits.");
      }
      if(status=='Aadharno'){
    	  swal("Aadhar card number is incorrect. Please check and enter a valid one!!");
      }
      if(status=='MinBalance')
    	  {
    	  swal("Minimum balance should be 2000");
    	  }
      if(status=='Username')
    	  {
    	  swal("Username is already taken!! Please enter a new one.");
    	  }
      
    </script>
  </body>























