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
<title>Board</title>

<style>

</style>
</head>

<body>
	<script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>

	<table id="example" class="display" style="width: 100%">
		<thead>
			<tr align="center">
				<th>seq</th>
				<th>writer</th>
				<th>title</th>
				<th>viewCount</th>
				<th>writeDate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${list}">
				<tr align="center">
					<td width="10" height="20">${i.qa_seq}</td>
					<td width="160" height="20">${i.qa_writer}</td>
					<td width="570" height="20"><a
						href="/qnaBoard/viewCount?qa_seq=${i.qa_seq}">${i.qa_title}</a></td>
					<td width="160" height="20">${i.qa_view_count}</td>
					<td width="40" height="20">${i.qa_write_date}</td>
				</tr>
			</c:forEach>


		</tbody>

		<tfoot>
			<tr>
				<td colspan="5" align="right"><a href="/qnaBoard/toWritingForm">
						<button type="button">글쓰기</button>
				</a></td>
			</tr>
			<tr>
				<td colspan="5" align="right">
					<form action="/board/searchTitle" method="post">
						<input type="text" name="title">
						<button>찾기</button>
					</form>
				</td>
			</tr>
		</tfoot>
	</table>
</body>

</html>