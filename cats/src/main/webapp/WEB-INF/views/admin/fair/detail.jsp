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
				<i class="fa-solid fa-pause"></i>
					${fairDto.fairName}
			</div>
		</div>
		<div class="content content-body">
			<div class="cell">
				<table class="table table-horizontal">
					<tr>
						<th>상태</th>
						<td>${fairDto.fairStatus}</td>
					</tr>
					<tr>
						<th>박람회 기간</th>
						<td>${fairDto.fairSdate} ~ ${fairDto.fairEdate}</td>
					</tr>
					<tr>
						<th>참가 정원(회사)</th>
						<td>${fairDto.fairEntryNum}</td>
					</tr>
					<tr>
						<th>참관 정원(관람객)</th>
						<td>${fairDto.fairVisitorNum}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${fairDto.fairInfo}</td>
					</tr>
					<tr>
						<th>참가 신청 기간(회사)</th>
						<td>${fairDto.fairEntryStime} ~ ${fairDto.fairEntryEtime}</td>
					</tr>
					<tr>
						<th>참관 신청 기간(관람객)</th>
						<td>${fairDto.fairVisitorStime} ~ ${fairDto.fairVisitorEtime}</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="cell right">
			<a href="list" class="btn btn-primary">목록</a>
			<a href="edit?fairNo=${fairDto.fairNo}" class="btn btn-secondary">수정</a>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>