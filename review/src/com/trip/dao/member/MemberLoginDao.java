package com.trip.dao.member;

import com.trip.dto.member.MemberLoginDto;

public interface MemberLoginDao {

	MemberLoginDto getList(MemberLoginDto dto);

	int joinMember(MemberLoginDto dto);
	
}
