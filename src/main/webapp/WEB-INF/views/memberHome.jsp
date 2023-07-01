<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- 아이콘 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

  <!-- 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
  <title>Home</title>

  <!-- bootstrap cdn -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
    crossorigin="anonymous"></script>

 <style>
 * {
  box-sizing: border-box;
}
:root{
  --text-color: black;
  --background-color: pink;
  --a-color: rgb(108, 108, 108);
}
body {
  margin: 0%;
  
}
/* font-family: 'Source Sans Pro'; */
a {
  text-decoration: none;
}


/* ----- 바디 ----- */
.carousel-control-next{
  height: 80%;
}

 </style>
</head>
<script>
    $(document).ready(function () {
      $('#tableBox').DataTable();
    });
  </script> 
<body> 
  <div class="rowheader">
   <c:import url="/WEB-INF/views/common/navi.jsp" />
  </div>
  <div class="rowbody">
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="3000">
          <img src="/resources/n_2_u_u.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="3000">
          <img src="/resources/y_1_u.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="3000">
          <img src="/resources/b_1_u.jpg" class="d-block w-100" alt="...">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
        data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
        data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>

  <div class="rowfooter">
    <c:import url="/WEB-INF/views/common/footer.jsp" />
  </div>
  <script>
    // 햄버거 바 클릭했을때
    const hamburgerBtn = document.querySelector('.navbar_hamburgerBtn');
    const menu = document.querySelector('.navbar_menu');
    const icon = document.querySelector('.navbar_icon');
    

    hamburgerBtn.onclick = function () {
      menu.classList.toggle('active');
      icon.classList.toggle('active');
    };
  </script>

</body>

</html>


