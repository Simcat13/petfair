<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(function(){
        $(".btn-address-search").click(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $("[name=companyZipcode]").val(data.zonecode);
                    $("[name=companyAdd1]").val(addr);
                    
                    // 커서를 상세주소 필드로 이동한다.
                    $("[name=companyAdd2]").focus();
                }
            }).open();
        });
        
        $(".btn-address-clear").click(function(){
        	$("[name=companyZipcode]").val("");
        	$("[name=companyAdd1]").val("");
        	$("[name=companyAdd2]").val("");
        });
    });
</script>


<form action="join" method="post" autocomplete="off" class="check-form">

<div class="row mt-4">
	<div class="col">
		<div class="p-4 rounded text-center">
        	<h3 class="center">회원가입 (회사용)</h3>
        </div>	
	</div>
</div>

<div class="row mt-4">
	<div class="col">
		<div class="center">
			<label class="col-1">
				아이디
				<i class="fa-solid fa-asterisk red"></i>
			</label>
			<input class="tool col-2" type="text" name="companyId" placeholder="영문 소문자시작, 숫자 포함 8~20자" required>
			<div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 작성하세요</div>
			<div class="fail2-feedback">이미 사용중인 아이디입니다</div>
		</div>
	</div>
</div>

<div class="row mt-4">
	<div class="col">
		<div class="center">
			<label class="col-1">
				비밀번호
				<i class="fa-solid fa-asterisk red"></i>
			</label>
			<input class="tool col-2" type="password" name="companyPw" placeholder="대소문자, 숫자, 특수문자 포함 6~15자" required>
			<div class="fail-feedback">비밀번호에는 반드시 영문 대,소문자와 숫자, 특수문자가 포함되어야 합니다</div>
		</div>
	</div>
</div>
<div class="row mt-4">
	<div class="col">
		<div class="center">
			<label class="col-1">
				비밀번호 확인
				<i class="fa-solid fa-asterisk red"></i>
			</label>
			<input class="tool col-2" type="password" id="pw-reinput" placeholder="비밀번호를 한 번 더 입력하세요" required>
			<div class="fail-feedback">비밀번호가 일치하지 않습니다</div>
		    <div class="fail2-feedback">비밀번호를 먼저 입력하세요</div>
		</div>
	</div>
</div>
<div class="row mt-4">
	<div class="col">
		<div class="center">
			<label class="col-1">
				회사명
				<i class="fa-solid fa-asterisk red"></i>
			</label>
			<input class="tool col-2" type="text" name="companyName" placeholder="회사명" required>
		</div>
	</div>
</div>
	
<div class="row mt-4">
	<div class="col">	
	<div class="center">
		<label class="col-1">
			이메일
			<i class="fa-solid fa-asterisk red"></i>
		</label>
		<input class="tool col-2" type="email" name="companyEmail" placeholder="email@email.com" required>
	</div>
	</div>
</div>
	
<div class="row mt-4">
	<div class="col">	
	<div class="center">
		<label class="col-1">
			연락처1
			<i class="fa-solid fa-asterisk red"></i>
		</label>
		<input class="tool col-2" type="tel" name="companyContact1" placeholder="숫자만 입력" required>
	</div>
	</div>
</div>
	
<div class="row mt-4">
	<div class="col">	
		<div class="center">
			<label class="col-1">연락처2</label>
			<input class="tool col-2" type="tel" name="companyContact2" placeholder="숫자만 입력">
		</div>
	</div>
</div>
	
<div class="row mt-4">
	<div class="col">	
		<div class="center">
	            <label class="col-1">팩스번호</label>
	            <input class="tool col-2" type="tel" name="companyFax" placeholder="팩스번호 입력해주삼">
		</div>
	</div>
</div>
	
<div class="row mt-4">
	<div class="col">	
		<div class="center">
	            <label class="col-1">사업자 등록번호</label>
	            <input class="tool col-2" type="text" name="companyBn" placeholder="'-' 포함 입력">
		</div>
	</div>
</div>
	
	
<div class="row mt-4">
	<div class="col">		
		<div class="center">
			<label class="col-1">주소</label>
			<input class="tool col-1" type="text" name="companyZipcode"  readonly
	                    placeholder="우편번호" size="6" maxlength="6">          
	        <button type="button" class="btn positive btn-address-search">
	        	<i class="fa-solid fa-magnifying-glass"></i>
	        </button>        
	        <button type="button" class="btn negative btn-address-clear">
	        	<i class="fa-solid fa-xmark"></i>
	        </button>
		</div>
	</div>
</div>
		
<div class="row mt-2">
	<div class="col">		
		<div class="center">
			<label class="col-1"></label>
	    	<input class="tool col-2" type="text" name="companyAdd1" 
	        		placeholder="기본주소" readonly>
		</div>
	</div>
</div>
		
<div class="row mt-2">
	<div class="col">		
		<div class="center">
			<label class="col-1"></label>
	    	<input class="tool col-2" type="text" name="companyAdd2" 
	               	placeholder="상세주소">
		</div>
	</div>
</div>

<div class="row mt-4">
	<div class="col">
		<div class="center my-10">
			<button type="submit" class="btn positive">
				<i class="fa-solid fa-user"></i>
				회원가입
			</button>
		</div>
	</div>
</div>

</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>