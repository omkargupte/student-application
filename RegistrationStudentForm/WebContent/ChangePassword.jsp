<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="global.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid bg">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-sx-12"></div>
			<div class="col-md-4 col-sm-4 col-sx-12">
				<form method="post" action="ChangeMyPassword.jsp" class="form-container" onsubmit="return validation()">
						<div class="form-group">
						<label for="currpass">Current Password</label> <input type="password"
							class="form-control" id="curpwd" placeholder="Current Password"
							name="curpass" required>
							
							
					</div>
					<div class="form-group">
						<label for="pass1">New Password</label> <input type="password"
							class="form-control" id="pwd1" placeholder="New Password"
							name="pass" required>
							<span id="passerror"></span>
					</div>
					<div class="form-group">
						<label for="pass2">Confirm Password</label> <input type="password"
							class="form-control" id="pwd2" placeholder="Confirm Password" name="cpass"
							required>
							<span id="newpasserror"></span>
					</div>

					
					<button type="submit" class="btn btn-success btn-block">Save</button>
						
				</form>	
				
			</div>
			<div class="col-md-4 col-sm-4 col-sx-12"></div>
				</div>

	</div>

<script>
var newpass=document.getElementById("pwd1");
var confpass=document.getElementById("pwd2");

	function validation()
	{
		var passCheck=new RegExp("[@!&*%#a-zA-z0-9]+[a-zA-z0-9]+[@!&*%#]");
		var cPassCheck=new RegExp("[@!&*%#a-zA-z0-9]+[a-zA-z0-9]+[@!&*%#]");
		
		if(passCheck.test(newpass.value) && (newpass.value.length>5))
		{
			document.getElementById("passerror").innerHTML="";
				
		}
		else
			{
			document.getElementById("passerror").innerHTML="*Should contain alphabets,numbers & special charcters and length should be greater than 5*";		
			return false;
			}
		if(newpass.value.match(confpass.value))
			{
			document.getElementById("newpasserror").innerHTML="";
			}
		else
		{
		document.getElementById("newpasserror").innerHTML="*Password does not match*";		
		return false;
		}
		
	}
	</script>
</body>
</html>