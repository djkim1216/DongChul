package com.trip.biz.review;

import java.util.List;

import com.trip.dto.review.TripReviewViewDto;

public interface TripReviewViewBiz {
	List<TripReviewViewDto> selectList(int start, int end);
}
