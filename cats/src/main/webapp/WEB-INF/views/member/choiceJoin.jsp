<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="center my-20">
<form action="${pageContext.request.contextPath}/member/join" method="get">
	<button type="submit">일반회원 회원가입</button>
</form>
</div>

<div class="center my-10">
<form action="${pageContext.request.contextPath}/company/join" method="get">
	<button type="submit">회사 회원가입</button>
</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>