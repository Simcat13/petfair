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
						<label for="fair_name">박람회 이름</label>
						<input type="text" class="form-control" id="fair_name" name="fairName">
					</div>
					<div class="cell flex-cell">
						<div class="cell w-50">
							<label for="fair_sdate">박람회 시작 날짜</label>
							<input type="text" class="form-control" id="fair_sdate" name="fairSdate">
						</div>
						<div class="cell w-50">
							<label for="fair_edate">박람회 종료 날짜</label>
							<input type="text" class="form-control" id="fair_edate" name="fairEdate">
						</div>
					</div>
					<div class="cell">
						<label for="fair_entry_num">최대 참가 회사 수</label>
						<input type="number" class="form-control" id="fair_entry_num" name="fairEntryNum">
					</div>
					<div class="cell">
						<label for="fair_visitor_num">최대 참관 인원 수</label>
						<input type="number" class="form-control" id="fair_visitor_num" name="fairVisitorNum">
					</div>
					<div class="cell">
						<label for="fair_info">박람회 설명</label>
						<textarea class="form-control" id="fair_info" name="fairInfo" rows="4"></textarea>
					</div>
					<div class="cell flex-cell">
						<div class="cell w-50">
							<label for="fair_entry_stime">참가 신청 시작 시간</label>
							<input type="text" class="form-control" id="fair_entry_stime" name="fairEntryStime">
						</div>
						<div class="cell w-50">
							<label for="fair_entry_etime">참가 신청 종료 시간</label>
							<input type="text" class="form-control" id="fair_entry_etime" name="fairEntryEtime">
						</div>
					</div>
					<div class="cell flex-cell">
						<div class="cell w-50">
							<label for="fair_visitor_stime">참관 신청 시작 시간</label>
							<input type="text" class="form-control" id="fair_visitor_stime" name="fairVisitorStime">
						</div>
						<div class="cell w-50">
							<label for="fair_visitor_etime">참관 신청 종료 시간</label>
							<input type="text" class="form-control" id="fair_visitor_etime" name="fairVisitorEtime">
						</div>
					</div>
					<button type="submit" class="btn btn-primary">등록</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/themes/material_blue.css">

<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/rangePlugin.js"></script>
<!-- 한국어 설정 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>

<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		function calculateEntryTimes(startDate) {
			let start = new Date(startDate);
			let entryStart = new Date(start);
			let entryEnd = new Date(start);
			let visitorEnd = new Date(start);

			entryStart.setMonth(entryStart.getMonth() - 2);
			entryStart.setHours(9, 0, 0);

			entryEnd.setMonth(entryEnd.getMonth() - 1);
			entryEnd.setHours(17, 0, 0);

			visitorEnd.setDate(visitorEnd.getDate() - 1);
			visitorEnd.setHours(17, 0, 0);

			return {
				entryStart: entryStart,
				entryEnd: entryEnd,
				visitorEnd: visitorEnd
			};
		}

		const fairSdatePicker = flatpickr('#fair_sdate', {
			enableTime: false,
			dateFormat: "Y-m-d",
			locale: "ko",
			plugins: [new rangePlugin({ input: "#fair_edate" })],
			onChange: function(selectedDates) {
				if (selectedDates.length > 0) {
					let dates = calculateEntryTimes(selectedDates[0]);
					entryStimePicker.setDate(dates.entryStart);
					entryEtimePicker.setDate(dates.entryEnd);
					visitorStimePicker.setDate(dates.entryStart);
					visitorEtimePicker.setDate(dates.visitorEnd);
				}
			}
		});

		const entryStimePicker = flatpickr('#fair_entry_stime', {
			enableTime: true,
			dateFormat: "Y-m-d H:i",
			locale: "ko",
			minuteIncrement: 30,
			time_24hr: true,
			onChange: function(selectedDates) {
				if (selectedDates.length > 0) {
					entryEtimePicker.set('minDate', selectedDates[0]);
				}
			}
		});

		const entryEtimePicker = flatpickr('#fair_entry_etime', {
			enableTime: true,
			dateFormat: "Y-m-d H:i",
			locale: "ko",
			minuteIncrement: 30,
			time_24hr: true
		});

		const visitorStimePicker = flatpickr('#fair_visitor_stime', {
			enableTime: true,
			dateFormat: "Y-m-d H:i",
			locale: "ko",
			minuteIncrement: 30,
			time_24hr: true,
		});

		const visitorEtimePicker = flatpickr('#fair_visitor_etime', {
			enableTime: true,
			dateFormat: "Y-m-d H:i",
			locale: "ko",
			minuteIncrement: 30,
			time_24hr: true
		});
	});
</script>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
