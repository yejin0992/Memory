<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td class="col1">* 비밀번호</td>
			<td class="col3"><input type="password" id="pw" name="pw"
				required>
				<div class="condition">
					<span id="check1">✔영문 대소문자</span> <span id="check2">✔숫자</span> <span
						id="check3">✔특수문자</span> <span id="check4">✔8~20자</span>
				</div></td>
		</tr>
		<tr>
			<td class="col1">* 비밀번호 확인</td>
			<td class="col3"><input type="password" id="repw" name="repw"
				maxlength="20" required>
				<div class="condition">
					<span id="check5">✔비밀번호 일치</span>
				</div></td>
		</tr>
	</table>


</body>
</html>