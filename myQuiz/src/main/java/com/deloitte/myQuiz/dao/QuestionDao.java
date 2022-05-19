package com.deloitte.myQuiz.dao;

import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;

import com.deloitte.myQuiz.entities.Questions;

public class QuestionDao {

	private SessionFactory factory; // CategoryDAO will need a session factory to perform operations

	public QuestionDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	@SuppressWarnings({ "unchecked" })
	public List<Questions> getAllDataByQuestionNumber(Integer qno)
	{
		
		String query = "from Questions as q where q.questionId = :qid";
		
		
		Session session = this.factory.openSession();
		Query<Questions> q = session.createQuery(query);
		q.setParameter("qid", qno);
		List<Questions> resultList = q.getResultList();
		
		session.close();
		
		for(Questions qe:resultList)
		{
			System.out.println(qe.toString());
		}
		
		
		return resultList;
		
		// [ [47, "capital?", "hyd", "del", "asd", "afgh" ],   [49, "name?", "hyd", "del", "asd", "afgh" ],  [50, "photo?", "hyd", "del", "asd", "afgh" ], ]
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Integer> getAllQuestionNumbers()
	{
		String query = "select q.questionId from Questions q";
		
		Session session = this.factory.openSession();
		
		Query q = session.createQuery(query);
		List resultList = q.getResultList();
		
		session.close();
		
		return resultList;
		
		// [ [47, "capital?", "hyd", "del", "asd", "afgh" ],   [49, "name?", "hyd", "del", "asd", "afgh" ],  [50, "photo?", "hyd", "del", "asd", "afgh" ], ]
	}
	
}
