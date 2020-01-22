package com.trip.controller.review;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.select.Elements;

import com.trip.biz.categoryreview.CategoryReviewBiz;
import com.trip.biz.categoryreview.CategoryReviewBizImpl;
import com.trip.biz.comment.CategoryCommentBiz;
import com.trip.biz.comment.CategoryCommentBizImpl;
import com.trip.biz.review.TripReviewViewBiz;
import com.trip.biz.review.TripReviewViewBizImpl;
import com.trip.dto.categoryreview.CategoryReviewDto;
import com.trip.dto.comment.CategoryCommentDto;
import com.trip.util.Crawler;
import com.trip.util.KaKaoApi;
import com.trip.util.ReviewUtil;

/**
 * Servlet implementation class TripReviewServlet
 * 
 * 
 * TripReview + TripReviewContents
 * 
 */
@WebServlet({ "/TripReviewList", "/TripReviewView", "/RestaurantReviewList", "/RestaurantReviewView",
		"/RoomsReviewList", "/RoomsReviewView", "/TouristReviewList", "/TouristReviewView","/CategoryReviewWrite","/CategoryReviewWriteRes", "/CateTmpImagesUpload",
		"/CateTmpImagesDelete", "/CateTmpDelete","/ReviewCateSearchList" , "/kakaoPlaceList", "/kakaoPlaceMainImgSearch", "/CategoryReviewRead", "/CategoryReviewDelete",
		"/CategoryReviewModify","/CategoryReviewModifyRes","/metaDateCrawling", "/CommentList", "/CommentCount",
		"/CommentWrite", "/CommentDelete", "/CommentModify", "/CommentPlus"
})
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ReviewServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String uri = request.getRequestURI();
		
		
		
		if (uri.endsWith("TripReviewList")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("user", "user1");
			
			String serverPath = getServletContext().getRealPath("/");
			
			if(ReviewUtil.tmpImgDirDelete(serverPath)) {
				System.out.println("[ 크롤링용  임시디렉터리 삭제 ]");
			}
			
			tmpDirDelete(request, response, "category_review");
			tmpDirDelete(request, response, "trip_review");
			
			listGo(request, response, "TripReviewView");
			
		} else if (uri.endsWith("RestaurantReviewList")) {

			listGo(request, response, "RestaurantReviewView");

		} else if (uri.endsWith("RoomsReviewList")) {

			listGo(request, response, "RoomsReviewView");

		} else if (uri.endsWith("TouristReviewList")) {

			listGo(request, response, "TouristReviewView");

		} else if (uri.endsWith("TripReviewView")) {

			listView(request, response, new TripReviewViewBizImpl());

		} else if (uri.endsWith("RestaurantReviewView")) {

			listView(request, response, new CategoryReviewBizImpl(), "2");

		} else if (uri.endsWith("RoomsReviewView")) {

			listView(request, response, new CategoryReviewBizImpl(), "1");

		} else if (uri.endsWith("TouristReviewView")) {

			listView(request, response, new CategoryReviewBizImpl(), "3");

		} else if (uri.endsWith("CategoryReviewWrite")) {
			
			categoryReviewWrite(request, response);
			
		} else if (uri.endsWith("CategoryReviewWriteRes")) {
			
			categoryReviewWriteRes(request,response,"category_review");
			
		} else if (uri.endsWith("CateTmpImagesUpload")) {

			tmpImagesUpload(request, response,"category_review");

		} else if (uri.endsWith("CateTmpImagesDelete")) {
			
			tmpImagesDelete(request, response,"category_review");
			
		} else if (uri.endsWith("CateTmpDelete")) {
			
			tmpDirDelete(request, response, "category_review");
			
		} else if (uri.endsWith("ReviewCateSearchList")) {
			
			request.setAttribute("category",request.getParameter("category"));
			go(request, response, "CategoryPlaceSearch.jsp");
			
		} else if (uri.endsWith("kakaoPlaceList")) {
			searchPlaceList(request,response);
		
		} else if (uri.endsWith("kakaoPlaceMainImgSearch")) {
			kakaoPlaceMainImgSearch(request,response);
		
		} else if (uri.endsWith("CategoryReviewRead")) {
			
			CategoryReviewBiz biz = new CategoryReviewBizImpl();
			
			request.setAttribute("dto", biz.selectOne(Integer.parseInt(request.getParameter("cr_no"))));
			
			go(request,response,"CategoryReviewRead.jsp");
			
		} else if (uri.endsWith("CategoryReviewDelete")) {
			
			categoryReviewDelete(request, response);
			
		} else if (uri.endsWith("CategoryReviewModify")) {
			
			CategoryReviewBiz biz = new CategoryReviewBizImpl();
			
			request.setAttribute("dto", biz.selectOne(Integer.parseInt(request.getParameter("cr_no"))));
			
			
			go(request, response, "CategoryReviewModify.jsp");
		
		} else if (uri.endsWith("CategoryReviewModifyRes")) {
			
			categoryReviewModifyRes(request, response, "category_review");
			
		} else if (uri.endsWith("metaDateCrawling")) {
			
			metaDateGet(request,response);
			
		} else if (uri.endsWith("CommentList")) {
			
			commentList(request, response);
			
		} else if (uri.endsWith("CommentCount")) {
			commentCount(request, response);
			
		} else if (uri.endsWith("CommentWrite")) {
			commentWrite(request, response);
		} else if (uri.endsWith("CommentDelete")) {
			commentDelete(request,response);
		} else if (uri.endsWith("CommentModify")) {
			commentModify(request, response);
		} else if (uri.endsWith("CommentPlus")) {
			commentPlus(request, response);
		}
	}
	
	// 명소 3 | 숙소1 | 맛집 2
	
	protected void commentDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String selectComment = request.getParameter("selectComment");
		int rv_no = Integer.parseInt(request.getParameter("rv_no"));
		int rv_crno = Integer.parseInt(request.getParameter("rv_crno"));
		
		if(selectComment.equals("trip")){
			
		} else {
			CategoryCommentBiz biz = new CategoryCommentBizImpl();
			int res = biz.delete(rv_no);
			if(res > 0) {
				response.getWriter().append(""+biz.commentCount(rv_crno));
			}
		}
	}
	
	protected void commentModify(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String selectComment = request.getParameter("selectComment");
		String rv_content = request.getParameter("rv_content");
		int rv_no = Integer.parseInt(request.getParameter("rv_no"));
		int rv_crno = Integer.parseInt(request.getParameter("rv_crno"));
		
		if(selectComment.equals("trip")){
			
		} else {
			CategoryCommentBiz biz = new CategoryCommentBizImpl();
			CategoryCommentDto dto = new CategoryCommentDto();
			
			dto.setRv_content(rv_content);
			dto.setRv_crno(rv_crno);
			dto.setRv_no(rv_no);
			
			int res = biz.update(dto);
			if(res > 0) {
				response.getWriter().append(""+biz.commentCount(rv_crno));
			}
		}
	}
	
	protected void commentPlus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		
	}
	
	protected void commentWrite(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String selectComment = request.getParameter("selectComment");
		String rv_content = request.getParameter("rv_content");
		String rv_id = (String)request.getSession().getAttribute("user");
		int rv_crno = Integer.parseInt(request.getParameter("rv_crno"));
		
		System.out.println(rv_content);
		System.out.println(rv_id);
		System.out.println(rv_crno);
		
		if(selectComment.equals("trip")){
			
		} else {
			
			CategoryCommentBiz biz = new CategoryCommentBizImpl();
			CategoryCommentDto dto = new CategoryCommentDto();
			
			dto.setRv_content(rv_content);
			dto.setRv_crno(rv_crno);
			dto.setRv_id(rv_id);
			int res = biz.insert(dto);
			if(res > 0) {
				response.getWriter().append(""+biz.commentCount(rv_crno));
			}
		}
	}
	
	protected void commentCount(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String selectComment = request.getParameter("selectComment");
		int rv_crno = Integer.parseInt(request.getParameter("rv_crno"));
		
		if(selectComment.equals("trip")){
			
		} else {
			CategoryCommentBiz biz = new CategoryCommentBizImpl();
			int res = biz.commentCount(rv_crno);
			response.getWriter().append(""+res);
		}
	}
	
	protected void commentList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String selectComment = request.getParameter("selectComment");
		int rv_crno = Integer.parseInt(request.getParameter("rv_crno"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		System.out.println(rv_crno +"|"+ page);
		
		if(selectComment.equals("trip")) {
			
		} else {
			CategoryCommentBiz biz = new CategoryCommentBizImpl();
			request.setAttribute("comment_list", biz.selectList(rv_crno, page));
		}
		go(request, response, "ReviewComment.jsp");
	}
	
	protected void metaDateGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String url = request.getParameter("url");
		String selector = request.getParameter("selector");
		
		Elements els = Crawler.crawlingMeta(url, selector);
		
		String resStr = els.get(0).attr("content");
		
		response.getWriter().append(resStr);
		
	}

	
	protected void categoryReviewModifyRes(HttpServletRequest request, HttpServletResponse response, String reviewPath) throws IOException, ServletException {
		
		String cr_contents = request.getParameter("cr_contents");
		String cr_id = (String) request.getSession().getAttribute("user");
		int cr_no = Integer.parseInt(request.getParameter("cr_no"));
		
		String now_cr_path = request.getParameter("cr_path");
		
		String serverPath = getServletContext().getRealPath("/");
		
		CategoryReviewBiz biz = new CategoryReviewBizImpl();
		
		CategoryReviewDto dtoSelect = biz.selectOne(Integer.parseInt(request.getParameter("cr_no")));
		String category = request.getParameter("category");
		
		if(dtoSelect.getCr_id().equals(cr_id)) {
			String old_cr_path = ReviewUtil.searchDir(serverPath, reviewPath, "tmp_"+cr_id);
			old_cr_path = (old_cr_path==null)? null : old_cr_path;
		
			String cr_path = null;
		
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmmss");
			String no = format.format(date);
		
			if(ReviewUtil.renameDir(serverPath, reviewPath, cr_id, no+"_"+cr_id))
				cr_path = ReviewUtil.searchDir(serverPath, reviewPath, no+"_"+cr_id);
		
			System.out.println("[old_cr_path] " + old_cr_path);
			System.out.println("[cr_path] " + cr_path);
		
			CategoryReviewDto dto = new CategoryReviewDto();
			String cr_category = null;
			if(category.equals("명소")) {
				cr_category = "3";
			} else if (category.equals("숙소")) {
				cr_category = "1";
			} else if (category.equals("맛집")) {
				cr_category = "2";
			}
		
			String cr_title = request.getParameter("cr_title");
			String cr_placeid = request.getParameter("cr_placeid");
		
			dto.setCr_no(cr_no);
			dto.setCr_category(cr_category);
			dto.setCr_title(cr_title);
			dto.setCr_placeid(cr_placeid);
			dto.setCr_contents(cr_contents);
			dto.setCr_path(now_cr_path);	
		
			int res = biz.update(dto, cr_path, old_cr_path, serverPath);
			
			if(res == 1) {
				if(cr_category == "1") {
					response.sendRedirect("RoomsReviewList");
				} else if (cr_category == "2") {
					response.sendRedirect("RestaurantReviewList");
				} else if (cr_category == "3"){
					response.sendRedirect("TouristReviewList");
				}
			}
		} else {
			String where = null;
			if(category.equals("숙소")) {
				where = "RoomsReviewList";
			} else if (category.equals("맛집")) {
				where = "RestaurantReviewList";
			} else if (category.equals("명소")) {
				where = "TouristReviewList";
			} else {
				where = "TripReviewList";
			}
			response.getWriter().append("<script>alert('부적절한 접근입니다.'); location.href ='" + where + "';</script>");
		}
	}
	
	protected void categoryReviewDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int cr_no = Integer.parseInt(request.getParameter("cr_no"));
		String user = (String)request.getSession().getAttribute("user");
		String where = null;
		
		
		CategoryReviewBiz biz = new CategoryReviewBizImpl();
		
		CategoryReviewDto dto = biz.selectOne(cr_no);
		
		if(dto.getCr_category().equals("숙소")) {
			where = "RoomsReviewList";
		} else if (dto.getCr_category().equals("맛집")) {
			where = "RestaurantReviewList";
		} else if (dto.getCr_category().equals("명소")) {
			where = "TouristReviewList";
		} else {
			where = "TripReviewList";
		}
		
		if(dto.getCr_id().equals(user)) {
			biz.delete(cr_no);
			response.getWriter().append("<script>alert('글이 성공적으로 삭제되었습니다.'); location.href ='" + where + "';</script>");
		} else {
			response.getWriter().append("<script>alert('부적절한 접근입니다.'); location.href ='" + where + "';</script>");
		}
	}
	
	protected void kakaoPlaceMainImgSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
