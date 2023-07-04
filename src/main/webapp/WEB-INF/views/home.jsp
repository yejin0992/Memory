<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<title>Memory Home</title>
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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Domine&family=Fasthand&family=Taviraj:ital,wght@1,200&display=swap"
	rel="stylesheet">
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

a {
	text-decoration: none;
	color: #525252;
}


/* ----- 네비바 ----- */
.rowheader {
	position: fixed;
	z-index: 2;
	width: 100%;
}

.navibar {
	display: flex;
	align-items: center;
	background-color: #ffffff97;
	padding: 2px 30px;
	position: relative;
}

.navbar {
	position: relative;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	padding: var(- -bs-navbar-padding-y) var(- -bs-navbar-padding-x);
}

/* 로고 */
.navbar_logo {
	font-family: 'Taviraj', serif;
	font-size: 30px;
	font-weight: bold;
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

.dropdown_menu:hover {
	color: darkorange;
	font-weight: bold;
}
.menu:hover {
color: darkorange;
}


/* 로그인 아이콘 */
.navbar_icon {
	list-style: none;
	float: right;
	position: absolute;
    right: 20px;
}

.navbar_icon li {
	padding: 8px 12px;
}

.navbar_icon li a {
	color: #525252;
}

.navbar_icon>li>a:hover {
	color: darkorange;
	font-weight: bold;
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
	
	
	.imgTextBox{
   display: none;

}

/* ----- 바디 ----- */
.carousel-control-next {
	height: 80%;
}

.carousel-item {
position: relative;
}
.imgTextBox {
position: absolute;
top: 40%;
right: 15%;
z-index: 5;
}
.perfumeName{
font-size: 50px;
cloro:  #525252;
margin: 0;
}
  
  @font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-weight: 400;
   font-style: normal;
}
   
  </style>
</head>
 <body style="font-family: 'Pretendard-Regular', sans-serif;">
	<input type="hidden" value="${loginID}">
	<div class="rowheader">
		<nav class="navibar">
		

			<c:if test="${loginID == null}">
				<div class="navbar_logo">
				<a href="/">The Memory</a>
			</div>
			<ul class="navbar_menu">
				<li class="dropdown"><a href="/test/heartTest">
						<div class="dropdown_menu">
							<a href="/member/loginForm" class="menu" onclick="alert('회원만 열람 가능합니다. 로그인 해주세요.')">PERFUME</a>
						</div>
				</a></li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/member/loginForm" class="menu" onclick="alert('회원만 열람 가능합니다. 로그인 해주세요.')">BEST</a>
					</div>
					
				</li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/member/loginForm" class="menu" onclick="alert('회원만 열람 가능합니다. 로그인 해주세요.')">COMMUNITY</a>
					</div>
					
		
				</li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/member/loginForm" class="menu" onclick="alert('회원만 열람 가능합니다. 로그인 해주세요.')">Q&A</a>
					</div> <input type="hidden" value="${loginID}">
				</li>
			</ul>
				<ul class="navbar_icon">
					<li><a href="/member/loginForm">LOGIN</a></li>
					<li><a href="/member/toJoinForm">SIGN UP</a></li>
				</ul>
			</c:if>
			
			<c:if test="${loginID != null}">
				<div class="navbar_logo">
				<a href="/">The Memory</a>
			</div>
			<ul class="navbar_menu">
				<li class="dropdown"><a href="/test/heartTest">
						<div class="dropdown_menu">
							<a href="/perfume/perfumeList" class="menu">PERFUME</a>
						</div>
				</a></li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/perfume/perfumeBest" class="menu">BEST</a>
					</div>

				</li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/freeBoard/selectList?cpage=1" class="menu">COMMUNITY</a>
					</div>

				</li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/qnaBoard/boardList" class="menu">Q&A</a>
					</div> <input type="hidden" value="${loginID}">
				</li>
			</ul>
				<ul class="navbar_icon">
					<li><a href="/myPage/toMyPageMain">MYPAGE</a></li>
					<li><a href="/member/logout">LOGOUT</a></li>
				</ul>
			</c:if>


			<a href="#" class="navbar_hamburgerBtn"> <i
				class="fa-solid fa-bars"></i></a>
		</nav>
	</div>
	<div class="rowbody">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="300000">
					<img src="/resources/n_2_u_u.jpg" class="d-block w-100" alt="...">
					<div class="imgTextBox">
					<p class="perfumeName">가브리엘 샤넬</p>
					<p>태양빛을 머금은 플로럴 향수</p>
					<input type="button" value="자세히 보기">
					</div>
					
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
	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
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


