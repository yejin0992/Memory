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
<title>perfume Select</title>
 <style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid grey;
}

.head {
	position: sticky;
	top: 0;
	height: 100px;
	background-color: pink;
	z-index: 2;
}

.text-overlay1 {
	position: absolute;
	top: 16%;
	left: 58%;
}

.text-overlay2 {
	position: absolute;
	top: 41%;
	left: 66%;
}

.text-overlay3 {
	position: absolute;
	top: 68%;
	left: 73%;
}

#pyramid {
	position: relative;
}



#perfumeImage {
	width: 400px;
	height: 500px;
}

.informationCol {
	display: flex;
	justify-content: center;
	align-items: center;
}

.heartCol {
	display: flex;
	justify-content: center;
	align-items: center;
}

.btnRow{
display:flex;
justify-content: flex-end;
}

.messageBox{
display:flex;
width: 100%;
flex-direction: column;
float:right;
}

#msgInsert{
float:right;
}

</style>


</head>

<body>
    <div class="container">
        <div class="row head">

        </div>
        <div class="row">
            <div class="col-12">
                <h4>Information</h4>
            </div>
            <hr>
        </div>
		<div class="row informationRow">
				<div class="col-6 informationCol">
					<img src="/perfumeImage/${file.sysName}" id="perfumeImage" class="img-fluid">
				</div>
				<div class="col-6 ">
					<div class="row ">
						<input type="hidden" id="per_seq" value="${perfume.per_seq}">
						<div class="col-4 h-25 d-inline-block">NAME</div>
						<div class="col-8">${perfume.per_name}</div>
					</div>
					<div class="row">
						<div class="col-4">brand</div>
						<div class="col-8">${perfume.per_brand}</div>
					</div>
					<div class="row">
						<div class="col-4">volume</div>
						<div class="col-8">${perfume.per_volume}ml</div>
					</div>
					<div class="row">
						<div class="col-4">kind</div>
						<div class="col-8">${perfume.per_kind}</div>
					</div>
					<div class="row">
						<div class="col-4">gender</div>
						<div class="col-8">${perfume.per_gender}</div>
					</div>
					<div class="row">
						<div class="col-4">price</div>
						<div class="col-8">${perfume.per_price}원</div>
					</div>
				</div>
		</div>
		<div class="row">
			<div class="col-12">
				<h4>perfume pyramid</h4>
			</div>
			<hr>
		</div>
		<div class="row justify-content-center">
			<div class="col-sm-12 col-md-9 col-lg-7 d-flex g-start-2"
				id="pyramid">
				<img src="/resources/pyramid.png" 
					class="img-fluid ">
				<div class="text-overlay1">
					<span class="note">${perfume.top1},</span> <span class="note">${perfume.top2},</span>
					<span class="note">${perfume.top3}</span>
				</div>
				<div class="text-overlay2">
					<span class="note">${perfume.middle1},</span> <span class="note">${perfume.middle2},</span>
					<span class="note">${perfume.middle3}</span>
				</div>
				<div class="text-overlay3">
					<span class="note">${perfume.base1},</span> <span class="note">${perfume.base2},</span>
					<span class="note">${perfume.base3}</span>
				</div>
			</div>
		</div>
		<div class="row">
            <div class="col heartCol">
       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
</svg>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <h4>댓글</h4>
            </div>
            <hr>
        </div>
		<div class="row">
			<div class="col">
				<div class="messageBox">
					<div class="id">아이디</div>
					<input type="text" name="" placeholder="댓글입력">
					<div class="com">
						<button id="msgInsert">확인</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row btnRow">
            <div class="col-2 btnCol">
                <button>목록</button>
                <!-- 삭제, 수정버튼 관리자일때만  -->
                <!-- 삭제하시겠습니까 alert -->
                <a href="/perfume/delete?per_seq=${perfume.per_seq}"><button>삭제</button></a>
                <!-- 수정하기 버튼 수정하기 페이지로 -->
                <button id="updateBtn">수정</button>
            </div>
        </div>
        <div class="row footer">푸터</div>
    </div>
    
 <script>

 $("#updateBtn").on("click",function(){
	 let per_seq = $("#per_seq").val();
	 console.log("per_seq : " + per_seq);
	 location.href="/perfume/toUpdate?per_seq="+per_seq;
 });
 
 
 </script>

</body>
</html>