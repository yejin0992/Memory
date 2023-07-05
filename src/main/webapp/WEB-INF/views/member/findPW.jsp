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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Find Password</title>
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

#pwBtn {
	background-color: rgb(82, 82, 82);
	color: white;
}

#idBtn {
	background-color: white;
	color: rgb(82, 82, 82);
}

#idBtn:hover {
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
	height: 100px;
	width: 400px;
	text-align: center;
	margin-top: 30%;
}

input {
	width: 100%;
	height: 35px;
	margin-top: 15px;
}

#findPwBtn {
	margin-top: 5%;
	background-color: rgb(82, 82, 82);
	color: white;
}

#findPwBtn:hover {
	background-color: darkorange;
	cursor: pointer;
}

.gotoPage {
	margin-top: 8px;
}

.gotoPage>a {
	color: darkorange;
}
</style>
</head>

<body>

	<div class="container" align="center">

		<form action="/member/findPW" method="post">
			<div class="rowbody">

				<!-- 정보 일치 하지 않을때 -->
				<c:if test="${check == 1}">
					<script>
						alert("일치하는 정보가 존재하지 않습니다.");
					</script>
				</c:if>
				
				
				
				<div class="findBox">
					<div class="findHeader">
						<b>내 계정 찾기</b>
					</div>
					<ul>
						<li><a href="/member/toFindID"><button type="button"
									id="idBtn">아이디</button></a>
							<div class="line"></div></li>
						<li><button id="pwBtn">비밀번호</button>
							<div class="line"></div></li>
					</ul>
					<div id="explain">
						가입할때 작성했던<br> 아이디,이름,이메일을 작성해주세요.
					</div>
					<div id="inputMyInfo">
						<input type="text" name="id" placeholder="  아이디"><br>
						<input type="text" name="name" placeholder="  이름"><br>
						<input type="text" name="email" placeholder="  이메일 입력하세요.">
					</div>
					<button id="findPwBtn">비밀번호 찾기</button>

					<div class="gotoPage" align="left">
						<a href="/member/loginForm">이미 아이디가 있으신가요? 로그인 하러 가기!</a>
					</div>
					<div class="gotoPage" align="left">
						<a href="/member/toJoinForm">회원가입 하러 가기</a>
					</div>
				</div>
			</div>
			</form>
			</div>

		

	<script>
		$("#pwBtn").on("click", function() {
			location.reload();
		})
	</script>
</body>

</html>