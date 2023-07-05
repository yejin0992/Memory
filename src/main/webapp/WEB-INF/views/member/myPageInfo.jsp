<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Member Information</title>
			<!-- jquery -->
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
			<!-- 카카오 우편먼호 API -->
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

			<style>
				body {
					background-image: url("/resources/joinBack.jpg");
					background-repeat: no-repeat;
					background-size: cover;
				}

				/* ----- row body ----- */
				.container {
					display: flex;
					align-items: center;
					justify-content: center;
				}

				.joinBox {
					background-color: rgb(255, 255, 255);
					width: 650px;
					border-radius: 20px;
					margin-top: 20%;
					margin-bottom: 15%;
				}

				table {
					height: 500px;
					width: 600px;
					border-top: 2px solid rgb(110, 110, 110);
					margin: auto;
					margin-top: 50px;
					font-size: 18px;
					color: rgb(73, 73, 73);
				}

				caption {
					margin: 50px;
				}

				/* td1 */
				.col1 {
					text-align: right;
					padding-right: 15px;
					width: 30%;
				}

				/* td2 */
				.col2 {
					width: 70%;
				}

				.condition {
					font-size: 12px;
					color: gray;
				}

				#match {
					font-size: 13px;
				}

				input {
					width: 90%;
					height: 30px;
					border: none;
					border-radius: 3px;
					margin: 9px 5px;
					border-bottom: 1px solid #ccc;
				}

				/* 외각라인 지우기 */
				input::after {
					content: '';
					position: absolute;
					bottom: 0;
					left: 0;
					width: 100%;
				}

				/* 클릭했을때 외각 라인이 안보이도록 */
				input[type="text"]:focus {
					outline: none;
				}

				input[type="password"]:focus {
					outline: none;
				}

				#id,
				#zipcode {
					width: 50%;
				}

				.gender {
					width: 5%;
					height: 15px;
				}

				#joinBtnTable {
					height: 150px;
				}

				/* 버튼 */
				#idCheck,
				#searchZipcode,
				#update,
				#back,
				#memberOut {
					border: none;
					background-color: #b2a08a;
					color: aliceblue;
					height: 30px;
					border-radius: 3px;
					padding: 1px 15px;
					font-size: medium;
				}

				#update,
				#back,
				#memberOut {
					margin: 8px;
				}

				#idCheck:hover,
				#searchZipcode:hover,
				#update:hover,
				#back:hover,
				#memberOut:hover {
					background-color: #525252;
					cursor: pointer;
				}

				button:hover {
					background-color: #525252;
					cursor: pointer;
				}

				input[type=radio] {
					accent-color: rgb(82, 82, 82);
				}

				.readOnly {
					background-color: #f7f7f7;
				}

				/* 비밀번호 변경 */
				#updatePW {
					border: none;
					background-color: #b2a08a;
					color: aliceblue;
					height: 30px;
					border-radius: 3px;
					padding: 1px 15px;
					font-size: medium;
				}
			</style>
		</head>

		<body>
			<c:if test="${status == 'update'}">
				<script>
					alert("수정 완료 되었습니다.");
					location.reload();
				</script>
			</c:if>
			<c:import url="/WEB-INF/views/common/navi.jsp" />
			<form action="/member/update" id="form" method="post">
				<div class="container">

					<div class="row body">
						<div class="joinBox">
							<table>
								<caption align="center">
									<h2>회원 정보</h2>
								</caption>
								<tr>
									<td class="col1">아이디</td>
									<td class="col3"><input type="text" id="id" class="readOnly" name="id" value="${myInfo.id}" readonly>
								</tr>
								<tr>
									<td></td>
									<td><button type="button" id="updatePW" style="display: none;">비밀번호 변경</button></td>
								</tr>

								<tr class="hiddenPW" style="display: none;">
									<td class="col1">* 비밀번호</td>
									<td class="col3"><input type="password" id="pw" class="readLater" name="pw" required readonly>
										<div class="condition">
											<span id="check1">✔영문 대소문자</span> <span id="check2">✔숫자</span>
											<span id="check3">✔특수문자</span> <span id="check4">✔8~20자</span>
										</div>
									</td>
								</tr>
								<tr class="hiddenPW" style="display: none;">
									<td class="col1">* 비밀번호 확인</td>
									<td class="col3"><input type="password" id="repw" class="readLater" name="repw" maxlength="20"
											required readonly>
										<div class="condition">
											<span id="check5">✔비밀번호 일치</span>
										</div>
									</td>
								</tr>
								<tr>
									<td class="col1">이름</td>
									<td class="col3"><input type="text" id="name" class="readOnly" name="name" value="${myInfo.name}"
											maxlength="5" readonly></td>
								</tr>
								<tr>
									<td class="col1">생년월일</td>
									<td class="col3"><input type="text" id="birth_date" class="readOnly" name="birth_date"
											value="${myInfo.birth_date}" maxlength="8" readonly></td>
								</tr>

								<tr>
									<td class="col1">* 연락처</td>
									<td class="col3"><input type="text" id="contact" class="readLater" name="contact"
											value="${myInfo.contact}" placeholder="  휴대폰 번호 입력('-'제외 입력)" readonly></td>
								</tr>
								<tr>
									<td class="col1">* 이메일</td>
									<td class="col3"><input type="text" id="email" class="readLater" name="email" value="${myInfo.email}"
											readonly></td>
								</tr>
								<tr>
									<td class="col1" id="address" valign="top"><br>주소</td>
									<td class="col3">
										<div>
											<input type="text" id="zipcode" class="readOnly" name="zipcode" value="${myInfo.zipcode}"
												readonly>
											<button type="button" id="searchZipcode" style="display: none;">우편번호</button>
										</div>
										<div>
											<input type="text" id="address1" class="readOnly" name="address1" value="${myInfo.address1}"
												placeholder="  기본주소" readonly></input>
										</div>
										<div>
											<input type="text" id="address2" class="readOnlyAdd" name="address2" value="${myInfo.address2}"
												placeholder="  나머지주소(선택 입력가능)" readonly></input>
										</div>

									</td>
								</tr>
								<tr>
									<td colspan="2" align="center" id="joinBtnTable"><a href="/myPage/toMyPageMain"><button type="button"
												id="back">돌아가기</button></a>
										<button type="button" id="update">정보수정</button>
										<button type="button" id="memberOut">회원탈퇴</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<c:import url="/WEB-INF/views/common/footer.jsp" />
			</form>

			<script>
				let pwRegexFlag = true;
				let updatePwFlag = true;
 
 				 $("#updatePW").on("click", function () {
 					pwRegexFlag = false;
				});  

				$("#update")
					.on(
						"click",
						function () {
							console.log("수정버튼 클릭");
							$("#searchZipcode").show();
							$(".readLater").removeAttr("readonly");
							$("#update,#back,#memberOut")
								.css("display", "none");

							let updateComplete = $("<button>");
							updateComplete.attr("id", "complete");
							updateComplete.text("완료");
							updateComplete.attr("type", "submit");
							updateComplete.css({
								"border": "none",
								"background-color": "#b2a08a",
								"color": "aliceblue",
								"height": "30px",
								"border-radius": "3px",
								"padding": "1px 15px",
								"font-size": "medium",
								"margin": "8px"
							});
							updateComplete.hover(function () {
								$(this).css({
									"background-color": "#525252",
									"color": "white"
								});
							}, function () {
								$(this).css({
									"background-color": "#b2a08a",
									"cursor": "pointer"
								});
							});

							console.log(2);

							// 수정 완료 버튼
							updateComplete.on("click", function (event) {
								event.preventDefault(); // 폼 바로 제출 막기

								let form = document
									.getElementById("form");

								let birth_date = document
									.getElementById("birth_date").value;
								let contact = document
									.getElementById("contact").value;
								let email = document
									.getElementById("email").value;
								let zipcode = document
									.getElementById("zipcode").value;
								let add1 = document
									.getElementById("address1").value;
								let add2 = document
									.getElementById("address2").value;

								let birth_dateRegex = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
								let contactRegex = /^01\d{8,9}$/;
								let emailRegex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[A-Za-z]+$/;
								let addRegex = /^[가-힣0-9\s,.|\-a-zA-Z]*$/;

								console.log(3);
								if (birth_date == "") {
									alert("생년월일을 입력해주세요.");
									return false;
								} else if (!birth_dateRegex
									.test(birth_date)) {
									alert('생년월일 형식을 맞춰 입력해주세요.(예시, 19990101)');
									return false;
								} else if (contact == "") {
									alert("휴대폰 번호를 입력해주세요.");
									return false;
								} else if (!contactRegex
									.test(contact)) {
									alert('휴대폰 번호 형식을 맞춰 입력해주세요.');
									return false;
								} else if (email == "") {
									alert("이메일을 입력해주세요.");
									return false;
								} else if (!emailRegex
									.test(email)) {
									alert('이메일 형식을 맞춰 입력해주세요.');
									return false;
								}
								if (add1.trim() == "") {
									return true;
								} else {
									if (!addRegex.test(add2)) {
										alert('주소 형식을 맞춰 입력해주세요.');
										return false;
									}
								}
								/* 
								pwRegexFlag = !pwRegexFlag
								 */
 								if (pwRegexFlag == true) {
									console.log(11);
									
									//펄스면 비밀번호 정규화
								} else if (pwRegexFlag == false) {
									let pw = document
										.getElementById("pw").value;
									let pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&#^])[A-Za-z\d@$!%*?&#^]{8,20}$/;
									let repw = document
										.getElementById("repw").value;

									if (pw == "") {
										alert("비밀번호를 입력해주세요.");
										return false;
									} else if (!(pw == repw)) {
										alert("비밀번호가 일치하지 않습니다.");
										return false;
									} else if (!pwRegex.test(pw)) {
										alert("비밀번호 형식을 맞춰 입력해주세요.(영문 대소문자, 숫자, 특수문자, 8~20자)");
										return false;
									}
									pwRegexFlag = true;
								}
								
								 updateComplete.on("click",function () {
									pwRegexFlag = true;
									});
 
								var result = confirm("정보를 수정하시겠습니까?");
								if (result) {
									$("#form").submit();
								} else {
								}
							});

							console.log(4);
							let cancel = $("<button>");
							cancel.attr("type", "button");
							cancel.text("취소");
							cancel.css({
								"border": "none",
								"background-color": "#b2a08a",
								"color": "aliceblue",
								"height": "30px",
								"border-radius": "3px",
								"padding": "1px 15px",
								"font-size": "medium",
								"margin": "8px"
							});

							cancel.hover(function () {
								$(this).css({
									"background-color": "#525252",
									"color": "white"
								});
							}, function () {
								$(this).css({
									"background-color": "#b2a08a",
									"cursor": "pointer"
								});
							});
							cancel.on("click", function () {
								location.reload();
							})

							$("#joinBtnTable").append(cancel);
							$("#joinBtnTable").prepend(updateComplete);

							$("#updatePW").show();

							// 비밀번호 수정 버튼
							
							$("#updatePW").on("click", function () {
								console.log("비번수정버튼클릭");
								let update = $(this);
								if (updatePwFlag) {
									update.text("비밀번호 변경 안함");
									$(".hiddenPW").show();
									pwRegexFlag = false;
									updatePwFlag = false;
								} else {
									update.text("비밀번호 변경");
									$(".hiddenPW").hide();
									updatePwFlag = true;
									pwRegexFlag = true;
									/* 
									if(updatePwFlag){
									
									}else{
										
									} */
								}
							});
						});
				console.log(5);

				//비밀번호 즉시 확인
				let check1 = document.getElementById("check1");
				let check2 = document.getElementById("check2");
				let check3 = document.getElementById("check3");
				let check4 = document.getElementById("check4");

				let check1Regex = /(?=.*[a-z])(?=.*[A-Z]).+/;
				let check2Regex = /[0-9]/;
				let check3Regex = /[~!@#$%^&*()_+|<>?:{}]/;

				$("#pw").on("keyup", function () {
					let pw = document.getElementById("pw").value;
					let repw = document.getElementById("repw").value;

					if (check1Regex.test(pw)) {
						check1.style.color = "darkorange";
					} else {
						check1.style.color = "";
					}

					if (check2Regex.test(pw)) {
						check2.style.color = "darkorange";
					} else {
						check2.style.color = "";
					}

					if (check3Regex.test(pw)) {
						check3.style.color = "darkorange";
					} else {
						check3.style.color = "";
					}

					if (pw.length >= 8 && pw.length <= 20) {
						check4.style.color = "darkorange";
					} else {
						check4.style.color = "";
					}

					if (pw == "") {
						check5.style.color = "";
					} else if (pw === repw) {
						check5.style.color = "darkorange";
					} else {
						check5.style.color = "";
					}
				});
				$("#repw").on("keyup", function () {
					let pw = document.getElementById("pw").value;
					let repw = document.getElementById("repw").value;

					if (repw == "") {
						check5.style.color = "";
					} else if (repw === pw) {
						check5.style.color = "darkorange";
					} else {
						check5.style.color = "";
					}
				});

				// 카카오 우편번호 API
				document.getElementById("searchZipcode").onclick = function () {
					$(".readOnlyAdd").removeAttr("readonly");
					new daum.Postcode(

						{
							oncomplete: function (data) {
								document.getElementById("zipcode").value = data.zonecode;
								document.getElementById("address1").value = data.address;
							},
						}).open();
				};

				// 수정 완료 버튼
				$("#memberOut").on("click", function () {
					var result = confirm("정말 회원 탈퇴 하시겠습니까?");
					if (result) {
						location.href = "/member/memberOut";
					} else {
					}
				});
			</script>
		</body>

		</html>