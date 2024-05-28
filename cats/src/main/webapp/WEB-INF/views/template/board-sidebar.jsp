<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
.title.title-head{
	border-bottom: 1px solid #CAE4FF;
	border-top: 1px solid #CAE4FF;
	background-color: #F2F9FF;
}
</style>

<div class="container flex-container">
	<div class="container inner-container">
		<div class="title title-head">
			<div class="title-head-text">고객센터</div>
		</div>
		<div class="title title-body">
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}/board/notice/list" class="link">공지사항</a>
				</div>
				<div class="title-body-sub"></div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}/board/qna/list" class="link">QnA 게시판</a>
				</div>
				<div class="title-body-sub">
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="${pageContext.request.contextPath}/board/review/list" class="link">이용후기</a>
				</div>
				<div class="title-body-sub">
				</div>
			</div>
		</div>
	</div>