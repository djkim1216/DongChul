package com.trip.controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.JSONParserTokenManager;

import com.trip.biz.review.TripReviewBiz;
import com.trip.biz.review.TripReviewBizImpl;
import com.trip.biz.review.TripReviewContentsBiz;
import com.trip.biz.review.TripReviewContentsBizImpl;
import com.trip.biz.review.TripReviewViewBiz;
import com.trip.biz.review.TripReviewViewBizImpl;
import com.trip.dao.review.TripReviewViewDaoImpl;
import com.trip.dto.review.TripReviewViewDto;

/**
 * Servlet implementation class TripReviewServlet
 * 
 * 
 * TripReview + TripReviewContents
 * 
 */
@WebServlet({"/TripReviewList","/TripReviewView"})
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
		
		if(uri.endsWith("TripReviewList")) {
			go(request,response,"TripReviewList.jsp");
		} else if(uri.endsWith("TripReviewView")) {
			tripReviewList(request,response);
			go(request,response,"TripReviewView.jsp");
		}
	}

	protected void go(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException{
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	protected void tripReviewList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TripReviewViewBiz tripReviewViewBiz = new TripReviewViewBizImpl();
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		List<TripReviewViewDto> list = tripReviewViewBiz.selectList(start, end);
		request.setAttribute("tripReviewView_List", list);
	}
	
}
