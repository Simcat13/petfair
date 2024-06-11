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
				<i class="fa-solid fa-pause"></i>박람회 등록
			</div>
		</div>
		<div class="content content-body">
			<div class="cell">
				<form action="insert" method="post" autocomplete="off">
					<div class="cell">
						<label for="fair_name">박람회 이름</label> <input type="text"
							class="form-control" id="fair_name" name="fairName">
					</div>
					<div class="cell">
						<label for="fair_sdate">박람회 시작 날짜</label> <input type="text"
							class="form-control datepicker" id="datetimepickerOnlyDate" name="fairSdate">
					</div>
					<div class="cell">
						<label for="fair_edate">박람회 종료 날짜</label> <input type="text"
							class="form-control datepicker" id="datetimepickerOnlyDate" name="fairEdate">
					</div>
					<div class="cell">
						<label for="fair_entry_num">최대 참가 회사 수</label> <input
							type="number" class="form-control" id="fair_entry_num"
							name="fairEntryNum">
					</div>
					<div class="cell">
						<label for="fair_visitor_num">최대 참관 인원 수</label> <input
							type="number" class="form-control" id="fair_visitor_num"
							name="fairVisitorNum">
					</div>
					<div class="cell">
						<label for="fair_info">박람회 설명</label>
						<textarea class="form-control" id="fair_info" name="fairInfo"
							rows="4"></textarea>
					</div>
					<div class="cell">
						<label for="fair_entry_stime">참가 신청 시작 시간</label> <input
							type="datetime-local" class="form-control" id="datetimepicker"
							name="fairEntryStime">
					</div>
					<div class="cell">
						<label for="fair_entry_etime">참가 신청 종료 시간</label> <input
							type="datetime-local" class="form-control" id="datetimepicker"
							name="fairEntryEtie">
					</div>
					<div class="cell">
						<label for="fair_visitor_stime">참관 신청 시작 시간</label> <input
							type="datetime-local" class="form-control"
							id="datetimepicker" name="fairVisitorStime">
					</div>
					<div class="cell">
						<label for="fair_visitor_etime">참관 신청 종료 시간</label> <input
							type="datetime-local" class="form-control"
							id="datetimepicker" name="fairVisitorEtime">
					</div>
					<button type="submit" class="btn btn-primary">등록</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Flatpickr CSS (위에다 하면 적용이 안돼서 밑에다가 했음-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- 한국어 설정 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>


<script type="text/javascript">
	flatpickr('#datetimepicker', {
		enableTime : true,
		dateFormat : "Y-m-d H:i",
		// 한국어 설정
		locale : "ko",
		minuteIncrement : 30,
		time_24hr : true,
	});
	flatpickr('#datetimepickerOnlyDate', {
		enableTime : false,
		dateFormat : "Y-m-d",
		// 한국어 설정
		locale : "ko",
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
