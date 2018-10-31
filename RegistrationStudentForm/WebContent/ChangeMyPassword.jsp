<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change My Password</title>
</head>
<body>
<% 
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		
		String pass1=request.getParameter("curpass");
		String pass2=request.getParameter("pass");
		String pass3=request.getParameter("cpass");
		int id=0,flag=0;
		String originalpass="";
	
		String sql1="select student_id,pass from OMKAR.registrationDetails where pass='"+pass1+"'";
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql1);

	while(rs.next())
	{
		id=rs.getInt(1);
		originalpass=rs.getString(2);
	}
	if(originalpass.equals(pass1))
	{
		
		String sql="update OMKAR.registrationDetails set pass='"+pass2+"',cpass='"+pass2+"' where student_id='"+id+"'";
		Statement stmt=con.createStatement();
		int i=stmt.executeUpdate(sql);
		
			out.println("<script>");
			out.println("alert('Password changed successfully')");
		out.println("window.location.href='Login.html'");
		out.println("</script>");
		stmt.close();
		con.close();
		
	}
	else
	{
		out.println("<script>");
		out.println("alert('Invalid Current Password')");
		out.println("window.location.href='ChangePassword.jsp'");
		out.println("</script>");
	}
	
	}
	catch(SQLException e)
	    	{
		e.printStackTrace();
	}
	
	%>	
</body>
</html>