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
			if(request.getParameter("keyword") != null) {
				request.setAttribute("keyword", request.getParameter("keyword"));
			}
			go(request,response,"TripReviewList.jsp");
		} else if(uri.endsWith("TripReviewView")) {
			tripReviewView(request,response);

		
	}

	protected void go(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException{
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	protected void tripReviewView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TripReviewViewBiz tripReviewViewBiz = new TripReviewViewBizImpl();
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String keyword = null;
		if(request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}
		List<TripReviewViewDto> list = tripReviewViewBiz.selectList(start, end, keyword);
		if(list.size() != 0) {
			request.setAttribute("tripReviewView_List", list);
			go(request,response,"TripReviewView.jsp");
		} else {
			response.getWriter().append("null");
		}
	}
}
