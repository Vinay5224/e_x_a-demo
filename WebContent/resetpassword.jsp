<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>confirm page</title>
</head>
<style>
.div2 {
    margin-left:258px;
    width: 438px;
    height: 416px;
    padding: 50px;
    border: 1px solid #555;
}
body{
background-image: url("https://cdn.ibdnewstoday.com/wp-content/uploads/2017/03/shutterstock_203751310.jpg");
	 background-size: 1400px 1100px;
 	background-repeat: no-repeat;
}


#snackbar {
visibility: hidden;
min-width: 250px;
margin-left: -125px;
background-color: red;
color: white;
text-align: center;
border-radius: 2px;
padding: 16px;
position: fixed;
z-index: 1;
left: 50%;
bottom: 30px;
font-size: 17px;
}

#snackbar.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

#snackbarpassword {
visibility: hidden;
min-width: 250px;
margin-left: -125px;
background-color: red;
color: white;
text-align: center;
border-radius: 2px;
padding: 16px;
position: fixed;
z-index: 1;
left: 50%;
bottom: 30px;
font-size: 17px;
}

#snackbarpassword.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
 
#snackbaremail {
visibility: hidden;
min-width: 250px;
margin-left: -125px;
background-color: red;
color: white;
text-align: center;
border-radius: 2px;
padding: 16px;
position: fixed;
z-index: 1;
left: 50%;
bottom: 30px;
font-size: 17px;
}

#snackbaremail.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;
} 

#snackbarInvalid {
visibility: hidden;
min-width: 250px;
margin-left: -125px;
background-color: red;
color: white;
text-align: center;
border-radius: 2px;
padding: 16px;
position: fixed;
z-index: 1;
left: 50%;
bottom: 30px;
font-size: 17px;
}

#snackbarInvalid.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

#snackbarsame {
visibility: hidden;
min-width: 250px;
margin-left: -125px;
background-color: green;
color: white;
text-align: center;
border-radius: 2px;
padding: 16px;
position: fixed;
z-index: 1;
left: 50%;
bottom: 30px;
font-size: 17px;
}

#snackbarsame.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
 
 #snackbarchanged {
visibility: hidden;
min-width: 250px;
margin-left: -125px;
background-color: green;
color: white;
text-align: center;
border-radius: 2px;
padding: 16px;
position: fixed;
z-index: 1;
left: 50%;
bottom: 30px;
font-size: 17px;
}

#snackbarchanged.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;
}


</style>
<body >
 <div class="container">
  <h2  style="margin-left:350px;"><b>RESET PASSWORD</b> </h2></h2> <a href="login.jsp" class="btn btn-primary btn-lg" style="margin-left:20px; margin-top:-50px;"><span class="glyphicon glyphicon-home"></span></a><img src="img/logo.png" alt="" style="margin-top: -70px; margin-left:980px;">
      <div class="div2">
   <form action="">
  <div class="form-group">
    <label for="email"> Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="pwd"> Present Password:</label>
    <input type="password" class="form-control" id="psdpwd">
  </div>
  <div class="form-group">
    <label for="pwd"> New Password:</label>
    <input type="password" class="form-control" id="newpwd">
  </div>
    <div class="form-group">
    <label for="pwd"> Conform Password:</label>
    <input type="password" class="form-control" id="conpwd">
  </div>
  <button type="submit" id="submit" class="btn btn-success">Submit</button>
</form>
  </div>
    </div>
    
 <script type="text/javascript">
 
	$(document).on("click","#submit",function() {

		var email = $("#email").val();
		var presentpass = $("#psdpwd").val();
		var newpass = $("#newpwd").val();
		var confirmpass = $("#conpwd").val();
		
		if(presentpass == newpass){
			
			var x = document
			 .getElementById("snackbarsame")

			 x.className = "show";
			 setTimeout(
			 function() {
			 x.className = x.className
			 .replace(
			 "show",
			 "");
			 },
			 3000);
			
			
		}

		if ((email == "") || (presentpass == "") || (newpass == "") || (confirmpass == "")) {
			 var x = document
			 .getElementById("snackbar")

			 x.className = "show";
			 setTimeout(
			 function() {
			 x.className = x.className
			 .replace(
			 "show",
			 "");
			 },
			 3000);

		} else {

			if (!validateEmail(email)) {
				var x = document
				 .getElementById("snackbaremail")

				 x.className = "show";
				 setTimeout(
				 function() {
				 x.className = x.className
				 .replace(
				 "show",
				 "");
				 },
				 3000);
				return false;
			}

			function validateEmail($email) {
				var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
				return emailReg.test($email);
			}

			$.ajax({

				url : "resetpassword",
				type : "POST",
				data : {
					email : email,
					presentpass : presentpass,
					newpass : newpass,
					confirmpass : confirmpass				
					
				},
				 success : function(responseText) {
					 
					 if(responseText.trim() == "Invalid"){
						 var x = document
						 .getElementById("snackbarInvalid")

						 x.className = "show";
						 setTimeout(
						 function() {
						 x.className = x.className
						 .replace(
						 "show",
						 "");
						 },
						 3000); 
						 
						 $('input[type="text"]').val('');
						 $('input[type="password"]').val('');
					     
				     }
				     else if(responseText.trim() == "done"){
				    	 
				    	 var x = document
						 .getElementById("snackbarchanged")

						 x.className = "show";
						 setTimeout(
						 function() {
						 x.className = x.className
						 .replace(
						 "show",
						 "");
						 },
						 3000); 
						 
						 $('input[type="text"]').val('');
						 $('input[type="password"]').val('');
						 
						 window.location = "34.234.131.234.180:8080/exahealth/index.jsp";

				 }else {
				     console.log("err");
				     }

				} 

			});

		}
	});
 
 
 
 </script>   
    
  <div id="snackbar">All Fields are Required</div>
<div id="snackbarpassword">Passwords are not same, Please Enter valid Ones!</div>
<div id="snackbaremail">Please Enter Valid Email Address!</div>
<div id="snackbarInvalid">Email Doesn't Exist</div>
<div id="snackbarsame">Please change the password! Previous & Present Password are same</div>
<div id="snackbarchanged">Password is Changed Successfully!</div>
    
</body>

</html>	