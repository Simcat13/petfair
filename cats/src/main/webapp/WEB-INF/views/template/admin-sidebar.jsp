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
					<a href="${pageContext.request.contextPath}/admin/po/orderList" class="link main-title">구매대행 관리</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/po/orderList" class="link">구매대행 처리대기</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/po/processList" class="link">구매대행 배송대기</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/po/processingList" class="link">구매대행 배송현황</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/po/completeList" class="link">구매대행 완료목록</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/po/cancelList" class="link">취소/반품/미수취</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}/admin/ship/orderList" class="link main-title">배송대행 관리</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/ship/orderList" class="link">배송대행 처리대기</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/ship/processList" class="link">배송대행 배송대기</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/ship/processingList" class="link">구매대행 배송현황</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/ship/completeList" class="link">배송대행 완료목록</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/ship/cancelList" class="link">취소/반품/미수취</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}/admin/po/settlement" class="link main-title">정산 관리</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/po/settlement" class="link">정산내역(일별)</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/po/vatList" class="link">부가세 신고자료 조회</a>
					</div>
					<div class="title-body-text">
						<a href="${pageContext.request.contextPath}/admin/credit/creditList" class="link">크레딧 충전관리</a>
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