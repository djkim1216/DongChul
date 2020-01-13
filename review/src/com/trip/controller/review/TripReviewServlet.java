package com.trip.controller.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trip.biz.review.TripReviewBiz;
import com.trip.biz.review.TripReviewBizImpl;

/**
 * Servlet implementation class TripReviewServlet
 */
@WebServlet({"/TripReviewServlet"})
public class TripReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public TripReviewServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		TripReviewBiz tripReviewBiz = new TripReviewBizImpl();
		request.setAttribute("tripReviewList", tripReviewBiz.selectAll());
		RequestDispatcher dispatch = request.getRequestDispatcher("/index.jsp");
		dispatch.forward(request, response);
		
	}

}
