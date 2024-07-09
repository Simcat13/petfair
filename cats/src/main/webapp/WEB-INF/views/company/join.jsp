<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.container {
	/*text-align:center; /*내부 요소 정렬*/
	margin-left: auto;
	margin-right: auto;
}

.area1 {
	display: flex;
}

.cell {
	margin-top: 10px;
	margin-bottom: 10px;
	place-items: center;
}

.w-30 {
	width: 30%;
}

.w-50 {
	width: 50%;
}

.w-60 {
	width: 60%;
}

.w-70 {
	width: 70%;
}

.w-75 {
	width: 75%;
}
</style>

<script type="text/javascript">
	$(function() {
		//상태객체(React의 state로 개념이 이어짐)
		var state = {
			//key : value
			companyIdValid : false,
			companyPwValid : false,
			companyPwCheckValid : false,
			companyEmailValid : false,
			companyBnValid : false,
			companyContactValid : false,
			companyAddValid : true,//선택항목
			//객체에 함수를 변수처럼 생성할 수 있다
			//- this는 객체 자신(자바와 동일하지만 생략이 불가능)
			ok : function() {
				return this.companyIdValid && this.companyPwValid
						&& this.companyPwCheckValid 
						&& this.companyEmailValid && this.companyBnValid
						&& this.companyContactValid && this.companyAddValid;

			},
		};

		$("[name=companyId]")
				.blur(
						function() {
							var regex = /^[a-z][a-z0-9]{7,19}$/;
							var value = $(this).val();

							if (regex.test(value)) {//아이디 형식 검사를 통과했다면
								$
										.ajax({
											url : "${pageContext.request.contextPath}/rest/company/checkId",
											method : "post",
											data : {
												companyId : value
											},
											success : function(response) {
												//console.log(response);
												if (response == "NNNNN") {
													$("[name=companyId]")
															.removeClass(
																	"success fail fail2")
															.addClass("fail2");
													state.companyIdValid = false;
												} else if (response == "NNNNY") {
													$("[name=companyId]")
															.removeClass(
																	"success fail fail2")
															.addClass("success");
													state.companyIdValid = true;
												}
											},
											error : function(xhr, status, error) {
												console.error("AJAX Error: "
														+ status + error);
											}
										});
							} else {//아이디가 형식검사를 통과하지 못했다면
								$("[name=companyId]").removeClass(
										"success fail fail2").addClass("fail");
								state.companyIdValid = false;
							}
						});
		$("[name=companyPw]")
				.on(
						"blur",
						function() {
							var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{6,15}$/;
							state.companyPwValid = regex.test($(this).val());
							$(this).removeClass("success fail").addClass(
									state.companyPwValid ? "success" : "fail");
						});
		$("#pw-reinput")
				.blur(
						function() {
							var companyPw = $("[name=companyPw]").val();
							state.companyPwCheckValid = companyPw == $(this)
									.val();

							if (companyPw.length == 0) {
								$(this).removeClass("success fail fail2")
										.addClass("fail2");
							} else {
								$(this)
										.removeClass("success fail fail2")
										.addClass(
												state.companyPwCheckValid ? "success"
														: "fail");
							}
						});
		//이메일 입력을 마친 상황일 때 잘못 입력한 경우만큼은 상태를 갱신
		$("[name=companyEmail]").blur(
				function() {
					var regex = /^[a-z0-9]{8,20}@[a-z0-9\.]{1,20}$/;
					var value = $(this).val();

					var isValid = regex.test(value);

					if (isValid != false) {
						state.companyEmailValid = true;
					}

					$(this).removeClass("success fail").addClass(
							isValid ? "success" : "fail");

				});
		
		$("[name=companyBn]").blur(function() {
			var regex = /^\d{3}-\d{2}-\d{5}$/;
			var value = $(this).val();

			if (regex.test(value)) {//아이디 형식 검사를 통과했다면
				$.ajax({
					url : "${pageContext.request.contextPath}/rest/company/checkCompanyBn",
					method : "post",
					data : {
					companyBn : value
					},
										success : function(response) {
											//console.log(response);
											if (response == "NNNNN") {
												$("[name=companyBn]")
														.removeClass(
																"success fail fail2")
														.addClass("fail2");
												state.companyBnValid = false;
											} else if (response == "NNNNY") {
												$("[name=companyBn]")
														.removeClass(
																"success fail fail2")
														.addClass("success");
												state.companyBnValid = true;
											}
										}
									});
						} else {//아이디가 형식검사를 통과하지 못했다면
							$("[name=companyBn]").removeClass(
									"success fail fail2").addClass("fail");
							state.companyBnValid = false;
						}
					});
		
		$("[name=companyContact1]").blur(
				function() {
					var regex = /^010[1-9][0-9]{7}$/;
					var value = $(this).val();
					state.companyContactValid = value.length == 0
							|| regex.test(value);
					$(this).removeClass("success fail").addClass(
							state.companyContactValid ? "success" : "fail");
				});
		//주소는 세 개의 입력창이 모두 입력되거나 안되거나 둘 중 하나
		$("[name=companyAdd2]")
				.blur(
						function() {
							var post = $("[name=companyZipcode]").val();
							var address1 = $("[name=companyAdd1]").val();
							var address2 = $("[name=companyAdd2]").val();

							var isClear = post.length == 0
									&& address1.length == 0
									&& address2.length == 0;
							var isFill = post.length > 0 && address1.length > 0
									&& address2.length > 0;

							state.companyAddValid = isClear || isFill;

							$(
									"[name=companyZipcode], [name=companyAdd1], [name=companyAdd2]")
									.removeClass("success fail").addClass(
											state.companyAddValid ? "success"
													: "fail");
						});

		//form 전송
		$(".check-form").submit(function() {
			//$(this).find("[name], #pw-reinput").blur();
			//$(this).find(".tool").blur();//모든 창

			//입력창 중에서 success fail fail2가 없는 창
			$(this).find(".tool").not(".success, .fail, .fail2").blur();
			return state.ok();
		});
	});
