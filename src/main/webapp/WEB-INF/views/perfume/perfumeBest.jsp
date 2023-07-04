<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>PerfumeBest</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.17/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.17/dist/sweetalert2.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&family=Kalam&display=swap" rel="stylesheet">
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}




* {
	/* border : 1px solid grey; */
	box-sizing: border-box;
	
}

html, body {
	position: relative;
	height: 100%;
	font-family: 'Pretendard-Regular';
}

body {
	background: white;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide img {
	display: block;
	position: relative;
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: flex;
	justify-content: center;
	position: relative;
	left: 35px;
	padding: 12px;
}

.smSlide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: flex;
	justify-content: center;
	position: relative;
	left: 1px;
	padding: 12px;
	margin: 0px;
}

.mySwiper {
	height: 400px;
}

.mySwiper2 {
	height: 400px;
}

.description {
	display: block;
}

/* 버튼 */
/* .swiper-button-next:after, .swiper-button-prev:after {
	font-family: swiper-icons;
	font-size: var(- -swiper-navigation-size);
	text-transform: none !important;
	letter-spacing: 0;
	font-variant: initial;
	line-height: 1;
} */

/* .swiper-button-next, .swiper-button-prev {
	position: absolute;
	top: 30%;
	width: calc(var(- -swiper-navigation-size)/44* 27);
	height: var(- -swiper-navigation-size);
	margin-top: calc(0px - ( var(- -swiper-navigation-size)/2));
	z-index: 10;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(- -swiper-navigation-color, var(- -swiper-theme-color));
} */

.left {
	position: relative;
}

/* .swiper-button-prev, .swiper-rtl .swiper-button-next {
	left: -50px;
} */

/* .swiper-button-next, .swiper-rtl .swiper-button-prev {
	right: -50px;
} */

/* .swiper-button-next:after, .swiper-button-prev:after {
	font-family: swiper-icons;
	font-size: var(- -swiper-navigation-size);
	text-transform: none !important;
	letter-spacing: 0;
	font-variant: initial;
	line-height: 1;
} */


.swiper-button-next, .swiper-button-prev {
    position: absolute;
    top: var(--swiper-navigation-top-offset,38%);
    width: calc(var(--swiper-navigation-size)/ 44 * 27);
    height: var(--swiper-navigation-size);
    margin-top: calc(0px - (var(--swiper-navigation-size)/ 2));
    z-index: 10;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #b2a08a ;
}

:root {
    --swiper-theme-color: #525252 ;
}

.textCol {
	z-index: 30;
	font-size: 30px;
	position: absolute;
	top: 30%;
	font-weight: 600;
font-family: 'Architects Daughter', cursive;
color : #DFA8A7;
}

.textRow {
	display: flex;
	text-align: center;
}

.info {
	padding-left: 12px;
	padding-right: 12px;
}

.description {
	height: 90%;
}

.thumbnail {
	height: 80%;
}

.image {
	height: 100%;
	width: 100%;
}

.brandRow {
	padding-top: 2px;
	padding-bottom: 5px;
	color: grey;
	font-size: 15px;
}

.titleRow {
	text-align: center;
	height: 180px;
	padding-top: 50px;
	font-size : 14px;
}

.priceRow {
	padding-top: 2px;
	font-weight: 500;
	color: #c28243;
}

.fullSlide {
	padding: 0px;
	position: relative;
	left: 12px;
}

#mainImage {
	width: 100%;
	height: 100%;
	flex: 1;
	padding: 0px;
	background-color: black;
	opacity: 0.4;
}

.imageRow {
	height: 350px;
	position: static;
	top: 50px;
	display: flex;
}

#perfume {
	font-size: 25px;
	font-weight: 200;
}

.naviHead {
	position: sticky;
	top: 0;
	height: 50px;
	z-index: 2;
	background-color: white;
}

.loop{
background-color : #DFA8A7;
color : white;
width:30px;
height:30px;
position:relative;
left : 87%;
z-index:5;
padding-left:0;
padding-right:0;
 box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
 border-radius : 2px;
}

.loop2{
background-color : #DFA8A7;
color : white;
width:30px;
height:30px;
position:relative;
left : 91%;
top:30px;
z-index:5;
padding-left:0;
padding-right:0;
 box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
 border-radius : 2px;
}

.margin{
height:200px;
}

.contentImage{
height:280px;

}

.liImage{
height:100%;
width:100%;
}

.brandRkRow{
margin-left : 10px;
color : grey;
}
.nameRkRow{
margin-left : 10px;
margin-top : 10px;
font-size : 17px;
}
.priceRkRow{
margin-left : 10px;
color : #b2a08a;
font-size : 16px;
}

.priceHr{
margin-top : 5px;
margin-bottom:8px;
}

