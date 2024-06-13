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

<div class="container w-500">
	<h1 class="center">회원가입(회사)</h1>
</div>

<div>
	<div class="center">
		<label>
			아이디
			<i class="fa-solid fa-asterisk red"></i>
		</label>
		<input type="text" name="companyId" placeholder="아이디쓸거입력하셈" required>
	</div>
	<div class="center">
		<label>
			비밀번호
			<i class="fa-solid fa-asterisk red"></i>
		</label>
		<input type="password" name="companyPw" placeholder="비밀번호486" required>
	</div>
	<div class="center">
		<label>
			비밀번호 확인
			<i class="fa-solid fa-asterisk red"></i>
		</label>
		<input type="password" placeholder="비밀번호 한번 더 확인할게요" required>
	</div>
	<div class="center">
		<label>
			회사명
			<i class="fa-solid fa-asterisk red"></i>
		</label>
		<input type="text" name="companyName" placeholder="회사명" required>
	</div>
	<div class="center">
		<label>
			이메일
			<i class="fa-solid fa-asterisk red"></i>
		</label>
		<input type="email" name="companyEmail" placeholder="email@email.com" required>
	</div>
	<div class="center">
		<label>
			연락처1
			<i class="fa-solid fa-asterisk red"></i>
		</label>
		<input type="tel" name="companyContact1" placeholder="연락처 1" required>
	</div>
	<div class="center">
		<label>연락처2</label>
		<input type="tel" name="companyContact2" placeholder="연락처 1">
	</div>
	<div class="center">
            <label>팩스번호</label>
            <input type="tel" name="companyFax" placeholder="팩스번호 입력해주삼">
	</div>
	<div class="center">
            <label>사업자 등록번호</label>
            <input type="text" name="companyBn" placeholder="'-' 포함 입력">
	</div>
	<div class="center">
		<label>주소</label>
	</div>
	<div class="center">
            <input type="text" name="companyZip"  readonly
                    placeholder="우편번호" size="6" maxlength="6">
            <button type="button" class="btn positive btn-address-search">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>        
            <button type="button" class="btn negative btn-address-clear">
            	<i class="fa-solid fa-xmark"></i>
            </button>
	</div>
	<div class="center">
            <input type="text" name="companyAdd1" 
                    placeholder="기본주소" readonly>
	</div>
	<div class="center">
            <input type="text" name="companyAdd2" 
                    placeholder="상세주소">
	</div>
	<div>
	
	</div>
</div>

<div class="center my-10">
	<button type="submit" class="btn positive">
		<i class="fa-solid fa-user"></i>
		회원가입
	</button>
</div>

</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>