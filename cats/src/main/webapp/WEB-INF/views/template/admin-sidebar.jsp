<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container flex-container">
	<div class="container inner-container">
		<div class="title title-head">
			<div class="title-head-text"><a href="${pageContext.request.contextPath}/admin/" class="link"><strong>관리자 메뉴</strong></a></div>
		</div>
		<div class="title title-body">
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}/admin/member/search" class="link main-title">회원</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/member/search" class="link">회원목록검색</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/member/block/searchList" class="link">차단회원관리</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}" class="link main-title">박람회 관리</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/fair/insert" class="link">박람회 등록</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}" class="link">부스 등록</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}" class="link main-title">참가업체 관리</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}" class="link">참가업체 목록</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}" class="link main-title">참관객 관리</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}" class="link">참관객 목록</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}" class="link main-title">통계</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}" class="link">정산내역(일별)</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}" class="link">관람객 분석</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}" class="link">뭐 또 있나</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}/admin/board/notice/list" class="link main-title">공지사항관리</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/board/notice/list" class="link">공지사항목록</a>
					</div>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/board/notice/write" class="link">공지사항작성</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text ">
					<a href="${pageContext.request.contextPath}/admin/board/qna/list" class="link main-title">QnA</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/board/qna/list" class="link">QnA목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>