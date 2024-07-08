<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container center mt-5 pt-5">

<div class="row mt-5 pt-5">
	<div class="col-6">
		<a href="${pageContext.request.contextPath}/member/join">
			<button class="btn btn-primary rounded p-5">일반회원 회원가입</button>
		</a>
	</div>
	<div class="col-6">
	<a href="${pageContext.request.contextPath}/company/join">
		<button class="btn btn-primary rounded p-5">회사 회원가입</button>
	</a>
</div>
</div>



</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>