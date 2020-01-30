package com.trip.dao.review;

import java.util.List;

import com.trip.dto.review.TripReviewDto;

public interface TripReviewDao {

	List<TripReviewDto> selectAll();
	TripReviewDto select(int tv_no);
	int insert(TripReviewDto tripReviewDto);
	int modify(TripReviewDto tripReviewDto);
	int countUpdate(TripReviewDto tripReviewDto);
	int delete(int tv_no);
	
}
