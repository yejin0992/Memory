<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta charset="UTF-8">

<title>Insert title here</title>
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

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #ffffff97;
	padding: 2px 30px;
	z-index: 2;
	position: fixed;
    top: 0;
    width: 100%;
}

/* 로고 */
.navbar_logo {
	font-size: large;
	margin-left: 20px;
}

.navbar_logo>a {
	color: rgb(81, 81, 81);
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
	padding-right: 20px;
}

.navbar_icon li {
	padding: 8px 12px;
}

.navbar_icon li a {
	color: rgb(81, 81, 81);
}

.navbar_icon>li>a:hover {
	color: darkorange;
}

.navbar_hamburgerBtn {
	position: absolute;
	right: 32px;
	font-size: 24px;
	display: none;
	color: rgb(81, 81, 81);
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
		z-index: 2;
	}
	.navbar_icon {
		display: none;
	}
	.navbar_menu.active {
		display: flex;
		padding-left: 0px;
	}
}
</style>
</head>
<body>
<div class="rowheader">
	<nav class="navbar">
		<div class="navbar_logo">
			<a href="/toMemberHome">MEMORY</a>
		</div>
		<ul class="navbar_menu">
			<li class="dropdown"><a href="/test/heartTest">
					<div class="dropdown_menu">Test</div>
			</a></li>
			<li class="dropdown">
				<div class="dropdown_menu">BEST</div>
				<div class="dropdown_content">
					<a href="/perfume/perfumeList">perfume main</a> <a
						href="/perfume/perfumeBest">perfume Best</a>
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
					<a href="/freeBoard/selectList?cpage=1">Free Board</a> <a
						href="/qnaBoard/boardList">Q&A</a>
				</div>
			</li>

		</ul>
		<ul class="navbar_icon">
			<li><a href="/myPage/toMyPageMain">My Page</a></li>
			<li><a href="/member/logout" >LOGOUT</a></li>
			<li><a href="/member/toMypage">EJ</a></li>
		</ul>
		<a href="#" class="navbar_hamburgerBtn"> <i
			class="fa-solid fa-bars"></i></a>
	</nav>
	
	
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