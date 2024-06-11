package com.kh.cats.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MemberDto {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberBirth;
	private String memberEmail;
	private String memberZipcode;
	private String memberAdd1;
	private String memberAdd2;
	private String memberContact1;
	private String memberContact2;
	private String memberLevel;
	private String memberBlock;
	private String memberInterest;
	private String memberAgree;
	private String memberEvent;
	private String memberJoin;
	private String memberLogin;
	private String memberJob;
}
