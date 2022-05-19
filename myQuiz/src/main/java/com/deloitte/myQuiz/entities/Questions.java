package com.deloitte.myQuiz.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Questions {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10, name="questionId")
	private int questionId;
	
	@Column(length = 100, name="question")
	private String question;

	@Column(length = 100, name="option1")
	private String option2;
	
	@Column(length = 100, name="option2")
	private String option3;
	
	@Column(length = 100, name="option3")
	private String option4;
	
	@Column(length = 100, name="option4")
	private String option1;
	
	@Column(length = 10, name="answer")
	private String correctAnswer;

	public Questions(int questionId, String question, String option2, String option3, String option4, String option1,
			String correctAnswer) {
		super();
		this.questionId = questionId;
		this.question = question;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.option1 = option1;
		this.correctAnswer = correctAnswer;
	}

	public Questions(String question, String option2, String option3, String option4, String option1,
			String correctAnswer) {
		super();
		this.question = question;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.option1 = option1;
		this.correctAnswer = correctAnswer;
	}

	public Questions() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	@Override
	public String toString() {
		return "Questions [questionId=" + questionId + ", question=" + question + ", option2=" + option2 + ", option3="
				+ option3 + ", option4=" + option4 + ", option1=" + option1 + ", correctAnswer=" + correctAnswer + "]";
	}
	
}

