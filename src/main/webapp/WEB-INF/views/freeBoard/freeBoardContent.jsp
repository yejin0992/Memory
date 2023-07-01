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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/npm/autosize@4.0.2/dist/autosize.min.js"></script>

<title>자유게시판 상세 내역</title>
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
/* 게시판 스타일  */
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

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.form-row {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 1rem;
}

.cate {
	color: #B2A08A;
}

#writer, #viewCount, #time, #commentCount {
	color: #959595;
}

.viewCountWrapper {
	width: 60px;
	padding: 0px;
}

#writer {
	width: max-content;
}
/*내용시작  */
.contents {
	width: 400px; /* 원하는 가로 크기 */
	height: 200px; /* 원하는 세로 크기 */
	overflow: auto; /* 내용이 넘칠 경우 스크롤 생성 */
}

#contents {
	white-space: pre-line;
}

.wrContent {
	max-height: auto;
	min-height: 300px;
}

.imageContainer {
	max-width: 400px;
	max-height: auto;
}

#image {
	max-width: 100%;
}

/* 수정완료, 취소버튼 */
#btnSave {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	background-color: #8fd4e9;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#btnSave:hover {
	background-color: #0a75c7;
}
/* 댓글 스타일 */
.commentContainer {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.comment {
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
	min-height: 90px;
	height: auto;
	max-height: 200px; /* 최대 높이 */
	overflow-y: auto; /* 세로 스크롤 생성 */
}

.commentHeader {
	margin-bottom: 5px;
}

.commentWriter {
	font-weight: bold;
}

.commentDate {
	color: #888;
	font-sirgb
	(50,
	45,
	45)12px;
}

.comment-body {
	margin-top: 5px;
}

.comment-body p {
	margin: 0;
}

.comment-form {
	margin-bottom: 20px;
}

.comment-form-title {
	margin-top: 0;
}

.form-group {
	margin-bottom: 15px;
}

.form-label {
	display: block;
	font-weight: bold;
}

.form-control {
	width: 100%;
	padding: 8px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

textarea.form-control {
	resize: vertical;
	height: auto;
}

.commentForm {
	margin: 10px;
}

#btnAddComment {
	padding: 8px 20px;
	font-size: 14px;
	background-color: #b2a08a;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.button {
	display: flex;
	justify-content: flex-end;
}

#backToList, #btnMod, #btnDel {
	padding: 8px 20px;
	font-size: 14px;
	background-color: white;
	color: black;
	border: 1px solid #525252;
	border-radius: 3px;
	cursor: pointer;
	margin-left: 10px;
}

#btnAddComment {
	margin-top: 10px;
}

.btnZone {
	position: relative;
	bottom: 30px;
	float: right;
}

}
.commentUpdate:hover, .commentDelete:hover, .commentReply:hover {
	cursor: pointer;
}

.commentHeader {
	overflow: hidden; /* 부모 요소의 영역을 벗어나는 자식 요소를 감추기 위해 overflow 속성 사용 */
}

.commentUpdate {
	float: right; /* 오른쪽으로 배치 */
}

.commentDelete {
	float: right; /* 오른쪽으로 배치 */
	margin-right: 10px; /* 오른쪽 여백 추가 */
}

.commentBody #commentContents {
	border: none;
	outline: none;
	background: transparent;
	padding: 0;
	height: auto;
	min-height: 40px;
}

#commentContents {
	width: 100%;
	margin-top: -20px;
}

.fa-bookmark {
	color: #BE7856;
}

.addComment {
	display: flex;
	justify-content: flex-end;
}
</style>
</head>

