package com.trip.dao.review;

import java.util.List;

import com.trip.dto.review.TripReviewViewDto;

public interface TripReviewViewDao {
	List<TripReviewViewDto> selectList(int start, int end);
	
}
