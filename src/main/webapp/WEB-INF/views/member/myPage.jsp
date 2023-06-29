<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
    $(document).ready(function () {
      $('#tableBox').DataTable();
    });
  </script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

	<table border=1 align=center>
		<tr>
			<th colspan=4>${sessionScope.loginID}님환영합니다.</th>
		</tr>
		<tr>
			<td align=center><a href="/qnaBoard/boardList">
					<button id="toBoard">게시판으로</button>
			</a></td>
			<td align=center><a href="/member/myInfo">
			<button id="myPage">마이페이지</button>
			</a></td>
			<td align=center><a href="/member/logout">
			<button id="Logout">로그아웃</button>
			</a></td>
			<td align=center><a href="/member/memberOut">
			<button id="memberOut">회원탈퇴</button>
			</a></td>
		</tr>
	</table>
</body>
</html>