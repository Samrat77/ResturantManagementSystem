<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ include file="staffheader.jsp"%>
<%@include file="menubarforstaff.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet">
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}
</style>
</head>
<body>



	<div class="container">
		<br>
		<div class="row justify-content">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4>
							<strong>View Orders</strong>
						</h4>
					</div>
					<div class="card-header">
						<strong>ORDERS</strong><br>
						
					<div class="card-body">


						<!-- start  of table -->
						<div class="container-xl">
							<div class="table-responsive">
								<div class="table-wrapper">
									<div class="table-title">
										<div class="row">
											<div class="col-sm-5">
												<h2>
													Order <b>Management</b>
												</h2>
											</div>
											
										</div>
									</div>



									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<!-- <th>#</th> -->
												<th>ID</th>
												<th>Table Name</th>
												<th>Product Name</th>
												<th>Quantity</th>
												<th>Vat</th>
												<th>Rate</th>
												<th>Bill Id</th>
												<th>Net Amount</th>
												<th>Date</th>
												<th>Status</th>
											</tr>
										</thead>
										<%
										int i=1;
            Connection con=DBConnection.getConn();
            Statement st=con.createStatement();
            String sql="select tname,pname,oid,quantity,rate,netamount,dateandtime,vat,ostatus from r_order inner join r_table on"
            	   +" r_table.id=r_order.tableid"
            	   +" inner join r_product on r_product.id=r_order.productid;";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {%>
										<tbody>
											<tr>
												<td class="col-md-1"><%=i++%></td>
												<td class="col-md-1"><%=rs.getString(1) %></td>
												<td class="col-md-1"><%=rs.getString(2) %></td>
												<td class="col-md-1"><%=rs.getString(4) %></td>
												<td class="col-md-1"><%=rs.getString(8) %></td>
												<td class="col-md-1"><%=rs.getString(5) %></td>
												<td class="col-md-1"><%=rs.getString(3) %></td>
												<td class="col-md-1"><%=rs.getString(6) %></td>
												<td class="col-md-1"><%=rs.getTimestamp(7).toGMTString() %></td>
												<td class="col-md-1"><%=rs.getString(9) %></td>
												
											</tr>
											<%} %>
										</tbody>
									</table>

								
								</div>
							</div>
						</div>
					</div>
					<!-- end of table -->




</body>
</html>