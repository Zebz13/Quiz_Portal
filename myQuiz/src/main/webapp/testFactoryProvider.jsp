<%@page import="com.deloitte.myQuiz.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Testing file</title>
</head>
<body>
<h1>I am creating session factory object</h1>
	<%
		
		out.println(FactoryProvider.getFactory()+"<br>");
		out.println(FactoryProvider.getFactory()+"<br>");
	%>
</body>
</html>