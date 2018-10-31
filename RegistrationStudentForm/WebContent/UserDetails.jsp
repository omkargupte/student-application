<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Details</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="userDetailsStyle.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
	try
{
		HttpSession s=request.getSession();
		String u1=(String)s.getAttribute("u");
		String p1=(String)s.getAttribute("p");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
		String sql="select * from OMKAR.registrationDetails where USERNAME='"+u1+"' and PASS='"+p1+"'";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			String udb=rs.getString("username");
			String pdb=rs.getString("pass");
			if(u1.equals(udb) && p1.equals(pdb))
			{
				%>
				<div class="table-responsive">
  <table class="table">
    <thead>
      <tr>

		<th scope="col">First Name</th>
		<th scope="col">Middle Name</th>
		<th scope="col">Last Name</th>
		<th scope="col">Address</th>
		<th scope="col">Email-Id</th>
		<th scope="col">Contact</th>
		<th scope="col">Date of Birth</th>
		<th scope="col">Gender</th>
		<th scope="col">User Name</th>
		<th scope="col">Password</th>
		
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><%=rs.getString("firstname")%></td><td><%=rs.getString("middlename")%></td><td><%=rs.getString("lastname")%></td>
		<td><%=rs.getString("address") %> <%=rs.getString("city") %> <%=rs.getString("state") %> <%=rs.getString("pin") %>
		<%=rs.getString("country") %></td> <td><%=rs.getString("mail") %></td> <td><%=rs.getString("phone") %></td>
		<td><%=rs.getString("birthday") %></td><td><%=rs.getString("gender") %></td><td><%=rs.getString("username") %></td>
		<td><%=rs.getString("pass") %></td>
	</tr>
	</tbody>
	
</table>
	</div>			
				
		<%	}
		}
}
catch(SQLException  | ClassNotFoundException e)
{
	e.printStackTrace();
}


%>
<div class="button-container">
  <a href="EditInfo.jsp" class="btn"><span>Edit</span></a>
   <a href="DeleteInformation.jsp" class="btn"><span>Delete</span></a>
</div>

</body>
</html>