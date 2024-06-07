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
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>제목칸
			</div>
		</div>
		<div class="content content-body">
		여기에 글 쓰시고요
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>