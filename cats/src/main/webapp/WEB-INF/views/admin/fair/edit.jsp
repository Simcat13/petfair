<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.text-box {
	border: 1px solid #d8d8d8;
	background-color: #f8f8f8;
	padding: 10px;
}

h6 {
	font-size: 14px;
	margin: 10px 0 10px 0;
}
</style>


<br>
<div class="container container-body">
<!-- 사이드바는 용도에 맞게 넣으면됩니다	 -->
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>박람회 수정
			</div>
		</div>
		<div class="content content-body">
			<div class="cell">
				<form action="edit" method="post" autocomplete="off">
				<input type="hidden" value="${fairDto.fairNo}" name="fairNo">
					<div class="cell">
						<label for="fair_status">박람회 상태</label>
						<select name="fairStatus" id="fair_status"  class="form-control" >
							<option value="진행 중" ${fairDto.fairStatus == '진행 중' ? 'selected' : ' '}>진행 중</option>
							<option value="종료" ${fairDto.fairStatus == '종료' ? 'selected' : ' '}>종료</option>
							<option value="취소" ${fairDto.fairStatus == '취소' ? 'selected' : ' '}>취소</option>							
						</select>
					</div>				
					<div class="cell">
						<label for="fair_name">박람회 이름</label>
						<input type="text" value="${fairDto.fairName}" class="form-control" id="fair_name" name="fairName">
					</div>
					<div class="cell flex-cell">
						<div class="cell w-50">
							<label for="fair_sdate">박람회 시작 날짜</label>
							<input type="text" value="${fairDto.fairSdate}" class="form-control" id="fair_sdate" name="fairSdate">
						</div>
						<div class="cell w-50">
							<label for="fair_edate">박람회 종료 날짜</label>
							<input type="text" value="${fairDto.fairEdate}" class="form-control" id="fair_edate" name="fairEdate">
						</div>
					</div>
					<div class="cell">
						<label for="fair_entry_num">최대 참가 회사 수</label>
						<input type="number" value="${fairDto.fairEntryNum}" class="form-control" id="fair_entry_num" name="fairEntryNum">
					</div>
					<div class="cell">
						<label for="fair_visitor_num">최대 참관 인원 수</label>
						<input type="number" value="${fairDto.fairVisitorNum}"  class="form-control" id="fair_visitor_num" name="fairVisitorNum">
					</div>
					<div class="cell">
						<label for="fair_info">박람회 설명</label>
						<textarea class="form-control" id="fair_info" name="fairInfo" rows="4">${fairDto.fairInfo}</textarea>
					</div>
					<div class="cell flex-cell">
						<div class="cell w-50">
							<label for="fair_entry_stime">참가 신청 시작 시간</label>
							<input type="text" value="${fairDto.fairEntryStime}" class="form-control" id="fair_entry_stime" name="fairEntryStime">
						</div>
						<div class="cell w-50">
							<label for="fair_entry_etime">참가 신청 종료 시간</label>
							<input type="text" value="${fairDto.fairEntryEtime}" class="form-control" id="fair_entry_etime" name="fairEntryEtime">
						</div>
					</div>
					<div class="cell flex-cell">
						<div class="cell w-50">
							<label for="fair_visitor_stime">참관 신청 시작 시간</label>
							<input type="text" value="${fairDto.fairVisitorStime}" class="form-control" id="fair_visitor_stime" name="fairVisitorStime">
						</div>
						<div class="cell w-50">
							<label for="fair_visitor_etime">참관 신청 종료 시간</label>
							<input type="text" value="${fairDto.fairVisitorEtime}" class="form-control" id="fair_visitor_etime" name="fairVisitorEtime">
						</div>
					</div>
					<div class="cell right">
						<a href="list" class="btn btn-secondary">목록으로</a>
						<button type="submit" class="btn btn-primary">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>