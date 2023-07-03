<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<!-- JavaScript Bundle with Popper -->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
   crossorigin="anonymous"></script>
<!-- CSS only -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
.borderName {
   font-size: 35px;
   padding-top: 80px;
   padding-bottom: 80px;
}

#btnArea a {
text-decoration: none;
color: #b2a08a;
}

.borderName a:hover, #btnArea a:hover {
color: #b2a08a;
font-weight: bold;
}

input[type="text"] {
   border: none;
   outline: none;
   background-color: transparent;
   border-bottom: 1px solid black;
}

#title {
   width: 100%;
   margin-top: 20px;
   font-size: 30px;
   padding-left: 20px;
}

#content {
   overflow: hidden;
   min-height: 300px;
   max-height: 100%;
   width: 100%;
   margin-top: 22px;
   font-size: 18px;
   padding: 10px;
   resize: none;
   border-color: #dddddd;
   pointer-events: none;
   border: none;
   
}

#content:focus {
   outline: none;
}

#content_info {
   color: #999999;
   font-size: 13px;
   padding: 8px;
}

.content_info_name {
   font-weight: bold;
   color: rgb(73, 73, 73);
}

#contentBox {
padding: 10px;

}
#imgBox {
    position: relative;
    max-width: 100%;
    min-height: max-content;
}

img {
    width: 100%;
}

/* content 버튼 */
#backBtn, #deleteBtn, #updateBtn {
   border: 1px solid rgb(210, 210, 210);
   background-color: white;
   margin-right: 10px;
   margin-top: 10px;
   border-radius: 3px;
   width: 80px;
   height: 35px;
}

/* 댓글입력 */
#replyContainer {
   border: 1px solid #b2a08a;
   height: 110px;
   border-radius: 5px;
}

#replyHead {
   height: 30%;
   padding: 2px 20px;
}

#replyHead>#writer {
   font-weight: bold;
   fond-size: 20px;
   border-bottom: none;
}

#replyBody {
   height: 70%;
}

.textarea {
   width: 90%;
   height: 100%;
   resize: none;
   border: none;
   padding-left: 20px;
}

.textarea:focus {
   outline: none;
}

#reply_insert_btn {
   width: 10%;
}

#replyBtn {
   border: none;
   background-color: #b2a08a;
   border-radius: 3px;
   margin-top: 30px;
   margin-right: 20px;
   padding: 5px 8px;
   color: white;
}

#replyBtn:hover {
   cursor: pointer;
   background-color: #525252;
}

#msg {
   width: 90%;
   height: 100%;
}

#replyInsertTextarea {
width: 100%;
}

/* 댓글 수정,삭제,출력 */
#nextreply {
   border: 1px solid #dddddd;
   width: 100%;
   height: 120px;
   padding: 4px 20px;
   border-radius: 7px;
}

#box {
   float: right;
}

#reply_date {
   margin-left: 10px;
   color: #999999;
}

.reply_btn {
   border: none;
   background-color: white;
   margin-right: 1px;
}

#nextReply_textarea {
   height: 50%;
   width: 100%;
}

.footer {
   margin-top: 50px;
}
   
  @font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-weight: 400;
   font-style: normal;
}
   
  </style>
</head>
 <body style="font-family: 'Pretendard-Regular', sans-serif;">


   <c:if test="${param.status == 'update' }">
      <script>
         alert("수정 완료 했습니다.");
      </script>
   </c:if>

   <div class="head">
      <c:import url="/WEB-INF/views/common/navi.jsp" />
   </div>
    
    <c:choose>
    <c:when test="${loginID==null}">
   <script>
   location.href="/";
   </script>
   </c:when>
   <c:otherwise>
   <div class="container">
      <form
         action="/qnaBoard/updatePost?qa_seq=${post.qa_seq}&qa_write_date=${post.qa_write_date}&qnaCpage=${qnaCpage}"
         id="form" method="post">

         <div class="body">
            <div class="borderName" align="center"><a href="/qnaBoard/boardList?qnaCpage=${qnaCpage}">Q & A</a></div>

            <input type="text" id="title" name="qa_title"
               value="${post.qa_title }" readonly>
            <div id="content_info">
               <span class="content_info_name">작성자 |</span> ${post.qa_writer} <span
                  class="content_info_name">작성일 |</span> ${post.qa_write_date} <span
                  class="content_info_name">조회수 |</span> ${post.qa_view_count}
            </div>

            <div id="contentBox">
               <c:forEach var="i" items="${file}">
               <div id="imgBox">
                  <img src="/qnaUpload/${i.sysName}">
                  </div>
               </c:forEach>
               <div>
               <textarea id="content" name="qa_contents"
                  value="${post.qa_contents}" readonly>${post.qa_contents}
                  </textarea>
                  </div>
            </div>

            <c:choose>
               <c:when test="${loginID eq post.qa_writer}">
                  <div id="btnArea" align="right">
                     <a href="/qnaBoard/boardList?qnaCpagee=${qnaCpage}">
                     <input type="button" id="backBtn" class="btn toList" value="목록">
                        <a href="/qnaBoard/delete?qa_seq=${post.qa_seq}"> 
                        <input type="button" id="deleteBtn" class="btn" value="삭제"></a> 
                        <input type="button" id="updateBtn" class="btn" value="수정">
                  </div>

               </c:when>
               <c:otherwise>

                  <div id="btnArea" align="right">
                     <a href="/qnaBoard/boardList"> <input type="button"
                        id="backBtn" class="btn" value="목록"></a>
                  </div>

               </c:otherwise>
            </c:choose>
         </div>
         <input type="hidden" name="qa_seq" value="${post.qa_seq}">
      </form>


      <!-- 댓글 출력 / 수정 / 삭제 -->

      <c:forEach var="r" items="${reply}">
         <hr>
         <form action="/reply/replyUpdate" method="post">
            <div id="nextreply">
               <span id="reply_id"> <b>${r.re_writer}</b>
               </span> <span id="reply_date">${r.re_write_date}</span>
               <c:choose>
                  <c:when test="${loginID eq r.re_writer}">
                     <div id="box">
                        <div class="nextReply_btn">
                           <input type="button" class="re_deleteBtn reply_btn" value="삭제"
                              seq=${r.re_seq}> <input type="button"
                              class="re_updateBtn reply_btn" value="수정">
                        </div>
                     </div>
                  </c:when>
               </c:choose>
               <textarea id="nextReply_textarea" class="textarea"
                  name="re_contents" readonly>${r.re_contents}</textarea>


               <input type="hidden" name="qa_seq" value="${r.qa_seq}"> <input
                  type="hidden" name="re_seq" value="${r.re_seq}">
                  <input type="hidden" name="qnaCpage" value="${qnaCpage}">
            </div>
         </form>
      </c:forEach>

      <!-- 댓글 입력 -->
      <form action="/reply/replyInsert" method="post">
         <hr>
         <div id="replyContainer">
            <div id="replyHead">
               <input type="text" id="writer" value="${sessionScope.loginID}"
                  name="re_writer" readonly>
            </div>
            <div id="replyBody" style="display: flex;">
               <div id="msg">
                  <textarea id="replyInsertTextarea" class="textarea"
                     name="re_contents"></textarea>
               </div>
               <div id="reply_insert_btn" align="right">
                  <input type="submit" id="replyBtn" value="등록">
               </div>
            </div>
            <input type="hidden" name="qa_seq" value="${post.qa_seq}">
            <input type="hidden" name="qnaCpage" value="${qnaCpage}">
         </div>
      </form>

   </div>

