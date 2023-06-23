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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

.replyUpdBtn{
display:none;
}

.replyDelBtn{
display:none;
}

.true{
color: #c28243;
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
     			<input type="hidden" class="per_seq" name="per_seq" value="${perfume.per_seq}">
					<c:choose>
					<c:when test="${heart == 0}">
					<i class="fa-regular fa-heart false"></i>
					</c:when>
					<c:when test="${heart == 1}">
					<i class="fa-solid fa-heart true"></i>
					</c:when>
					</c:choose>	
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
        <div class="row">
            <div class="col-12">
                <h4>댓글</h4>
            </div>
            <hr>
        </div>
        <div class="row replyListRow">
        <div class="col replyListCol">
        <c:forEach var="i" items="${reply}">
					<form action="/perfumeReply/update" method="post">
						<div class="row">
							<input type="text" class="col" name="id" value="${i.id}" readonly>
						</div>
						<div class="row">
							<input type="text" name="contents" value="${i.contents}" readonly>
							<input type="hidden" name="per_seq" value="${i.per_seq}">
							<input type="hidden" name="re_seq" value="${i.re_seq}">
						</div>
						<c:if test="${writer eq i.id}">
							<div class="row">
								<div class="col">
									<button type="button" class="replyModBtn">수정</button>
									<a href="/perfumeReply/delete?re_seq=${i.re_seq}&per_seq=${perfume.per_seq}">
									<button type="button" class="replyDelBtn">삭제</button></a>
									<button class="replyUpdBtn" type="submit">완료</button>
								</div>
							</div>
						</c:if>
					</form>
				</c:forEach>
        </div>
        </div>
		<div class="row">
			<div class="col">
				<div class="messageBox">
				<form action="/perfumeReply/insert" method="post">
					<div class="id">${writer}</div>
					<input type="hidden" name="per_seq" value="${perfume.per_seq}">
					<input type="text" name="contents" placeholder="댓글입력">
					<div class="com">
						<button type="submit" id="msgInsert">확인</button>
					</div>
					</form>
				</div>
			</div>
		</div>
        <input type="hidden" id="loginID" value="${sessionScope.writer}">
        <div class="row footer">푸터</div>
    </div>
    
 <script>

 // 게시글 수정
 $("#updateBtn").on("click",function(){
	 let per_seq = $("#per_seq").val();
	 console.log("per_seq : " + per_seq);
	 location.href="/perfume/toUpdate?per_seq="+per_seq;
 });
 // 댓글 수정
 $(".replyModBtn").on("click", function(){
	 let contents = $(this).parent().parent().prev().children();
	 $(this).css("display","none");
	 $(this).next().children().css("display","inline-block");
	 $(this).next().next().css("display","inline-block");
	 contents.removeAttr("readonly");
	 alert("readonly 풀림")
 })

 // 좋아요 ajax
  t = (per_seq, isTrue, id) => {
		 console.log("per_seq : "+per_seq);
		 console.log("isTrue : "+ isTrue);
		 console.log("id : " + id);
		  $.ajax({
		    url: "/perfume/heartChange",
		    type: "post",
		    data: {
		      per_seq: per_seq,
		      isTrue: isTrue,
		      id : id
		    }
		  });
		  alert("ajax수행");
		};
	  
 // 좋아요 클릭
 $(".fa-heart").on("click", function (ev) {
	 this.className = $(this).hasClass('true') ? "fa-regular fa-heart false" : "fa-solid fa-heart true";	 
	 console.log($(this).hasClass('true'));
	 let per_seq =  $(this).prev().val();
	 let id = $("#loginID").val();
	 t(per_seq, $(this).hasClass('true'),id) 
 });
  
 
 </script>

</body>
</html>