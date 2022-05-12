<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*" %> 
<%@page import ="add.AddressBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	//THIS PAGE ONLY PERFORMS INSERT STATEMENT INTO DATABASE IF THE INFORMATION IS VALID.
	if(request.getParameter("submitInput") != null){
		//create a new AddressBean for the session if we haven't already.
		AddressBean addressBean = (AddressBean) session.getAttribute("addressBean");
		if(addressBean == null){
			addressBean = new AddressBean(); 
			session.setAttribute("addressBean", addressBean);
		}
		//set values into the address bean. 
		addressBean.setFirstName(request.getParameter("fname"));
		addressBean.setSurName(request.getParameter("sname"));
		addressBean.setTelephone(request.getParameter("telephone"));
		addressBean.setMobile(request.getParameter("mobile"));
		addressBean.setEmail(request.getParameter("email"));
		addressBean.setAddress(request.getParameter("address"));
		addressBean.setPostalNumber(request.getParameter("postalnr"));
		addressBean.setTown(request.getParameter("town"));
		addressBean.setCountry(request.getParameter("country"));

		//if we have error messages, then set attribute to request, and then forward to old page.
		if(!addressBean.getStringBuilder().isEmpty()){
			request.setAttribute("errorMessage", addressBean.getStringBuilder().toString());
			addressBean.clearStringBuilder(); //clear the error messages
			session.setAttribute("addressBean", addressBean); //overwrite previous addressBean
			request.getRequestDispatcher("Register.jsp").forward(request, response);
			response.sendRedirect("Register.jsp");
		}
		//else, insert into the database and redirect to "DeleteAddress.jsp"
		else{
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				//get connection to database
				Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost/address", "root", "Mydatabase321!");
				
				//create a statement object for sending queries to sql database
				Statement myStat = myConn.createStatement();
						
				//execute sql query
						
				String sqlQuery = "insert into addresses " 
					+ "(fname, sname, telephone, mobile, email, address, postalnr, town, country)"
					+ "values ("+ "\'" + addressBean.getFirstName().toString() + "\', " + 
					"\'" + addressBean.getSurName().toString() + "\', " + 
					"\'" + addressBean.getTelephone() + "\', " + 
					"\'" + addressBean.getMobile() + "\', " + 
					"\'" + addressBean.getEmail() + "\', " + 
					"\'" + addressBean.getAddress().toString() + "\', " + 
					"\'" + addressBean.getPostalNumber() + "\', " + 
					"\'" + addressBean.getTown().toString() + "\', " + 
					"\'" + addressBean.getCountry().toString() + "\')";

				myStat.execute(sqlQuery);
								
				System.out.println("Insert complete");
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
%>
</body>
</html>