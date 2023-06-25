<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
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
  <title>Board</title>

  <style>
  
    .qnaTitle {
      text-align: center;
      font-size: 30px;
           padding-top: 100px;
      padding-bottom: 50px;
    }

    table td {
      padding: 10px;
      vertical-align: top;
      border-bottom: 1px solid #ccc;
    }

    thead th {
      padding: 10px;
      font-weight: bold;
      vertical-align: top;
      color: rgb(45, 45, 45);
      border-bottom: 3px solid rgb(52, 52, 52);
    }

    tfoot td {
   border-bottom: 0px;
    }

    #date, #hit {
    color: grey;
    }

    @media (max-width: 800px) {
      table th:nth-child(4),
      table td:nth-child(4),
      table th:nth-child(5),
      table td:nth-child(5)  {
        display: none;
      }
      table td:nth-child(1) {
        width: 10%;
      }
      table td:nth-child(2) {
        width: 70%;
      }
      table td:nth-child(3) {
        width: 20%;
      }
    }

    button {
      border: none;
			font-size: 14px;
      background-color: rgb(82, 82, 82);
			color: white;
      border-radius: 2px;
      box-shadow: 0 5px 4px rgba(0, 0, 0, 0.2);
    }

    button:hover {
			background-color: darkorange;
			font-weight: bold;
			cursor: pointer;
		}

    #searchBtn {
      background-color: none;
    }

    #keyword {
      width: 30%;
      border-radius: 2px;
      border: 1px solid rgb(82, 82, 82);
      height: 25px;
    }
    
    #selectOprion {
      height: 25px;
    }
    
    .searchBox {
    padding:50px;
    }

  </style>
</head>

<body>
  <script>
    $(document).ready(function () {
      $('#tableBox').DataTable();
    });
  </script>
 
    <div class="header">
      <c:import url="/WEB-INF/views/common/navi.jsp" />
    </div>
    <div class="row body">
      <div class="qnaTitle">Q & A</div>
      <table id="tableBox" class="display" style="width: 70%" align="center">
        <thead>
          <tr align="center">
            <th>NO</th>
            <th>SUBJECT</th>
            <th>NAME</th>
            <th>DATE</th>
            <th>HIT</th>
          </tr>
        </thead>
        <tbody>
        
          <c:forEach var="i" items="${list}">
            <tr align="center">
              <td width="10" height="20">${i.qa_seq}</td>
              <td width="570" height="20"><a href="/qnaBoard/viewCount?qa_seq=${i.qa_seq}">${i.qa_title}</a></td>
              <td width="160" height="20">${i.qa_writer}</td>
              <td width="40" height="20" id="date">${i.qa_write_date}</td>
              <td width="10" height="20" id="hit">${i.qa_view_count}</td>
            </tr>
          </c:forEach>
        </tbody>

        <tfoot>

          <tr>
            <td colspan="5">
              <!-- 페이징 -->
              <nav aria-label="Page navigation example" align="center">
                <ul class="pagination d-flex justify-content-center">
                  <c:forEach var="i" items="${pageNavi}">
                    <c:choose>
                      <c:when test="${i eq '<<'}">
                        <li class="page-item"><a class="page-link"
                            href="/qnaBoard/boardList?cpage=${firstNavi}">${i}</a></li>
                      </c:when>
                      <c:when test="${i eq '<'}">
                        <li class="page-item"><a class="page-link"
                            href="/qnaBoard/boardList?cpage=${cpage - 10}">${i}</a></li>
                      </c:when>
                      <c:when test="${i eq '>'}">
                        <li class="page-item"><a class="page-link"
                            href="/qnaBoard/boardList?cpage=${cpage + 10}">${i}</a></li>
                      </c:when>
                      <c:when test="${i eq '>>'}">
                        <li class="page-item"><a class="page-link" href="/qnaBoard/boardList?cpage=${lastNavi}">${i}</a>
                        </li>
                      </c:when>
                      <c:otherwise>
                        <li>&nbsp;<a href="/qnaBoard/boardList?cpage=${i}">${i}</a>&nbsp;
                        </li>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>
                </ul>
              </nav>
            </td>
          </tr>

          <tr>
            <td colspan="5" align="right"><a href="/qnaBoard/toWritingForm">
                <button type="button">글쓰기</button>
              </a></td>
          </tr>
          <tr>
            <td colspan="5" align="center">

              <div class="searchBox">
                <select id="selectOprion" name="searchType">
                  <option value="title">제목</option>
                  <option value="content">내용</option>
                  <option value="title_content">제목+내용</option>
                  <option value="writer">작성자</option>
                </select> 
                <input type="text" id="keyword" name="keyword"  />
                <button type="button" id="searchBtn">검색</button>
              </div> 
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
    <div class="row footer">
      <c:import url="/WEB-INF/views/common/footer.jsp" />
    </div>
  

  <script>
    document.getElementById("searchBtn").onclick = function () {

      let searchType = document.getElementsByName("searchType")[0].value;
      let keyword = document.getElementsByName("keyword")[0].value;

      location.href = "/qnaBoard/searchPost?cpage=1" + "&searchType="
        + searchType + "&keyword=" + keyword;

      console.log(searchType)
      console.log(keyword)
    };
  </script>
</body>

</html>