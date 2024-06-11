package com.kh.cats.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cats.dto.CompanyDto;
import com.kh.cats.dto.MemberDto;

@Repository
public class CompanyDao {

	@Autowired
	private SqlSession sqlSession;
	
	//가입
	public void insert(CompanyDto companyDto) {
		sqlSession.insert("company.insert", companyDto);
	}
	
	//ID 셀렉원
	public CompanyDto selectOne(String companyId) {
		return sqlSession.selectOne("company.find", companyId);
	}
	
	//로그인시간 업데이트
	public boolean updateLogin(String companyId) {
		return sqlSession.update("company.updateLogin", companyId) > 0;
	}
}
