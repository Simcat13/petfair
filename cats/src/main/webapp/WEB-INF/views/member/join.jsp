<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
	    //상태객체(React의 state로 개념이 이어짐)
	    var state = {
	        //key : value
	        memberIdValid : false,
	        memberPwValid : false,
	        memberPwCheckValid : false,
	        memberNameValid : false,
	        memberEmailValid : false,
	        memberContactValid : false,
	        memberBirthValid : true, //선택항목
	        memberAddValid : true,//선택항목
	        //객체에 함수를 변수처럼 생성할 수 있다
	        //- this는 객체 자신(자바와 동일하지만 생략이 불가능)
	        ok : function(){
	            return this.memberIdValid 
	                    && this.memberPwValid && this.memberPwCheckValid
	                    && this.memberNameValid && this.memberEmailValid
	                    && this.memberContactValid && this.memberBirthValid
	                    && this.memberAddValid;
	                    
	        },
	    };
	
	    $("[name=memberId]").blur(function(){
	        var regex = /^[a-z][a-z0-9]{7,19}$/;
	        var value = $(this).val();
	
	        if(regex.test(value)) {//아이디 형식 검사를 통과했다면
	            $.ajax({
	                url : "${pageContext.request.contextPath}/rest/member/checkId",
	                method : "post",
	                data: {
	                    memberId : value
	                },
	                success : function(response) {
	                    //console.log(response);
	                    if(response == "NNNNN") {
	                        $("[name=memberId]").removeClass("success fail fail2").addClass("fail2");
	                        state.memberIdValid = false;
	                    }
	                    else if(response == "NNNNY") {
	                        $("[name=memberId]").removeClass("success fail fail2").addClass("success");
	                        state.memberIdValid = true;
	                    }
	                }
	            });
	        }
	        else {//아이디가 형식검사를 통과하지 못했다면
	            $("[name=memberId]").removeClass("success fail fail2").addClass("fail");
	            state.memberIdValid = false;
	        }
	    });
	    $("[name=memberPw]").on("blur", function(){
	        var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{6,15}$/;
	        state.memberPwValid = regex.test($(this).val());
	        $(this).removeClass("success fail")
	                    .addClass(state.memberPwValid ? "success" : "fail");
	    });
	    $("#pw-reinput").blur(function(){
	        var memberPw = $("[name=memberPw]").val();
	        state.memberPwCheckValid = memberPw == $(this).val();
	        
	        if(memberPw.length == 0) {
	            $(this).removeClass("success fail fail2").addClass("fail2");
	        }
	        else {
	            $(this).removeClass("success fail fail2")
	                        .addClass(state.memberPwCheckValid ? "success" : "fail");
	        }
	    });
	    $("[name=memberName]").blur(function(){
	        var regex = /^[가-힣]{2,7}$/;
	        var value = $(this).val();
	
	        if(regex.test(value)) {
	            $.ajax({
	                url:"${pageContext.request.contextPath}/rest/member/checkMemberName",
	                method:"post",
	                data : { memberName : value },
	                success:function(response){
	                    if(response) {//사용 가능한 경우 - success
	                        state.memberNameValid = true;
	                        $("[name=memberName]")
	                            .removeClass("success fail fail2")
	                            .addClass("success");
	                    }
	                }
	            });
	        }
	        else {//형식이 맞지 않는 경우 - fail
	            state.memberNameValid = false;
	            $("[name=memberName]")
	                .removeClass("success fail fail2")
	                .addClass("fail");
	        }
	    });
	    
	    //이메일 입력을 마친 상황일 때 잘못 입력한 경우만큼은 상태를 갱신
	    $("[name=memberEmail]").blur(function(){
	        var regex = /^[a-z0-9]{8,20}@[a-z0-9\.]{1,20}$/;
	        var value = $(this).val();
	        
	        var isValid = regex.test(value);
	        
	        if(isValid != false) {
	        	state.memberEmailValid = true;
	        }
	        
	        $(this).removeClass("success fail")
	                    .addClass(isValid ? "success" : "fail");
	        
	    });
		
        
	    $("[name=memberContact1]").blur(function(){
	        var regex = /^010[1-9][0-9]{7}$/;
	        var value = $(this).val();
	        state.memberContactValid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.memberContactValid ? "success" : "fail");
	    });
	    $("[name=memberBirth]").blur(function(){
	        var regex = /^(19[0-9]{2}|20[0-9]{2})-(02-(0[1-9]|1[0-9]|2[0-8])|(0[469]|11)-(0[1-9]|1[0-9]|2[0-9]|30)|(0[13578]|1[02])-(0[1-9]|1[0-9]|2[0-9]|3[01]))$/;
	        var value = $(this).val();
	        state.memberBirthValid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.memberBirthValid ? "success" : "fail");
	    });
	
	    //주소는 세 개의 입력창이 모두 입력되거나 안되거나 둘 중 하나
	    $("[name=memberAdd2]").blur(function(){
	        var post = $("[name=memberZipcode]").val();
	        var address1 = $("[name=memberAdd1]").val();
	        var address2 = $("[name=memberAdd2]").val();
	
	        var isClear = post.length == 0 && address1.length == 0 && address2.length == 0;
	        var isFill = post.length > 0 && address1.length > 0 && address2.length > 0;
	
	        state.memberAddValid = isClear || isFill;
	
	        $("[name=memberZipcode], [name=memberAdd1], [name=memberAdd2]")
	                .removeClass("success fail")
	                .addClass(state.memberAddValid ? "success" : "fail");
	    });
	
	    //form 전송
	    $(".check-form").submit(function(){
	        //$(this).find("[name], #pw-reinput").blur();
	        //$(this).find(".tool").blur();//모든 창
	        
	        //입력창 중에서 success fail fail2가 없는 창
	        $(this).find(".tool").not(".success, .fail, .fail2").blur();
	        return state.ok();
	    });
	});
