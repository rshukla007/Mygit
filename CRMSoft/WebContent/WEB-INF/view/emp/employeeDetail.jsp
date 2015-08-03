<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring MVC Form Handling</title>
		<%
		  int pageNumber=1;		
	      if(request.getParameter("page") != null)
	      { 
	          session.setAttribute("page", request.getParameter("page"));
	          pageNumber = Integer.parseInt(request.getParameter("page")); 
	       } 
	      else 	           
	       { 
	          session.setAttribute("page", "1"); 
	       } 
	        /*  String nextPage = (pageNumber +1) + "";
	          session.setAttribute( "EmpList", UserDaoImpl.getData(pageNumber)); 
	          System.out.println(((java.util.List)session.getAttribute("EmpList")).size()); 
	          String myUrl = "pagingEmp.jsp?page=" + nextPage; 
	          System.out.println(myUrl);  
	          pageContext.setAttribute("myUrl", myUrl);*/ 
	    %> 
	</head>
	<body>
		<h2>Submitted Employee Information</h2>
	   <table border="1">
		   <tr>
		        <td>Employee ID </td>
		        <td>${empId}</td>
		    </tr>
		    <tr>
		        <td>Employee Name</td>
		        <td>${name}</td>
		    </tr>
		    <tr>
		        <td>Employee Age</td>
		        <td>${age}</td>
		    </tr>
		    <tr>
		        <td>Employee Salary</td>
		        <td>${salary}</td>
		    </tr>
		</table>  
	</body>
</html>