package com.kh.cats.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cats.dto.TestDto;


@Repository
public class TestDao {

	@Autowired
	private SqlSession sqlSession;

	// 등록
	public void insert(TestDto testDto) {
		sqlSession.insert("test.insert", testDto);
	}
}
