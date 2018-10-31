<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Java Practice</title>
<link rel="stylesheet" href="newStyle.css">
</head>
<body>
	<div class="my-name">
	<label>Hi,</label>
	
	<%
		String fname=request.getParameter("fname");
		String mname=request.getParameter("mname");
		String lname=request.getParameter("lname");
		String addr=request.getParameter("addr");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		int pcode=Integer.parseInt(request.getParameter("pcode"));
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		String bdate=request.getParameter("did");
		String gender=request.getParameter("gender");
		String uname=request.getParameter("uid");
		String pass=request.getParameter("pass");
		String cpass=request.getParameter("cpass");
	%>
	
	
	<%
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
				
				String sql="insert into OMKAR.registrationDetails(firstname,middlename,lastname,address,pin,city,state,country,mail,phone,birthday,gender,username,pass,cpass) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				PreparedStatement ps=con.prepareStatement(sql);
				
				ps.setString(1, fname);
				ps.setString(2, mname);
				ps.setString(3, lname);
				ps.setString(4, addr);
				ps.setInt(5, pcode);
				ps.setString(6, city);
				ps.setString(7, state);
				ps.setString(8, country);
				ps.setString(9, email);
				ps.setString(10, contact);
				ps.setString(11, bdate);
				ps.setString(12, gender);
				ps.setString(13, uname);
				ps.setString(14, pass);
				ps.setString(15, cpass);
				
				int i=ps.executeUpdate();
				
				if(i>0)
				{%>
					<script>
					alert("Thank you! Your response has been saved successfully.");
					</script>
					<%= fname%>
	</div>
	<div class="my-data">
	<b>Name:</b> <%= fname%> <%= mname%> <%=lname %>
	<br><br>
	<b>Address:</b> <%=addr %>, <%=city %>, <%= state%>, <%=country %> - <%= pcode %>
	<br><br>
	<b>Email-Id:</b><%=  email%>
	<br><br>
	<b>Contact:</b><%=contact  %>
	<br><br>
	<b>Date of Birth:</b><%=bdate%>      
	<br><br>
	<b>Gender:</b><%= gender %>
	<br><br>
	<b>User Name:</b><%= uname%>
				<%}
				
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
	%>
	</div>
	<br><br>
	<label class="login">To Proceed</label> <a href="Login.html">Click Here</a>
</body>
</html>