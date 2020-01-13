package com.trip.dao.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.trip.db.SqlMapConfig;
import com.trip.dto.review.TripReviewContentsDto;

public class TripReviewContentsDaoImpl extends SqlMapConfig implements TripReviewContentsDao{

	private String namespace = "com.trip.db.mybatis-mapper.";
	private int num;
	
	@Override
	public List<TripReviewContentsDto> selectList(int tvc_tvno, int tvc_day) {
		SqlSession session = getSqlSessionFactory().openSession();
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("tvc_tvno", tvc_tvno);
		params.put("tvc_day", tvc_day);
		List<TripReviewContentsDto> selectList = session.selectList(namespace+"tripReviewContents_List",params);
		session.close();
		return selectList;
	}

	@Override
	public TripReviewContentsDto select(int tvc_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(TripReviewContentsDto tripReviewContentsDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify(TripReviewContentsDto tripReviewContentsDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int tvc_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
