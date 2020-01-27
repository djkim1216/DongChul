package com.trip.dao.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.trip.db.SqlMapConfig;
import com.trip.dto.member.MemberLoginDto;

public class MemberLoginDaoImpl extends SqlMapConfig implements MemberLoginDao{

	SqlSession sql = getSqlSessionFactory().openSession();
	private String namespace = "memberMapper.";
	
	@Override
	public MemberLoginDto getList(MemberLoginDto dto) {
		MemberLoginDto result = sql.selectOne(namespace+"memberList", dto);
		return result;
	}

	@Override
	public int joinMember(MemberLoginDto dto) {
		int result = sql.insert(namespace+"memberInsert", dto);
		//insert, update, delete는 commit 해주기
		sql.commit();
		return result;
	}

	@Override
	public Map<String, Object> dupCheck(Map<String, Object> paramMap) {
		Map<String, Object> result = sql.selectOne(namespace+"dupCheck", paramMap);
		return result;
	}
}
