package com.kh.cats.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cats.dto.FairDto;

@Repository
public class FairDao {

	@Autowired
	private SqlSession sqlSession;
	
	//박람회 등록
	public void insert(FairDto fairDto) {
		sqlSession.insert("fair.insert", fairDto);
	}
	
	//방금 등록한 박람회번호
	public int sequence() {
	    return sqlSession.selectOne("fair.sequence");
	}
}
