<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- lightpick CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<style>
.menu-type {
	margin: 0px !important;
}

.menu-list {
	margin: 0px !important;
}

.listArea {
	border: 1px solid #ced3d6;
}

#qnaNo {
	width: 10%;
}

#qnaSecret {
	width: 10%;
}

#qnaTitle {
	width: 60%;
}

#qnaWdate {
	width: 15%;
}

#isBlock, #memberDetail {
	width: 9%;
}

.menu-type {
	background-color: #60A1F833 !important;
	height: 42px;
}

.menu-list {
	margin: 0px !important;
}
</style>




<!-- 로그인 한 회원의 구매서 목록 페이지 -->
<br>
<br>
<div class="container container-body">
	<!-- 왼쪽 내용 -->
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>

	<!-- 오른쪽 내용 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text"></div>
		</div>
		<div class="content content-body"></div>
	</div>
</div>
<!-- 컨테이너 자리 닫는 태그 -->


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>