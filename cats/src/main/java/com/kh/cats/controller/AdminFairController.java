package com.kh.cats.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cats.dao.FairDao;
import com.kh.cats.dto.FairDto;
import com.kh.cats.vo.PageVO;


@Controller
@RequestMapping("/admin/fair")
public class AdminFairController {
	
	@Autowired
	private FairDao fairDao;

	//박람회 등록
	@GetMapping("/insert")
	public String insert() {
		return "admin/fair/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute FairDto fairDto) {
		fairDao.insert(fairDto);
		
//		int fairNo = fairDao.sequence();
		
//		return "redirect:detail?fairNo=" + fairNo;
		return "admin/fair/insert";
	}
	
	//박람회 상세
//	@GetMapping("/detail")
//	public String detail(@RequestParam int fairNo, Model model, 
//								@ModelAttribute FairDto fairDto) {
//		
//		
//	}
	
	//박람회 목록
	@GetMapping("/list")
	public String list(@ModelAttribute PageVO pageVO,
			@RequestParam(required = false) String status, Model model) {
		
	}
}
