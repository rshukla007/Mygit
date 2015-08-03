<%@page import="java.sql.*"%> 
<form method="post" action="excelFile.jsp"> 
<table border=1> 
<tr><th>Name</th><th>Address</th><th>Contact No</th><th>Email</th></tr> 
<% 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 
Statement st=con.createStatement(); 
ResultSet rs=st.executeQuery("Select * from employee"); 
while(rs.next()){ 
%> 
<tr><td><input type="text" name="name" value="<%=rs.getString("name")%>"></td><td><input type="text" name="address" value="<%=rs.getString("address")%>"></td><td><input type="text" name="contact" value="<%=rs.getString("contactNo")%>"></td><td><input type="text" name="email" value="<%=rs.getString("contactNo")%>"></td></tr> 
<% 
} 
%> 
</table> 
<input type="submit" value="Export To Excel"> 
</form> 