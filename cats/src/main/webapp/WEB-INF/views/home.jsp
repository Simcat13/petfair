<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 스위퍼 cdn -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
    src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<style>
.text-box {
    border: 1px solid #d8d8d8;
    background-color: #f8f8f8;
    padding: 10px;
}
.swiper {
    width: 1140px;
    height: 360px;
}

h6 {
    font-size: 14px;
    margin: 10px 0 10px 0;
}
</style>


<br>
<script type="text/javascript">
    $(function() {
        var swiper = new Swiper('.banners', {
            direction : 'horizontal',
            loop : true,
            speed : 2000,
            autoplay : {
                delay : 5000,
                disableOnInteraction : false,
            },
            navigation : {
                nextEl : '.swiper-button-next',//다음버튼 선택자
                prevEl : '.swiper-button-prev',//이전버튼 선택자
            },
        // effect: 'slide',
        });

        var colors = [ "#FFE0F0", "#FCFFD2", "#F3ECDC", "#90DEF2", "#4F70D9",
                "#8A50E2", "#FFD800" ];

        swiper.on('slideChange', function() {
            var index = swiper.realIndex;
            $(".head-banner").css({
                "backgroundColor" : colors[index],
                "transition" : "background-color 3s",
            });
        });

        var swiper2 = new Swiper('.banners2', {
            direction : 'horizontal',
            loop : true,
            speed : 4000,
            slidesPerView : 2, // 동시에 보여줄 슬라이드 갯수
            spaceBetween : 30, // 슬라이드간 간격
            slidesPerGroup : 1, // 그룹으로 묶을 수
            autoplay : {
                delay : 2000,
                disableOnInteraction : false,
            },
            navigation : {
                nextEl : '.swiper-button-next',//다음버튼 선택자
                prevEl : '.swiper-button-prev',//이전버튼 선택자
            },
        });

        var swiper3 = new Swiper('.banners3', {
            loop : true,
            speed : 2000,
            effect : 'fade',
            fadeEffect: { crossFade: true },
            pagination : {
                el : '.swiper-pagination-custom',
                clickable : true,
                renderBullet : function(index, className) {
                    var pageName;
                    switch (index) {
                    case 0:
                        pageName = '미국'
                        break;
                    case 1:
                        pageName = '영국'
                        break;
                    case 2:
                        pageName = '독일'
                        break;
                    case 3:
                        pageName = '일본'
                        break;
                    case 4:
                        pageName = '중국'
                        break;
                    case 5:
                        pageName = '스페인'
                        break;
                    }
                    return '<span class="' + className + '">' + pageName
                            + '</span>';
                },
            },
        });

    });
</script>
<div class="head-banner">
    <div class="swiper banners center">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="https://via.placeholder.com/1140x360?text=Image+1">
            </div>
            <div class="swiper-slide">
                <img src="https://via.placeholder.com/1140x360?text=Image+2">
            </div>
            <div class="swiper-slide">
                <img src="https://via.placeholder.com/1140x360?text=Image+3">
            </div>
            <div class="swiper-slide">
                <img src="https://via.placeholder.com/1140x360?text=Image+4">
            </div>
            <div class="swiper-slide">
                <img src="https://via.placeholder.com/1140x360?text=Image+5">
            </div>
            <div class="swiper-slide">
                <img src="https://via.placeholder.com/1140x360?text=Image+6">
            </div>
            <div class="swiper-slide">
                <img src="https://via.placeholder.com/1140x360?text=Image+7">
            </div>
        </div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
