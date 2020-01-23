package com.trip.controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.trip.dao.member.MemberLoginDao;
import com.trip.dao.member.MemberLoginDaoImpl;
import com.trip.dto.member.MemberLoginDto;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet({"/memberLogin2","/loginForm","/logout"})
public class MemberLoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberLoginDao memberLoginDao = new MemberLoginDaoImpl();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		HttpSession session;
		if(uri.endsWith("memberLogin2")) {
			
			session = request.getSession();
			MemberLoginDto dto = new MemberLoginDto();
			dto.setM_id(String.valueOf(request.getParameter("myId")));
			dto.setM_pass(String.valueOf(request.getParameter("myPw")));
			dto.setM_nick(String.valueOf(request.getParameter("myNick")));
			dto.setM_email(String.valueOf(request.getParameter("email")));
			dto.setPlatform(String.valueOf(request.getParameter("platform")));
			
			MemberLoginDto user = new MemberLoginDto();
			user = memberLoginDao.getList(dto);
			
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			out.print(gson.toJson(user));  //객체 --> JSON 문자열로 바꿈
			out.flush();
			out.close();
			
		} else if (uri.endsWith("loginForm")) {
			response.sendRedirect("loginForm.jsp");
			
		} else if(uri.endsWith("logout")) {
			response.sendRedirect("headerbar.jsp");
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
