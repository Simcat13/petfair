<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
</div>
<div class="footer">
	<div class="container" style="width: 1140px;">
		<div class="footer-top">
			<div class="cell flex-cell center auto-width">
				<div class="cell cs">
					<h3>
						고객센터 <span>/ CS center</span>
					</h3>
					<div class="cell pt-20">
						<ul class="menu">
							<li><a href="${pageContext.request.contextPath}/board/qna/list"> <img
									src="${pageContext.request.contextPath}/image/1대1문의.png">
							</a></li>
							<li><a href=""> <img src="${pageContext.request.contextPath}/image/FAQ.png">
							</a></li>
						</ul>
					</div>
					<div class="cell worktime">
						<strong>평일</strong> : 09:30 ~ 18:00 / 점심시간 : 11:30 ~ 12:40<br>
						토요일, 일요일 및 법정공휴일은 휴무입니다.<br> (근무시간 외 상담은 게시판 이용 부탁드립니다.)
					</div>
					<div class="cell email">
						<strong>Email : <a href="malito:maseukana43@gmail.com"
							class="link">maseukana43@gmail.com</a>
						</strong>
					</div>
				</div>
				<div class="cell currency">
					<h3>
						다사조 <span>/ da4jo</span>
					</h3>
					<div class="cell center">
						<a href="${pageContext.request.contextPath}">
							<img src="${pageContext.request.contextPath}/image/logotemplate.png" width="350px">
						</a>
					</div>
				</div>
				<script type="text/javascript">
				$(document).ready(function() {
				    $.ajax({
				        url: "${pageContext.request.contextPath}/rest/notice/list", // noticeRestController에 매핑
				        method: "GET", // 단순히 읽기만 함
				        success: function(response) { // 읽어들이면 동작
				            for (var i = 0; i < response.length; i++) {
				                var notice = response[i];
				                // 공지사항 제목 길면 자르기
				                var truncatedTitle = notice.noticeTitle;
				                if (notice.noticeTitle.length >= 25) {
				                    truncatedTitle = notice.noticeTitle.substring(0, 25);
				                }
				                // 새로운 <a> 요소를 생성하여 공지사항 제목을 포함시킵니다.
				                var titleLink = $("<a class='link' id='linkNotice'>").attr("href", "/board/notice/detail?noticeNo=" + notice.noticeNo).text(truncatedTitle).css("font-size", "13px");;
				                // <li> 요소를 생성하고 타이틀 링크를 하위 요소로 추가합니다.
				                var listItem = $("<div class='w-100 cell flex-cell'>").append(titleLink);
				                // 작성일을 오른쪽에 보여줍니다.
				                listItem.append($("<label class='wdate' for='linkNotice'>").text(notice.noticeWdate));
				                // footer-notice-list 클래스를 가진 요소에 <li> 요소를 추가합니다.
				                $(".notice-wrapper").append(listItem);
				            }
				        },
				        error: function(xhr, status, error) { // 엉키면...
				            console.error("띠로리...");
				        }

				    });
				});
				</script>
				<div class="cell notice" id="notice-list">
					<h3>
						공지사항 <span>/ Notice</span> <a href="${pageContext.request.contextPath}/board/notice/list"
							class="link-notice"><i class="fa-solid fa-plus"></i></a>
							<hr>
					</h3>
					<div class="cell center notice-wrapper">
					
					</div>
				</div>
			</div>
		</div>
		<div class="footer-middle"></div>
		<div class="footer-bottom"></div>
	</div>
</div>
<style>
	.notice-wrapper div > a {
	text-align: left;
		width: 81%;
	}
	.wdate {
		color: #2D3436;
	}
</style>
</main>
</body>
</html>