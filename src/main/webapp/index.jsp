<html>
<head>
<title></title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--CSS FOR FORM -->
<style>
body {
  margin: 0;
  padding: 0;
  /* background-color: #17a2b8; */
  background-image: url("img/res5.jpg");
  height: 100vh;
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
  max-width: 600px;
  height: 340px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}
</style>
</head>
<%
String msg="";
if(request.getAttribute("msg")!=null)
{
	msg=(String)request.getAttribute("msg");
}

%>
<body bgcolor="#bdbdbd">
 <div id="login">
        <h3 class="text-center text-black pt-5">Restaurant Management System</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12" >
                    
                        <form id="login-form" class="form" action="LoginCtrl" method="post">
                        
                            <h3 class="text-center text-info">Login</h3>
                            <h6 class="text-center text-danger pt-1"><%=msg %></h6>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                           
                                
                           
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            <div class="form-group" align="center" >
                                <!-- <label for="remember-me" class="text-info"><span>Remember me</span>�<span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br> -->
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Login">
                            </div>
                           
                        </form>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>