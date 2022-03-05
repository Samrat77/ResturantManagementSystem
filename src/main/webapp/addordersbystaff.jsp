<%@page import="com.restaurant.DBConnect.DataUtility"%>
<%@page import="com.restaurant.Model.ProductDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.restaurant.Model.ManageStoreDAO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.order-form .container {
	color: #4c4c4c;
	padding: 20px;
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, .1);
}

.order-form-label {
	margin: 8px 0 0 0;
	font-size: 14px;
	font-weight: bold;
}

.order-form-input {
	width: 100%;
	padding: 8px 8px;
	border-width: 1px !important;
	border-style: solid !important;
	border-radius: 3px !important;
	font-family: 'Open Sans', sans-serif;
	font-size: 14px;
	font-weight: normal;
	font-style: normal;
	line-height: 1.2em;
	background-color: transparent;
	border-color: #cccccc;
}

.btn-submit:hover {
	background-color: #090909 !important;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="staffheader.jsp"%>
<%@include file="menubarforstaff.jsp"%>
</head>
<body>

	<section class="order-form my-4 mx-4">
	<div class="container pt-4">

		<div class="row">
			<div class="col-12">
				<h1>Add Order</h1>

				<strong><span>Date <%=(new java.util.Date()).toLocaleString()%></span></strong>
				<hr class="mt-1">
			</div>

			<div class="col-12">

				<div class="row mx-4">
					<div class="col-12 mb-2">

						<label class="order-form-label">Product Name</label>
					</div>
					<div class="col-12 col-sm-6">
						<form action="ManageProducts" method="get" id="my-select"
							name="f1">
							<select name="productid" class="order-form-input"
								onchange="this.form.submit()" id="my-select" >
								
							<%							
							int pId=DataUtility.getInt(String.valueOf(request.getAttribute("productId")));
							%>
								<%
									Connection con1 = DBConnection.getConn();
									String sql1 = "SELECT * FROM R_PRODUCT ";
									PreparedStatement ps1 = con1.prepareStatement(sql1);
									ResultSet rs1 = ps1.executeQuery();
									while (rs1.next()) {
									
									if(pId>0){
								%>			
														
								<%if(rs1.getInt(1)==pId){%>
								
								<option value="<%=rs1.getInt(1)%>" ><%=rs1.getString(2)%></option>
								<%break;} %>
								<%}else{ %>
								
								<option value="<%=rs1.getInt(1)%>" ><%=rs1.getString(2)%></option>
								<%
								}}
								%>
								
							</select>
						<!-- </form> -->
					</div>
				</div>

			<!-- 	<form action="ManageProducts" method="post"> -->
					<jsp:useBean id="bean" class="com.restaurant.Bean.ProductBean"
						scope="request"></jsp:useBean>
					<div class="col-12">

						<div class="row mx-4">
							<div class="col-12 mb-2">

								<label class="order-form-label">Table Name</label>
							</div>
							<div class="col-12 col-sm-6">

								<select name="tableid" id="cars" class="order-form-input">
									<%
										Connection con = DBConnection.getConn();
										String sql = "SELECT * FROM R_TABLE";
										PreparedStatement ps = con.prepareStatement(sql);
										ResultSet rs = ps.executeQuery();
										while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>" selected="selected"><%=rs.getString(2)%></option>
									<%
										}
									%>
								</select>

							</div>
						</div>
					</div>
					<div class="row mt-3 mx-4">
						<div class="col-1">
							<label class="order-form-label">Quantity</label>
						</div>
						<div class="col-1">
							<input type="number" class="order-form-input" placeholder=" "
								name="quantity" required>
						</div>

						<div class="col-1">
							<label class="order-form-label">Rate</label>
						</div>
						<div class="col-1" id="rate">
							<input type="text" name="rate" class="order-form-input"
								placeholder=" " value="<%=DataUtility.getInt(bean.getPrice())%>" readonly="readonly">
								
						</div>


						<div class="row mt-3 mx-4">
							<div class="col-12">
								<label class="order-form-label">Vat 13 %</label>
							</div>
							<div class="col-12 col-sm-6">
								<%
									Connection conn = DBConnection.getConn();
									PreparedStatement preparest = conn.prepareStatement("SELECT * FROM R_COMPANY");
									ResultSet resultSet = preparest.executeQuery();
									while (resultSet.next()) {
								%>
								<input class="order-form-input" placeholder=" "
									value="<%=resultSet.getString(4)%>" name="vat">
								<%
									}
								%>
							</div>
						</div>
					</div>
					<%
						if (request.getAttribute("total") != null) {
					%>

					<div class="row mt-3 mx-4">
						<div class="col-12">
							<label class="order-form-label">Total Charge</label>
						</div>
						<div class="col-12 col-sm-6">
							<input class="order-form-input" placeholder=" "
								value="<%=session.getAttribute("total")%>">
						</div>
					</div>
					<%
						}
					%>
				 <div class="row mx-4">
						<div class="col-12 mb-2">

							<label class="order-form-label">Status</label>
						</div>
						<div class="col-12 col-sm-6">

							<select name="status" id="cars" class="order-form-input">
								<option value="paid">Paid</option>
								<option value="unpaid">UnPaid</option>
							</select>

						</div>
					</div> 
			</div>

			<div class="row mt-4">
				<div class="col-3">
					<button type="submit" id="btnSubmit" name="Action" 
						value="CreateOrder"
						class="btn btn-dark d-block mx-auto btn-submit">Create
						Order</button>

				</div>
				<!-- <div class="col-0">
					<button type="submit" id="btnSubmit" name="Action" value="Print"
						class="btn btn-dark d-block mx-auto btn-submit">Print</button>

				</div> -->
			</div>
			</form>
		</div>
	</div>
	</div>
	</section>
	<script type="text/javascript">
		function d() {
			document.f1.rate.value = document.f1.id.value;
			document.f1.hd.value = document.f1.id
					.item(document.f1.id.selectedIndex).text;

		}
	</script>
</body>
</html>