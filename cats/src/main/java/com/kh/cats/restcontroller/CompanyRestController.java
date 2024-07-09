package com.kh.cats.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.cats.dao.CompanyDao;
import com.kh.cats.dto.CompanyDto;

@CrossOrigin
@RestController
@RequestMapping("/rest/company")
public class CompanyRestController {

	@Autowired
	private CompanyDao companyDao;

	// 사용가능 아이디
	@RequestMapping("/checkId")
	public String checkId(@RequestParam String companyId) {
		CompanyDto companyDto = companyDao.selectOne(companyId);
		if (companyDto == null) {
			return "NNNNY";// 사용 가능한 경우(DB에 없는 경우)
		} else {
			return "NNNNN";// 사용 불가능한 경우(DB에 있는 경우)
		}
	}

	// 사업자 번호 체크
	@RequestMapping("/checkCompanyBn")
	public String checkCompanyBn(@RequestParam String companyBn) {
		CompanyDto companyDto = companyDao.selectOneCompanyBn(companyBn);
		if (companyDto == null) {
			return "NNNNY";// 사용 가능한 경우(DB에 없는 경우)
		} else {
			return "NNNNN";// 사용 불가능한 경우(DB에 있는 경우)
		}
	}
}