</script>

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
                    $("[name=memberZipcode]").val(data.zonecode);
                    $("[name=memberAdd1]").val(addr);
                    
                    // 커서를 상세주소 필드로 이동한다.
                    $("[name=memberAdd2]").focus();
                }
            }).open();
        });
        
        $(".btn-address-clear").click(function(){
        	$("[name=memberZipcode]").val("");
        	$("[name=memberAdd1]").val("");
        	$("[name=memberAdd2]").val("");
        });
    });
</script>


<form action="join" method="post" autocomplete="off" class="check-form">

<div class="row mt-4">
	<div class="col">
		<div class="p-4 rounded text-center">
        	<h3 class="center">회원가입 (회원용)</h3>
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
			<input class="tool col-2" type="text" name="memberId" placeholder="영문 소문자시작, 숫자 포함 8~20자" required>
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
			<input class="tool col-2" type="password" name="memberPw" placeholder="대소문자, 숫자, 특수문자 포함 6~15자" required>
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
				이름
				<i class="fa-solid fa-asterisk red"></i>
			</label>
			<input class="tool col-2" type="text" name="memberName" placeholder="한국 이름" required>
			<div class="fail-feedback">이름은 한글 2~7자로 입력해주세요</div>
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
			<input class="tool col-2" type="email" name="memberEmail" placeholder="email@email.com" required>		
		</div>
		<!-- <div class="center mt-2">
			<button type="button" class="btn negative btn-send-cert me-5">
				<i class="fa-solid fa-paper-plane"></i>
			</button>
		 -->
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
			<input class="tool col-2" type="tel" name="memberContact1" placeholder="숫자만 입력" required>
			<div class="fail-feedback">올바르지 않은 형식입니다</div>
		</div>
	</div>
</div>

<div class="row mt-4">
	<div class="col">		
		<div class="center">
			<label class="col-1">연락처2</label>
			<input class="tool col-2" type="tel" name="memberContact2" placeholder="숫자만 입력">
		</div>
	</div>
</div>
		
<div class="row mt-4">
	<div class="col">		
		<div class="center">
	    	<label class="col-1">생년월일</label>
	   		<input class="tool col-2" type="date" name="memberBirth">
		</div>
	</div>
</div>
		
<div class="row mt-4">
	<div class="col">		
		<div class="center">
			<label class="col-1">주소</label>
			<input class="tool col-1" type="text" name="memberZipcode" readonly
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
	    	<input class="tool col-2" type="text" name="memberAdd1" 
	        		placeholder="기본주소" readonly>
		</div>
	</div>
</div>
		
<div class="row mt-2">
	<div class="col">		
		<div class="center">
			<label class="col-1"></label>
	    	<input class="tool col-2" type="text" name="memberAdd2" 
	               	placeholder="상세주소">
		</div>
	</div>
</div>

<div class="row mt-4">
	<div class="col">		
		<div class="center">
			<label class="col-1">흥미분야</label>
			<input class="tool col-2" type="text" name="memberInterest"
	                    placeholder="ex)고양이, 강아지, 고슴도치">
		</div>
	</div>
</div>

<div class="row mt-4">
	<div class="col">		
		<div class="center">
			<label class="col-1">직업</label>
			<input class="tool col-2" type="text" name="memberJob"
	                    placeholder="ex)직장인, 무직 등">
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