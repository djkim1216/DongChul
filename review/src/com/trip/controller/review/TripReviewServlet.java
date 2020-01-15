package com.trip.controller.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trip.biz.review.TripReviewBiz;
import com.trip.biz.review.TripReviewBizImpl;
import com.trip.biz.review.TripReviewContentsBiz;
import com.trip.biz.review.TripReviewContentsBizImpl;

/**
 * Servlet implementation class TripReviewServlet
 * 
 * 
 * TripReview + TripReviewContents
 * 
 */
@WebServlet({"/tripReviewMain"})
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

		String uri = request.getRequestURI();
		System.out.println("서버");
		if(uri.endsWith("tripReviewMain")) {
			
		}
	}

}
