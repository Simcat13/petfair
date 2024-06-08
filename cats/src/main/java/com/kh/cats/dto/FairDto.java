package com.kh.cats.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class FairDto {
	private int fairNo;
	private String fairName;
	private String fairSdate;
	private String fairEdate;
	private int fairEntryNum;
	private int fairVisitorNum;
	private String fairInfo;
	private String fairEntryStime;
	private String fairEntryEtie;
	private String fairVisitorStime;
	private String fairVisitorEtime;
}
