package com.deloitte.myQuiz.servlets;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.deloitte.myQuiz.entities.Questions;
import com.deloitte.myQuiz.helper.FactoryProvider;

/**
 * Servlet implementation class AddQuestionsServlet
 */

public class AddQuestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		try
		{
			String question = request.getParameter("question");
			String opt1 = request.getParameter("option1");
			String opt2= request.getParameter("option2");
			String opt3 = request.getParameter("option3");
			String opt4 = request.getParameter("option4");
			String ans = request.getParameter("radio");
			switch(ans)
			{
			case "a":
				ans=opt1;
				break;
			case "b":
				ans=opt2;
				break;
			case "c":
				ans=opt3;
				break;
			case "d":
				ans=opt4;
				break;
				
			}
			String redirection1 = request.getParameter("finish");
			
			if(question!=null && opt1!=null && opt2!=null && opt3!=null && opt4!=null && ans!=null) {
				Questions questions = new Questions(question, opt1, opt2, opt3, opt4, ans);
				
				Session hibernateSession = FactoryProvider.getFactory().openSession();
				
				Transaction txn= hibernateSession.beginTransaction();
				hibernateSession.save(questions);
				txn.commit();
				hibernateSession.close();
				
				System.out.println("Saved successfully");
				System.out.println(questions.toString());
				if(redirection1.equals("f"))
				{
					response.sendRedirect("login.jsp");
				}
				else
				{
					response.sendRedirect("administrator.jsp");
				}
				doGet(request, response);
			}
			else
			{
				response.sendRedirect("administrator.jsp");
			}
			
			
		}catch(Exception e)
		{
			
		}
		
		
	}

}
