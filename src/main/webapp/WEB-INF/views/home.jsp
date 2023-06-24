<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<a href="/member/loginForm">
<button>버튼</button></a><br>


<a href="/perfume/perfumeList"><button>perfume main</button></button></a><br>
<a href="/perfume/perfumeBest"><button>perfume Best</button></a><br>
<a href="/freeBoard/selectList?cpage=1"><button>자유게시판 목록으로(페이징)</button></a><br>
<a href="/myPage/toMyPageMain">마이페이지</a>
</body>
</html>
