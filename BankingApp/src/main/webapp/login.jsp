<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/e48d166edc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style/login_style.css">
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <title>Login Form</title>
</head>

<body>
<input type="hidden" id="msg" value="<%=request.getAttribute("msg")%>">
    <div class="Main-container">
        <div class="container-login">
            <div class="wrap-login">

                <div class="login-pic">
                    <img src="style/banklogo.jpg" alt="IMG">
                </div>

                <form action = "Login" class="login-form">
                    <span class="login-form-title">Login</span>

                    <div class="wrap-input">
                        <input type="text" class="input" name="email" placeholder="Email" required>
                        <span class="focus-input"></span>
                        <span class="symbol-input">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>
                    <div class="wrap-input">
                        <input type="password" class="input" name="pass" placeholder="Password" required>
                        <span class="focus-input"></span>
                        <span class="symbol-input">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="login-form-btn-container"> 
                        <input type="submit" class= "login-form-btn" value = "Login">
                    </div>

                  <div class="text-center p-t-1">
                      <span class="txt1">Forgot</span>
                      <a href="#" class="txt2"> Username / Password ?</a>
                  </div>
                  <div class="text-center p-t-2">
                      <a href="register.jsp" class="txt2">Create Your Account <i class="fa fa-long-arrow-right " aria-hidden="true"></i></a>
                  </div>

                </form>

            </div>
        </div>
    </div>
    
     <script src="vendor/jquery/jquery.min.js"></script>
   <script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var status=document.getElementById("msg").value;

if(status=='Registered'){
swal("Registration successful. Please login");
}


</script>
</body>
    