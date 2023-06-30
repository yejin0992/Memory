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

.titleArea {
	padding: 20px;
	text-align: center;
	font-size: 30px;
	padding-top: 100px;
	padding-bottom: 50px;
}
}

.titleArea h1 {
	font-size: 27px; /* 원하는 크기로 조절해주세요 */
	text-align: center;
}

.cont_wrap {
	margin-top: 40px;
	margin-bottom: 40px;
	display: flex;
	flex-direction: column;
	display: flex;
	padding: 10px;
}

.cont_wrap .item {
	border-bottom: 1px solid #959595;
	padding-bottom: 20px; /* 필요한 여백을 설정해주세요 */
	margin-bottom: 20px; /* 필요한 여백을 설정해주세요 */
	display: flex; /* 추가된 속성 */
	flex-direction: column;
	display: flex; /* 추가된 속성 */
}

.writer, .date {
	color: #959595;
	font-size: 15px;
}

.title {
	font-size: 18px;
}

.title a {
	color: black;
	text-decoration: none;
}

.title a:hover {
	color: #B2A08A;
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
		<h2>북마크</h2>
	</div>

	<div class="container">
		<div class="totalCount">
			<span>북마크한 글 <strong><span class="count">${bookmarkedPostsCount}</span></strong></span>
		</div>
		<div class="cont_wrap">
			<c:forEach var="bm" items="${bookmarked}">
				<div class="item">
					<strong class="title"><a
						href="/freeBoard/selectBySeq?fr_seq=${bm.fr_seq}">${bm.fr_title}</a></strong>
					<span class="writer">${bm.fr_writer }</span> <span class="date">${bm.formattedDate}</span>
				</div>
			</c:forEach>
		</div>
		<div class="pageArea">
			<c:if test="${prev}">
				<span><a
					href="myPage/selectBookmarkedPosts?cpage=${startNavi -1}">이전</a></span>
			</c:if>
			<c:forEach var="navi" begin="${startNavi }" end="${endNavi }">
				<span> <a href="/myPage/selectBookmarkedPosts?cpage=${navi}">${navi}</a>
				</span>
			</c:forEach>
			<c:if test="${next}">
				<span><a
					href="myPage/selectBookmarkedPosts?cpage=${endNavi +1}">다음</a></span>
			</c:if>
		</div>
	</div>
	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>