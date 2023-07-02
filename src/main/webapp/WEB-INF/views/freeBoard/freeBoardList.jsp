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
<title>자유게시판 목록</title>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
	font-weight: 400;
}

@font-face {
	font-family: 'KorailRoundGothicBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

* {
	font-family: 'Pretendard-Regular';
}

.titleArea {
	text-align: center;
	font-size: 30px;
	padding-top: 100px;
	padding-bottom: 50px;
}

.commentCount {
	font-family: 'KorailRoundGothicBold';
	color: red;
	margin-left: 5px;
}

.table {
	border-collapse: collapse;
}

table.table {
	background-color: white;
}

.table th, .table td {
	border: none; /* 테이블 셀의 경계선을 없앰 */
}

.container {
	margin: 0 auto;
	padding: 20px;
}

@media ( max-width : 767px) {
	/* 모바일 화면 크기에 대한 스타일 적용 */
	.hide-on-mobile {
		display: none;
	}
}

h2 {
	text-align: center;
	color:black;
}

h2 a{
	text-decoration: none; /* 링크의 밑줄 제거 */
	color:black;
}

.table-responsive {
	overflow-x: auto;
}

table td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: rgb(45, 45, 45);
	border-bottom: 3px solid rgb(52, 52, 52);
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

.searchArea {
	margin-top: 20px;
	display: flex;
	justify-content: center;
}

.button {
	display: flex;
	justify-content: flex-end;
}

#btnAdd {
	padding: 8px 20px;
	font-size: 14px;
	background-color: #b2a08a;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btnSearch {
	border: 1px solid #CBC8BF;
	background-color: white;
	color: black;
	padding: 3px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 3px; /* 버튼을 둥글게 만드는 속성 */
	margin-left: 5px;
}

.btnSearch:hover {
	background-color: #CBC8BF;
	color: white;
}

.pageArea {
	margin: 20px 0 20px 10px;
	text-align: center;
}

.pageArea a {
	text-decoration: none;
	color: #B2A08A;
}
</style>
</head>
<body>
	<div class="header">
		<c:import url="/WEB-INF/views/common/navi.jsp" />
	</div>
	<div class="titleArea">
		<a href="/freeBoard/selectList?cpage=1"><h2>COMMUNITY</h2></a>
	</div>

	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered" solid black>
				<thead>
					<tr>
						<th id="no" class="hide-on-mobile">NO</th>
						<th id="cate" class="hide-on-mobile">CATE</th>
						<th>TITLE</th>
						<th id="writer">WRITER</th>
						<th id="time" align="center">DATE</th>
						<th id="viewCount" class="hide-on-mobile">HIT</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list}">
						<c:set var="commentCount" value="${i.commentCount}" />
						<tr>
							<td class="hide-on-mobile" align="center">${i.fr_seq }</td>
							<td class="hide-on-mobile" align="center">${i.fr_category }</td>
							<td class="title"><a
								href="/freeBoard/selectBySeq?fr_seq=${i.fr_seq}">${i.fr_title}</a>
								<c:if test="${i.commentCount > 0}">
									<span class="commentCount">${i.commentCount}</span>
								</c:if></td>
							<td align="center">${i.fr_writer }</td>
							<td align="center">${i.formattedDate}</td>
							<td class="hide-on-mobile" align="center">${i.fr_view_count }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="button">
			<a href="/freeBoard/toFreeBoardWrite"><button type="button"
					id="btnAdd">글쓰기</button></a>
		</div>
		<div class="searchArea">
			<!-- <form class="table-form" action="freeBoard/searchPosts" method="get"> -->
			<select id="field" name="field">
				<option value="fr_title"
					<c:if test="${field eq 'fr_title'}">selected</c:if>>제목</option>
				<option value="fr_contents"
					<c:if test="${field eq 'fr_content'}">selected</c:if>>내용</option>
				<option value="fr_writer"
					<c:if test="${field eq 'fr_writer'}">selected</c:if>>작성자</option>
			</select> <input type="text" id="query" name="query" value="${query }" />
			<button type="button" class="btnSearch" value="검색">검색</button>
			<!-- 	</form> -->
		</div>
		<div class="pageArea">
			<c:if test="${prev}">
				<span><a href="freeBoard/selectList?cpage=${startNavi -1}">이전</a></span>
			</c:if>
			<c:forEach var="navi" begin="${startNavi }" end="${endNavi }">
				<span> <a href="/freeBoard/selectList?cpage=${navi}">${navi}</a>
				</span>
			</c:forEach>
			<c:if test="${next}">
				<span><a href="freeBoard/selectList?cpage=${endNavi +1}">다음</a></span>
			</c:if>
		</div>
	</div>
	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>

	<script>
		$(".btnSearch").on(
				"click",
				function() {
					let field = $("#field")[0].value;
					let query = $("#query")[0].value;

					console.log(field);
					console.log(query);
					location.href = "/freeBoard/selectList?cpage=1" + "&field="
							+ field + "&query=" + query;

				})
	</script>