<body>

	<!-- 게시판 시작  -->
	<div class="header">
		<c:import url="/WEB-INF/views/common/navi.jsp" />
	</div>
	<div class="titleArea">
		<h2>COMMUNITY</h2>
	</div>
	<div class="container">

		<!-- 말머리랑 제목 -->
		<div class="row form-group" style="display: flex;">
			<div class="mb-3 col-1">
				<span class="cate">${conts.fr_category }</span>
			</div>
			<div class="title col-7">
				<span>${conts.fr_title }</span>
			</div>
			<div class="postMeta col-4 d-flex justify-content-end">
				<span id="time" style="margin-right: 10px;">${conts.formattedDate }</span>
				<i class="fa-solid fa-eye" style="color: #b2a08a;"></i> <span
					id="viewCount" style="margin-left: 5px;">${conts.fr_view_count }</span>
				<i class="fa-solid fa-comment"
					style="color: #b2a08a; margin-left: 5px;"></i><span
					id="commentCount" style="margin-right: 10px; margin-left: 5px;">${conts.commentCount}</span>
			</div>
		</div>
		<div class="row form-group"
			style="display: flex; justify-content: space-between;">
			<span class="col-11" id="writer">${conts.fr_writer }</span>
			<div class="col-1">
				<i
					class="fa-bookmark fa-xl ${isBookmarked == 1 ? 'fa-solid' : 'fa-regular' }"></i>
				<input type="hidden" id="isBookmarked" value=${isBookmarked}>
			</div>
		</div>

		<hr class="separator">

		<!-- 내용 -->
		<div class="mb-3">
			<div class="wrContent">
				<div class="imageContainer">
					<c:forEach items="${imageList}" var="image">
						<img id="image" src="/freeImages/${image.sysName}" alt="게시판 이미지">
					</c:forEach>
				</div>
				<p id="contents">${conts.fr_contents}</p>
			</div>
		</div>
		<hr class="separator">
		<div class="button">
			<a href="${cpage}"><button type="button" id="backToList">목록</button></a>
			<a href="/freeBoard/toUpdateForm?fr_seq=${conts.fr_seq }"><button
					type="button" id="btnMod">수정</button></a>
			<button type="button" id="btnDel">삭제</button>
		</div>
		<hr class="separator">
		<!-- 게시판 끝 -->
		<!-- 댓글창 시작 -->
		<div class="mb-3 commentContainer">
			<!-- 댓글들 -->
			<c:forEach var="i" items="${list}">
				<div class="comment">
					<div class="commentHeader">
						<span class="commentWriter">${i.re_writer}</span> <span
							class="commentDate">${i.formattedDate}</span> <span
							class="commentReply">답글달기</span> <input type="hidden"
							value="${i.re_seq }" id="re_seq" name="re_seq"> <input
							type="hidden" name="fr_seq" value="${conts.fr_seq}">
					</div>
					<form action="/frReply/updateComment" method="post">
						<c:choose>
							<c:when test="${loginID eq i.re_writer}">
								<div class="btnZone">
									<span class="commentUpdate" onclick="updateComment()">수정</span>
									<span class="commentDelete" onclick="deleteComment()">삭제</span>
								</div>
							</c:when>
						</c:choose>
						<div class="commentBody">
							<textarea id="commentContents" class="autosize"
								name="re_contents" maxlength="250" readonly>${i.re_contents}</textarea>
							<input type="hidden" value="${i.re_seq }" id="re_seq"
								name="re_seq"> <input type="hidden" name="fr_seq"
								value="${conts.fr_seq}">
						</div>
					</form>
				</div>
			</c:forEach>


		</div>

		<!-- 댓글들 끝 -->
		<!-- 댓글 다는 창 시작  -->
		<div class="commentForm">
			<form>
				<div class="formGroup">
					<textarea id="commentContent" name="re_contents"
						class="form-control" rows="3" maxlength="250"
						placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
				</div>
				<div class="addComment">
					<button type="button" id="btnAddComment">등록</button>
				</div>
			</form>
		</div>
		<!-- 댓글다는창 끝 -->
	</div>
	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>




	<script>
		//댓글창 출력시 크기 자동조절 
		document.addEventListener('DOMContentLoaded', function() {
			autosize(document.querySelectorAll('.autosize'));
		});

		//게시글 삭제 
		const btnDel = document.getElementById('btnDel');
		btnDel.addEventListener('click', function() {
			console.log("게시판 삭제버튼 클릭함");
			let fr_seq = "${conts.fr_seq}";
			console.log("게시판 시퀀스 잘 가져왔는지 확인 : " + fr_seq);
			if (confirm("이 글을 삭제하시겠습니까?")) {
				console.log("삭제 확인 버튼 클릭함");
				location.href = "/freeBoard/deleteBoard?fr_seq=" + fr_seq;
			} else {
				// 취소시 아무런 동작 안함
			}
		});

		// 댓삭
		function deleteComment() {
			//find, parent, next, prev 
			// 삭제 span태그 요소 가져오기 
			console.log("삭제버튼 클릭하면");
			let btn_zone = $(event.target).parent();
			let re_seq = btn_zone.parent().find('#re_seq').val();
			//event.target은 이벤트 핸들러가 호출될 때 해당 이벤트가 발생한 요소를 가리키는 jQuery 객체
			console.log("re_seq: " + re_seq);
			let fr_seq = "${conts.fr_seq}";
			console.log("fr_seq : " + fr_seq);
			if (confirm("댓글을 삭제하시겠습니까?")) {
				console.log("삭제 확인 버튼 클릭시");
				let deleteURL = "/frReply/deleteComment?re_seq=" + re_seq
						+ "&fr_seq=" + fr_seq;
				window.location.href = deleteURL;
			} else {
				//취소시 아무런 동작 안함; 
			}
		}
		//댓수정
		function updateComment() {
			console.log("수정버튼 클릭하면");
			let btn_zone = $(event.target).parent();
			btn_zone.empty();
			let re_seq = btn_zone.parent().find('#re_seq').val();
			console.log("re_seq : " + re_seq);
			btn_zone.next().find("#commentContents").removeAttr("readonly");

			btn_zone.parent().prev().find(".commentDate").hide();// 날짜
			btn_zone.parent().prev().find(".commentReply").hide();// 답글달기

			let saveUpdate = $("<button>").attr("id", "saveUpdate");
			let cancel = $("<button>").attr("id", "cancel");
			saveUpdate.text("등록");
			cancel.text("취소");

			saveUpdate.attr("type", "submit");
			saveUpdate.css("background-color", "transparent");
			saveUpdate.css("border", "none");
			saveUpdate.css("padding", "0");
			saveUpdate.css("cursor", "pointer");

			cancel.css("background-color", "transparent");
			cancel.css("border", "none");
			cancel.css("padding", "0");
			cancel.css("cursor", "pointer");
			cancel.css("margin-left", "10px");

			btn_zone.append(saveUpdate);
			btn_zone.append(cancel);

			$("#cancel").on("click", function() {
				history.back();
			});

		}
		// 북마크 

		$(".fa-bookmark").on(
				"click",
				function() {
					if ($(this).hasClass("fa-regular")) {
						// "fa-regular" 클래스를 가지고 있는 경우의 처리 (빈북마크 아이콘일때)
						console.log("fa-regular 클래스를 가지고 있습니다.");
						let isBookmarked = $("#isBookmarked").val();

						let fr_seq = "${conts.fr_seq}";

						// 북마크 상태에 따라 아이콘 업데이트 및 서버 요청 수행
						if (isBookmarked == "0") {
							// 북마크가 되어 있지 않은 상태
							$(this).removeClass("fa-regular false").addClass(
									"fa-solid true");

							// 북마크 추가를 위한 AJAX 요청
							$.ajax({
								url : "/bookmark/insertBookmark",
								type : "POST",
								data : {
									"fr_seq" : fr_seq
								},
								success : function(resp) {
									console.log("북마크 추가 요청 성공");
									console.log(resp);
									console.log("북마크 결과: " + isBookmarked);
								},
								error : function(xhr, status, error) {
									console.log("북마크 추가 요청 실패");
									console.log(xhr);
									console.log(status);
									console.log(error);
								}
							});
						}
					} else {
						// "fa-regular" 클래스를 가지고 있지 않은 경우의 처리 (꽉찬 북마크 아이콘일 때)
						console.log("fa-regular 클래스를 가지고 있지 않습니다.");
						$(this).removeClass("fa-solid true").addClass(
								"fa-regular false");
						let fr_seq = "${conts.fr_seq}";
						let isBookmarked = $("#isBookmarked").val();

						// 북마크 삭제를 위한 AJAX 요청
						$.ajax({
							url : "/bookmark/deleteBookmark",
							type : "POST",
							data : {
								"fr_seq" : fr_seq
							},
							success : function(resp) {
								console.log("북마크 삭제 요청 성공");
								console.log("북마크 결과: " + isBookmarked);
								console.log(resp);
							},
							error : function(xhr, status, error) {
								console.log("북마크 삭제 요청 실패");
								console.log(xhr);
								console.log(status);
								console.log(error);
							}
						});
					}
				});

		// ajax로 댓글 작성하기
		$("#btnAddComment")
				.on(
						"click",
						function() {
							console.log("클릭은 되냐");
							let re_contents = $("#commentContent").val();
							console.log("댓글 내용: ", re_contents);
							let fr_seq = "${conts.fr_seq}";
							console.log("본문 글 시퀀스 : ", fr_seq);

							$
									.ajax({
										url : "/frReply/insertComment",
										type : "post",
										data : {
											re_contents : re_contents,
											fr_seq : fr_seq
										}
									})
									.done(
											function(resp) {
												if (resp > 0) {
													console.log("잘insert됨 : ",
															resp);
													window.location.href = "/freeBoard/selectBySeq?fr_seq="
															+ fr_seq;
												} else {
													console.log("댓글 작성 실패");
												}

											}).fail(
											function(xhr, status, error) {
												console.log(xhr);
												console.log(status);
												console.log(error);
											});
						});
	</script>






</body>
</html>