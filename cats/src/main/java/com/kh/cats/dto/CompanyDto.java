package com.kh.cats.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CompanyDto {
	private String companyId;
	private String companyPw;
	private String companyName;
	private String companyEmail;
	private String companyZipcode;
	private String companyAdd1;
	private String companyAdd2;
	private String companyContact1;
	private String companyContact2;
	private String companyLevel;
	private String companyBn;
	private String companyAgree;
	private String companyFax;
	private String companyJoin;
	private String companyLogin;
}