//		KaKao REST API
		
		String imgObjJson = KaKaoApi.search("image", request.getParameter("place_name"), 1, 1);
		
		JSONObject jsonObj = null;
		
		JSONParser paser = new JSONParser();
		try {
			jsonObj = (JSONObject) paser.parse(imgObjJson);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONArray array = (JSONArray) jsonObj.get("documents");
		jsonObj = (JSONObject) array.get(0);
		
		String targetURL = (String) jsonObj.get("image_url");
		
		String serverPath = getServletContext().getRealPath("/");
		
		HttpSession session = request.getSession();
		
		String path = ReviewUtil.tmpImgSave(serverPath, targetURL, (String)session.getAttribute("user"));
		
		
//		카카오 페이지 크롤링
//		String path = Crawler.crawlingMeta("https://place.map.kakao.com/"+request.getParameter("id"), "meta[property=og:image]").get(0).attr("content");
		
//		System.out.println("[MainImgPaht] " + path);
		
		
		response.getWriter().append(path);
	}
	
	protected void searchPlaceList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String out = null;
		if(page == null) {
			out = KaKaoApi.searchPlace(request.getParameter("keyword"), category);
		} else {
			out = KaKaoApi.searchPlace(request.getParameter("keyword"), category , page);
		}
		response.getWriter().append(out);
	}
	
	
	protected void go(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}

	protected void listGo(HttpServletRequest request, HttpServletResponse response, String reviewLocation)
			throws ServletException, IOException {
		if (request.getParameter("keyword") != null) {
			request.setAttribute("keyword", request.getParameter("keyword"));
		}
		request.setAttribute("reviewLocation", reviewLocation);
		go(request, response, "ReviewList.jsp");

	}

	protected void listView(HttpServletRequest request, HttpServletResponse response, Object biz)
			throws ServletException, IOException {
		listView(request, response, biz, null);
	}

	protected void listView(HttpServletRequest request, HttpServletResponse response, Object biz, String category)
			throws ServletException, IOException {

		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String keyword = null;
		List<?> list = null;

		System.out.println("ListView");
		if (request.getParameter("keyword") != null || !(request.getParameter("keyword").equals(""))) {
			keyword = request.getParameter("keyword");
		}

		if (biz instanceof TripReviewViewBizImpl) {

			TripReviewViewBiz tripReviewViewBiz = (TripReviewViewBizImpl) biz;
			list = tripReviewViewBiz.selectList(start, end, keyword);

		} else if (biz instanceof CategoryReviewBizImpl) {

			CategoryReviewBiz categoryReviewViewBiz = (CategoryReviewBizImpl) biz;
			list = categoryReviewViewBiz.selectList(start, end, keyword, category);

		}

		if (list.size() != 0) {
			request.setAttribute("ReviewView_List", list);
			if (category != null) {
				go(request, response, "CategoryReviewView.jsp");
			} else {
				go(request, response, "TripReviewView.jsp");
			}

		} else {
			response.getWriter().append("null");
		}

	}

	protected void categoryReviewWrite(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String from = request.getParameter("category");
		
		if(from.equals("RestaurantReviewView")) {
			request.setAttribute("category", "맛집");
		} else if (from.equals("TouristReviewView")) {
			request.setAttribute("category", "명소");
		} else if (from.equals("RoomsReviewView")) {
			request.setAttribute("category", "숙소");
		}
		
		go(request, response, "CategoryReviewWrite.jsp");
	}
	
	
	protected void categoryReviewWriteRes(HttpServletRequest request, HttpServletResponse response, String reviewPath) throws IOException, ServletException {
		
		String cr_contents = request.getParameter("cr_contents");
		String cr_id = (String) request.getSession().getAttribute("user");
		
		String serverPath = getServletContext().getRealPath("/");
		
		CategoryReviewBiz biz = new CategoryReviewBizImpl();
		
		
		String old_cr_path = ReviewUtil.searchDir(serverPath, reviewPath, "tmp_"+cr_id);
		old_cr_path = (old_cr_path==null)? "" : old_cr_path;
		
		String cr_path = null;
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmmss");
		String no = format.format(date);
		
		if(ReviewUtil.renameDir(serverPath, reviewPath, cr_id, no+"_"+cr_id))
			cr_path = ReviewUtil.searchDir(serverPath, reviewPath, no+"_"+cr_id);
		
		System.out.println("[old_cr_path] " + old_cr_path);
		System.out.println("[cr_path] " + cr_path);
		
		CategoryReviewDto dto = new CategoryReviewDto();
		
		String category = request.getParameter("category");
		String cr_category = null;
		if(category.equals("명소")) {
			cr_category = "3";
		} else if (category.equals("숙소")) {
			cr_category = "1";
		} else if (category.equals("맛집")) {
			cr_category = "2";
		}
		
		String cr_title = request.getParameter("cr_title");
		String cr_placeid = request.getParameter("cr_placeid");
		
		
		dto.setCr_category(cr_category);
		dto.setCr_title(cr_title);
		dto.setCr_path(old_cr_path);
		dto.setCr_placeid(cr_placeid);
		dto.setCr_contents(cr_contents);
		dto.setCr_id(cr_id);
		
		int res = biz.insert(dto, cr_path);
		
		if(res == 1) {
			if(cr_category == "1") {
				response.sendRedirect("RoomsReviewList");
			} else if (cr_category == "2") {
				response.sendRedirect("RestaurantReviewList");
			} else if (cr_category == "3"){
				response.sendRedirect("TouristReviewList");
			}
		}
		
	}
	

	protected void tmpImagesUpload(HttpServletRequest request, HttpServletResponse response, String reviewPath) throws IOException {
		
		ReviewUtil util = new ReviewUtil();
		
		HttpSession session = request.getSession();
		
		String user = (String) session.getAttribute("user");
		
		String serverPath = getServletContext().getRealPath("/");
		
		String outPath = util.tmpImagesUpload(request, serverPath, reviewPath, user);

		response.getWriter().append(outPath);
		
	}
	
	protected void tmpImagesDelete(HttpServletRequest request, HttpServletResponse response, String reviewPath) throws IOException {
		
		String url = request.getParameter("url");
		
		HttpSession session = request.getSession();
		
		String user = (String) session.getAttribute("user");
		
		String serverPath = getServletContext().getRealPath("/");
		
		if(ReviewUtil.tmpImagesDelete(serverPath, reviewPath, user, url))
			response.getWriter().append("1");
		else
			response.getWriter().append("0");
	}
	
	protected void tmpDirDelete(HttpServletRequest request, HttpServletResponse response, String reviewPath) throws IOException {
		
		HttpSession session = request.getSession();
		
		String user = (String) session.getAttribute("user");
		
		String serverPath = getServletContext().getRealPath("/");
		
		if(ReviewUtil.tmpDirDelete(serverPath, reviewPath, user))
			response.getWriter().append("1");
		else
			response.getWriter().append("0");
		
	}
	
}
