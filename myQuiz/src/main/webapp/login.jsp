<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="components/navbar.jsp" %>
<style>
#outline {
            width: 30%;
            border:  solid black;
            margin-left:35%;
            height: 400px;
            margin-top:25px;
              
        }
#head 	{
        width: 80%;
        height: 30px;
        background-color:#ebebeb;
        margin-bottom: 20px;
        margin-left:10%;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$( document ).ready(function() {
	    localStorage.clear()
	});
</script>
</head>
<body>
	
	<div class="outline" >
		<div id="head"> 
			<h2 style="text-align:center; margin-top: 50px;">Quiz Administrator</h2>
			<form>
			  <span style="text-align:left"><label for="user_name"><b>User Name:</b></label></span>
			  <input type="text" id="user_name" name="user_name" style="margin-left:70px; width:115px;"><br><br>
			  <span style="text-align:left"><label for="user_pass"><b>Password:</b></label></span>
			  <input type="password" id="user_pass" name="user_pass" style="margin-left:80px; width:115px"><br><br>
			  <button type="button" onclick="validate();" style="margin-left:155px;width:125px;" >Submit</button>
			</form>
		</div>	
		<div id="head" style="margin-top:160px;"> 
			<h2 style="text-align:center; margin-top: 50px;">Quiz Player</h2>
			<form action="QuizPlayerServlet" method="post" onsubmit="setname();">
			  <span style="text-align:left"><label for="name"><b>Name:</b></label></span>
			  <input id="player_name" type="text"  name="name" style="margin-left:105px; width:115px;"><br><br>
			  <input  type="submit" style="margin-left:155px; width:125px" value="Start">
			</form>
		</div>	
	
	</div>	
		
		
		
</body>
</html>