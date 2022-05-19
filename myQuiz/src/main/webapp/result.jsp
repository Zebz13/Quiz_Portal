<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Summary</title>
<%@include file="components/navbar.jsp" %>
</head>
<body>
	<div class=" container1 outline" id="outline-2" >
		<div style="margin-left:20%;margin-top:13%">
			<h1><b>Summary</b></h1>
			<div class="row">
				<div class="column-name">
					<h2>Name:<span style="margin-left:44%" id="player_name"></span></h2>
					<h2>Correct Answers:<span style="margin-left:20%" id="answer"></span></h2>
					<h2>Percentage:<span style="margin-left:33%" id="percent"></span></h2>
					<a href='login.jsp'><button style="margin-left:30%;">Finish</button></a>
					
				</div>
			
			</div>
		
		</div>
	</div>
	<script>
		let score=localStorage.getItem("score")
		let total_no=localStorage.getItem("total_q")
		let name=localStorage.getItem("name")
		let percentage= ((score/total_no)*100).toFixed(2);
		document.getElementById("answer").innerHTML= score.toString()+" out of "+total_no.toString()
		document.getElementById("percent").innerHTML=percentage.toString()+"%"
		document.getElementById("player_name").innerHTML=name
		
	</script>
</body>
</html>