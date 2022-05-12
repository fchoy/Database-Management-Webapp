<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H2>Search Database</H2>
	<!-- If a certain parameter is blank, ignore it. -->
	<!-- User can enter partial information and use it to search form. -->
	<form action="exSearchAddress.jsp">
		<label for="fname" id="fnameLabel">First Name : </label>
		<input type="text" name="fname" required>
		<br>
		<label for="sname" id="snameLabel">Surname :  </label>
		<input type="text" name="sname" value="" >
		<br>
		<label for="telephone" id="telephoneLabel">Telephone Number : </label>
		<input type="text" name="telephone" >
		<br>
		<label for="mobile" id="mobileLabel">Mobile Number : </label>
		<input type="text" name="mobile" >
		<br>
		<label for="email" id="emailLabel">Email Address :  </label>
		<input type="email" name="email" value="">
		<br>
		<label for="address" id="addressLabel">Address : </label>
		<input type="text" name="address" value="" >
		<br>
		<label for="postalnr" id="postalnrLabel">Postal Number : </label>
		<input type="text" name="postalnr" >
		<br>
		<label for="town" id="townLabel">Town :  </label>
		<input type="text" name="town" value="" >
		<br>
		<label for="country" id="countryLabel">Country : </label>
		<input type="text" name="country" value="" >
		<br>
		<input type="submit" name="submitInput" value="Submit">
	</form>
</body>
</html>