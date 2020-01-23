package com.trip.dao.schedule;

import static com.trip.db.schedule.JDBCTemplete.close;
import static com.trip.db.schedule.JDBCTemplete.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.trip.dto.schedule.LocationDto;
import com.trip.dto.schedule.TeamDto;

public class TeamDao {
	public TeamDto selectOneTeam(int t_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs=null;
		TeamDto tdto=null;
		
		String sql=" SELECT * FROM TEAM WHERE T_ID=? ";
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1,t_id);
			rs=pstm.executeQuery();
			while(rs.next()) {
			tdto=new TeamDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs,pstm, con);
		}
		return tdto;
	}
	
	public int updateTeamName(String schedule_name, int t_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		String sql=" UPDATE TEAM SET T_NAME=? WHERE T_ID=? ";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, schedule_name);
			pstm.setInt(2, t_id);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm, con);
		}
		return res;
	}
	public int createTeam(String leaderId, String days) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		String sql = " INSERT INTO TEAM(T_ID,T_LEADERID,T_DAYS,T_STAGE, T_FLAG) VALUES(TEAMSEQ.NEXTVAL,?,?,'0단계','N') ";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, leaderId);
			pstm.setString(2, days);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm, con);
		}
		return res;
	}
}
