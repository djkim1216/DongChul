package com.trip.member.dao;

import org.apache.ibatis.session.SqlSession;

import com.trip.common.sql.SqlMapConfig;
import com.trip.member.dto.MemberLoginDto;

public class MemberLoginDaoImpl extends SqlMapConfig implements MemberLoginDao{

	private String namespace = "memberMapper.";
	
	public MemberLoginDto getList(MemberLoginDto dto) {
		SqlSession sql = getSqlSessionFactory().openSession();
		MemberLoginDto result = sql.selectOne(namespace+"memberList", dto);
		sql.close();
		return result;
	}
}
