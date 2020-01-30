package trip.biz;

import java.util.ArrayList;
import java.util.List;

import trip.dao.MemberDao;
import trip.dao.TeamDao;
import trip.dao.TeamMemberDao;
import trip.dto.LocationDto;
import trip.dto.TeamMemberDto;

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
