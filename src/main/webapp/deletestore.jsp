<%@page import="com.restaurant.DBConnect.DBConnection"%>
<%@page import="com.restaurant.Model.ManageStoreDAO"%>
<%@page import="com.restaurant.Bean.ManageStoreBean"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String id=request.getParameter("id");

if (id != null) {
	int userid = Integer.parseInt(id);

	Connection con = DBConnection.getConn();
	String sql = "DELETE FROM R_STORE WHERE ID=" + userid;
	PreparedStatement ps = con.prepareStatement(sql);
	int i = ps.executeUpdate();
	if (i > 0) {
request.setAttribute("deletestore", "Store Successfully Deleted");
request.getRequestDispatcher("store.jsp").forward(request, response);
%>

<%-- <jsp:forward page="/store.jsp" /> --%>
<%}} %>
</body>
</html>