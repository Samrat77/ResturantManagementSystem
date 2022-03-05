<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.restaurant.Bean.UserClass"%>
<%@page import="com.restaurant.Model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%@include file="menubar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Admin profile</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	
	<style>
body {
  margin: 0;
  padding: 0;
  background-color: #e0e0e0;
  height: 100vh;
}</style>
</head>
<body>
<%
String username=(String)session.getAttribute("admin");
System.out.print("Value of admin is "+username);
Connection con=DBConnection.getConn();
Statement statement=con.createStatement();
String query="SELECT * FROM R_USER WHERE USERNAME='"+username+"'";
ResultSet rs=statement.executeQuery(query);
while(rs.next())
{
	%>

	<div class="container">
		<br>
		<div class="row justify-content">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4>
							<strong>Admin</strong>
						</h4>
					</div>
					<div class="card-header">
						<strong>Update Information</strong>
						<%if(request.getAttribute("edit")!= null) {%>
						
						<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Hey!!</strong> Profile Updated Successfully 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%} %>
					</div>
					<div class="card-body">

						<form class="form-horizontal" method="post" action="UserCtrl">

							<div class="form-group">
								<label for="name" class="cols-sm-2 control-label"><strong>UserName</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="uname" id="name"
											placeholder="Enter User Name" disabled="disabled"  value="<%=rs.getString(2)%>"/>
					
									</div>
																				
				
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label"><strong>Email</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="emailid"
											placeholder="Enter Email id" value="<%=rs.getString(3) %>" />
									</div>
									<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("emailid") == null) ? "" : request.getAttribute("emailid")%></strong></span>
								</div>
							</div>
							<div class="form-group">
								<label for="username" class="cols-sm-2 control-label"><strong>First
										name</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="fname"
											id="username" disabled="disabled" placeholder="Enter First name" value="<%=rs.getString(4) %>" />
									</div>
									<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>
									
								</div>
							</div>

							<div class="form-group">
								<label for="username" class="cols-sm-2 control-label"><strong>Last
										name</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="lname"
											id="username" disabled="disabled" placeholder="Enter Last name" value="<%=rs.getString(5) %>" />
									</div>
									
								</div>
							</div>

							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label"><strong>Phone</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="phone"
											placeholder="Enter your Phone number" value="<%=rs.getString(6) %>" />
									</div>
									<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("no") == null) ? "" : request.getAttribute("no")%></strong></span>
								</div>
							</div>

							
								<div class="form-group">
									<label for="confirm" class="cols-sm-2 control-label"><strong>Gender</strong></label>
										
									
									<div class="col-sm-10">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="choose"
												id="gridRadios1" value="<%=rs.getString(7) %>"  disabled="disabled"> <label
												class="form-check-label" for="gridRadios1"> Male </label>
											&nbsp&nbsp&nbsp&nbsp <input class="form-check-input"
												type="radio" name="choose" id="gridRadios2" value="<%=rs.getString(7) %>" checked>
											<label class="form-check-label" for="gridRadios2">
												Female </label>
										</div>

									</div>
								</div>
							



<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong></strong> Leave the password field empty if you don't want to change.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>









							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label"><strong>Password</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">



										<input type="password" class="form-control" name="password"
											placeholder="Enter password" />

									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label"><strong>Confirm
										Password</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="password" class="form-control" name="cpassword"
											placeholder="Enter password" />
									</div>
									<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("pass") == null) ? "" : request.getAttribute("pass")%></strong></span>
								</div>
							</div>


							<div class="form-group col-sm-2 col-md-2" style="float: left;">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block login-button" name="Action" value="Edit">Save
									Changes</button>
									
							</div> 
							<button type="button" class="btn btn-warning">Back</button>

						
						</form>
			<%-- <span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("edit") == null) ? "" : request.getAttribute("edit")%></strong></span> --%>			
					</div>

				</div>
			</div>
		</div>
	</div>



	<%@ include file="js/script.js"%>
	<%}


%>
</body>
</html>