	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exafluence</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

body{
	margin:0;
	color:#6a6f8c;
	background-image: url("https://cdn.ibdnewstoday.com/wp-content/uploads/2017/03/shutterstock_203751310.jpg");
		 background-size: 1400px 1100px;
 	background-repeat: no-repeat;
	font:600 16px/18px 'Open Sans',sans-serif;
	overflow : hidden;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:#f8fff0;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:525px;
	min-height:670px;
	position:relative;
	background:url(https://www.asmag.com/upload/pic/case/63303.0825.jpg) no-repeat center;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:100%;
	position:absolute; 
	padding:60px 70px 50px 70px;
	background:rgba(40,57,101,.9);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	-webkit-transform:rotateY(180deg);
	        transform:rotateY(180deg);
	-webkit-backface-visibility:hidden;
	        backface-visibility:hidden;
	-webkit-transition:all .4s linear;
	transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	-webkit-perspective:1000px;
	        perspective:1000px;
	-webkit-transform-style:preserve-3d;
	        transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#f8fff0;
	font-size:12px;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	-webkit-transition:all .2s ease-in-out 0s;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	-webkit-transform:scale(0) rotate(0);
	        transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	-webkit-transform:scale(0) rotate(0);
	        transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	-webkit-transform:scale(1) rotate(45deg);
	        transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	-webkit-transform:scale(1) rotate(-45deg);
	        transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	-webkit-transform:rotate(0);
	        transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	-webkit-transform:rotate(0);
	        transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
	color:#f8fff0;
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

#snackbarConformation {
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

#snackbarConformation.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
 
 #snackbarexist {
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

#snackbarexist.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
 
 
 
 #snackbarNotverified {
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

#snackbarNotverified.show {
visibility: visible;
-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
animation: fadein 0.5s, fadeout 0.5s 2.5s;

}
  
 
 
 
 
 
 
 @-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}
  

</style>

</head>
<body>

<div class="column col-lg-2 col-md-2 col-sm-2" style="height:80px; margin-left:1080px; background-image:url(img/logo.png); background-repeat:no-repeat;">


</div>
	<div class="login-wrap">
	<div class="login-html">

			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">Sign In</label> <input id="tab-2"
				type="radio" name="tab" class="sign-up"><label for="tab-2"
				class="tab">Sign Up</label>
			<div class="login-form">

				<div class="sign-in-htm">
					<div class="group">
						<label for="user" class="label">Email Address</label> <input
							id="user" type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">Password</label> <input id="pass"
							type="password" class="input" data-type="password">
					</div>
					<div class="group">
						<input id="check" type="checkbox" class="check" checked> <label
							for="check"><span class="icon"></span> Keep me Signed in</label>
					</div>
					<div class="group">
						<input type="submit" id="signin" class="button" value="Sign In">
					</div><div class="hr"></div>
					<div class="foot-lnk">
					 <a href="resetpassword.jsp" style="margin-left: -10px;">Reset password</a>
					
					<a href="forget.jsp" style="margin-left: 60px;">Forgot Password?</a>

					</div>
				</div>
				<div class="sign-up-htm">
					<div class="group">
						<label for="pass" class="label">Name</label> <input
							id="name" type="text" class="input">
					</div>
						<div class="group">
						<label for="pass" class="label">Company Name</label> <input
							id="company" type="text" class="input">
					</div>
						<div class="group">
						<label for="pass" class="label">Designation</label> <input
							id="designation" type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">Email Address</label> <input
							id="em" type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">Password</label> <input
							id="Spass1" type="password" class="input" data-type="password">
					</div>
					<div class="group">
						<label for="pass" class="label">Confirm Password</label> <input
							id="Spass2" type="password" class="input" data-type="password">
					</div>

					<div class="group">
						<input id="Submit" type="submit" class="button" value="Submit">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label for="tab-1">Already Member?</a>
					</div>
				</div>

			</div>
		</div>
	</div>


	
	<script type="text/javascript">
		//Login script
		$(document).on("click","#signin",function() {

							var username = $("#user").val();
							var password = $("#pass").val();

							if ((username == "") || (password == "")) {
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

								if (!validateEmail(username)) {
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

								function validateEmail($username) {
									var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
									return emailReg.test($username);
								}

								$.ajax({

									url : "Login",
									type : "POST",
									data : {
										username : username,
										password : password
									},
									 success : function(responseText) {
										 
										 //Notverified
										 
										 
										 
										 
										 
										 
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
										 else if(responseText.trim() == "Notverified"){
											 var x = document
											 .getElementById("snackbarNotverified")

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
									     else
									     {
									    	 window.location.href="index.jsp";
									     }

									} 

								});

							}
						});
	</script>

	<script type="text/javascript">
	
	//create user script
		$(document).on("click", "#Submit", function() {

			var name = $("#name").val();
			var companyname = $("#company").val();
			var designation = $("#designation").val();
			var createusername = $("#em").val();
			var createpassword = $("#Spass1").val();
			var confirmpassword = $("#Spass2").val();
			
			if ((name == "") || (companyname == "") || (designation == "") ||  (createpassword == "") || (createpassword == "") || (confirmpassword == "")) {
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
				
				if(createpassword==confirmpassword){

				if (!validateEmail(createusername)) {
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

				function validateEmail($createusername) {
					var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
					return emailReg.test($createusername);
				}

				$.ajax({

					url : "CreateUser",
					type : "POST",
					data : {name:name,companyname:companyname,designation:designation,createusername:createusername,createpassword:createpassword,confirmpassword:confirmpassword},
					 success : function(responseText) {
						 $('input[type="text"]').val('');
						 $('input[type="password"]').val('');
						 
						 if(responseText.trim() == "ok"){
							 var x = document
							 .getElementById("snackbarConformation")

							 x.className = "show";
							 setTimeout(
							 function() {
							 x.className = x.className
							 .replace(
							 "show",
							 "");
							 },
							 3000);
							 
						 }else{
							 
							 
							 var x = document
							 .getElementById("snackbarexist")

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

					} 

				});

			}else{
			
				var x = document
				 .getElementById("snackbarpassword")

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
				
			}
		

		});
	</script>



<div id="snackbar">All Fields are Required</div>
<div id="snackbarpassword">Passwords are not same, Please Enter valid Ones!</div>
<div id="snackbaremail">Please Enter Valid Email Address!</div>
<div id="snackbarInvalid">Invalid Username or Password</div>
<div id="snackbarConformation">We'll get back to you soon</div>
<div id="snackbarexist">User is Already Existed</div>
<div id="snackbarNotverified">User not verified yet!</div>

</body>
</html>