package com.trip.controller.search;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trip.dao.search.SearchDao;
import com.trip.dao.search.SearchDaoImpl;
import com.trip.dto.search.SearchDto;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session;
		session = request.getSession();
		
		
		SearchDao dao = new SearchDaoImpl();
		SearchDto dto = new SearchDto();
		
		String [] particle = {"에서",  "으로", "부터", "까지","에", "서","은", "는", "이", "가", "을", "를", "로", "와", "사이"};
		
		dto.setMyid(request.getParameter("myid"));
		dto.setSearch(request.getParameter("search"));
		
		String [] array = dto.getSearch().split(" ");
		
		int res = 0;
		
		for(int i=0; i<array.length; i++) {
			for(int j=0; j<particle.length; j++) {
				if(array[i].endsWith(particle[j])) {
					int index = array[i].indexOf(particle[j]);
					array[i] = array[i].substring(0,index);
					System.out.println(array[i]);
				}
				
			}
			res = dao.insertSearch(dto.getMyid(), array[i]);
		}
		
		if(res>0) {
			System.out.println("검색어 추가 성공!");
		}
		
	}

}