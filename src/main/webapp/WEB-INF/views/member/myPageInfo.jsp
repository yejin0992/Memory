<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my Page</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<form action="/member/update" method="post">
		


		<table border="1" align="center">
			<tr>
				<td>id</td>
				<td>${myInfo.id}</td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="pw"
					placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" readonly></td>
			</tr>
			<tr>
				<td>repw</td>
				<td><input type="password" name="repw" placeholder="비밀번호 재입력"
					readonly></td>
			</tr>

			<tr>
				<td>name</td>
				<td><input type=text value="${myInfo.name}" name="name"
					id="name" readonly></td>
			</tr>
			<tr>
				<td>phone</td>
				<td><input type=text value="${myInfo.contact}" name="contact"
					id="phone" readonly></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type=text value="${myInfo.email}" name="email"
					id="email" readonly></td>
			</tr>
			<tr>
				<td>postNum</td>
				<td><input type=text value="${myInfo.zipcode}" name="zipcode"
					id="postNum" readonly>
					<button type="button" id="searchadd">우편번호</button></td>
			</tr>
			<tr>
				<td>add1</td>
				<td><input type=text value="${myInfo.address1}" name="address1"
					id="add1" readonly></td>
			</tr>
			<tr>
				<td>add2</td>
				<td><input type=text value="${myInfo.address2}" name="address2"
					id="add2" readonly></td>
			</tr>

			<tr>
				<td colspan=2 align="center" id="control">
					<button type="button" id="update">정보수정</button> <a
					href="/member/mypage"><button type="button" id="back">돌아가기</button></a>
				</td>
			</tr>
		</table>
	</form>
	

	<script>
	

	//들어가라
		$("#update").on("click", function() {
			console.log("수정버튼 클릭");
			$("input").removeAttr("readonly");
			$("#update,#back").css("display", "none");

			let updateComplete = $("<button>");
			updateComplete.text("수정 완료");
			updateComplete.attr("type", "submit")

			let cancel = $("<button>");
			cancel.attr("type", "button") / cancel.text("취소");
			cancel.on("click", function() {
				location.reload();
			})

			$("#control").append(cancel);
			$("#control").prepend(updateComplete);

		})
	</script>

</body>
</html>