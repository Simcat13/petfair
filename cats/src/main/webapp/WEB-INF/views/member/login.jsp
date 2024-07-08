<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="login" method="post" autocomplete="off">

	<div class="container center mt-4 pt-5">
		<div class="row mt-4">
			<div class="col">
				<i class="fa-solid fa-user"></i> 로그인
			</div>
		</div>
		
		<div class="row mt-4">
			<div class="col">
				<label class="col-1">아이디</label>
				<input class="tool col" type="text" name="memberId" required>
			</div>
		</div>

		
		<div class="row mt-2">
			<div class="col">
				<label class="col-1">비밀번호</label>
				<input class="tool col" type="password" name="memberPw" required>
			</div>
		</div>
		
		<div class="row mt-4">
			<div class="col">
				<button class="btn btn-success rounded">로그인</button>
			</div>
		</div>

		<c:if test="${param.error != null}">
			<div class="cell center">
				<h3 style="color: red">로그인 정보가 일치하지 않습니다</h3>
			</div>
		</c:if>

	</div>
</form>

<!-- 회사 로그인 링크 -->
<div class="cell center">
		<a href="${pageContext.request.contextPath}/company/login">
			<button class="btn" title="회사 로그인 하러가기">
				<i class="fa-solid fa-building"></i>
				<i class="fa-solid fa-arrow-right-to-bracket"></i>
			</button>
		</a>
</div>

<div class="cell center mt-4">
	<a href="#" style="text-decoration-line: none;">아이디 찾기</a>
	&nbsp;|&nbsp;
	<a href="#" style="text-decoration-line: none;">비밀번호 찾기</a>
	&nbsp;|&nbsp;
	<a href="${pageContext.request.contextPath}/member/join" style="text-decoration-line: none;">회원가입</a>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>