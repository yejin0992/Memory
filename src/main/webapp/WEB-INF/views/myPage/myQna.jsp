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
<title>QNA에서 쓴 글</title>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}

@font-face {
	font-family: 'KorailRoundGothicBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

.commentCount {
	font-family: 'KorailRoundGothicBold';
	color: blue;
	margin-left: 5px;
}

h2 {
	text-align: center;
	color: #555555;
}

.titleArea {
	text-align: center;
	font-size: 30px;
	padding-top: 100px;
	padding-bottom: 50px;
}

.table {
	border-collapse: collapse;
	margin-top: 20px;
	margin-bottom: 20px;
}

table.table {
	background-color: white;
}

.table th, .table td {
	border: none; /* 테이블 셀의 경계선을 없앰 */
}

#time, #no, #cate, #writer, #viewCount, #replyNum {
	text-align: center;
}

.title a {
	color: black;
	text-decoration: none;
}

.title a:hover {
	color: #B2A08A;
}

.pageArea {
	margin: 50px 0 20px 10px;
	text-align: center;
}

.pageArea a {
	text-decoration: none;
	color: #B2A08A;
}
/* 사이드네비게이션바(snb) */
@media ( max-width : 767px) {
	.snb {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.snb li {
		margin-bottom: 10px;
	}
}

li {
	postion: relative;
	display: inline-block;
}

.text_item {
	display: block;
	position: relative;
	padding-bottom: 20px;
	font-size: 20px;
	margin-right: 7px;
}

.snb ul li a.active .text_item:after {
	position: absolute;
	bottom: 0;
	left: 0;
	z-index: 9;
	width: 100%;
	height: 4px;
	background-color: #333;
	content: '';
}
</style>
</head>

<body>
	<div class="header">
		<c:import url="/WEB-INF/views/common/navi.jsp" />
	</div>
	<div class="titleArea">
		<h2>내가 쓴 글</h2>
	</div>
	<div class="container">
		<div class="snb">
			<Ul>
				<li><a class="active" href="selectMyPost?cpage=1"><span
						class="text_item">자유게시판</span></a></li>
				<li><a class="active" href="selectMyQna"><span
						class="text_item">Q&A</span></a></li>
			</Ul>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered" solid black>
				<thead>
					<tr>
						<th id="no" class="hide-on-mobile">NO</th>
						<th>TITLE</th>
						<th id="time" align="center">DATE</th>
						<th id="viewCount" class="hide-on-mobile">HIT</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="my" items="${myQnaList}">
						<tr>
							<td class="hide-on-mobile" align="center">${my.qa_seq }</td>
							<a href="/qnaBoard/viewCount?qa_seq=${my.qa_seq}&qnaCpage=${qnaCpage}"><td class="title">${my.qa_title}</td></a>
							<td align="center">${my.detailDate}</td>
							<td class="hide-on-mobile" align="center">${my.qa_view_count }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>