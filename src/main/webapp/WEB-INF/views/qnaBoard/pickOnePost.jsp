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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
.borderName {
	font-size: 30px;
	padding-top: 100px;
}

input[type="text"] {
	border: none;
	outline: none;
	background-color: transparent;
	border-bottom: 1px solid black;
}

#title {
	width: 100%;
	margin-top: 20px;
	font-size: 30px;
}

#content {
	overflow: hidden;
	min-height: 300px;
	max-height: 100%;
	width: 100%;
	margin-top: 22px;
	font-size: 18px;
	padding: 20px;
	resize: none;
	border-color: #dddddd;
	pointer-events: none;
	border: none;
}

#content:focus {
	outline: none;
}

#content_info {
	color: #999999;
	font-size: 13px;
	padding: 8px;
}

.content_info_name {
	font-weight: bold;
	color: rgb(73, 73, 73);
}

/* content 버튼 */
#backBtn, #deleteBtn, #updateBtn {
	border: 1px solid rgb(210, 210, 210);
	background-color: white;
	margin-right: 10px;
	margin-top: 10px;
	border-radius: 3px;
	width: 80px;
	height: 35px;
}

/*   .btn:hover{
      background-color: darkorange;
      color: white;
      font-weight: bold;
      border: none;
    } */

/* 댓글입력 */
#replyContainer {
	border: 1px solid #dddddd;
	height: 120px;
	border-radius: 5px;
}

#replyHead {
	height: 30%;
	padding: 2px 20px;
	background-color: #dddddd;
}

#replyHead>#writer {
	font-weight: bold;
	fond-size: 20px;
	border-bottom:none;
}

#replyBody {
	height: 70%;
}

.textarea {
	width: 90%;
	height: 100%;
	resize: none;
	border: none;
	padding-left: 20px;
}

.textarea:focus {
	outline: none;
}

#reply_insert_btn {
	width: 10%;
}

#reply {
	border: none;
	background-color: #dddddd;
	border-radius: 3px;
	margin-top: 25%;
	margin-right: 10px;
	padding: 5px 8px;
}

#reply:hover {
	cursor: pointer;
	background-color: darkorange;
}

#msg {
	width: 90%;
	height: 100%;
}

/* 댓글 수정,삭제,출력 */
#nextreply {
	border: 1px solid #dddddd;
	width: 100%;
	height: 140px;
	padding: 4px 20px;
	border-radius: 7px;
}

#box {
	padding-bottom: 1%;
}

#reply_date {
	color: #999999;
	width: 80%;
}

#nextReply_btn {
	width: 20%;
}

.reply_btn {
	border: 1px solid rgb(210, 210, 210);
	background-color: white;
	border-radius: 3px;
	margin-right: 10px;
}

#nextReply_textarea {
	height: 50%;
	width: 100%;
}

.footer {
	margin-top: 50px;
}
</style>
</head>

