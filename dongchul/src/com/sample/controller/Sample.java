package com.sample.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Sample
 */
@WebServlet("/sample")
public class Sample extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sample() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = String.valueOf(request.getParameter("id"));
		String pw = String.valueOf(request.getParameter("pw"));
		
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		
		//1. forward (파라미터까지 포함시켜서 페이지를 부르는 방법)
		String returnPage = "";
		
		try {
			//String aaa = "aaa";
			//int bbb = Integer.parseInt(aaa);
			
			returnPage = "view/sample/sampleResult.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(returnPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			String errorMsg = e.getMessage();
			
			
			request.setAttribute("errorMsg", errorMsg);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
		
		//2. redirect
		//response.sendRedirect("result.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
