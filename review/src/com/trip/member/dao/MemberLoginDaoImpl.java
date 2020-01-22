package com.trip.member.dao;

import org.apache.ibatis.session.SqlSession;

import com.trip.db.SqlMapConfig;
import com.trip.member.dto.MemberLoginDto;

public class MemberLoginDaoImpl extends SqlMapConfig implements MemberLoginDao{

	private String namespace = "memberMapper.";
	
	public MemberLoginDto getList(MemberLoginDto dto) {
		SqlSession sql = getSqlSessionFactory().openSession();
		System.out.println(dto);
		MemberLoginDto result = sql.selectOne(namespace+"memberList", dto);
		//System.out.println("dao : " + dto.getM_pass());
		sql.close();
		return result;
	}
}
