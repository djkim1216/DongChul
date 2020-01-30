package com.trip.biz;

import java.util.ArrayList;
import java.util.List;

import com.trip.dao.schedule.MemberDao;
import com.trip.dao.schedule.TeamDao;
import com.trip.dao.schedule.TeamMemberDao;
import com.trip.dto.schedule.TeamMemberDto;



public class PlanBiz {
	TeamMemberDao TMdao=new TeamMemberDao();
	TeamDao Tdao=new TeamDao();
	MemberDao Mdao=new MemberDao();
	
	public List<String> teamMembernames(int tm_tid) {//팀id-->멤버id-->사용자 이름
		List<TeamMemberDto> list=TMdao.teamMemberList(tm_tid);
		List<String> m_names=new ArrayList<String>();
		for(int i=0; list.size()>i;i++) {
			m_names.add(Mdao.selectOneMember(list.get(i).getTm_uid()).getM_name());
		}
	return m_names;
	}
	
	public int tamMemberCount(int tm_tid) {
		List<TeamMemberDto> list=TMdao.teamMemberList(tm_tid);
	return list.size();
	}
}