.height30{
height:30px;
}

.btnCol{
height:40px;
float:right;
}

.rkBtn{
border: none;
background-color : white;
cursor: pointer;
}

.rkBtn:hover{
color : #b2a08a;
}

.pageList{
width:30px;
height:30px;
line-height:30px;
color : grey;
}

.page{
color : grey;
}

.boardList{
cursor: pointer;
}

.boardHover{
background-color: #EBEBEB;
opacity : 0.2;
} 
</style>
</head>

<body>
	<div class="row naviHead">
			<c:import url="/WEB-INF/views/common/navi.jsp" />
		</div>
	<div class="container">
		<div class="row imageRow m-0 p-0">
			<img src="/resources/perfumeBest2.png" id="mainImage">
	</div>
		<div class="row titleRow">
			<div class=col-12>
				<span id="perfume">Best</span><br> 실시간으로 인기가 가장 많은 향수를 확인하세요
			</div>
		</div>

		<div class="row">
			<div class="col-2 left d-none d-sm-none d-md-block">
				<div class="row textRow">
					<div class="col textCol">
						Best<br> Perfume
					</div>
				</div>

			</div>
			<!-- md 사이즈때 보임 -->
			<div class="col-10 top10 d-none d-sm-none d-md-block fullSlide">
				<div class="row swiper mySwiper">
					<div class="col swiper-wrapper">
						<c:forEach var="i" items="${best}" varStatus="loop">
							<div class="row swiper-slide img" >
						<input type="hidden" value="${i.per_seq}">
						  <span class="loop">${loop.index + loop.begin + 1}</span>
								<div class="col description">
									<div class="row thumbnail">
										<img src="/perfumeImage/${i.sysName}" class="image">
									</div>
									<div class="row brandRow info">${i.per_brand }</div>
									<div class="row nameRow info">${i.per_name }</div>
									<div class="row priceRow info">
<fmt:formatNumber  type="number" maxFractionDigits="3" value="${i.per_price}" />원
</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-pagination"></div>
				</div>
			</div>


			<div class="col-3 left d-block d-md-none">
				<div class="row textRow">
					<div class="col textCol">
						Best<br> Perfume
					</div>
				</div>

			</div>
			<!-- xs, sm사이즈때 보임 -->
			<div class="col-9 top10 d-block d-md-none">
				<div class="row swiper mySwiper2">
					<div class="col swiper-wrapper">
						<c:forEach var="i" items="${best}" varStatus="loop">
							<div class="row swiper-slide img smSlide">
							<input type="hidden" value="${i.per_seq}">
								<div class="col description">
								<input type="hidden" value="${i.per_seq}">
								 <div class="loop2">${loop.index + loop.begin + 1}</div>
									<div class="row thumbnail">
										<img src="/perfumeImage/${i.sysName}" class="image">
									</div>
									<div class="row brandRow info">${i.per_brand }</div>
									<div class="row nameRow info">${i.per_name }</div>
									<div class="row priceRow info">
									<fmt:formatNumber  type="number" maxFractionDigits="3" value="${i.per_price}" />원
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
		
		<div class="row height30"></div>
		<hr>
		<div class="row height30"></div>
		
		<div class="row">
		<div class="col-12 btnCol">
			<button class="rkBtn">낮은가격</button>
			<button class="rkBtn">높은가격</button>
			<!-- <input type="hidden" id="choice" name="choice" value="1"> -->
		</div>
		</div>
		<div class="row justify-content-center">
		<div class="col-10 p-0 col-auto" id="contentList">
						<ul class="row list-group list-group-horizontal m-0">
							<c:forEach var="i" items="${list}" begin="0" end="3" step="1">
								<li class="list-group-item col-xs-12 col-sm-6 col-lg-3 boardList"
									value="${i.per_seq}">
									<div class="row contentImage">
										 <img src="/perfumeImage/${i.sysName}" class="liImage"> 
									</div>
									<div class="row brandRkRow">${i.per_brand}</div>
									<div class="row nameRkRow">${i.per_name }</div>
									<hr class="priceHr">
									<div class="row priceRkRow">
									<fmt:formatNumber  type="number" maxFractionDigits="3" value="${i.per_price}" />원
									</div>
									
								</li>
							</c:forEach>
						</ul>

						<ul class="row list-group list-group-horizontal m-0">
							<c:if test="${list.size() > 4 }">
								<c:forEach var="i" items="${list }" begin="4" end="7" step="1">
									<li class="list-group-item col-sm-6 col-lg-3 boardList"
										value="${i.per_seq}">
										<div class="row contentImage">
											 <img src="/perfumeImage/${i.sysName}" class="liImage"> 
										</div>
										<div class="row brandRkRow">${i.per_brand}</div>
										<div class="row nameRkRow">${i.per_name }</div>
										<hr class="priceHr">
										<div class="row priceRkRow">
									<fmt:formatNumber  type="number" maxFractionDigits="3" value="${i.per_price}" />원
									</div>
										
									</li>
								</c:forEach>
							</c:if>
						</ul>


						<ul class="row list-group list-group-horizontal m-0">
							<c:if test="${list.size() > 8}">
								<c:forEach var="i" items="${list }" begin="8" end="11" step="1">
									<li class="list-group-item col-sm-6 col-lg-3 boardList"
										value="${i.per_seq}">
										<div class="row contentImage">
											<img src="/perfumeImage/${i.sysName}" class="liImage"> 
										</div>
										<div class="row brandRkRow">${i.per_brand}</div>
										<div class="row nameRkRow">${i.per_name }</div>
										<hr class="priceHr">
										<div class="row priceRkRow">
									<fmt:formatNumber  type="number" maxFractionDigits="3" value="${i.per_price}" />원
									</div>
										
									</li>
								</c:forEach>
							</c:if>
						</ul>

					</div>
					</div>
					<div class="row height30"></div>
					<div class="row pageNavi">
						<nav aria-label="Page navigation example" align="center"
							id="pageNavigation">
							<ul class="pagination d-flex justify-content-center">
								<c:forEach var="i" items="${pagination}">
									<c:choose>
										<c:when test="${i eq '<<'}">
											<li class="pageList"><a class="page"
												href="/perfume/perfumeBest?cpage=${start}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '<'}">
											<li class="pageList"><a class="page"
												href="/perfume/perfumeBest?cpage=${cpage - 10}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '>'}">
											<li class="pageList"><a class="page"
												href="/perfume/perfumeBest?cpage=${cpage + 10}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '>>'}">
											<li class="pageList"><a class="page"
												href="/perfume/perfumeBest?cpage=${last}">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="pageList"><a
												class="page ${i == cpage ? 'current-page' : ''}"
												href="/perfume/perfumeBest?cpage=${i}"
												${i == cpage ? "disabled" : ""} onclick="${i == cpage ? "event.preventDefault()" : ""}" >
													${i} </a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</nav>
					</div>
					<div class="row height30"></div>
	</div>
	
