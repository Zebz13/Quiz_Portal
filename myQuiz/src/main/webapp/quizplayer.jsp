<%@page import="com.deloitte.myQuiz.entities.Questions"%>
<%@page import="com.deloitte.myQuiz.helper.FactoryProvider"%>
<%@page import="com.deloitte.myQuiz.dao.QuestionDao"%>


<%@page import="java.util.*"%>

 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
table {
	border: 1px solid black;
	width: 500px;
	height: 300px;
	background: yellow;
}
.radio-input {
  margin: 0 0.5rem 0;
}
</style>

<script src="js/script.js"></script>
<%@include file="components/navbar.jsp" %>


</head>
<body>



	<%
	int questionNumber = Integer.parseInt(request.getParameter("questionId"));
	

	QuestionDao qdao = new QuestionDao(FactoryProvider.getFactory());

	List<Integer> qNumbers = qdao.getAllQuestionNumbers(); /* [1,2,3,4,5,6] */
	List<Questions> qdata = qdao.getAllDataByQuestionNumber(questionNumber); /* [question,option1,option2,option3,option4] */
	
	int questionIndex = qNumbers.indexOf(questionNumber);
	int lastQuestionIndex = qNumbers.size()-1;
	int nextQuestionIndex = questionIndex+1;
	int previousQuestionIndex = questionIndex-1;
	
	if(previousQuestionIndex <=0)
	{
		previousQuestionIndex=0;
	}

	%>
	<div class="container1 outline" id="outline-1">
		<div style="margin-top:10%;margin-left:10%;">
		
		<form>
        <div style="margin-left: 50px;font-size:large;">
        
       	<%
       		for(Questions q:qdata)
       		{
       	%>
        
         	<input type="hidden"  id="questionNumber" value="<%= questionNumber%>">
         	<input type="hidden"  id="correct_answer" value=<%=q.getCorrectAnswer() %>>
         	<input type="hidden"  id="total_questions" value=<%=qNumbers.size() %>>
         	
            <p><b>Q<%= questionNumber%>:&nbsp;<%= q.getQuestion() %></b></p>
            
            <p><input type="radio" name="selectedAnswer" id="radio0" value="<%= q.getOption1()%>"><%= q.getOption1()%></p>
            <p><input type="radio" name="selectedAnswer" id="radio1" value="<%= q.getOption2() %>"><%= q.getOption2() %></p>
            <p><input type="radio" name="selectedAnswer" id="radio2" value="<%= q.getOption3() %>"><%= q.getOption3() %></p>
            <p><input type="radio" name="selectedAnswer" id="radio3" value="<%= q.getOption4() %>"><%= q.getOption4() %></p>
         
       <%
       		}
       %>
       <div style="margin-left:35%;">
       
            <%
            if(nextQuestionIndex==1)
           		 {
            
            %>
            <button disabled id="previous" type="button" class="btn " onclick="previousAnswer(<%=questionIndex%>)">Previous</button>
            <%
            } else{
            %> 
            
            <button  id="previous" type="button" class="btn " onclick="previousAnswer(<%=questionIndex%>)">Previous</button>
            <%
            }
            if(questionIndex==lastQuestionIndex)
            {
            %>
            <button id="submit" type="button" class="btn " onclick="saveAnswer(<%=nextQuestionIndex%>,<%=lastQuestionIndex%>);calAnswer();">Submit</button>
            <%}
            	else
            	{
            	%>
          
			<button id="next" type="button" class="btn " onclick="saveAnswer(<%=nextQuestionIndex%>,<%=lastQuestionIndex%>)">Next</button>
 			<%
 			}
            %>
            </div>
        </div>
        
    </form>
    </div>
	</div>
	
<script>
	let qNo=document.getElementById("questionNumber").value
	let quiz=JSON.parse(localStorage.getItem("quiz"))
	if(quiz !=null){
		let current = quiz.find( (item) => item.question == qNo)
		if(current){
			let radio=current.radio
			if(radio!=null){
				let temp="radio"+radio.toString();
				document.getElementById(temp).checked=true
			}
		}
		
	}
		
</script>


</body>
</html>