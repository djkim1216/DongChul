package com.trip.dao.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.trip.db.SqlMapConfig;
import com.trip.dto.review.TripReviewViewDto;

public class TripReviewViewDaoImpl extends SqlMapConfig implements TripReviewViewDao{

	private String namespace = "com.trip.db.mybatis-mapper.";
	private int num;
	
	@Override
	public List<TripReviewViewDto> selectList(String start, String end, String keyword) {
		SqlSession session = getSqlSessionFactory().openSession();
		Map<String, String> params = new HashMap<String, String>();
		params.put("start", start);
		params.put("end", end);
		params.put("keyword", keyword);
		List<TripReviewViewDto> selectList = session.selectList(namespace+"tripReviewView_List",params);
		session.close();
		return selectList;
	}
	
}
