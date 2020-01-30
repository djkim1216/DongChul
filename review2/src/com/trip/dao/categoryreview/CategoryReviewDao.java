package com.trip.dao.categoryreview;

import java.util.List;

import com.trip.dto.categoryreview.CategoryReviewDto;

public interface CategoryReviewDao {
	
	List<CategoryReviewDto> selectList(String start, String end, String keyword, String category);
	CategoryReviewDto selectOne(int cr_no);
	int maxListNum();
	int insert(CategoryReviewDto dto);
	int delete(int cr_no);
	int update(CategoryReviewDto dto);
	int count(int cr_no);
}
