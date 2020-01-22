package trip.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import trip.biz.PlanBiz;
import trip.dao.AccountDao;
import trip.dao.LocationDao;
import trip.dao.MemberDao;
import trip.dao.RoomsDao;
import trip.dao.TeamDao;
import trip.dao.TeamMemberDao;
import trip.dao.VoRoomDao;
import trip.dto.AccountDto;
import trip.dto.LocationDto;
import trip.dto.RoomsDto;
import trip.dto.VoRoomDto;

/**
 * Servlet implementation class TeamController
 */
@WebServlet("/TeamMemberController")
public class TeamMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TeamMemberController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");

		TeamDao teamDao = new TeamDao();

		TeamMemberDao teammemberDao = new TeamMemberDao();
		LocationDao locationDao = new LocationDao();
		MemberDao memberDao = new MemberDao();
		AccountDao accountDao=new AccountDao();
		RoomsDao roomsDao=new RoomsDao();
		VoRoomDao voroomDao=new VoRoomDao();
		PlanBiz planBiz = new PlanBiz();

		//HttpSession session = request.getSession();
		// session.setAttribute("t_id", "abcd");
		
		if (command.equals("createTeam")) {
			String leader = "lee";
			String days = "3";
			int res = teamDao.createTeam(leader, days);// 리더아이디, 일차
			if (res > 0) {
				teammemberDao.insertMember("lee");
				dispatch("invitation_form.jsp", request, response);
			} else {
				response.sendRedirect("index.jsp");
			}
		} else if (command.equals("idCheck")) {
			String id = request.getParameter("id");

			String res = memberDao.idChk(id);
			if (res != null) {// id가 존재할때
				JSONObject obj = new JSONObject();
				if (teammemberDao.insertMember(id) != 0) {// 팀에 uid가 없다면
					obj.put("id", id);
				}
				response.getWriter().println(obj.toJSONString());
			}
		}

		else if (command.equals("complete_0")) {
			int t_id = 1;
			
			String schedule_name = request.getParameter("schedule_name");
			String acc_holder=request.getParameter("acc_holder");
			String acc_bank=request.getParameter("acc_bank");
			String acc_num=request.getParameter("acc_num");
			
			teamDao.updateTeamName(schedule_name, t_id);
			AccountDto dto=new AccountDto(t_id,acc_holder,acc_bank,acc_num);
			accountDao.insertAcc(dto);
			
			response.sendRedirect("selectDay.jsp");
		} else if (command.equals("addlist")) {
			int loc_tid = 1;// 내꺼
			String loc_mid = "lee";// 내정보
			String loc_day = request.getParameter("loc_day");

			LocationDto locDto = new LocationDto(loc_tid, loc_mid, loc_day);

			List<LocationDto> loc_list = locationDao.selectTeamLoc(locDto);
			request.setAttribute("loc_list", loc_list);
			request.setAttribute("loc_day", loc_day);
			
			request.setAttribute("mileage", Integer.parseInt(accountDao.selectAcc(loc_tid).getAcc_mileage()));
			request.setAttribute("days", (teamDao.selectOneTeam(1)).getT_days());
			request.setAttribute("m_names", planBiz.teamMembernames(1));// list
			dispatch("addlist.jsp", request, response);
		} else if (command.equals("addplace")) {
			int loc_id = Integer.parseInt(request.getParameter("loc_id"));
			String loc_scate = request.getParameter("loc_cate");
			int loc_cate = loc_scate.equals("AD5") ? 1 : loc_scate.equals("FD6") ? 2 : 3;
			String loc_name = request.getParameter("loc_name");
			String loc_addr = request.getParameter("loc_addr");
			String loc_x = request.getParameter("loc_x");
			String loc_y = request.getParameter("loc_y");
			String loc_url = request.getParameter("loc_url");
			String loc_day = request.getParameter("loc_day");
			LocationDto locDto = new LocationDto(loc_id, loc_cate, loc_name, loc_addr, loc_x, loc_y, loc_url, loc_day);

			locDto.setLoc_tid(1);// 팀명id
			locDto.setLoc_mid("lee");// 자기자신id

			int res = locationDao.insertPlace(locDto);
			
			if (res > 0) {
				System.out.println("담기 완료!!!");
				if(loc_cate==1) {//카테고리가 1일때
				RoomsDto roomsDto=new RoomsDto(1,loc_id,loc_day);//팀id
				roomsDao.insertRoom(roomsDto);
				}
			} else {
				System.out.println("이미 담아져있다!!");
			}
			response.sendRedirect("TeamMemberController?command=addlist&loc_day=" + loc_day);
		} else if (command.equals("delplace")) {
			int loc_id = Integer.parseInt(request.getParameter("loc_id"));
			String loc_day = request.getParameter("loc_day");
			int loc_tid = 1;

			LocationDto locDto = new LocationDto(loc_id, loc_tid, loc_day);// team,day,locid
			locationDao.deletePlace(locDto);

			response.sendRedirect("TeamMemberController?command=addlist&loc_day=" + loc_day);
		}else if(command.equals("setRooms")){
			int loc_tid=1;
			String loc_day=request.getParameter("day");//1일차
			List<LocationDto> loc_rooms_list = locationDao.selectTeamRooms(loc_tid,loc_day);
			VoRoomDto voroomsDto=new VoRoomDto(loc_tid,"lee",loc_day);
			int loc_id=voroomDao.selectVoRoom(voroomsDto);
			
			request.setAttribute("days", teamDao.selectOneTeam(loc_tid).getT_days());
			request.setAttribute("loc_rooms_list", loc_rooms_list);
			request.setAttribute("vote_id", loc_id);
			dispatch("setRooms.jsp", request, response);
		} else if(command.equals("setRooms_bnt")){
			int loc_tid=1;
			String loc_day=request.getParameter("loc_day");//1일차
			
			VoRoomDto voroomsDto=new VoRoomDto(loc_tid,"lee",loc_day);
			int loc_id=voroomDao.selectVoRoom(voroomsDto);
			
			List<LocationDto> loc_rooms_list = locationDao.selectTeamRooms(loc_tid,loc_day);
			JSONObject jsonObj=new JSONObject();
			
			for(int i=0;i<loc_rooms_list.size();i++) {
				int id=loc_rooms_list.get(i).getLoc_id();
				String title=loc_rooms_list.get(i).getLoc_name();
				String url=loc_rooms_list.get(i).getLoc_url();
				String y=loc_rooms_list.get(i).getLoc_y();
				String x=loc_rooms_list.get(i).getLoc_x();
				
				HashMap<String,Object> map=new HashMap<String,Object>();
				HashMap<String,Object> map2=new HashMap<String,Object>();
				
				map.put("id", id);
				map.put("title", title);
				map.put("url", url);
				map.put("y", y);
				map.put("x", x);
				if(id==loc_id) {
					map.put("vote",id);
				}else {
					map.put("vote",0);
				}
				map2.put("room"+i, map);
				jsonObj.putAll(map2);
			}
			
			response.getWriter().write(jsonObj.toJSONString());
			
		}else if(command.equals("setRooms_vote")) {
			int loc_tid = Integer.parseInt(request.getParameter("loc_tid"));
			String loc_mid="lee";
			int loc_id = Integer.parseInt(request.getParameter("loc_id"));
			String loc_day = request.getParameter("loc_day");
			
			VoRoomDto voroomDto=new VoRoomDto(loc_tid,loc_mid,loc_id,loc_day);
			
			int res=voroomDao.insertVoRoom(voroomDto);
			if(res<1) {
			voroomDao.updateVoRoom(voroomDto);
			}
		}else if(command.equals("setRoom_vote_res")) {
			List<VoRoomDto> roomVoteList=voroomDao.resVoRoom(1);
			request.setAttribute("roomVoteList", roomVoteList);
			dispatch("roomVoteRes.jsp",request,response);
		}else if(command.equals("delRoom_vote_res")) {
			int rooms_tid = Integer.parseInt(request.getParameter("rooms_tid"));
			int rooms_id = Integer.parseInt(request.getParameter("rooms_id"));
			String rooms_day = request.getParameter("rooms_day");
			
			VoRoomDto voroomsDto=new VoRoomDto(rooms_tid,rooms_id,rooms_day);
			int res=voroomDao.deleteVoRoom(voroomsDto);
		}else if(command.equals("setRoute")){
			int loc_tid=1;//팀 아이디
			request.setAttribute("days",teamDao.selectOneTeam(loc_tid).getT_days());
			
			LocationDto locDto=new LocationDto();
			locDto.setLoc_tid(loc_tid);
			locDto.setLoc_day(request.getParameter("day"));
			
			List<LocationDto> loc_list = locationDao.selectTeamLoc(locDto);
			request.setAttribute("loc_list", loc_list);
			dispatch("setRoute.jsp", request, response);
		} else if(command.equals("setRoute_bnt")){
			int loc_tid=1;
			
			LocationDto locDto=new LocationDto();
			locDto.setLoc_tid(loc_tid);
			locDto.setLoc_day(request.getParameter("loc_day"));
			
			List<LocationDto> loc_list = locationDao.selectTeamLoc((locDto));
			
			JSONObject jsonObj=new JSONObject();
			
			for(int i=0;i<loc_list.size();i++) {
				int id=loc_list.get(i).getLoc_id();
				String title=loc_list.get(i).getLoc_name();
				String url=loc_list.get(i).getLoc_url();
				String y=loc_list.get(i).getLoc_y();
				String x=loc_list.get(i).getLoc_x();
				int cate=loc_list.get(i).getLoc_cate();
				
				HashMap<String,Object> map=new HashMap<String,Object>();
				HashMap<String,Object> map2=new HashMap<String,Object>();
				
				map.put("id", id);
				map.put("title", title);
				map.put("url", url);
				map.put("y", y);
				map.put("x", x);
				map.put("cate",cate);
				
				map2.put("room"+i, map);
				jsonObj.putAll(map2);
			}
			
			response.getWriter().write(jsonObj.toJSONString());
		} else if(command.equals("payment")){
			request.setAttribute("accountDto", accountDao.selectAcc(1));
			request.setAttribute("person", planBiz.teamMembernames(1));
			if(teamDao.selectOneTeam(1).getT_leaderId().equals("lee")) {
				dispatch("payment_leader.jsp", request, response);
			}else {
				dispatch("payment.jsp", request, response);
			}
		}else if(command.equals("updateacc")){
			int acc_tid=1;
			String acc_bank=request.getParameter("acc_bank");
			String acc_num=request.getParameter("acc_num");
			String acc_holder=request.getParameter("acc_holder");
			String acc_price=request.getParameter("acc_price");
			AccountDto accDto=new AccountDto(acc_tid,acc_holder,acc_bank,acc_num,acc_price);
			accountDao.updateAcc(accDto);
			request.setAttribute("accountDto", accountDao.selectAcc(acc_tid));
			request.setAttribute("person", planBiz.tamMemberCount(acc_tid));
			dispatch("payment.jsp", request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
