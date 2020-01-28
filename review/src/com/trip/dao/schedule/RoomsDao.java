package com.trip.dao.schedule;

import static com.trip.db.schedule.JDBCTemplete.close;
import static com.trip.db.schedule.JDBCTemplete.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.trip.dto.schedule.RoomsDto;


public class RoomsDao {
	public int insertRoom(RoomsDto roomsDto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		String sql = " INSERT INTO ROOMS VALUES(?,?,?,?) ";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, roomsDto.getRooms_tid());
			pstm.setInt(2, roomsDto.getRooms_id());
			pstm.setString(3, roomsDto.getRooms_day());
			pstm.setInt(4, 0);		
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm, con);
		}
		return res;
	}
	public int delRoom(RoomsDto roomsDto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		String sql = " DELETE FROM ROOMS WHERE ROOMS_TID=? AND ROOMS_ID=? AND ROOMS_DAY=? ";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, roomsDto.getRooms_tid());
			pstm.setInt(2, roomsDto.getRooms_id());
			pstm.setString(3, roomsDto.getRooms_day());	
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm, con);
		}
		return res;
	}

	public int voteRoom(RoomsDto roomsDto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		String sql = " UPDATE ROOMS SET ROOMS_CNT=ROOMS_CNT+1 WHERE ROOMS_TID=? AND ROOMS_ID=? AND ROOMS_DAY=? ";
		
		try {
			pstm=con.prepareStatement(sql);
			
			pstm.setInt(1, roomsDto.getRooms_tid());
			pstm.setInt(2, roomsDto.getRooms_id());
			pstm.setString(3, roomsDto.getRooms_day());		
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm, con);
		}
		return res;
	}
	public List<RoomsDto> resVoteRoom(int rooms_tid) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs=null;
		List<RoomsDto> roomVoteList=new ArrayList<RoomsDto>();
		
		String sql = " SELECT * " + 
				" FROM (SELECT ROOMS_ID, ROOMS_DAY, ROOMS_CNT, ROOMS_TID, RANK() OVER(PARTITION BY ROOMS_TID, ROOMS_DAY ORDER BY ROOMS_CNT DESC) AS RANK FROM ROOMS) " + 
				" WHERE RANK=1 AND ROOMS_TID=? ";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, rooms_tid);	
			
			rs=pstm.executeQuery();
			while(rs.next()) {
				RoomsDto dto=new RoomsDto();
				dto.setRooms_id(rs.getInt(1));
				dto.setRooms_day(rs.getString(2));
				dto.setRooms_cnt(rs.getInt(3));
				dto.setRooms_tid(rs.getInt(4));
				
				roomVoteList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstm, con);
		}
		return roomVoteList;
	}
	
	

}
