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
<title>Student Update</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		ResultSet rs = null;
	%>
	<%
		try {
			HttpSession hs = request.getSession();
			String uid = (String) hs.getAttribute("u");
			String pwd = (String) hs.getAttribute("p");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			String sql = "select firstname,middlename,lastname,address,pin,city,state,mail,phone,birthday,username from OMKAR.registrationDetails where username='"
					+ uid + "' and pass='" + pwd + "'";
			PreparedStatement ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
	%>
	<div class="container-fluid bg">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-sx-12"></div>
			<div class="col-md-4 col-sm-4 col-sx-12">
				<form action="UpdateInformation" method="post" class="form-container">

					<div class="form-group">
						<label for="fname">First Name</label> <input type="text"
							class="form-control" id="fn" name="fname"
							value=<%=rs.getString(1)%> required>
					</div>

					<div class="form-group">
						<label for="pass">Middle Name</label> <input type="text"
							class="form-control" id="mn" name="mname"
							value=<%=rs.getString(2)%> required>
					</div>

					<div class="form-group">
						<label for="lname">Last Name</label> <input type="text"
							class="form-control" id="ln" name="lname"
							value=<%=rs.getString(3)%> required>
					</div>

					<div class="form-group">
						<label for="address">Address</label>
						<textarea rows="3" cols="50" name="addr" class="form-control"
							id="ad"  required><%=rs.getString(4)%></textarea>
					</div>

					<div class="form-group">
						<label for="pin">Pin Code</label> <input type="number"
							class="form-control" id="pc" name="pcode"
							value=<%=rs.getInt(5)%> required>
					</div>

					<div class="form-group">
						<label for="ct">City</label> <input type="text"
							class="form-control" id="ci" name="city"
							value=<%=rs.getString(6)%> required>
					</div>

					<div class="form-group">
						<label for="st">State</label> <input type="text"
							class="form-control" id="ste" name="state"
							value=<%=rs.getString(7)%> required>
					</div>

					<div class="form-group">
						<label for="mail">Email-Id</label> <input type="text"
							class="form-control" id="mid" name="email"
							value=<%=rs.getString(8)%> required>
					</div>

					<div class="form-group">
						<label for="phno">Contact</label> <input type="text"
							class="form-control" id="pno" name="phone"
							value=<%=rs.getString(9)%> required>
					</div>

					<div class="form-group">
						<label for="bdate">Date Of Birth</label> <input type="date"
							class="form-control" id="bdt" name="birth"
							value=<%=rs.getString(10)%> required>
					</div>

					<div class="form-group">
						<label for="user">User Name</label> <input type="text"
							class="form-control" id="usr" name="uid"
							value=<%=rs.getString(11)%> required>
					</div>


					<button type="submit" class="btn btn-success btn-block">Update Information</button>
				</form>
			</div>
			<div class="col-md-4 col-sm-4 col-sx-12"></div>
		</div>

	</div>

	<%
		}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	%>




</body>
</html>