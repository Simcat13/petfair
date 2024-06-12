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
				<i class="fa-solid fa-pause"></i>박람회 목록
			</div>
		</div>
		<div class="content content-body">
			<div class="cell">
				<table class="table table-border">
					<thead>
						<tr>
							<th>번호</th>
							<th>박람회명</th>
							<th>시작일자</th>
							<th>종료일자</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="fairDto" items="${fairList}">
							<tr>
								<td>${fairDto.fairNo}</td>
								<td>
									<a href="detail?fairNo=${fairDto.fairNo}">${fairDto.fairName}</a>
								</td>
								<td>${fairDto.fairSdate}</td>
								<td>${fairDto.fairEdate}</td>
								<td>${fairDto.fairStatus}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="cell right">
			<a href="insert" class="btn btn-secondary">박람회 등록</a> 
		</div>
		<%-- 네비게이터 --%>
		<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>