<body>

	<c:if test="${param.status == 'update' }">
		<script>
			alert("수정 완료 했습니다.");
		</script>
	</c:if>

	<div class="head">
		<c:import url="/WEB-INF/views/common/navi.jsp" />
	</div>
	<div class="container">
		<form
			action="/qnaBoard/updatePost?qa_seq=${post.qa_seq}&qa_write_date=${post.qa_write_date}"
			method="post">

			<div class="body">
				<div class="borderName">Q & A</div>
				<hr>
				<input type="text" id="title" name="qa_title"
					value="${post.qa_title }" readonly>
				<div id="content_info">
					<span class="content_info_name">작성자 |</span> ${post.qa_writer} <span
						class="content_info_name">작성일 |</span> ${post.qa_write_date} <span
						class="content_info_name">조회수 |</span> ${post.qa_view_count}
				</div>

				<div id="contentBox">
					<textarea id="content" name="qa_contents"
						value="${post.qa_contents}" readonly>${post.qa_contents}
		 	        </textarea>
					<c:forEach var="i" items="${file}">
						<img src="/qnaUpload/${i.sysName}">
					</c:forEach>
				</div>

				<c:choose>
					<c:when test="${loginID eq post.qa_writer}">

						<div id="btnArea" align="right">
							<a href="/qnaBoard/boardList"> <input type="button"
								id="backBtn" class="btn" value="목록"></a> <a
								href="/qnaBoard/delete?qa_seq=${post.qa_seq}"> <input
								type="button" id="deleteBtn" class="btn" value="삭제"></a> <input
								type="button" id="updateBtn" class="btn" value="수정">
						</div>


					</c:when>
					<c:otherwise>

						<div id="btnArea" align="right">
							<a href="/qnaBoard/boardList"> <input type="button"
								id="backBtn" class="btn" value="목록"></a>
						</div>

					</c:otherwise>
				</c:choose>
			</div>
			<input type="hidden" name="qa_seq" value="${post.qa_seq}">
		</form>


		<!-- 댓글 출력 / 수정 / 삭제 -->

		<c:forEach var="r" items="${reply}">
			<hr>
			<form action="/reply/replyUpdate" method="post">
				<div id="nextreply">
					<div id="reply_id">
						<b>${r.re_writer}</b>
					</div>
					<textarea id="nextReply_textarea" class="textarea"
						name="re_contents" readonly>${r.re_contents}</textarea>

					<c:choose>
						<c:when test="${loginID eq r.re_writer}">
							<div id="box" style="display: flex;">
								<div id="reply_date">${r.re_write_date}</div>
								<div id="nextReply_btn" align="right">
									<input type="button" id="re_updateBtn" class="reply_btn"
										value="수정"> <a
										href="/reply/replyDelete?qa_seq=${r.qa_seq}&re_seq=${r.re_seq}">
										<input type="button" id="re_deleteBtn" class="reply_btn"
										value="삭제">
									</a>
								</div>
							</div>
						</c:when>

					</c:choose>
					<input type="hidden" name="qa_seq" value="${r.qa_seq}"> <input
						type="hidden" name="re_seq" value="${r.re_seq}">
				</div>
			</form>
		</c:forEach>

		<!-- 댓글 입력 -->
		<form action="/reply/replyInsert" method="post">
			<hr>
			<div id="replyContainer">
				<div id="replyHead">
					<input type="text" id="writer" value="${sessionScope.loginID}"
						name="re_writer" readonly>
				</div>
				<div id="replyBody" style="display: flex;">
					<div id="msg">
						<textarea class="textarea" name="re_contents"></textarea>
					</div>
					<div id="reply_insert_btn" align="right">
						<input type="submit" id="reply" value="등록">
					</div>
				</div>
				<input type="hidden" name="qa_seq" value="${post.qa_seq}">
			</div>
		</form>

	</div>

	<div class="footer">
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>

	<script>

		// 게시글 수정 버튼
		$("#updateBtn").on("click", function() {
			/* 
			  // 파일 선택 버튼 클릭 이벤트 핸들러
			  var fileBox = '<div class="filebox">' +
			    '<input class="upload-name" value="첨부파일" placeholder="첨부파일">' +
			    '<label for="file" align="center">파일찾기</label>' +
			    '<input type="file" id="file" name="files" value="${file}" multiple>' +
			    '</div>';
			  
			  // 파일 선택 창을 추가할 위치를 지정하여 HTML 코드를 추가
			  $("#someContainer").append(fileBox);
			 */
			$("#content").css({
				"pointer-events" : "auto",
				"resize" : "auto"
			});
			$("#title").removeAttr("readonly");
			$("#content").removeAttr("readonly");
			$("#updateBtn,#deleteBtn").css("display", "none");

			let updateComplete = $("<input>");
			updateComplete.attr("value", "완료");
			updateComplete.attr("type", "submit");
			updateComplete.css({
				"border" : "1px solid rgb(210, 210, 210)",
				"background-color" : "white",
				"margin-right" : "10px",
				"margin-top" : "10px",
				"border-radius" : "3px",
				"width" : "80px",
				"height" : "35px"
			});

			let cancel = $("<input>");
			cancel.attr("type", "button");
			cancel.attr("value", "취소");
			cancel.css({
				"border" : "1px solid rgb(210, 210, 210)",
				"background-color" : "white",
				"margin-right" : "10px",
				"margin-top" : "10px",
				"border-radius" : "3px",
				"width" : "80px",
				"height" : "35px"
			});
			cancel.on("click", function() {
				location.reload();
			});
			$("#btnArea").append(updateComplete);
			$("#btnArea").append(cancel);
		});
		
		// 댓글 수정하기 버튼
		$("#re_updateBtn").on("click", function() {

			$("#nextReply_textarea").removeAttr("readonly");
			$("#re_updateBtn,#re_deleteBtn").css("display", "none");

			let updateComplete = $("<input>");
			updateComplete.attr("type", "submit");
			updateComplete.attr("value", "완료");

			updateComplete.css({
				"border" : "1px solid rgb(210, 210, 210)",
				"background-color" : "white",
				"border-radius" : "3px",
				"margin-right" : "10px"
			});

			let cancel = $("<input>");
			cancel.attr("type", "button");
			cancel.attr("value", "취소");
			cancel.css({
				"border" : "1px solid rgb(210, 210, 210)",
				"background-color" : "white",
				"border-radius" : "3px",
				"margin-right" : "10px"
			});
			cancel.on("click", function() {

				location.reload();
			});
			$("#nextReply_btn").append(updateComplete);
			$("#nextReply_btn").append(cancel);
		});
	</script>

</body>


</html>