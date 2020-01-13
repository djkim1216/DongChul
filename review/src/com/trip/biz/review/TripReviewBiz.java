package com.trip.biz.review;

import java.util.List;

import com.trip.dto.review.TripReviewDto;

public interface TripReviewBiz {

	List<TripReviewDto> selectAll();
	TripReviewDto select(int tv_no);
	int insert(TripReviewDto tripReviewDto);
	int modify(TripReviewDto tripReviewDto);
	int countUpdate(int tv_no);
	int delete(int tv_no);
	
}
