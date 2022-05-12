<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*, java.io.*" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Database Table Entries</title>
</head>
<body>
<h1> Database Entries </h1>
<form action="exDelete.jsp">
	<table border="1">
	<!-- IDEA : Create a table with all the columns and entries from the database, then create a button with the value of the id number of the entry to delete. -->
	<%
		try{
			//establish connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/address", "root", "Mydatabase321!");
			
			//create statement object
			Statement myStat = myConn.createStatement();
			
			//execute query
			ResultSet myRs = myStat.executeQuery("select * from addresses");
			
			//process result list
			//create headers
			out.print("<tr>");
			out.print("<th>id</th> <th>First Name</th> <th>Surname</th> <th>Telephone</th> <th>Mobile Number</th> <th>Email</th> <th>Address</th> <th>Postal Number</th> <th>Town</th> <th>Country</th> <th>Delete Entry</th>");
			out.print("</tr>");
			
			//display all entires in the table.
			while(myRs.next()){
				out.print("<tr>");
				out.print("<td>" + myRs.getString("id") + "</td>");
				out.print("<td>" + myRs.getString("fname") + "</td>");
				out.print("<td>" + myRs.getString("sname") + "</td>");
				out.print("<td>" + myRs.getString("telephone") + "</td>");
				out.print("<td>" + myRs.getString("mobile") + "</td>");
				out.print("<td>" + myRs.getString("email") + "</td>");
				out.print("<td>" + myRs.getString("address") + "</td>");
				out.print("<td>" + myRs.getString("postalnr") + "</td>");
				out.print("<td>" + myRs.getString("town") + "</td>");
				out.print("<td>" + myRs.getString("country") + "</td>");
				out.print("<td> <input type='submit' name='delete' value=" + "\'" + myRs.getString("id") + "\'>");
				out.print("</tr>");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
	%>
	</table>
</form>
</body>
</html>