<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap"
	rel="stylesheet">
<title>Home</title>

<!-- bootstrap cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<style>
* {
	box-sizing: border-box;
}

:root { -
	-text-color: black; -
	-background-color: pink; -
	-a-color: rgb(108, 108, 108);
}

body {
	margin: 0%;
}
/* font-family: 'Source Sans Pro'; */
a {
	text-decoration: none;
}

/* ----- 네비바 ----- */
/*  position:fixed;*/
.rowheader {
	position: fixed;
	z-index: 1;
	width: 100%;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #ffffff97;
	padding: 2px 30px;
}

/* 로고 */
.navbar_logo {
	font-size: large;
}

.navbar_logo>a {
	color: var(- -a-color);
}

/* 네비메뉴 */
nav ul {
	list-style-type: none;
	margin: 0;
}

nav ul li {
	display: inline-block;
}

.dropdown {
	position: relative;
}

.dropdown_menu {
	color: rgb(81, 81, 81);
	padding: 10px 12px;
	font-size: 16px;
	cursor: pointer;
}

.dropdown_content {
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	display: none;
}

.dropdown_content a {
	color: black;
	padding: 7px 16px;
	text-decoration: none;
	display: block;
}

.dropdown_content a:hover {
	color: rgb(167, 167, 167);
}

.dropdown_menu:hover:not(.home) {
	background-color: darkorange;
	color: white;
}

.dropdown:hover .dropdown_content {
	display: block;
}

/* 로그인 아이콘 */
.navbar_icon {
	list-style: none;
}

.navbar_icon li {
	padding: 8px 12px;
}

.navbar_icon li a {
	color: var(- -a-color);
}

.navbar_icon>li>a:hover {
	color: darkorange;
}

.navbar_hamburgerBtn {
	position: absolute;
	right: 32px;
	font-size: 24px;
	display: none;
	color: var(- -a-color);
}

@media screen and (max-width:830px) {
	/* 네비 */
	.navbar {
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 24px;
	}
	.navbar_menu {
		display: none;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
	.navbar_menu li {
		width: 100%;
		text-align: center;
	}
	.navbar_hamburgerBtn {
		display: block;
	}
	.navbar_icon {
		display: none;
		padding-right: 150px;
	}
	.navbar_menu.active {
		display: flex;
	}

	/* 푸터 */
	.rowfooter {
		flex-direction: column;
		height: 100%;
	}
}

/* ----- 바디 ----- */
.carousel-control-next {
	height: 80%;
}

/* ----- 푸터 ----- */
.rowfooter {
	width: 100%;
	height: 100%;
	background-color: rgb(232, 232, 232);
	padding: 20px;
	display: flex;
}

.rowfooter>.footer_menu1 {
	flex-grow: 3;
}

.rowfooter>.footer_menu2 {
	flex-grow: 3;
}

.rowfooter>.footer_menu3 {
	flex-grow: 2;
}

.rowfooter .head {
	font-weight: bold;
	font-size: x-large;
}

.rowfooter .line {
	width: 90%;
	color: rgb(128, 128, 128);
}

.rowfooter i {
	font-size: 30px;
	padding-right: 10px;
	color: grey;
}
</style>
</head>

<body>
	<div class="rowheader">
		<nav class="navbar">
			<div class="navbar_logo">
				<a href="/">MEMORY</a>
			</div>
			<ul class="navbar_menu">
				<li class="dropdown">
					<a href="/test/heartTest">
					<div class="dropdown_menu">Test</div></a>
					
				</li>
				<li class="dropdown">
					<div class="dropdown_menu">BEST</div>
					<div class="dropdown_content">
						<a href="/perfume/perfumeList">perfume main</a> 
						<a href="/perfume/perfumeBest">perfume Best</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown_menu">SHOP</div>
					<div class="dropdown_content">
						<a href="#">1</a> <a href="#">2</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown_menu">CUMMUNITY</div>
					<div class="dropdown_content">
						<a href="/freeBoard/selectList?cpage=1">Free Board</a> 
						<a href="/qnaBoard/boardList">Q&A</a>
					</div>
				</li>
				
			</ul>
			<ul class="navbar_icon">
				<li><a href="/member/loginForm">LOGIN</a></li>
				<li><a href="/member/toJoinForm">Sign up</a></li>
				<li><a href="#">SERCH</a></li>
			</ul>
			<a href="#" class="navbar_hamburgerBtn"> <i
				class="fa-solid fa-bars"></i></a>
		</nav>
	</div>
	<div class="rowbody">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="3000">
					<img src="/resources/n_2_u_u.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="3000">
					<img src="/resources/y_1_u.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="3000">
					<img src="/resources/b_1_u.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="rowfooter">
		<div class="footer_menu1">
			<div class="head">COMPANY INFO</div>
			<div class="line">COMPANY : PERFUME</div>
			<div class="line">OWNER :홍길동</div>
			<div class="line">ADDRESS : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩)
				2F, 3F</div>
			<div class="line">CPO : 홍길동(hgd@naver.com)</div>
			<div class="line">BUSINESS LICENSE : 000-00-00000</div>
		</div>
		<div class="footer_menu2">
			<div class="head">CONTECT</div>
			<div class="line">
				TEL : 02-1234-1234<br> MON-FRI AM 9:00 - PM 17:00<br>
				LUNCH TIME PM 12:00 -PM 13:00
			</div>
			<div class="head">BANK ACCOUNT</div>
			<div class="line">
				예금주 홍길동<br> 우리은행 123-4567-8900
			</div>
		</div>
		<div class="footer_menu3">
			<div class="head">SNS</div>
			<a href="#"><i class="fa-brands fa-square-instagram"></i></a> <a
				href="#"> <i class="fa-brands fa-square-facebook"></i></a> <a
				href="#"><i class="fa-brands fa-square-youtube"></i></a>

		</div>
	</div>
	<script>
		// 햄버거 바 클릭했을때
		const hamburgerBtn = document.querySelector('.navbar_hamburgerBtn');
		const menu = document.querySelector('.navbar_menu');
		const icon = document.querySelector('.navbar_icon');

		hamburgerBtn.onclick = function() {
			menu.classList.toggle('active');
			icon.classList.toggle('active');
		};
	</script>

</body>

</html>


