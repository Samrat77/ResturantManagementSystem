<%@page import="com.restaurant.Bean.CompanyInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%@include file="menubar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #e0e0e0;
	height: 100vh;
}
</style>
</head>
<body>

	<%

Connection con=DBConnection.getConn();
Statement statement=con.createStatement();
String sql="SELECT * FROM R_COMPANY";
ResultSet rs=statement.executeQuery(sql);
if(rs.next())
{
	%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!------ Include the above in your HEAD tag ---------->
	<br>
	<div class="container">

		<div class="row justify-content">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<strong>Manage Company</strong>
					</div>
					<div class="card-header">
						Manage Company Information <br> <span
							style="color: #64ffda; font-style: inherit;"><strong><%=(request.getAttribute("updated") == null) ? "" : request.getAttribute("updated")%></strong></span>

					</div>
					<div class="card-body">

						<form class="form-horizontal" method="post" action="CompanyCtrl">

							<div class="form-group">
								<label for="name" class="cols-sm-2 control-label"><strong>Restaurant
										Name</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="cname" id="name"
											value="<%=rs.getString(2) %>"
											placeholder="Enter Company Name" />
									</div>

									<%-- <span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>        
                                  --%>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label"><strong>Charge
										Amount(%)</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="camt"
											value="<%=rs.getInt(3) %>" placeholder="Enter Charge Amount" />
									</div>
									<%--  <span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>
                                         --%>
								</div>
							</div>
							<div class="form-group">
								<label for="username" class="cols-sm-2 control-label"><strong>Vat
										Charge (%)</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="vat"
											value="<%=rs.getInt(4) %>" id="username"
											placeholder="Enter VAT Charge" />
									</div>
									<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong></span>

								</div>
							</div>
							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label"><strong>Address</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="address"
											value="<%=rs.getString(5) %>" placeholder="Enter Address" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label"><strong>Phone</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="phone"
											value="<%=rs.getString(6) %>"
											placeholder="Enter your Phone number" />
									</div>
									<span style="color: red; font-style: inherit;"><strong><%=(request.getAttribute("no") == null) ? "" : request.getAttribute("no")%></strong></span>

								</div>
							</div>

							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label"><strong>Country</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<input type="text" class="form-control" name="country"
											value="<%=rs.getString(7) %>"
											placeholder="Enter your Country" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label"><strong>Message</strong></label>
								<div class="cols-sm-10">
									<div class="input-group">

										<textarea type="text" class="form-control" name="msg" cols="3"
											rows="3"><%=rs.getString(8) %></textarea>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="inputState"><strong>Currency</strong></label> <select
									name="choose" value="<%=rs.getString(9) %>" id="inputState"
									class="form-control">
									<option selected>INR</option>
									<option>AUS</option>
									<option>POUND</option>
									<option>DOLLAR</option>
								</select>
							</div>

							<div class="form-group col-sm-2">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block login-button"
									name="Action" value="Save">Save Changes</button>
							</div>

						</form>





					</div>

				</div>
			</div>
		</div>
	</div>



	<%}

%>

	<%@ include file="js/script.js"%>
	<%-- <%@include file="footer.jsp" %> --%>
</body>
</html>