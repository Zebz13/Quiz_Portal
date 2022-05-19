package com.deloitte.myQuiz.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QuizPlayerServlet
 */
public class QuizPlayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizPlayerServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
		//PrintWriter out = response.getWriter();
		try {
			String userName = request.getParameter("name");
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("quiz_player_name", userName);
			response.sendRedirect("quizplayer.jsp?questionId=1");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
