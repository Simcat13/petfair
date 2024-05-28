package com.kh.cats.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.cats.dao.TestDao;
import com.kh.cats.dto.TestDto;

import io.swagger.v3.oas.annotations.tags.Tag;
@Tag(name = "테스트", description = "테스트 구현")
@CrossOrigin
@RestController
@RequestMapping("/")
public class CatsTest {
	
	@Autowired
	private TestDao testDao;

	@PostMapping("/test") // 등록
	public void insert(@RequestBody TestDto testDto) {
		testDao.insert(testDto);
	}

}
