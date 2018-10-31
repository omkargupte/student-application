var sub=document.getElementById("submit-button");
var fn=document.getElementById("f1");
var mn=document.getElementById("m1");
var ln=document.getElementById("l1");
var pin=document.getElementById("pin");
var city=document.getElementById("c-t");
var state=document.getElementById("s-t");
var email=document.getElementById("mail");
var phno=document.getElementById("contact");
var userid=document.getElementById("uname");
var pass=document.getElementById("pwd");
var cpass=document.getElementById("c-pwd");



function validateStudForm()
{
	
	var fnameCheck=new RegExp("^[A-Za-z]+$");
	var mnameCheck=new RegExp("^[A-Za-z]+$");
	var lnameCheck=new RegExp("^[A-Za-z]+$");
	var pinCheck=new RegExp("^[4][0-9]{5}$");
	var cityCheck=new RegExp("^[A-Za-z]+$");
	var stateCheck=new RegExp("^[A-Za-z]+$");
	var emailCheck=new RegExp("^[a-z]+[a-z0-9_]+@[a-z]{5,}[a-z.]{2,6}[a-z.]{2,6}$");
	var phnoCheck=new RegExp("^[789][0-9]{9}$");
	var uidCheck=new RegExp("^[a-zA-Z0-9]+$");
	var passCheck=new RegExp("[@!&*%#a-zA-z0-9]+[a-zA-z0-9]+[@!&*%#]");
	var cPassCheck=new RegExp("[@!&*%#a-zA-z0-9]+[a-zA-z0-9]+[@!&*%#]");

	if(fnameCheck.test(fn.value))
		{
			document.getElementById("fnerror").innerHTML="";
			//f1();	
		}
	else
	{
		document.getElementById("fnerror").innerHTML="*Please enter alphabets only*";		
		return false;
	}
	if(mnameCheck.test(mn.value))
	{
		document.getElementById("mnerror").innerHTML="";
	}
	else
	{
		document.getElementById("mnerror").innerHTML="*Please enter alphabets only*";
		return false;
	}
	if(lnameCheck.test(ln.value))
	{
		document.getElementById("lnerror").innerHTML="";
	}
	else
	{
		document.getElementById("lnerror").innerHTML="*Please enter alphabets only*";
		return false;
	}
	if(pinCheck.test(pin.value))
	{
		document.getElementById("pinerror").innerHTML="";
	}
	else
	{
		document.getElementById("pinerror").innerHTML="*Invalid Pin Number*";
		return false;
	}
	if(cityCheck.test(city.value))
	{
		document.getElementById("cityerror").innerHTML="";
			
	}
	else
	{
		document.getElementById("cityerror").innerHTML="*Please enter alphabets only*";		
		return false;
	}
	if(stateCheck.test(state.value))
	{
		document.getElementById("stateerror").innerHTML="";
			
	}
	else
	{
		document.getElementById("stateerror").innerHTML="*Please enter alphabets only*";		
		return false;
	}
	if(emailCheck.test(email.value))
	{
		document.getElementById("mailerror").innerHTML="";
			
	}
	else
	{
		document.getElementById("mailerror").innerHTML="*Invalid Email Address*";		
		return false;
	}
	if(phnoCheck.test(phno.value))
	{
		document.getElementById("contacterror").innerHTML="";
			
	}
	else
	{
		document.getElementById("contacterror").innerHTML="*Invalid Contact Number*";		
		return false;
	}
	if(uidCheck.test(userid.value))
	{
		document.getElementById("usererror").innerHTML="";
			
	}
	else
	{
		document.getElementById("usererror").innerHTML="*Please enter only alphabets and numbers*";		
		return false;
	}
	if(passCheck.test(pass.value) && (pass.value.length>5))
	{
		document.getElementById("passerror").innerHTML="";
			
	}
	else
	{
		document.getElementById("passerror").innerHTML="*Should contain alphabets,numbers & special charcters and length should be greater than 5*";		
		return false;
	}
	if(pass.value.match(cpass.value))
	{
		document.getElementById("cpasserror").innerHTML="";
		f1();	
	}
	else
	{
		document.getElementById("cpasserror").innerHTML="*Password does not match*";		
		return false;
	}
}
	


function f1()
{
 //alert("Thank you! Your response hass been saved successfully.");
}

