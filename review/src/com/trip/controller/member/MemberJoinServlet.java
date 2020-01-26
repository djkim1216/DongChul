package com.trip.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.trip.dao.member.MemberLoginDao;
import com.trip.dao.member.MemberLoginDaoImpl;
import com.trip.dto.member.MemberLoginDto;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/memberJoin")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberLoginDao memberLoginDao = new MemberLoginDaoImpl();
	Logger log = Logger.getLogger(this.getClass());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("[" + request.getServletPath() + "]=============[START]");
		
		MemberLoginDto dto = new MemberLoginDto();
//		m_id
//		m_nick
//		m_pass
//		m_name
//		m_email
//		m_phone
//		m_flag
//		m_grade
//		m_platform
//		m_filepath
//		m_addr1
//		m_addr2
		
		dto.setM_id(String.valueOf(request.getParameter("myId")));
		dto.setM_pass(String.valueOf(request.getParameter("myPw")));
		dto.setM_email(String.valueOf(request.getParameter("email")));
		dto.setM_platform(String.valueOf(request.getParameter("platform")));

		int result = memberLoginDao.joinMember(dto);
		
		if(result < 1) {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().append("<script>alert('회원가입에 실패했습니다.');" +"window.location.href='/page?page=join';</script>");
		}else {
			response.sendRedirect("/page?page=login");
		}
		log.debug("[" + request.getServletPath() + "]=============[END]");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
