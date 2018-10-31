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
<title>Delete Record</title>
</head>
<body>
	
		
						<script>
						var result=confirm("Are you sure you want to delete record?");
						
						if(result)
							{
								window.location.href="SuccessfullDelete.jsp";
							}
						else 
						{
							window.location.href="UserDetails.jsp";
						}
						</script>
</body>	
</html>