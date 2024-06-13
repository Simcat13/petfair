package com.kh.cats.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.cats.dao.MemberDao;
import com.kh.cats.dto.MemberDto;

@CrossOrigin
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {

	@Autowired
	private MemberDao memberDao;

	//사용가능 아이디
	@RequestMapping("/checkId")
	public String checkId(@RequestParam String memberId) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		if(memberDto == null) {
			return "NNNNY";//사용 가능한 경우(DB에 없는 경우)
		}
		else {
			return "NNNNN";//사용 불가능한 경우(DB에 있는 경우)
		}
	}
	
	//한국이름 규정 체크
	@PostMapping("/checkMemberName")
	public boolean checkMemberName(@RequestParam String memberName) {
		MemberDto memberDto = memberDao.selectOneMemberName(memberName);
		return memberDto == null;
	}
}
