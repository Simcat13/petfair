<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고양이가 세상을 지배한다</title>

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 프로젝트용 기본 스타일 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons.css">
<!-- <link rel="stylesheet" type="text/css" href="href="${pageContext.request.contextPath}/css/test.css"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">

<!-- font awesome 아이콘 CDN -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
</style>

<!--  jQuery CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- summernote cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- select2 cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".searchSelect").select2({
			minimumResultsForSearch : Infinity
		//selelct창에 검색 바 유무(주석처리 시 생김)
		});
	});
</script>
<style>
.note-editor {
	border: 1px solid #636e72 !important;
}

.nav {
	width: 1140px;
}

.head-bottom {
	margin: 0px;
	/* border-top: 1px solid #ACB8BD;
	border-bottom: 1px solid #ACB8BD;   홈 네비바에 선긋기*/
}

.head li {
	display: inline-block;
	font-size: 12px;
	width: 60px;
	color: #2D3436;
	padding: 0.5em;
	position: relative;
}

.head-middle {
 	height: 80px !important;
}

.home>a {
	font-size: 30px;
	font-weight: 800;
	color: rgb(251,222,35);
}

.cs, .currency, .notice {
	width: 33.3333%;
	font-size: 14px;
	text-align: left;
	padding-left: 20px;
	padding-right: 20px;
}

.cs span, .currency span, .wdate {
	color: #ACB8BD;
	font-size: 12px;
	font-weight: lighter;
}

.cs {
	border-left: none;
}


.notice {
	border-right: none;
}

.link-notice {
	position: relative;
	float: right;
}
.footer {
    position: fixed;
    bottom: 0;
    width: 100%;
    z-index: 1000; /* 풋터가 위에 올 수 있도록 z-index 설정 */
}

.section {
    padding-bottom: 200px; /* 풋터의 높이만큼 padding-bottom 추가 */
}
</style>

<!-- 내가 만든 JS -->
<script src="${pageContext.request.contextPath}/js/commons.js"></script>

</head>

<body>

	<main>
		<div class="header">
			<div class="container">
				<div class="cell">
					<ul class="right contour head">
						<c:if
							test="${sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자'}">
							<li><a href="${pageContext.request.contextPath}/admin/">${sessionScope.loginLevel}</a></li>
						</c:if>
						<c:choose>
							<c:when test="${sessionScope.loginId != null}">
								<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
								<li><a href="${pageContext.request.contextPath}/member/mypage">mypage</a></li>

							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
								<li><a href="${pageContext.request.contextPath}/member/join">회원가입</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="${pageContext.request.contextPath}/board/notice/list">고객센터</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="head-bottom mb-30">
			<div class="nav container">
				<ul class="menu cell center">
					<li class="home w-25"><a href="${pageContext.request.contextPath}"> 야옹이 </a></li>

					<li><a href="${pageContext.request.contextPath}">관람안내</a></li>

					<li><a href="${pageContext.request.contextPath}">커뮤니티</a></li>

					<li><a href="${pageContext.request.contextPath}">공지사항</a></li>

					<li><a href="${pageContext.request.contextPath}">이용후기</a></li>

					<li><a href="${pageContext.request.contextPath}">참가신청</a></li>

				</ul>
			</div>
		</div>
		<div class="section">
			<div class="article">