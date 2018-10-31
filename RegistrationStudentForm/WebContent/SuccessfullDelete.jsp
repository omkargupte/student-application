<%@page import="java.sql.Statement"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
HttpSession hs=request.getSession();
String uname=(String)hs.getAttribute("u");
String password=(String)hs.getAttribute("p");
System.out.println(uname+ " "+ password);
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
	Statement stmt=con.createStatement();
	String sql="delete from OMKAR.registrationDetails where username='"+uname+"' and pass='"+password+"'";
	stmt.executeUpdate(sql);
		out.println("<script>");
		out.println("alert('Record Deleted Successfully!!!')");
		out.println("window.location.href='registrationForm.html'");
		out.println("</script>");
}
catch(SQLException | ClassNotFoundException e)
{
	e.printStackTrace();
}


%>
</body>
</html>