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
	font-family: "Dovemayo_gothic";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2")
		format("woff2");
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: "Dovemayo_gothic";
}

.table {
	border-collapse: collapse;
}

.table th, .table td {
	border: none; /* 테이블 셀의 경계선을 없앰 */
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

@media ( max-width : 767px) {
	/* 모바일 화면 크기에 대한 스타일 적용 */
	.hide-on-mobile {
		display: none;
	}
}

h1 {
	text-align: center;
}

.table-responsive {
	overflow-x: auto;
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
}

.btnSearch {
	border: 1px solid #CBC8BF;
	background-color: white;
	color: black;
	padding: 3px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 3px; /* 버튼을 둥글게 만드는 속성 */
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
		<h1>자유게시판</h1>
	</div>

	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-striped" solid black>
				<thead>
					<tr>
						<th id="no" class="hide-on-mobile">글번호</th>
						<th id="cate" class="hide-on-mobile">말머리</th>
						<th>제목</th>
						<th id="writer">글쓴이</th>
						<th id="time" align="center">날짜</th>
						<th id="viewCount" class="hide-on-mobile">조회수</th>
						<th id="replyNum" align="center">댓글수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list}">
						<tr>
							<td class="hide-on-mobile" align="center">${i.fr_seq }</td>
							<td class="hide-on-mobile" align="center">${i.fr_category }</td>
							<td class="title"><a
								href="/freeBoard/selectBySeq?fr_seq=${i.fr_seq}">${i.fr_title}</a></td>
							<td align="center">${i.fr_writer }</td>
							<td align="center">${i.fr_write_date}</td>
							<td class="hide-on-mobile" align="center">${i.fr_view_count }</td>
							<td align="center">댓글수 아직 미완성이여요</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="button">
			<a href="/freeBoard/toFreeBoardWrite"><button type="button"
					id="btnAdd" class="btn btn-primary">글쓰기</button></a>
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