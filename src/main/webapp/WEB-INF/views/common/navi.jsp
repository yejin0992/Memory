<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Domine&family=Fasthand&family=Taviraj:ital,wght@1,200&display=swap" rel="stylesheet">
<style>

* {
	box-sizing: border-box;
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
	z-index: 3;
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
	background-color: #b2a08a ;
	color: white;
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
	color: #b2a08a;
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
}
</style>
</head>
<body>
	<input type="hidden" value="${loginID}">
	
		<nav class="navibar">
			<div class="navbar_logo">
				<a href="/">The Memory</a>
			</div>
			<ul class="navbar_menu">
				<li class="dropdown"><a href="/test/heartTest">
						<div class="dropdown_menu">
							<a href="/perfume/perfumeList">PERFUME</a>
						</div>
				</a></li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/perfume/perfumeBest">BEST</a>
					</div>

				</li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/freeBoard/selectList?cpage=1">COMMUNITY</a>
					</div>

				</li>
				<li class="dropdown">
					<div class="dropdown_menu">
						<a href="/qnaBoard/boardList">Q&A</a>
					</div> <input type="hidden" value="${loginID}">
				</li>
			</ul>

			<ul class="navbar_icon">
				<li><a href="/myPage/toMyPageMain">My Page</a></li>
				<li><a href="/member/logout">LOGOUT</a></li>
			</ul>

			<a href="#" class="navbar_hamburgerBtn"> <i
				class="fa-solid fa-bars"></i></a>
		</nav>

	<script>
		// 햄버거 바 클릭했을때
		const hamburgerBtn = document.querySelector('.navbar_hamburgerBtn');
		const menu = document.querySelector('.navbar_menu');
		const icon = document.querySelector('.navbar_icon');

		hamburgerBtn.onclick = function() {
			menu.classList.toggle('active');
			icon.classList.toggle('active');
		};
		
		
		$(".btn").on("click", function(){
			if(${sessionScople.loginID == null}){
				alert("로그인 먼저 진행");
				location.href="/에러페이지주소/";
			}else {
				return true;
			}
		})
	
	</script>
</body>
</html>