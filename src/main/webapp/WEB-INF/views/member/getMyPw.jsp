<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<meta charset="UTF-8">
<title>Password Update</title>

<style>
* {
	box-sizing: border-box;
	/* border: 1px solid black; */
}

.rowbody {
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

.findBox {
	width: 400px;
	margin-bottom: 50px;
}

.findHeader {
	font-size: 30px;
	padding: 6%;
	color: rgb(82, 82, 82);
}

button {
	border: none;
	font-size: 14px;
	width: 100%;
	height: 40px;
}

ul {
	padding: 0%
}

li {
	float: left;
	list-style-type: none;
	width: 50%;
	margin: 0%;
}

#idBtn {
	background-color: white;
	color: rgb(82, 82, 82);
}

#pwBtn {
	background-color: rgb(82, 82, 82);
	color: white;
}

#idBtn:hover {
	color:darkorange;
	font-weight: bold;
	cursor: pointer;
}

.line {
	height: 5px;
	background-color: rgb(82, 82, 82);
	padding: 0%;
}


input {
	width: 100%;
	height: 35px;
	margin-top: 15px;
}

#pwUpdateBtn {
	margin-top: 6%;
	background-color: #525252;
	color: white;
}

#pwUpdateBtn:hover {
	background-color: darkorange;
	cursor: pointer;
}

.gotoPage {
	margin-top: 8px;
}

.gotoPage>a {
	color: darkorange;
}

.condition {
	font-size: 12px;
	color: #dddddd;
}
</style>

</head>

<body>
	<!-- 정보 일치 하지 않을때 -->
	<c:if test="${check == 0}">
		<script>alert("비밀번호를 변경해 주세요.");</script>
	</c:if>

	<form action="/member/pwUpdate" method="post">
		<div class="rowbody" align="center">
			<div class="findBox">
				<div class="findHeader">
					<b>내 계정 찾기</b>
				</div>
				<ul>
					<li><a href="/member/toFindID">
					<button type="button" id="idBtn">아이디</button>
						<div class="line"></div><a></a></li>
					<li><a href="/member/toFindPW"><button type="button"
								id="pwBtn">비밀번호</button></a>
						<div class="line"></div></li>
				</ul>
				
				<div id="inputMyInfo">
					<input type="password" id="pw" name="pw" placeholder="  비밀번호"
						maxlength="20" required>
					<div class="condition">
						<span id="check1">✔영문 대소문자</span> <span id="check2">✔숫자</span> <span
							id="check3">✔특수문자</span> <span id="check4">✔8~20자</span>
					</div>

					<input type="password" id="repw" name="repw"
						placeholder="  비밀번호 확인" maxlength="20" required>
					<div class="condition">
						<span id="check5">✔비밀번호 일치</span>
					</div>
				</div>
				<button type="submit" id="pwUpdateBtn">비밀번호 변경</button>

				<input type="hidden" name="id" value="${findPw}">
			</div>
		</div>
	</form>


	<script>
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
    document.getElementById("pwUpdateBtn").onclick = () => {
    	   let pw = document.getElementById("pw").value;
           let repw = document.getElementById("repw").value;
           
           let pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
               	
      if (pw == "") {
        alert("비밀번호를 입력 하세요.");
        return false;
      } else if (!(pw == repw)) {
        alert("비밀번호가 일치 하지 않습니다.");
        return false;
     
      }else if (!pwRegex.test(pw)) {
    	  alert("비밀번호 형식을 맞춰 입력해주세요.(영문 대소문자, 숫자, 특수문자, 8~20자)");
    	  return false;
      } else if (pw == repw) {
    	  alert("비밀번호 수정 완료 되었습니다.");
      }
      
    }
    </script>
</body>

</html>