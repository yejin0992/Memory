<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Join</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- 카카오 우편먼호 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


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
	min-height: 100vh;
}

.joinBox {
	background-color: rgb(255, 255, 255);
	width: 650px;
	border-radius: 20px;
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

#id, #zipcode {
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
#idCheck, #searchZipcode, #joinBtn, #cancel {
	border: none;
	background-color: #b2a08a;
	color: white;
	height: 30px;
	border-radius: 3px;
	padding: 1px 15px;
	font-size: medium;
}

#joinBtn, #cancel {
	margin: 8px;
}

#idCheck:hover, #searchZipcode:hover, #joinBtn:hover, #cancel:hover {
	background-color: #525252;
	cursor: pointer;
}

input[type=radio] {
	accent-color: rgb(82, 82, 82);
}
</style>
</head>

<body>
	<form action="/member/join" id="form" method="post">
		<div class="container">
			<div class="row header"></div>
			<div class="row body">
				<div class="joinBox">
					<table>
						<caption>
							<h2>회원가입</h2>
						</caption>
						<tr>
							<td class="col1">* 아이디</td>
							<td class="col3"><input type="text" id="id" name="id"
								placeholder="  영문 소문자/숫자, 4~16자" required>
								<button type="button" id="idCheck">중복확인</button></td>
						</tr>
						<tr>
							<td class="col1">* 비밀번호</td>
							<td class="col3"><input type="password" id="pw" name="pw"
								required>
								<div class="condition">
									<span id="check1">✔영문 대소문자</span> <span id="check2">✔숫자</span>
									<span id="check3">✔특수문자</span> <span id="check4">✔8~20자</span>
								</div></td>
						</tr>
						<tr>
							<td class="col1">* 비밀번호 확인</td>
							<td class="col3"><input type="password" id="repw"
								name="repw" maxlength="20" required>
								<div class="condition">
									<span id="check5">✔비밀번호 일치</span>
								</div></td>
						</tr>
						<tr>
							<td class="col1">* 이름</td>
							<td class="col3"><input type="text" id="name" name="name"
								maxlength="5" required></td>
						</tr>
						<tr>
							<td class="col1">* 생년월일</td>
							<td class="col3"><input type="text" id="birth_date"
								name="birth_date" placeholder="  예시)19990101111" maxlength="8"
								required></td>
						</tr>

						<tr>
							<td class="col1">* 연락처</td>
							<td class="col3"><input type="text" id="contact"
								name="contact" placeholder="  휴대폰 번호 입력('-'제외 입력)" required></td>
						</tr>
						<tr>
							<td class="col1">* 이메일</td>
							<td class="col3"><input type="text" id="email" name="email"
								required></td>
						</tr>
						<tr>
							<td class="col1" id="address">주소</td>
							<td class="col3">
								<div>
									<input type="text" id="zipcode" name="zipcode" readonly>
									<button type="button" id="searchZipcode">우편번호</button>
								</div>
								<div>
									<input type="text" id="address1" name="address1"
										placeholder="  기본주소" readonly></input>
								</div>
								<div>
									<input type="text" id="address2" name="address2"
										placeholder="  나머지주소(선택 입력가능)"></input>
								</div>

							</td>
						</tr>
						<tr id="joinBtnTable">
							<td colspan="2" align="center">
								<button type="submit" id="joinBtn">가입</button> <a href="/"><button
										type="button" id="cancel">취소</button></a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row footer"></div>
		</div>
	</form>

	<script>

      //아이디중복확인
       let idChecked = false; // 아이디 중복 체크 상태 변수 (기본값: false)
        
       // 아이디 변경 시 중복 확인 여부 리셋
       document.getElementById("id").addEventListener("input", function() {
         idChecked = false;
       });
       
      $("#idCheck").on("click", function () {
        const id = $("#id").val();
        let idRegex = /^[a-z0-9]{4,16}$/;
        if (id == "") {
          alert("아이디를 입력하세요.");
          return;
        } else if (!idRegex.test(id)) {
          alert('ID를 형식에 맞춰 입력해주세요.(영문 소문자,숫자,4자~16자)');
          return;
        }

        $.ajax({
          url: "idCheck",
          data: { id: id },
        }).done(function (resp) {
          resp = JSON.parse(resp);
          if (resp) {
            alert("이미 사용중인 아이디 입니다");
            $("#id").val("");
            idChecked = false;
          } else {
            alert("사용 가능한 아이디 입니다");
            idChecked = true;
          }
        })
      });

	  //비밀번호 확인
      let check1 = document.getElementById("check1");
      let check2 = document.getElementById("check2");
      let check3 = document.getElementById("check3");
      let check4 = document.getElementById("check4");

      let check1Regex = /(?=.*[a-z])(?=.*[A-Z]).+/; 
      let check2Regex = /[0-9]/; 
      let check3Regex = /[~!@#$%^&*()_+|<>?:{}]/; 

      $("#pw").on("keyup", function() {
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
      
        if (pw == ""){  
        	check5.style.color = "";
        } else if 
        	(pw === repw) {
            	check5.style.color = "darkorange";
        } else {
        	check5.style.color = "";
        } 
      });
      $("#repw").on("keyup", function () {
    	  let pw = document.getElementById("pw").value;
          let repw = document.getElementById("repw").value;
         
          if (repw == ""){  
          	check5.style.color = "";
          } else if 
          	(repw === pw) {
              	check5.style.color = "darkorange";
          } else {
          	check5.style.color = "";
          } 
    	});
      
      //정규화
      document.getElementById("joinBtn").onclick = () => {

        let form = document.getElementById("form");
        let id = document.getElementById("id").value;
        let pw = document.getElementById("pw").value;
        let repw = document.getElementById("repw").value;
        let name = document.getElementById("name").value;
        let birth_date = document.getElementById("birth_date").value;
        let contact = document.getElementById("contact").value;
        let email = document.getElementById("email").value;
        let zipcode = document.getElementById("zipcode").value;
        let add1 = document.getElementById("address1").value;
        let add2 = document.getElementById("address2").value;

        let idRegex = /^[a-z0-9]{4,16}$/;
        let pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
        let nameRegex = /^[가-힣]{2,5}$/;
        let contactRegex = /^01\d{8,9}$/;
        let emailRegex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[A-Za-z]+$/;
		let add1Regex = /^([가-힣\d\s]+),?\s?([가-힣\d\s]+),?\s?([가-힣\d\s]+)$/;
		let add2Regex = /^([가-힣\d\s]+),?\s?([가-힣\d\s]+),?\s?([가-힣\d\s]+)$/;
		
        // 생년월일
        let birth_dateRegex = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
        let currentDate = new Date(); //현재날짜
        let insertBirthDate = new Date(birth_date.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3')); // 유저가 입력한 날짜
        if (insertBirthDate > currentDate) {
            alert("미래의 날짜는 입력할 수 없습니다.");
            return false;
        } else if (birth_date == "") {
              alert("생년월일을 입력해주세요.");
              return false;
        } else if (!birth_dateRegex.test(birth_date)) {
              alert('생년월일 형식을 맞춰 입력해주세요.(예시, 19990101)');
              return false;
        }
        
        
        if (!idChecked) {
          alert("아이디 중복 체크를 해주세요.");
          return false;
        }
        if (id == ""){
        	alert("아이디를 입력해주세요.");
        	return false;
        }else if (!idRegex.test(id)){
        	alert("아이디 형식을 맞춰 입력해주세요.(영문 소문자, 4~16자)")
        	return false;
        }else if (pw == "") {
          alert("비밀번호를 입력해주세요.");
          return false;
        } else if (!(pw == repw)) {
          alert("비밀번호가 일치하지 않습니다.");
          return false;
        }else if (!pwRegex.test(pw)){
        	alert("비밀번호 형식을 맞춰 입력해주세요.(영문 대소문자, 숫자, 특수문자, 8~20자)")
        	return false;
        } else if (name == "") {
          alert("이름를 입력해주세요.");
          return false;
        } else if (!nameRegex.test(name)) {
          alert('이름 형식을 맞춰 입력해주세요.(한글, 2자~5자)');
          return false;
        
        }else if (contact == "") {
          alert("휴대폰 번호를 입력해주세요.");
          return false;
        } else if (!contactRegex.test(contact)) {
          alert('휴대폰 번호 형식을 맞춰 입력해주세요.');
          return false;
        } else if (email == "") {
          alert("이메일을 입력해주세요.");
          return false;
        } else if (!emailRegex.test(email)) {
          alert('이메일 형식을 맞춰 입력해주세요.');
          return false;
        } else if (!add1Regex.test(add1)) {
          alert('주소 형식을 맞춰 입력해주세요.');
          return false;
        } else if (!add2Regex.test(add2)) {
          alert('주소 형식을 맞춰 입력해주세요.');
          return false;
        }

      // 카카오 우편번호 API
      document.getElementById("searchZipcode").onclick = function () {
        new daum.Postcode(
          {
            oncomplete: function (data) {
              document.getElementById("zipcode").value = data.zonecode;
              document.getElementById("address1").value = data.address;
            },
          }).open();
      };
    </script>
</body>

</html>