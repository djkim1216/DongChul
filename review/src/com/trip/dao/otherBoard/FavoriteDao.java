package com.trip.dao.otherBoard;

import java.util.List;

import com.trip.dto.otherBoard.FavoriteDto;

public interface FavoriteDao {

	
	List<FavoriteDto> favoriteList(String f_id);
	int favoriteCheck(String f_id, int f_pno);
	int favoriteInsert(FavoriteDto fDto);
	int favoriteDelete(String f_id, int f_pno);
	
}
