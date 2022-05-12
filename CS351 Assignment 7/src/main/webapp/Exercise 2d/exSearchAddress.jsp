<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//idea : get values from previous page. Build search using OR. All rows that contain atleast one matching value will be displayed. 
//use a string builder to build the sql query.
if(request.getParameter("submitInput") != null){
	try{
		StringBuilder string = new StringBuilder(0);
		String firstName = request.getParameter("fname");
		String surName = request.getParameter("sname");
		String telephone = request.getParameter("telephone");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String postalNr = request.getParameter("postalnr");
		String town = request.getParameter("town");
		String country = request.getParameter("country");
	
		Class.forName("com.mysql.cj.jdbc.Driver");
	
		//get connection to database
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost/address", "root", "Mydatabase321!");
		
		//create a statement object for sending queries to sql database
		Statement myStat = myConn.createStatement();
				
		//execute sql query
		string.append("SELECT id, fname, sname, telephone, mobile, email, address, postalnr, town, country FROM addresses ");
		string.append("WHERE ");
		string.append("id = 'id' AND ");
		string.append("fname = '" + firstName + "' OR ");
		string.append("sname = " + "'" + surName + "' OR ");
		string.append("telephone = " + "'" + telephone + "' OR ");
		string.append("mobile = " + "'" + mobile + "' OR ");
		string.append("email = " + "'" + email + "' OR ");
		string.append("address = " + "'" + address + "' OR ");
		string.append("postalnr = " + "'" + postalNr + "' OR ");
		string.append("town = " + "'" + town + "' OR ");
		string.append("country = " + "'" + country + "'");
		
		//execute query
		ResultSet myRs = myStat.executeQuery(string.toString());
		
		//process result set
		session.setAttribute("resultset", myRs);
		
		System.out.println("Search Successful.");
		
		response.sendRedirect("SearchAddressResult.jsp");
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
}
%>
</body>
</html>