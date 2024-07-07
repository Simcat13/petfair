package com.kh.cats.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cats.dao.CompanyDao;
import com.kh.cats.dto.CompanyDto;
import com.kh.cats.dto.MemberDto;

import jakarta.servlet.http.HttpSession;

@Controller
@CrossOrigin
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	
	// 회원가입
	@GetMapping("/join")
	public String join() {
		return "company/join";
	}

	@PostMapping("/join")
	public String join(@ModelAttribute CompanyDto companyDto) {
		companyDao.insert(companyDto);

		return "redirect:joinSuccess";
	}
	//회원가입 성공
	@GetMapping("/joinSuccess")
	public String joinSuccess() {
		return "company/joinSuccess";
	}
	
	//로그인 (로그인 시간 업데이트)
	@GetMapping("/login")
	public String login() {
		return "company/login";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute CompanyDto inputDto, HttpSession session) {
		CompanyDto findDto = companyDao.selectOne(inputDto.getCompanyId());
		boolean isValid = findDto != null && inputDto.getCompanyPw().equals(findDto.getCompanyPw());
		
		if(isValid) {
			session.setAttribute("loginId", findDto.getCompanyId());
			session.setAttribute("loginLevel", findDto.getCompanyLevel());
			
			companyDao.updateLogin(findDto.getCompanyId());
			
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginLevel");
		
		return "redirect:/";
	}
}
