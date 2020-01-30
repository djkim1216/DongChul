package com.trip.dao.search;

import java.util.List;

import com.trip.dto.search.SearchDto;

public interface SearchDao {
	public List<SearchDto> searchList(String search);
	public int insertSearch(String myid, String search);
	
}
