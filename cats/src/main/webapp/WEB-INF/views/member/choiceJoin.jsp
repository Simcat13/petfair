<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="center my-20">
	<a href="${pageContext.request.contextPath}/member/join">
		<button class="btn">일반회원 회원가입</button>
	</a>
</div>

<div class="center my-10">
	<a href="${pageContext.request.contextPath}/company/join">
		<button class="btn">회사 회원가입</button>
	</a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>