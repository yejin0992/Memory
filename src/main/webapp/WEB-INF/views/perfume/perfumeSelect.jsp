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
 
 @font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}
 
* {
font-family: 'Pretendard-Regular';
	box-sizing: border-box;
}

div {
/* 	border: 1px solid grey; */
}

.head {
	position: sticky;
	top: 0;
	height: 100px;
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
/* 	display: flex;
	justify-content: center;
	align-items: center; */
	position:relative;
	right:30px;
	top:47%;
}

i {
position:relative;
bottom:2px;
}



.messageBox{
display:flex;
width: 100%;
flex-direction: column;
float:right;
border : 0.5px solid #525252;
border-radius : 10px;
}

.messageSelect{
border : 0.5px solid lightgrey;
border-radius : 10px;

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

/* 폰트 */
 #per_name {
  font-size: 23px; 
} 
 @media (max-width: 768px) {
  #per_name {
    font-size: 15px;
  } 
}

 .info {
  font-size: 18px; 
  color :  #b2a08a ;
  font-weight:400;
} 
 @media (max-width: 768px) {
  .info {
    font-size: 15px;
    color :  #b2a08a ;
    font-weight:400;
  } 
}


.nameRow{
height:70px;
line-height:60px;
padding-top : 5px;

}

#per_brand{
font-size : 14px;
color :  #b2a08a ;
}

.infoRow{
height:40px;
}

.height80{
height:80px;
}

.height60{
height:60px;
}

.height40{
height:40px;
}

.smTitle{
color : #525252;
}

.recordBtn{
background-color : white;
border : 0.5px solid grey;
padding-top : 3px;
padding-bottom:3px;
padding-left:10px;
padding-right:10px;
border-radius:3px;
margin-right:10px;
}


.replyBtn{
background-color : white;
color : #525252;
border :none;
padding-top : 3px;
padding-bottom:3px;
padding-left:10px;
padding-right:10px;
border-radius:3px;
margin-right:10px;
}

.btnCol{
padding:0px;
position:relative;
left:10px;
float:left;
}



.replyIdCol{
padding: none;
border : none;
}

.replyConCol{
padding:none;
border : none;
}

.replyIdRow{
position:relative;
left : 10px;
padding-top : 10px;
padding-right:0px;
border: none;
font-weight:bold;
}

.replyConRow{
border : none;
width:100%;
padding-left : 20px;
min-height:50px;
}

.height15{
height:15px;
}

.justify-content-center{
padding-top : 100px;
}

.replyRow{
padding:0;
padding-bottom : 2px;
}

#replyInput{
width:100%;
min-height:60px;
border : none;
margin-bottom:2px;
}

.sessionID{
position:relative;
padding-top : 10px;
border: none;
width: 100%;
font-weight:bold;
}

#formDate{
position: relative;
left : 10px;
z-index : 2;
width: 50px;
color : lightgrey;
font-size : 16px;
}

#replyComplete{
background-color : #b2a08a;
margin-bottom : 10px;
color : white;
}

#replyComplete:hover{
background-color : #525252 ;
color : white;
}


</style>


</head>

