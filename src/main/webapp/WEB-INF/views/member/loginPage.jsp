<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <style>
    * {
      box-sizing: border-box;
      /* border: 1px solid black;  */
    }

    body {
      background-color: #adadad;
    }

    .container {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }

    .loginBox {
      background-color: #ffffff;
      border-radius: 20px;
      width: 400px;
      height: 500px;
      padding: 20px;
    }

    /* ----- Login,greeting ----- */
    .text {
      padding-top: 20px;
    }

    .login {
      font-size: 30px;
      color: darkorange;
    }

    .greeting {
      font-size: 18px;
      margin-top: 5px;
    }

    /* -----  아이디,비번 -----  */
    .inputText {
      padding-top: 23%;
    }

    input {
      font-size: 15px;
      width: 90%;
      height: 30px;
      border: none;
      border-radius: 3px;
      margin: 9px 5px;
      border-bottom: 1px solid #797979;
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

    ::placeholder {
      text-align: center;
    }

    #forget {
      padding-left: 5%;
      padding-top: 3px;
      text-decoration: none;
      color: darkorange;
    }

    /* -----  버튼 -----  */
    button {
      font-size: 15px;
      border: none;
      background-color: rgb(82, 82, 82);
      color: white;
      padding: 3%;
      width: 90%;
      border-radius: 50px;
    }

    #loginBtn {
      margin-top: 25px;
      background-color: rgb(82, 82, 82);
      color: white;
      border: 2px solid rgb(82, 82, 82);
    }

    #loginBtn:hover {
      color: rgb(255, 255, 255);
      background-color: darkorange;
      border: 2px solid darkorange;
      cursor: pointer;
    }

    #signUpBtn {
      margin-top: 10px;
      color: rgb(82, 82, 82);
      background-color: white;
      border: 2px solid rgb(82, 82, 82);
    }

    #signUpBtn:hover {
      background-color: darkorange;
      color: white;
      border: 2px solid darkorange;
      cursor: pointer;
    }
  </style>
</head>

<body>

  <div class="container">
    <div class="row header"></div>
    <div class="row body">
	
	<c:if test="${status=='l_f'}">
		<script>
			alert("ID, 비밀번호를 다시 확인해주세요.");
			location.reload();
		</script>
	</c:if>
	

	<c:choose>
		<c:when test="${loginId==null}">
    
    <form action="/member/login" method="post">
      <div class="loginBox">
        <div class="text">
          <div class="login"><b>Login</b></div>
          <div class="greeting">Welcome to Memory :D</div>
        </div>
        <div class="inputText" align="center">
          <input type="text" id="id" name="id"placeholder="ID">
          <input type="password" id="pw" name="pw" placeholder="Password">
        </div>
        <div>
          <a href="#" id="forget">Forget your password?</a>
        </div>
        <div class="buttonBox" align="center">
          <button type="submit" id="loginBtn">Login</button><br>
          <a href="/member/joinForm">
          <button type="button" id="signUpBtn">Sign Up</button>
          </a>
        </div>
      </div>
      </form>
      </c:when>
      </c:choose>
      <div class="row footer"></div>
    </div>

</body>
</html>