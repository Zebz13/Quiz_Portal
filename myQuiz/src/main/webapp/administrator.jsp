<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<title>Administrator Screen</title>
<%@include file="components/navbar.jsp" %>
</head>

<script type="text/javascript">
let current_user=localStorage.getItem("user");
if(current_user !="admin"){
	alert("No Admin Access")
	window.location='login.jsp'
	
}
	
</script>

<style>

input{
margin:0;
padding:0;
}


</style>
<body>

	<div class="container1 outline" id="outline-1">
			<form action="AddQuestionsServlet" method="post" onsubmit=" return validateFormNext();" >
				<div class="row_adminstrator">
					<div class="column name">
							<label  for="fname">Question</label><br><br>
							<label for="fname">Answer(a)</label><br><br>
							<label for="fname">Answer(b)</label><br><br>
							<span style="margin-top:300px"><label for="fname">Answer(c)</label></span><br><br>
							<label for="fname">Answer(d)</label><br/><br/><br>
							<label for="cor_option">Correct Option</label>
					</div>
					<div class="column value">
						<input size="70" type="text" id="question" class='class' name="question"><br><br>
						<input size="70" type="text" id="option1" class='class' name="option1"><br><br>
						<input size="70" type="text" id="option2" class='class' name="option2"><br><br>
						<input size="70" type="text" id="option3" class='class' name="option3"><br><br>
						<input size="70" type="text" id="option4" class='class' name="option4"><br><br/><br>
					  	<input type="radio" id ="a" name="radio" value="a">
					  	<span class="checkmark">(a)&nbsp;&nbsp;&nbsp;&nbsp;</span>
					  	<input type="radio"  id ="b" name="radio" value="b">
					  	<span class="checkmark">(b)&nbsp;&nbsp;&nbsp;&nbsp;</span>
					  	<input type="radio" id ="c" name="radio" value="c">
					  	<span class="checkmark">(c)&nbsp;&nbsp;&nbsp;&nbsp;</span>
					  	<input type="radio"  id ="d" name="radio" value="d">
					  	<span class="checkmark">(d)&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
			</div>
				<div class="container1 buttons_adminstrator">
					<button class="finish" type="submit" name="finish" value="f"  >Finish</button> <!-- onclick to both button -->
					<button class="next" type="submit" name="finish" value="n" >Next</button>
				</div>
			</form>
	
	</div>
</body>
</html>