package com.trip.dao.schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static com.trip.db.schedule.JDBCTemplete.*;
import com.trip.dto.schedule.TeamMemberDto;

public class TeamMemberDao {
	public List<TeamMemberDto> teamMemberList(int tm_tid){
		List<TeamMemberDto> list = new ArrayList<TeamMemberDto>();
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM TEAMMEMBER WHERE TM_TID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, tm_tid);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				TeamMemberDto dto = new TeamMemberDto();
				
				dto.setTm_tid(rs.getInt(1));
				dto.setTm_uid(rs.getString(2));
				dto.setTm_depflag(rs.getString(3));
				dto.setTm_stage(rs.getInt(4));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstm, con);
		}
		return list;
	}
	
	public String idChk(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = " SELECT M_ID FROM MYMEMBER WHERE M_ID = ? ";
		String res = null;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			
			rs = pstm.executeQuery();
			rs.next();
			res = rs.getString(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstm, con);
		}
	
		return res;
	}
	
	
	public int insertMember(String userId) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		String sql = " INSERT INTO TEAMMEMBER VALUES('1',?,'N',1) ";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, userId);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm, con);
		}
		return res;
	}
	
}
