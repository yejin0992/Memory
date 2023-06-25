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
<title>북마크한 글</title>
<style>
</style>
</head>

<body>

	<div class="titleArea">
		<h1>북마크</h1>
	</div>

	<div class="container">
		<div class="totalCount">
			<span>북마크한 글 ${bookmarkedPostsCount}</span>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-striped" solid black>
				<thead>
					<tr>
						<th>제목</th>
						<th id="writer">글쓴이</th>
						<th id="time" align="center">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bm" items="${bookmarked}">
						<tr>
							<td><a href="/freeBoard/selectBySeq?fr_seq=${bm.fr_seq}">${bm.fr_title}</a></td>
							<td align="center">${bm.fr_writer }</td>
							<td align="center">${bm.fr_write_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pageArea">
				<c:if test="${prev}">
					<span><a href="myPage/selectBookmarkedPosts?cpage=${startNavi -1}">이전</a></span>
				</c:if>
				<c:forEach var="navi" begin="${startNavi }" end="${endNavi }">
					<span> <a href="/myPage/selectBookmarkedPosts?cpage=${navi}">${navi}</a>
					</span>
				</c:forEach>
				<c:if test="${next}">
					<span><a href="myPage/selectBookmarkedPosts?cpage=${endNavi +1}">다음</a></span>
				</c:if>
			</div>
		</div>
</body>
</html>