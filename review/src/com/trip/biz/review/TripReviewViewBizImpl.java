package com.trip.biz.review;

import java.util.List;

import com.trip.dao.review.TripReviewViewDao;
import com.trip.dao.review.TripReviewViewDaoImpl;
import com.trip.dto.review.TripReviewViewDto;

public class TripReviewViewBizImpl implements TripReviewViewBiz{

	TripReviewViewDao tripReviewViewDao = new TripReviewViewDaoImpl();
	
	@Override
	public List<TripReviewViewDto> selectList(int start, int end) {
		// TODO Auto-generated method stub
		return tripReviewViewDao.selectList(start, end);
	}

}
