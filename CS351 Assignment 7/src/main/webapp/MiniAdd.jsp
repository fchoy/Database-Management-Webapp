<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="add.SumBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add</title>
</head>
<body>	
	<form method="post" action="MiniAdd.jsp">
		<label for="num1" id="num2Label">First Input </label>
		<input type="text" name="num1" required>
		<br>
		<label for="num2" id="num1Label">Second Input </label>
		<input type="text" name="num2" required>
		<br>
		<input type="submit" name="submitInput" value="Submit">
		<input type="submit" name="reset" value="Reset">
	</form>
		${errorMessage}
	<!--<jsp:useBean id="sumBean" class="add.SumBean" scope="session"/>-->
		
	<% 
		if(request.getParameter("reset") != null){
			SumBean addBean = (SumBean) session.getAttribute("sumBean"); 
			if(addBean == null){
				addBean = new SumBean(); 
			}
			else{
				addBean.resetList();
			}
		}
		else if(request.getParameter("submitInput") != null){
			SumBean addBean = (SumBean) session.getAttribute("sumBean"); //get the Javabean from the current session 
			if(addBean == null){ //if no bean is created for the session yet
				addBean = new SumBean(); //create a new bean
				session.setAttribute("sumBean", addBean); //add the bean to the session w/ the identifier "sumBean", bean will be saved for the duration of the session.
			}
			
			//set values from form input
			addBean.setNum1(request.getParameter("num1"));
			addBean.setNum2(request.getParameter("num2"));
						
			/*if(!addBean.getStringBuilder().isEmpty()){ find way to display error message if invalid input is found
				request.setAttribute("errorMessage", addBean.getStringBuilder().toString());
				addBean.clearStringBuilder();
			}*/
				//request.setAttribute("errorMessage", ""); remove error message for valid inputs
				out.write("<br/>");
				out.write("Current Sum : " + (addBean.getNum1() + addBean.getNum2())); //display current sum
				out.write("<br/>");
				out.write("Sums Calculated so far : ");
				addBean.add(); //add together the numbers set using setProperty
				%>
				<!--<jsp:setProperty name="sumBean" property="*"/> Not working with invalid inputs -->
				<% 
				//if the array list is not empty, then display the sums calculated so far.
				if(addBean.getResult().size() != 0){			
					int size = addBean.getResult().size();
					
					for(int i = 0; i < size; ++i){
						if(size == 1){
							out.write(addBean.getResult().get(i));
						}
						else{
							out.write(addBean.getResult().get(i) + ", ");
						}
					}
				
				}
				session.setAttribute("sumBean", addBean); //overwrite the previously set sumBean with the newly updated JavaBean
			}
		
	%>	
</body>
</html>