<div class="row footer">
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

	<script>
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 10,
      centeredSlides: true,
      slidesPerView: 3, // 보여지는 슬라이드 수
     loop: true, // 슬라이드 무한 반복
       autoplay: {
         delay: 2500,
         disableOnInteraction: false,
       },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

    var swiper = new Swiper(".mySwiper2", {
      spaceBetween: 15,
      centeredSlides: true,
      slidesPerView: 1, // 보여지는 슬라이드 수
     loop: true, // 슬라이드 무한 반복
       autoplay: {
         delay: 2500,
         disableOnInteraction: false,
       },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
    
    $(".swiper-slide").on("click", function(){
    	let per_seq = $(this).children().val();
    	location.href="/perfume/bestSelect?per_seq="+per_seq;
    })

    
     var currentPage = ${cpage}; // 현재 페이지 번호
    var pageLinks = document.querySelectorAll(".page"); // 페이지 링크 요소들을 가져옴

    for (var i = 0; i < pageLinks.length; i++) {
      // 페이지 링크 요소들에 클릭 이벤트를 추가
      pageLinks[i].addEventListener("click", function(event) {
        if (parseInt(event.target.textContent) === currentPage) {
          // 현재 페이지 번호와 클릭한 페이지 번호가 같으면 클릭 이벤트를 막음
          event.preventDefault();
        } else {
          // 현재 페이지 번호와 클릭한 페이지 번호가 다르면 링크를 따라 이동
          window.location.href = event.target.getAttribute("href");
        }
      });
    }
    
    const currentPage2 = document.querySelector('.current-page');
    currentPage2.style.color = 'black';
    currentPage2.style.fontWeight='500';
    
    // 향수 클릭 시 디테일 뷰 이동
    $(".boardList").on("click", function(){
    	let per_seq = $(this).val();
    	location.href="/perfume/bestSelect?per_seq="+per_seq+"&cpage="+currentPage;
    })
    
    // 향수 낮은가격, 높은가격으로 정렬
    $(".rkBtn").on("click", function(){
    	if($(this).text()=="낮은가격"){
    		location.href="/perfume/perfumeBest?choice=1"
    	}else{
    		location.href="/perfume/perfumeBest?choice=0"
    	}
    })
    
    	// 향수 hover css 적용
	  $('.liImage').hover(
	    function() {
	      $(this).addClass('boardHover');
	    },
	    function() {
	      $(this).removeClass('boardHover');
	    }
	  ); 

  </script>
</body>




</html>