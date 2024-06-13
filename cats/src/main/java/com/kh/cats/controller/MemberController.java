package com.kh.cats.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cats.dao.MemberDao;
import com.kh.cats.dto.MemberDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	//회원가입 선택
	@GetMapping("/choiceJoin")
	public String choiceJoin() {
		return "member/choiceJoin";
	}
	
	//회원가입
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.insert(memberDto);
		
		return "redirect:joinSuccess";
	}
	@RequestMapping("/joinSuccess")
	public String joinSuccess() {
		return "member/joinSuccess";
	}
	
	
	//로그인
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto inputDto, HttpSession session) {
		MemberDto findDto = memberDao.selectOne(inputDto.getMemberId());
		boolean isValid = findDto != null && inputDto.getMemberPw().equals(findDto.getMemberPw());
		
		if(isValid) {
			session.setAttribute("loginId", findDto.getMemberId());
			session.setAttribute("loginLevel", findDto.getMemberLevel());
			
			memberDao.updateLogin(findDto.getMemberId());
			
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginLevel");
		
		return "redirect:/";
	}
}
