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
	margin: 80px;
	display: flex;
}

.profileBox {
	width: 220px;
	height: 350px;
	border: 1.2px solid #CBC8BF;
	padding: 20px;
	box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
	border-radius: 5px;
}

.profileInfo {
	display: flex;
	align-items: center;
	justify-content: center;
}

.editProfileButton {
	padding: 5px 10px;
	background-color: white;
	border: 1px solid #CBC8BF;
	width: 80px;
	height: 30px;
	border-radius: 5px;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
}

.editProfileButton a {
	text-decoration: none;
	color: black;
}

.profilePicture {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	border: 1px solid #CBC8BF;
	margin: 0 auto; /* 추가: 가로 방향 중앙 정렬 */
}

.profilePicture img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profileInfo {
	display: flex;
	flex-direction: column;
	margin: 10px;
}

.wrapperBtnEdit {
	margin: 10px;
}

.myPosts a, .myComments span {
	text-decoration: none; /* 텍스트에 밑줄 제거 */
	color: black;
}

.myPosts a:hover {
	color: #B2A08A;
}

.profileStats {
	display: flex;
	align-items: stretch;
	justify-content: space-between;
	width: 100%;
	height: calc(100% -194px);
}

.myRecords {
	height: 68px;
	display: flex;
	flex-direction: column;
	flex-grow: 1;
}

.wrapperBookmarks {
	
}

.bookmarks {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
}

.bookmarkIcon {
	margin: 10px;
}

.likeContainer {
	margin-left: 80px;
}

.myComments {
	font-size: 14px;
}
</style>
</head>

<body>
	<div class="header">
		<c:import url="/WEB-INF/views/common/navi.jsp" />
	</div>
	<div class="container">
		<div class="profileBox">
			<div class="profilePicture">
				<!-- 프로필 사진이 들어갈 부분 -->
				<img src="주소 어쩌구" alt="" />
			</div>
			<div class="profileInfo">
				<div class="userName">
					<span class="username"><strong>${loggedID}</strong></span>
				</div>
				<div class="wrapperBtnEdit">
					<button class="editProfileButton">
						<a href="/myPage/toUpdateMyInfo">Edit</a>
					</button>
				</div>
			</div>
			<div class="profileStats">
				<div class="myRecords">
					<div class="myPosts">
						<span><a href="/myPage/selectMyPost?cpage=1">작성한 글</a></span> <span>${myPostsCount}</span>
					</div>
					<div class="myComments">
						<span>작성한 댓글 999+</span>
					</div>
				</div>
				<div class="wrapperBookmarks">
					<div class="bookmarks">
						<div class="bookmarkIcon">
							<a href="/myPage/selectBookmarkedPosts"><i
								class="fa-regular fa-bookmark fa-2xl" style="color: #b2a08a;"></i></a>
						</div>
						<span style="text-align: center;">북마크
							${bookmarkedPostsCount }</span>
					</div>
				</div>
			</div>
		</div>
		<div class="likeContainer">
			<div class="wrapperPerfume">
				<h3>
					<strong>Liked Perfume</strong>
				</h3>
				<div class="likePerfume">
					<c:forEach items="${likedPerfume }" var="image">
						<img src="perfumeImage/${image.sysName}" alt="향수 이미지" />
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>




</body>
</html>