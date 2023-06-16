<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src = "https://code.jquery.com/jquery-3.6.4.js"></script>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
<form action="/qnaBoard/insertPost" method="post">
	<table border="1" width="1000" height="500">
		
			<tr height="20">
				<th>자유게시판 글 작성하기</th>
			</tr>
			<tr height="20">
				<td>
				<input type="text" placeholder="글 제목을 입력하세요" size="130" name="qa_title">
				</td>
			</tr>
		<!-- 	<tr height="20">
				<td>
				
				<input type="file" id="addfile" name="files" multiple>
				
				</td>
			</tr> -->
		
			<tr>
				<td>
				<textarea placeholder="글 내용을 입력하세요." cols="138" rows="30" name="qa_contents"></textarea>
				</td>
			</tr>
			<tr height="20">
				<td>
				<a href="selectAll">
				<input type="button" value="목록으로" id="toList"></a> 
				<input type="submit" value="작성완료">
				</td>
			</tr>
		
	</table>
</form>
	<script>

   </script>

</body>
</html>