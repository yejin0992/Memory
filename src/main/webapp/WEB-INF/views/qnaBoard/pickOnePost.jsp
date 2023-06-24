<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>

<style>
#replyContainer {
	width: 1000px;
	height: 150px;
}

#replyHead {
	height: 20%;
	background-color: rgb(185, 189, 194);
}

#replyBody {
	height: 80%;
}

#replyBody>div {
	float: left;
	height: 100%;
}

#replyBody>#msg {
	width: 80%;
}

#replyBody>#msg>textarea {
	width: 100%;
	height: 100%;
	resize: none;
}

#replyBody>#rightside {
	width: 20%;
}

#reply {
	border: none;
	background-color: none;
	width: 100%;
	height: 100%;
}

#reply:hover {
	cursor: pointer;
}
</style>

</head>
<body>

	<form action="/qnaBoard/updatePost?qa_seq=${post.qa_seq}" method="post">
		
		<table border="1" width="1000" height="500">

			<tr height="20" >
				<th colspan="2">자유게시판 글 작성하기</th>
			</tr>
			<tr height="20">
				<td><input type="text" class="editor" value="${post.qa_title }"
					size="100" name="qa_title" readonly></td>
				<td><input type="textarea" name="qa_view_count" value="${post.qa_view_count }">
					<img src="/upload/">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div cols="138" class="editor" rows="30"
						name="qa_contents" readonly>
						<c:forEach var="i" items="${file}">
				<img src="/qnaUpload/${i.sysName}">
				</c:forEach>
						${post.qa_contents}</div>
				</td>
			</tr>
			
			<tr align="right" height="20">
				<td colspan="2">
				<a href="/qnaBoard/boardList">
				<input type="button" id="backBtn" value="목록으로"></a> 
				<a href="/qnaBoard/delete?qa_seq=${post.qa_seq}">
				<input type="button" id="deleteBtn" value="삭제"></a> 
				<input type="button" id="updateBtn" value="수정">
				</td>
			</tr>

		</table>
	</form>

	<!-- 댓글 출력 / 수정 / 삭제 -->
	<c:forEach var="r" items="${reply}">
		<form action="/reply/replyUpdate" method="post">
			<div id="nextreply">
				<table border="1" width="1000" height="100">
					<tr>
						<th>${sessionScope.loginID}</th>
						<th>${r.re_write_date}</th>
					</tr>
					<tr>
						<td><textarea class="replyforUpdate" name="re_contents"
								readonly>${r.re_contents}</textarea></td>
						<td>
							<button type="button" id="re_updateBtn">수정</button> 
							<a href="/reply/replyDelete?qa_seq=${r.qa_seq}&re_seq=${r.re_seq}">
							<input type="button" id="re_deleteBtn" value="삭제">
						</a>
						</td>
					</tr>
				</table>
				<input type="hidden" name="qa_seq" value="${r.qa_seq}"> 
				<input type="hidden" name="re_seq" value="${r.re_seq}">
			</div>
		</form>
	</c:forEach>

	<!-- 댓글 입력 -->
	<form action="/reply/replyInsert" method="post">
		<div id="replyContainer">
			<div id="replyHead">
				<input type="text" id="writer" value="${sessionScope.loginID}"
					name="re_writer" readonly>
			</div>
			<div id="replyBody">
				<div id="msg">
					<textarea id="textarea" name="re_contents"></textarea>
				</div>
				<div id="rightside">
					<button id="reply">REPLY</button>
				</div>
			</div>
		</div>
		<input type="hidden" name="qa_seq" value="${post.qa_seq}">
	</form>

	<script>
	
		// 게시글 수정 버튼
		$("#updateBtn").on("click", function() {

			$(".editor").removeAttr("readonly");
			$("#updateBtn,#deleteBtn").css("display", "none");

			let updateComplete = $("<button>");
			updateComplete.text("수정 완료");
			updateComplete.attr("type", "submit")

			let cancel = $("<button>");
			cancel.attr("type", "button");
			cancel.text("취소");
			cancel.on("click", function() {
				location.reload();
			});
			$("#updateBtn").parent("td").append(updateComplete);
			$("#updateBtn").parent("td").append(cancel);
		});

		// 댓글 수정하기 버튼
		$("#re_updateBtn").on("click", function() {

			$(".replyforUpdate").removeAttr("readonly");
			$("#re_updateBtn,#re_deleteBtn").css("display", "none");

			let updateComplete = $("<button>");
			updateComplete.text("수정 완료");
			updateComplete.attr("type", "submit")

			let cancel = $("<button>");
			cancel.attr("type", "button");
			cancel.text("취소");
			cancel.on("click", function() {
				location.reload();
			});
			$("#re_updateBtn").parent("td").append(updateComplete);
			$("#re_updateBtn").parent("td").append(cancel);
		});

		
	</script>

</body>
</html>