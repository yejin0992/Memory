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
<title>내가 쓴 글 목록</title>
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
	font-family: 'Pretendard-Regular';
}
</style>
</head>

<body>

	<div class="titleArea">
		<h1>내가 쓴 글</h1>
	</div>

	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-striped" solid black>
				<thead>
					<tr>
						<th id="no" class="hide-on-mobile">글번호</th>
						<th>제목</th>
						<th id="time" align="center">날짜</th>
						<th id="viewCount" class="hide-on-mobile">조회수</th>
						<th id="replyNum" align="center">댓글수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="my" items="${myPosts}">
						<tr>
							<td class="hide-on-mobile" align="center">${my.fr_seq }</td>
							<td><a href="/freeBoard/selectBySeq?fr_seq=${my.fr_seq}">${my.fr_title}</a></td>
							<td align="center">${my.fr_write_date}</td>
							<td class="hide-on-mobile" align="center">${my.fr_view_count }</td>
							<td align="center">댓글수 아직 미완성이여요</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pageArea">
				<c:if test="${prev}">
					<span><a href="myPage/selectMyPost?cpage=${startNavi -1}">이전</a></span>
				</c:if>
				<c:forEach var="navi" begin="${startNavi }" end="${endNavi }">
					<span> <a href="/myPage/selectMyPost?cpage=${navi}">${navi}</a>
					</span>
				</c:forEach>
				<c:if test="${next}">
					<span><a href="myPage/selectMyPost?cpage=${endNavi +1}">다음</a></span>
				</c:if>
			</div>

		</div>
</body>
</html>