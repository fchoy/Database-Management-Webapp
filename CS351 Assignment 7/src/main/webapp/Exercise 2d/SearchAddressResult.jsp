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
<h2>Search Results</h2>
<form action="SearchAddress.jsp">
<table border="1">
<%
	//On this page, we process the resultSet and display results according to the search parameters. 
	
	try{
		ResultSet myRs = (ResultSet) session.getAttribute("resultset");
		
		//create table to display results.
		out.print("<tr>");
		out.print("<th>id</th> <th>First Name</th> <th>Surname</th> <th>Telephone</th> <th>Mobile Number</th> <th>Email</th> <th>Address</th> <th>Postal Number</th> <th>Town</th> <th>Country</th>");
		out.print("</tr>");
		
		while(myRs.next()){
			//For any null values, just display as blank.
			out.print("<tr>");
			out.print("<td>" + myRs.getString("id") + "</td>");
			try{
				out.print("<td>" + myRs.getString("fname") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			try{
				out.print("<td>" + myRs.getString("sname") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			try{
				out.print("<td>" + myRs.getString("telephone") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			try{
				out.print("<td>" + myRs.getString("mobile") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			try{
				out.print("<td>" + myRs.getString("email") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			try{
				out.print("<td>" + myRs.getString("address") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			try{
				out.print("<td>" + myRs.getString("postalnr") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			try{
				out.print("<td>" + myRs.getString("town") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			try{
				out.print("<td>" + myRs.getString("country") + "</td>");
			}
			catch(Exception e){
				out.print("<td></td>");
			}
			
			out.print("</tr>");
		}
		
		session.setAttribute("resultset", null); //reset resultset attribute
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
</table>
<br/>
<input type='submit' name='redirect' value='Search Again'>
</form>
</body>
</html>