package com.trip.dao.member;

import org.apache.ibatis.session.SqlSession;

import com.trip.db.SqlMapConfig;
import com.trip.dto.member.MemberLoginDto;

public class MemberLoginDaoImpl extends SqlMapConfig implements MemberLoginDao{

	SqlSession sql = getSqlSessionFactory().openSession();
	private String namespace = "memberMapper.";
	
	@Override
	public MemberLoginDto getList(MemberLoginDto dto) {
		MemberLoginDto result = sql.selectOne(namespace+"memberList", dto);
		sql.close();
		return result;
	}

	@Override
	public int joinMember(MemberLoginDto dto) {
		int result = sql.insert(namespace+"memberInsert", dto);
		sql.close();
		return result;
	}
}
