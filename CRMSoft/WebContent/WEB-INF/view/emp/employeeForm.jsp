<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring MVC Form Handling</title>
	</head>
	<body>
		<h2>Employee Data Form</h2>
		<form:form method="POST" action="addEmployee">
	   		<table>
			    <tr>
			        <td><form:label path="empId">Employee Id:</form:label></td>
			        <td><form:input path="empId" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="name">Employee Name:</form:label></td>
			        <td><form:input path="name" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="age">Employee Age:</form:label></td>
			        <td><form:input path="age" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="salary">Employee Salary:</form:label></td>
			        <td><form:input path="salary" /></td>
			    </tr>
			    
			    <tr>
			        <td colspan="2">
			            <input type="submit" value="Submit"/>
			        </td>
			    </tr>
			</table>  
		</form:form>
	</body>
</html>