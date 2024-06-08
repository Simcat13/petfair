package com.kh.cats.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cats.dto.MemberDto;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	//가입
	public void inser(MemberDto memberDto) {
		sqlSession.insert("member.insert", memberDto);
	}
}
