package com.kh.cats.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	//박람회 등록
	@GetMapping("/fair/insert")
	public String fairInsert() {
		return "admin/fair/insert";
	}
}
