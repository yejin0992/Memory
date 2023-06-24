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
<title>찐마이페이지 메인</title>
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

.container {
	display: flex;
}

.profilePicture {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	border: 1px solid black;
}

.profilePicture img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profileInfo {
	display: flex;
	flex-direction: column;
}

.proflieStats {
	display: flex;
	align-items: stretch;
}

.bookmarks {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	margin-right: 10px;
}
</style>
</head>

<body>

	<div class="container">
		<div class="profileBox">
			<div class="profilePicture">
				<!-- 프로필 사진이 들어갈 부분 -->
				<img src="주소 어쩌구" alt="프사프사프사프사프사프사프사프사프로필사진을올리세요" />
			</div>
			<div class="profileInfo">
				<span class="username"> <!-- 아이디가 들어갈 부분 --> tester123
				</span>
				<button class="editProfileButton">프로필 수정</button>
			</div>
			<div class="profileStats">
				<!-- 프로필 하단 프로필 통계  -->
				<div class="myRecords">
					<div class="myPosts">
						<span><a href="/myPage/selectMyPost?cpage=1">작성한 글</a></span> <span>${myPostsCount}</span>
					</div>
					<div class="myComments">
						<span>작성한 댓글</span> <span>1000</span>
					</div>
				</div>
				<div class="wrapperBookmarks">
					<div class="bookmarks">
						<span>북마크</span> <span>3</span>
					</div>
				</div>
			</div>
		</div>
		<div class="likeContainer">
			<div class="wrapperPerfume">
				<h3>좋아요한 향수</h3>
				<div class="likePerfume">
					<img src="" alt="향수사진" />
				</div>
			</div>
		</div>
	</div>




</body>
</html>