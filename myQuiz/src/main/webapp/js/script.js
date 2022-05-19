function validate(){
	
	var userName=document.getElementById("user_name").value;
	var userPassword=document.getElementById("user_pass").value;
	console.log(userName);
	console.log(userPassword);
	
	if(userName === "Admin" && userPassword === "Admin"){
		localStorage.setItem("user","admin")
		window.location="administrator.jsp"
	}
	else{
		alert("Invalid admin credentials")
		window.location="login.jsp"
	}
}
function redirectToLogin()
{
	window.location="login.jsp"
}
function isChecked()
{
	if(document.getElementsByName("radio")[0].checked || document.getElementsByName("radio")[1].checked || document.getElementsByName("radio")[2].checked || document.getElementsByName("radio")[3].checked)
		{
		return true;
		}
	else
		return false;
}
function validateFormNext() {
	console.log("Inside validateFormNext")
	let f1=document.getElementsByClassName('class')[0].value;
	let f2=document.getElementsByClassName('class')[1].value;
	let f3=document.getElementsByClassName('class')[2].value;
	let f4=document.getElementsByClassName('class')[3].value;
	let f5=document.getElementsByClassName('class')[4].value;
	if(f1==='' || f2==='' || f3==='' || f4==='' || f5==='' || !(isChecked()))
		{
		console.log("Empty field")
		
		window.alert("One or more mandatory fields are required")
		
		
		return false;
		
		}
		
	}
	
function saveAnswer(nextPageIndex,lastIndex){
	if(document.getElementsByName("selectedAnswer")[0].checked||document.getElementsByName("selectedAnswer")[1].checked||document.getElementsByName("selectedAnswer")[2].checked||document.getElementsByName("selectedAnswer")[3].checked)
		{
			let correct_ans=document.getElementById("correct_answer").value
			var temp=document.getElementsByName("selectedAnswer");
			var answer={};
			for(i=0;i<temp.length;i++){
				if(temp[i].checked){
					
					answer={question:nextPageIndex,radio:i,ans:temp[i].value,correct_ans:correct_ans}
	
				}
			}
			let quiz = localStorage.getItem("quiz");
			if(quiz==null){
					answers=[];
					answers.push(answer)
					localStorage.setItem("quiz", JSON.stringify(answers));
			}
			else{
				localStorage.removeItem("radio")
				let tquiz=JSON.parse(localStorage.getItem("quiz"))
				let oldQuestion = tquiz.find( (item) => item.question == nextPageIndex)
				 
				if(oldQuestion){
					oldQuestion.ans=answer.ans;
					oldQuestion.radio=answer.radio
					tquiz.map((item) => {
						if(item.question == oldQuestion.question){
							item.ans=oldQuestion.ans
							item.radio=oldQuestion.radio
						}
					})
					localStorage.setItem("quiz", JSON.stringify(tquiz));
				}
				else{
					
					tquiz.push(answer)
					localStorage.setItem("quiz", JSON.stringify(tquiz));
				}
			}
			if(nextPageIndex-1==lastIndex)
			{
				var z = confirm("Do you want to submit your answers?");
				if (z == true) {
				   window.location = 'result.jsp';
				} else {
					window.location = 'quizplayer.jsp?questionId='+nextPageIndex;
				  }
				
			}
			else
			{
				let num= nextPageIndex+1
				window.location = 'quizplayer.jsp?questionId='+num.toString();
			}
			
		}
		else
		{
			window.alert("Select an answer to continue")
			
			window.location = 'quizplayer.jsp?questionId='+nextPageIndex;
		}
			
}
function setname()
{
	var name=document.getElementById("player_name").value;
	localStorage.setItem("name",name);
}

function previousAnswer(previousQuestionIndex){
	let quiz=JSON.parse(localStorage.getItem("quiz"));
	let question_no;
	let answer;
	let radio;
	quiz.map((item)=>{
		if(item.question == previousQuestionIndex){
			question_no=item.question;
			answer=item.ans;
			radio=item.radio;
		}
	})

	localStorage.setItem("radio",radio)
	let num=previousQuestionIndex
	window.location = 'quizplayer.jsp?questionId='+num.toString()
	
}
function calAnswer(){
	
	let quiz=JSON.parse(localStorage.getItem("quiz"));
	var score=0;
	var total_questions=document.getElementById("total_questions").value
	quiz.map((item)=>{
		if(item.ans == item.correct_ans){
			//console.log("entered here in map: ")
			score=score+1;
		}
	})
	
	localStorage.setItem("score",score)
	localStorage.setItem("total_q",total_questions)
	
}

function goToQuestion(qno, index, lastIndex)
{
	if(index <=0) // first question
	{
		document.getElementById("previous").addClass("disabled");
	}
	else if (index == lastIndex) // submit button case
	{
		document.getElementById("previous").removeClass("disabled");
		
		
		
	}
	else // all other questions
	{
		document.getElementById("previous").removeClass("disabled");
		
		var location = qno;
		
		window.location = "quizPlayer.jsp?questionId="+location;
	}
}


//============================================================================

function saveData(){
	
	selectedAnswer = document.getElementN
	
}