<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- JavaScript Bundle with Popper -->
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
<meta charset="UTF-8">
<title>getMyID</title>


<style>
* {
	box-sizing: border-box;
	/* border: 1px solid black; */
}

.rowbody {
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

.findBox {
	width: 400px;
}

.findHeader {
	font-size: 30px;
	padding: 6%;
	color: rgb(82, 82, 82);
}

button {
	border: none;
	font-size: 14px;
	width: 100%;
	height: 40px;
}

ul {
	padding: 0%
}

li {
	float: left;
	list-style-type: none;
	width: 50%;
	margin: 0%;
}

#idBtn {
	background-color: rgb(82, 82, 82);
	color: white;
}

#pwBtn {
	background-color: white;
	color: rgb(82, 82, 82);
}

#pwBtn:hover {
	color: darkorange;
	font-weight: bold;
	cursor: pointer;
}

.line {
	height: 5px;
	background-color: rgb(82, 82, 82);
	padding: 0%;
}

#explain {
	height: 70px;
	width: 400px;
	text-align: center;
	margin-top: 27%;
}

#getIdBox {
	height: 70px;
	width: 100%;
	background-color: rgb(248, 248, 248);
	display: flex;
	justify-content: center;
	align-items: center;
}

#login {
	margin-top: 10%;
	background-color: rgb(82, 82, 82);
	color: white;
}

#login:hover {
	background-color: darkorange;
	cursor: pointer;
}
</style>

</head>

<body>
	<div class="rowbody" align="center">
		<div class="findBox">
			<div class="findHeader">
				<b>아이디/비밀번호 찾기</b>
			</div>

			<ul>
				<li><button id="idBtn">아이디</button>
					<div class="line"></div></li>
				<li><a href="/member/toFindPW"><button type="button"
									id="pwBtn">비밀번호</button></a>
					<div class="line"></div></li>
			</ul>

			<div id="explain">회원님의 계정을 찾았습니다.</div>

			<div id="getIdBox">
				<b>${findID}</b>
			</div>
			<div>
				<a href="/member/loginForm"><button id="login">로그인</button></a>
			</div>
		</div>
	</div>
</body>
</html>