<body>
 

    <div class="container">
        <div class="row head">
			 <c:import url="/WEB-INF/views/common/navi.jsp" />
        </div>
        <div class="row">
            <div class="col-12">
                <h4 class="smTitle">INFORMATION</h4>
            </div>
            <hr>
        </div>
		<div class="row informationRow">
			<div class="col-6 informationCol">
					<img src="/perfumeImage/${file.sysName}" id="perfumeImage" class="img-fluid">
			<div class="heartCol">
     			<input type="hidden" class="per_seq" name="per_seq" value="${perfume.per_seq}">
					<c:choose>
					<c:when test="${heart == 0}">
					<i class="fa-regular fa-heart fa-xl false"></i>
					</c:when>
					<c:when test="${heart == 1}">
					<i class="fa-solid fa-heart fa-xl true"></i>
					</c:when>
					</c:choose>	
            </div>
        
				</div>
				<div class="col-6 ">
				<div class="row height80"></div>
				<div class="row">
						<div id="per_brand" class="col-12">${perfume.per_brand}</div>
					</div>
					<div class="row nameRow">
						<input type="hidden" id="per_seq" value="${perfume.per_seq}">
						<div id="per_name" class="col-12" >${perfume.per_name}</div>
					</div>
					<div class="row height60"></div>
					<div class="row infoRow">
						<div class="col-3 info">용량</div>
						<div class="col-9">${perfume.per_volume}ml</div>
					</div>
					<div class="row infoRow">
						<div class="col-3 info">종류</div>
						<div class="col-9">${perfume.per_kind}</div>
					</div>
					<div class="row infoRow">
						<div class="col-3 info">성별</div>
						<div class="col-9">${perfume.per_gender}</div>
					</div>
					<div class="row infoRow">
						<div class="col-3 info">가격</div>
						<div class="col-9">${perfume.per_price}원</div>
					</div>
				</div>
		</div>
		<div class="row height80"></div>
		<div class="row">
			<div class="col-12">
				<h4 class="smTitle">NOTE PYRAMID</h4>
			</div>
			<hr>
		</div>
		<div class="row justify-content-center">
			<div class="col-sm-12 col-md-9 col-lg-7 d-flex g-start-2"
				id="pyramid">
				<img src="/resources/pyramid.png" 
					class="img-fluid ">
				<div class="text-overlay1">
					<span class="note">${perfume.top1}</span>
					<c:if test="${perfume.top2 != null }">
					<span class="note">, ${perfume.top2}</span>
					</c:if>
					<c:if test="${perfume.top3 != null }">
					<span class="note">, ${perfume.top3}</span>
					</c:if>
				</div>
				<div class="text-overlay2">
					<span class="note">${perfume.middle1}</span> 
					<c:if test="${perfume.middle2 != null }">
					<span class="note">, ${perfume.middle2},</span>
					</c:if>
					<c:if test="${perfume.middle3 != null }">
					<span class="note">, ${perfume.middle3}</span>
					</c:if>
				</div>
				<div class="text-overlay3">
					<span class="note">${perfume.base1}</span> 
					<c:if test="${perfume.base2 != null }">
					<span class="note">, ${perfume.base2},</span>
					</c:if>
					<c:if test="${perfume.base3 != null }">
					<span class="note">, ${perfume.base3}</span>
					</c:if>
				</div>
			</div>
		</div>
		
         	<div class="row height40"></div>
        
        <div class="row btnRow">
        <div class="col-7"></div>
            <div class="col-5 btnCol d-flex flex-row-reverse">
                <a href="/perfume/perfumeList?cpage=${cpage}"><button class="recordBtn">목록</button></a>
                <!-- 삭제, 수정버튼 관리자일때만  -->
                <!-- 삭제하시겠습니까 alert -->
                <a href="/perfume/delete?per_seq=${perfume.per_seq}"><button class="recordBtn">삭제</button></a>
                <!-- 수정하기 버튼 수정하기 페이지로 -->
                <button id="updateBtn" class="recordBtn">수정</button>
            </div>
        </div>
        	<div class="row height40"></div>
        <div class="row">
            <div class="col-12">
                <h4 class="smTitle">댓글</h4>
            </div>
            <hr>
        </div>
        <!-- 댓글 출력  -->
        <div class="row replyListRow">
        <div class="col replyListCol">
        <c:forEach var="i" items="${reply}">
					<form action="/perfumeReply/update" method="post" class="row messageSelect">
						<div class="col-12 replyIdCol">
						<div class="row" ></div>
							<input type="text" class="replyIdRow" name="id" value="${i.id}" readonly>
							<span id="formDate">${i.formedDate}</span>
						</div>
						<div class="col-12 replyConCol">
							<input type="text" class="row replyConRow" name="contents" value="${i.contents}" readonly>
							<input type="hidden" name="cpage" value="${cpage}">
							<input type="hidden" name="per_seq" value="${i.per_seq}">
							<input type="hidden" name="re_seq" value="${i.re_seq}">
						</div>
						<c:if test="${loginID eq i.id}">
						<div class="row height15"></div>
							<div class="row replyRow">
								<div class="col d-flex flex-row-reverse">
									<button type="button" class="replyModBtn replyBtn">수정</button>
									<a href="/perfumeReply/delete?re_seq=${i.re_seq}&per_seq=${perfume.per_seq}&cpage=${cpage}">
									<button type="button" class="replyDelBtn replyBtn">삭제</button></a>
									<button class="replyUpdBtn replyBtn" type="submit">완료</button>
								</div>
							</div>
						</c:if>
					</form>
					<div class="row height15"></div>
				</c:forEach>
        </div>
        </div>
        <!-- 댓글 입력  -->
		<div class="row">
			<div class="col">
				<div class="row messageBox messageBorder">
				<form action="/perfumeReply/insert" method="post" >
					<div class="sessionID col-12">${loginID}</div>
					<input type="hidden" name="per_seq" value="${perfume.per_seq}">
					<input type="text" id="replyInput"class="col-12" name="contents" placeholder="댓글을 입력해주세요.">
					<input type="hidden" name="cpage" value="${cpage}">
					<div class="col-12 d-flex flex-row-reverse">
						<button type="submit" id="replyComplete" class="replyBtn">확인</button>
					</div>
					</form>
				</div>
			</div>
		</div>
        <input type="hidden" id="loginID" value="${loginID}">
        <div class="row height40"></div>
        <div class="row footer">
       <%--   <c:import url="/WEB-INF/views/common/fsooter.jsp" /> --%>
        </div>
    </div>
    
 <script>
let replyFlag = true
 // 게시글 수정
 $("#updateBtn").on("click",function(){
	 let per_seq = $("#per_seq").val();
	 console.log("per_seq : " + per_seq);
	 location.href="/perfume/toUpdate?per_seq="+per_seq;
 });
 // 댓글 수정
 $(".replyModBtn").on("click", function(){
	 if(replyFlag==true){
	 let contents = $(this).parent().parent().prev().prev().children();
	 $(this).css("display","none"); 
	 $(this).next().children().css("display","inline-block");
	 $(this).next().next().css("display","inline-block");
	 contents.removeAttr("readonly");
	 replyFlag = false;
	 }
	 else if(replyFlag==false){
		 alert("댓글 수정을 완료해주세요.");
		 return false;
	 }
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
	 this.className = $(this).hasClass('true') ? "fa-regular fa-heart fa-xl false" : "fa-solid fa-heart fa-xl true";	 
	 console.log($(this).hasClass('true'));
	 let per_seq =  $(this).prev().val();
	 let id = $("#loginID").val();
	 t(per_seq, $(this).hasClass('true'),id) 
 });
 
 </script>

</body>
</html>