</c:otherwise>
   </c:choose>


   <div class="footer">
      <c:import url="/WEB-INF/views/common/footer.jsp" />
   </div>

   <script>
      // 게시글 수정 버튼
      $("#updateBtn").on("click", function() {
         $("#content").css({
            "pointer-events" : "auto",
            "resize" : "auto"
         });
         $("#title").removeAttr("readonly");
         $("#content").removeAttr("readonly");
         $("#updateBtn,#deleteBtn,.toList").css("display", "none");

         let updateComplete = $("<input>");
         updateComplete.attr("value", "완료");
         updateComplete.attr("type", "submit");
         updateComplete.css({
            "border" : "1px solid rgb(210, 210, 210)",
            "background-color" : "white",
            "margin-right" : "10px",
            "margin-top" : "10px",
            "border-radius" : "3px",
            "width" : "80px",
            "height" : "35px"
         });
         


         let cancel = $("<input>");
         cancel.attr("type", "button");
         cancel.attr("value", "취소");
         cancel.css({
            "border" : "1px solid rgb(210, 210, 210)",
            "background-color" : "white",
            "margin-right" : "10px",
            "margin-top" : "10px",
            "border-radius" : "3px",
            "width" : "80px",
            "height" : "35px"
         });
         cancel.on("click", function() {
            location.reload();
         });
         
         let backBtn = $("#backBtn");
         backBtn.css({
             "margin-right": "5px",
             "margin-bottom": "15px",
         });
         $("#btnArea").append(updateComplete);
         $("#btnArea").append(cancel);
      });
      
      // 게시글 삭제
      $("#deleteBtn").on("click",function(){
         var delet = confirm("댓글을 삭제하시겠습니까?");
         if (result) {
            alert("삭제 완료 되었습니다.");
            location.href = "/reply/replyDelete?qa_seq=${post.qa_seq}&re_seq="
                  + replySeq;
         } else {
         }
      });

      // 댓글 수정하기 버튼
      $(".re_updateBtn").on("click", function() {
         let updateFlag = true;
         if (updateFlag == true) {
            $(this).css("background-color", "red");
            $(this).parent().parent().next().removeAttr("readonly");
            $(this).css("display", "none");
            $(this).siblings().css("display", "none");

            let updateComplete = $("<input>");
            updateComplete.attr("type", "submit");
            updateComplete.attr("value", "완료");

            updateComplete.css({
               "border" : "none",
               "background-color" : "white",
               "margin-right" : "1px"
            });
            updateComplete.on("click", function() {
               alert("댓글 수정 완료되었습니다.")
            });

            let cancel = $("<input>");
            cancel.attr("type", "button");
            cancel.attr("value", "취소");
            cancel.css({
               "border" : "none",
               "background-color" : "white",
               "margin-right" : "1px"
            });
            cancel.on("click", function() {
               location.reload();
            });

            let updateBox = $(this).parent();
            updateBox.append(updateComplete);
            updateBox.append(cancel);
            
            updateFlag = false;
            
         } else if (updateFlag == false) {
            alert("댓글 수정을 완료해 주세요.");
            return false;
         }
      });

      // 댓글 삭제
      $(".re_deleteBtn").on(
                  "click",
                  function() {
                     let replySeq = $(this).attr("seq");
                     var result = confirm("댓글을 삭제하시겠습니까?");
                     if (result) {
                        alert("삭제 완료 되었습니다.");
                        location.href = "/reply/replyDelete?qa_seq=${post.qa_seq}&re_seq="
                              + replySeq;
                     } else {
                     }
                  });

      // 댓글 등록 
      $("#replyBtn").on("click", function() {
         let replyInsert = $("#replyInsertTextarea").val();
         console.log(replyInsert);
         if (replyInsert.trim() == "") {
            alert("댓글을 입력하세요.");
            return false;
         } else {
            $("#form").submit();
         }
      });
   </script>

</body>


</html>