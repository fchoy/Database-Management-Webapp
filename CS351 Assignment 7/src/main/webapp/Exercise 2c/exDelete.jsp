<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*, java.io.*" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Entry</title>
</head>
<body>
	<%
		try{
			//delete entry in database
			//get value of input button (which should be the id number)
			
			int idNum = Integer.parseInt(request.getParameter("delete"));
			
			//connect to database
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/address", "root", "Mydatabase321!");
			//create statement object
			Statement myStat = myConn.createStatement();
	
			//execute sql query
			String sql = "delete from addresses where id=" + "\'" + idNum + "\'";
			
			myStat.executeUpdate(sql); //deletes row
			
			out.write("Entry deleted.");
			//response.sendRedirect("Register.jsp"); //return to Register.jsp page.
		}
		catch(Exception e){
			e.printStackTrace(); 
		}
	%>
</body>
</html>