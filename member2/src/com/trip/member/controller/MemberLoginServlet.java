package com.trip.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trip.member.dao.MemberLoginDao;
import com.trip.member.dao.MemberLoginDaoImpl;
import com.trip.member.dto.MemberLoginDto;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/memberLogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberLoginDao memberLoginDao = new MemberLoginDaoImpl();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			MemberLoginDto dto = new MemberLoginDto();
			dto.setM_id(String.valueOf(request.getParameter("userId")));
			dto.setM_pass(String.valueOf(request.getParameter("userPw")));
//			dto.setM_email(String.valueOf(request.getParameter("email")));
			dto.setM_email(String.valueOf(request.getParameter("kei01118@naver.com")));
			dto.setPlatform(String.valueOf(request.getParameter("platform")));
			
			MemberLoginDto result = new MemberLoginDto();
			result = memberLoginDao.getList(dto);
			if(result == null) {
				response.setContentType("text/html; charset=utf-8");
				response.getWriter().append("<script>alert('로그인에 실패했습니다.');" +"window.location.href='/page?page=login';</script>");
			}else {
				request.setAttribute("result", result);
				RequestDispatcher dispatcher = request.getRequestDispatcher("mainview.jsp");
				dispatcher.forward(request, response);
			}
			//request.setAttribute("id", id);
			//request.setAttribute("pw", pw);
			
			//1. forward (파라미터까지 포함시켜서 페이지를 부르는 방법)
//			RequestDispatcher dispatcher = request.getRequestDispatcher("mainview.jsp");
//			dispatcher.forward(request, response);
			
			
			//2. redirect
			//response.sendRedirect("result.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
