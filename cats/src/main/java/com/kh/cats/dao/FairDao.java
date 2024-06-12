package com.kh.cats.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cats.dto.FairDto;
import com.kh.cats.vo.PageVO;

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
	
	//박람회 목록 조회
	public List<FairDto> selectList(PageVO pageVO){
		return sqlSession.selectList("fair.list", pageVO);
	}
	
	//페이지네이션을 위한 카운트(등록된 박람회 총 개수)
	public Integer count(PageVO pageVO) {
		return sqlSession.selectOne("fair.count", pageVO);
	}
	
	//스케줄서비스- 박람회 종료날짜가 지난경우 자동갱신
	public boolean editStatus() {
		return sqlSession.update("fair.editStatus") > 0;
	}
	
	//박람회 상세
	public FairDto selectOne(int fairNo) {
		return sqlSession.selectOne("fair.find", fairNo);
	}
	
	
}