</script>

<!-- 우편번호 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		$(".btn-address-search").click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
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

		$(".btn-address-clear").click(function() {
			$("[name=companyZipcode]").val("");
			$("[name=companyAdd1]").val("");
			$("[name=companyAdd2]").val("");
		});
	});
</script>


<form action="join" method="post" autocomplete="off" class="check-form">
	<div class="container w-600">

		<div class="cell center p-5">
			<h3 class="center">
				<i class="fa-solid fa-building"></i> 회원가입 (회사용)
			</h3>
		</div>


		<div class="cell area1 mt-4">
			<div class="w-30">
				<label> 아이디 <i class="fa-solid fa-asterisk red"></i>
				</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="text" name="companyId"
					placeholder="영문 소문자시작, 숫자 포함 8~20자" required>
				<div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 입력하세요</div>
				<div class="fail2-feedback">이미 사용중인 아이디입니다</div>
			</div>
		</div>


		<div class="cell area1 mt-4">
			<div class="w-30">
				<label> 비밀번호 <i class="fa-solid fa-asterisk red"></i>
				</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="password" name="companyPw"
					placeholder="대소문자, 숫자, 특수문자 포함 6~15자" required>
				<div class="fail-feedback">비밀번호에는 반드시 영문 대,소문자와 숫자, 특수문자가
					포함되어야 합니다</div>
			</div>
		</div>

		<div class="cell area1 mt-4">
			<div class="w-30">
				<label> 비밀번호 확인 <i class="fa-solid fa-asterisk red"></i>
				</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="password" id="pw-reinput"
					placeholder="비밀번호를 한 번 더 입력하세요" required>
				<div class="fail-feedback">비밀번호가 일치하지 않습니다</div>
				<div class="fail2-feedback">비밀번호를 먼저 입력하세요</div>
			</div>
		</div>

		<div class="cell area1 mt-4">
			<div class="w-30">
				<label> 회사명 <i class="fa-solid fa-asterisk red"></i>
				</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="text" name="companyName"
					placeholder="회사명" required>
			</div>
		</div>

		<div class="cell area1 mt-4">
			<div class="w-30">
				<label> 이메일 <i class="fa-solid fa-asterisk red"></i>
				</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="email" name="companyEmail"
					placeholder="email@email.com" required>
			</div>
		</div>

		<div class="cell area1 mt-4">
			<div class="w-30">
				<label>사업자 등록번호 <i class="fa-solid fa-asterisk red"></i>
				</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="text" name="companyBn"
					placeholder="'-' 포함 입력" required>
				<div class="fail-feedback">XXX-XX-XXXXX 형식으로 입력하세요</div>
				<div class="fail2-feedback">이미 사용중인 사업자 번호입니다</div>
			</div>
		</div>

		<div class="cell area1 mt-4">
			<div class="w-30">
				<label> 연락처1 <i class="fa-solid fa-asterisk red"></i>
				</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="tel" name="companyContact1"
					placeholder="숫자만 입력하세요" required>
			</div>
		</div>

		<div class="cell area1 mt-4">
			<div class="w-30">
				<label>연락처2</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="tel" name="companyContact2"
					placeholder="숫자만 입력하세요">
			</div>
		</div>

		<div class="cell area1 mt-4">
			<div class="w-30">
				<label>팩스번호</label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="tel" name="companyFax"
					placeholder="팩스번호를 입력하세요">
			</div>
		</div>

		<div class="cell area1 mt-4">
			<div class="w-30">
				<label>주소</label>
			</div>
			<div class="w-70">
				<input class="tool w-50" type="text" name="companyZipcode" readonly
					placeholder="우편번호" size="6" maxlength="6">
				<button type="button" class="btn positive btn-address-search">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
				<button type="button" class="btn negative btn-address-clear">
					<i class="fa-solid fa-xmark"></i>
				</button>
			</div>
		</div>

		<div class="cell area1 mt-2">
			<div class="w-30">
				<label></label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="text" name="companyAdd1"
					placeholder="기본주소" readonly>
			</div>
		</div>

		<div class="cell area1 mt-2">
			<div class="w-30">
				<label></label>
			</div>
			<div class="w-70">
				<input class="tool w-75" type="text" name="companyAdd2"
					placeholder="상세주소">
			</div>
		</div>
		
	
	<!-- 개인정보동의 -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
	<!-- 개인정보 동의 체크해야 가입 가능하게 -->
	<script>
		function checkAgreeRequired() {
			//개인정보 필수 체크 확인
			var checkAgree = document.querySelector(".agreeCheckbox");
			// 버튼과 필수 체크박스를 연결합니다.
			var buttons = document.querySelectorAll(".signup");
			//체크 확인
			var isChecked = checkAgree.checked;
			//버튼 변경
			buttons.forEach(function(button) {
				button.disabled = !isChecked;
			});
		}
	</script>
		
		<div class="cell area1 mt-4">
			<div class="w-30">
				<label>개인정보 수집 동의</label>
			</div>
			<div class="w-70">		
				<input type="checkbox"
					class="agreeCheckbox" oninput="checkAgreeRequired();" name="companyAgree" value="Y">
				<label>[필수]</label>			
				<span>
					<a class="col" data-toggle="modal"
					data-target="#privacyPolicyModal" style="cursor: pointer">개인정보
					수집 및 이용</a> 에 동의합니다.
				</span>
			</div>
		</div>
	
		
	<!-- 개인정보 보호 Modal -->
	<div class="modal fade" id="privacyPolicyModal" tabindex="-1"
		role="dialog" aria-labelledby="privacyPolicyModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" id="privacyPolicyModalLabel"
						style="font-size: 1.2rem; line-height: 26px; font-weight: 700; color: #1c1e22;">개인정보처리방침</p>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p class="joinAgreeTitle">제1조(목적)</p>
					<p class="joinAgreeContent">
						<span
							style="font-weight: bold; text-decoration: underline; font-size: 13px">(주)야옹</span>
						(이하 ‘회사'라고 함)은 회사가 제공하고자 하는 서비스(이하 ‘회사 서비스’)를 이용하는 개인(이하 ‘이용자’ 또는
						‘개인’)의 정보(이하 ‘개인정보’)를 보호하기 위해, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한
						법률(이하 '정보통신망법') 등 관련 법령을 준수하고, 서비스 이용자의 개인정보 보호 관련한 고충을 신속하고 원활하게
						처리할 수 있도록 하기 위하여 다음과 같이 개인정보처리방침(이하 ‘본 방침’)을 수립합니다.
					</p>
					<br>
					<p class="joinAgreeTitle">제2조(개인정보 처리의 원칙)</p>
					<p class="joinAgreeContent">개인정보 관련 법령 및 본 방침에 따라 회사는 이용자의
						개인정보를 수집할 수 있으며 수집된 개인정보는 개인의 동의가 있는 경우에 한해 제3자에게 제공될 수 있습니다. 단,
						법령의 규정 등에 의해 적법하게 강제되는 경우 회사는 수집한 이용자의 개인정보를 사전에 개인의 동의 없이 제3자에게
						제공할 수도 있습니다.</p>
					<br>
					<p class="joinAgreeTitle">제3조(본 방침의 공개)</p>
					<p class="joinAgreeContent">회사는 이용자가 언제든지 쉽게 본 방침을 확인할 수 있도록 회사
						홈페이지 첫 화면 또는 첫 화면과의 연결화면을 통해 본 방침을 공개하고 있습니다. 회사는 제1항에 따라 본 방침을
						공개하는 경우 글자 크기, 색상 등을 활용하여 이용자가 본 방침을 쉽게 확인할 수 있도록 합니다.</p>
					<br>
					<p class="joinAgreeTitle">제4조(본 방침의 변경)</p>
					<p class="joinAgreeContent">본 방침은 개인정보 관련 법령, 지침, 고시 또는 정부나 회사
						서비스의 정책이나 내용의 변경에 따라 개정될 수 있습니다. 회사는 제1항에 따라 본 방침을 개정하는 경우 다음 각 호
						하나 이상의 방법으로 공지합니다. 회사가 운영하는 인터넷 홈페이지의 첫 화면의 공지사항란 또는 별도의 창을 통하여
						공지하는 방법 서면·모사전송·전자우편 또는 이와 비슷한 방법으로 이용자에게 공지하는 방법 회사는 제2항의 공지는 본
						방침 개정의 시행일로부터 최소 7일 이전에 공지합니다. 다만, 이용자 권리의 중요한 변경이 있을 경우에는 최소 30일
						전에 공지합니다.</p>
					<br>
					<p class="joinAgreeTitle">제5조(회사 서비스 제공을 위한 정보)</p>
					<p class="joinAgreeContent">회사는 이용자에게 회사의 서비스를 제공하기 위하여 다음과 같은
						정보를 수집합니다. 필수 수집 정보: 이메일 주소, 이름 및 연락처</p>
					<br>
					<p class="joinAgreeTitle">제6조(개인정보 수집 방법)</p>
					<p class="joinAgreeContent">회사는 다음과 같은 방법으로 이용자의 개인정보를 수집합니다.
						이용자가 회사의 홈페이지에 자신의 개인정보를 입력하는 방식 어플리케이션 등 회사가 제공하는 홈페이지 외의 서비스를 통해
						이용자가 자신의 개인정보를 입력하는 방식 이용자가 공고 지원을 위해 회사의 서비스를 이용하는 과정에서 이용자가 입력
						하는 방식</p>
					<br>
					<p class="joinAgreeTitle">제7조(개인정보의 이용)</p>
					<p class="joinAgreeContent">회사는 개인정보를 다음 각 호의 경우에 이용합니다. 공지사항의
						전달 등 회사운영에 필요한 경우 이용문의에 대한 회신, 불만의 처리 등 이용자에 대한 서비스 개선을 위한 경우 회사의
						서비스를 제공하기 위한 경우 법령 및 회사 약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여
						서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재를 위한 경우 신규 서비스 개발을 위한 경우 이벤트 및
						행사 안내 등 마케팅을 위한 경우 채용 절차 진행을 위해 안내 메일 및 문자를 발송하는 경우</p>
					<br>
					<p class="joinAgreeTitle">제8조(개인정보의 보유 및 이용기간)</p>
					<p class="joinAgreeContent">회사는 이용자의 개인정보에 대해 개인정보의 수집·이용 목적
						달성을 위한 기간 동안 개인정보를 보유 및 이용합니다. 전항에도 불구하고 회사는 내부 방침에 의해 서비스 부정이용기록은
						부정 가입 및 이용 방지를 위하여 회원 탈퇴 시점으로부터 최대 1년간 보관합니다.</p>
					<br>
					<p class="joinAgreeTitle">제9조(법령에 따른 개인정보의 보유 및 이용기간)</p>
					<p class="joinAgreeContent">회사는 관계법령에 따라 다음과 같이 개인정보를 보유 및
						이용합니다. 전자상거래 등에서의 소비자보호에 관한 법률에 따른 보유정보 및 보유기간 계약 또는 청약철회 등에 관한 기록
						: 5년 대금결제 및 재화 등의 공급에 관한 기록 : 5년 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
						표시•광고에 관한 기록 : 6개월 통신비밀보호법에 따른 보유정보 및 보유기간 웹사이트 로그 기록 자료 : 3개월
						전자금융거래법에 따른 보유정보 및 보유기간 전자금융거래에 관한 기록 : 5년 위치정보의 보호 및 이용 등에 관한 법률
						개인위치정보에 관한 기록 : 6개월</p>
					<br>
					<p class="joinAgreeTitle">제10조(개인정보의 파기원칙)</p>
					<p class="joinAgreeContent">회사는 원칙적으로 이용자의 개인정보 처리 목적의 달성,
						보유·이용기간의 경과 등 개인정보가 필요하지 않을 경우에는 해당 정보를 지체 없이 파기합니다.</p>
					<br>
					<p class="joinAgreeTitle">제11조(개인정보파기절차)</p>
					<p class="joinAgreeContent">이용자가 회원가입 등을 위해 입력한 정보는 개인정보 처리 목적이
						달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에
						따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기 되어집니다. 회사는 파기 사유가 발생한 개인정보를 개인정보보호
						책임자의 승인절차를 거쳐 파기합니다.</p>
					<br>
					<p class="joinAgreeTitle">제12조(개인정보파기방법)</p>
					<p class="joinAgreeContent">회사는 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수
						없는 기술적 방법을 사용하여 삭제하며, 종이로 출력된 개인정보는 분쇄기로 분쇄하거나 소각 등을 통하여 파기합니다.</p>
					<br>
					<p class="joinAgreeTitle">제13조(광고성 정보의 전송 조치)</p>
					<p class="joinAgreeContent">회사는 전자적 전송매체를 이용하여 영리목적의 광고성 정보를
						전송하는 경우 이용자의 명시적인 사전동의를 받습니다. 다만, 다음 각호 어느 하나에 해당하는 경우에는 사전 동의를 받지
						않습니다 회사가 재화 등의 거래관계를 통하여 수신자로부터 직접 연락처를 수집한 경우, 거래가 종료된 날로부터 6개월
						이내에 회사가 처리하고 수신자와 거래한 것과 동종의 재화 등에 대한 영리목적의 광고성 정보를 전송하려는 경우 「방문판매
						등에 관한 법률」에 따른 전화권유판매자가 육성으로 수신자에게 개인정보의 수집출처를 고지하고 전화권유를 하는 경우 회사는
						전항에도 불구하고 수신자가 수신거부의사를 표시하거나 사전 동의를 철회한 경우에는 영리목적의 광고성 정보를 전송하지
						않으며 수신거부 및 수신동의 철회에 대한 처리 결과를 알립니다. 회사는 오후 9시부터 그다음 날 오전 8시까지의 시간에
						전자적 전송매체를 이용하여 영리목적의 광고성 정보를 전송하는 경우에는 제1항에도 불구하고 그 수신자로부터 별도의 사전
						동의를 받습니다. 회사는 전자적 전송매체를 이용하여 영리목적의 광고성 정보를 전송하는 경우 다음의 사항 등을 광고성
						정보에 구체적으로 밝힙니다. 회사명 및 연락처 수신 거부 또는 수신 동의의 철회 의사표시에 관한 사항의 표시 회사는
						전자적 전송매체를 이용하여 영리목적의 광고성 정보를 전송하는 경우 다음 각 호의 어느 하나에 해당하는 조치를 하지
						않습니다. 광고성 정보 수신자의 수신거부 또는 수신동의의 철회를 회피·방해하는 조치 숫자·부호 또는 문자를 조합하여
						전화번호·전자우편주소 등 수신자의 연락처를 자동으로 만들어 내는 조치 영리목적의 광고성 정보를 전송할 목적으로 전화번호
						또는 전자우편주소를 자동으로 등록하는 조치 광고성 정보 전송자의 신원이나 광고 전송 출처를 감추기 위한 각종 조치
						영리목적의 광고성 정보를 전송할 목적으로 수신자를 기망하여 회신을 유도하는 각종 조치</p>
					<br>
					<p class="joinAgreeTitle">제14조(아동의 개인정보보호)</p>
					<p class="joinAgreeContent">회사는 만 14세 미만 아동의 개인정보 보호를 위하여 만 14세
						이상의 이용자에 한하여 회원가입을 허용합니다. 제1항에도 불구하고 회사는 이용자가 만 14세 미만의 아동일 경우에는,
						그 아동의 법정대리인으로부터 그 아동의 개인정보 수집, 이용, 제공 등의 동의를 그 아동의 법정대리인으로부터 받습니다.
						제2항의 경우 회사는 그 법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(ID), 휴대폰 번호 등을 추가로
						수집합니다.</p>
					<br>
					<p class="joinAgreeTitle">제15조(이용자의 의무)</p>
					<p class="joinAgreeContent">이용자는 자신의 개인정보를 최신의 상태로 유지해야 하며,
						이용자의 부정확한 정보 입력으로 발생하는 문제의 책임은 이용자 자신에게 있습니다. 타인의 개인정보를 도용한 회원가입의
						경우 이용자 자격을 상실하거나 관련 개인정보보호 법령에 의해 처벌받을 수 있습니다. 이용자는 전자우편주소, 비밀번호
						등에 대한 보안을 유지할 책임이 있으며 제3자에게 이를 양도하거나 대여할 수 없습니다.</p>
					<br>
					<p class="joinAgreeTitle">제16조(회사의 개인정보 관리)</p>
					<p class="joinAgreeContent">회사는 이용자의 개인정보를 처리함에 있어 개인정보가 분실,
						도난, 유출, 변조, 훼손 등이 되지 아니하도록 안전성을 확보하기 위하여 필요한 기술적·관리적 보호대책을 강구하고
						있습니다.</p>
					<br>
					<p class="joinAgreeTitle">제17조(삭제된 정보의 처리)</p>
					<p class="joinAgreeContent">회사는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된
						개인정보는 회사가 수집하는 "개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는
						이용할 수 없도록 처리하고 있습니다.</p>
					<br>
					<p class="joinAgreeTitle">제18조(비밀번호의 암호화)</p>
					<p class="joinAgreeContent">이용자의 비밀번호는 일방향 암호화하여 저장 및 관리되고 있으며,
						개인정보의 확인, 변경은 비밀번호를 알고 있는 본인에 의해서만 가능합니다.</p>
					<br>
					<p class="joinAgreeTitle">제19조(국외 이전 개인정보의 보호)</p>
					<p class="joinAgreeContent">회사는 이용자의 개인정보에 관하여 개인정보보호법 등 관계 법규를
						위반하는 사항을 내용으로 하는 국제계약을 체결하지 않습니다. 회사는 이용자의 개인정보를 국외에 제공(조회되는 경우를
						포함)ㆍ처리위탁ㆍ보관(이하 "이전"이라 함)하려면 이용자의 동의를 받습니다. 다만, 본조 제3항 각 호의 사항 모두를
						개인정보보호법 등 관계 법규에 따라 공개하거나 전자우편 등 대통령령으로 정하는 방법에 따라 이용자에게 알린 경우에는
						개인정보 처리위탁ㆍ보관에 따른 동의절차를 거치지 아니할 수 있습니다. 회사는 본조 제2항 본문에 따른 동의를 받으려면
						미리 다음 각 호의 사항 모두를 이용자에게 고지합니다. 이전되는 개인정보 항목 개인정보가 이전되는 국가, 이전일시 및
						이전방법 개인정보를 이전받는 자의 성명(법인인 경우 그 명칭 및 정보관리 책임자의 연락처를 말한다) 개인정보를 이전받는
						자의 개인정보 이용목적 및 보유ㆍ이용 기간 회사는 본조 제2항 본문에 따른 동의를 받아 개인정보를 국외로 이전하는 경우
						개인정보보호법 대통령령 등 관계법규에서 정하는 바에 따라 보호조치를 합니다.</p>
					<br>
					<p class="joinAgreeTitle">제20조(개인정보 자동 수집 장치의 설치·운영 및 거부에 관한
						사항)</p>
					<p class="joinAgreeContent">회사는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용
						정보를 저장하고 수시로 불러오는 개인정보 자동 수집장치(이하 '쿠키')를 사용합니다. 쿠키는 웹사이트를 운영하는데
						이용되는 서버(http)가 이용자의 웹브라우저(PC 및 모바일을 포함)에게 보내는 소량의 정보이며 이용자의 저장공간에
						저장되기도 합니다. 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을
						설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도
						있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 회사의 일부 서비스는 이용에 어려움이 있을 수
						있습니다.</p>
					<br>
					<!-- <p class="joinAgreeTitle"></p>
                <p class="joinAgreeContent"></p>
                <br> -->
				</div>
			</div>
		</div>
	</div>

		<div class="row mt-4">
			<div class="col">
				<div class="center my-10">
					<button type="submit" class="btn btn-success signup" disabled>
						<i class="fa-solid fa-user"></i> 회원가입
					</button>
				</div>
			</div>
		</div>

	</div>
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>