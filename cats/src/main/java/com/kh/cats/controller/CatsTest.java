package com.kh.cats.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.cats.dao.TestDao;
import com.kh.cats.dto.TestDto;

import io.swagger.v3.oas.annotations.tags.Tag;
@Tag(name = "테스트", description = "테스트 구현")
@CrossOrigin
@Controller
public class CatsTest {
	
	@Autowired
	private TestDao testDao;

	@PostMapping("/test1") // 등록
	public void insert(@RequestBody TestDto testDto) {
		testDao.insert(testDto);
	}
	
	@GetMapping("/test")
	public String home(){
		return "member/test";
	}
}
