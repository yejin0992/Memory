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
<title>Insert title here</title>
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

h2 {
	text-align: center;
	color: #555555;
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

/* .title {
        border-bottom: 1px solid #000;
      } */
.wrContent textarea {
	width: 100%;
}
</style>
</head>
<body>
	<!-- 게시판 시작  -->
	<div class="container">
		<div class="titleArea">
			<h2>게시판</h2>
		</div>
		<!-- 말머리랑 제목  -->
		<form action="/freeBoard/insertBoard" method="post">
			<div class="row form-group">
				<div class="col-2">
					<div class="mb-3">
						<select class="form-select" id="category" name="fr_category"
							required>
							<option value="" disabled selected hidden>말머리</option>
							<c:forEach var="c" items="${category }">
								<option value="${c.cate_name }">${c.cate_name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-10">
					<div class="title">
						<input type="text" class="form-control" id="title" name="fr_title"
							placeholder="제목을 입력하세요." required />
					</div>
				</div>
			</div>
			<!-- 내용 -->
			<div class="mb-3">
				<div class="wrContent">
					<textarea class="form-control" id="content" name="fr_contents"
						rows="13" required></textarea>
				</div>
			</div>
			<div class="button">
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="button" class="btn btn-light">취소</button>
			</div>
		</form>
	</div>

	<!-- 게시판 끝 -->

	<script>
		$("#btnCancel").on("click", function() {

		})
	</script>




</body>
</html>