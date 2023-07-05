<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- fontawesome  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">


<title>Perfume List</title>
<style>
* {
	box-sizing: border-box;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

:root { -
	-swiper-theme-color: #544639;
}

.listHead {
	position: sticky;
	top: 0;
	height: 50px;
	z-index: 2;
	background-color: white;
}

.body {
	position: relative;
	background-color: white;
	font-family: 'Pretendard-Regular';
}

.imageRow {
	height: 350px;
	position: static;
	top: 50px;
	display: flex;
}

#mainImage {
	width: 100%;
	height: 100%;
	flex: 1;
	padding: 0px;
	background-color: black;
	opacity: 0.7;
}

.contentTop {
	position: sticky;
	top: 50px;
	height: 55px;
	border-bottom: 1px solid black;
	background-color: white;
	z-index: 2;
}

.contentTitle {
	line-height: 55px;
	color: black;
	font-size: 20px;
	text-align: left;
}

.sideNaviBrand {
	position: relative;
	top: 30px;
	height: 300px;
	overflow-y: auto;
	background-color: white;
}

.BrandTitle {
	position: sticky;
	top: -10px;
	padding-bottom: 0px;
	padding-right: 0px;
	padding-top: 5px;
	padding-left: 0px;
	z-index: 1;
	background-color: white;
	font-weight: bold;
	height: 40px;
}

.sideNaviPrice {
	position: relative;
	top: 60px;
	overflow-y: auto;
	background-color: white;
}

.priceTitle {
	position: sticky;
	top: 0px;
	padding-bottom: 10px;
	padding-top: 5px;
	padding-left: 0px;
	padding-right: 0px;
	margin-left: 0px;
	z-index: 1;
	font-weight: bold;
}

.searchTitle {
	font-weight: bold;
	margin-bottom: 10px;
	padding: 0px;
}

.sideNavi {
	padding-right: 30px;
}

.sideNaviSearch {
	position: relative;
	top: 90px;
	overflow-y: auto;
	background-color: white;
}

#contentList {
	min-height: 1100px;
	max-height: 1400px;
	overflow-y: auto;
}

.contentImage {
	height: 265px;
}

 
.list-group {
    --bs-list-group-border-color: none; 
    --bs-list-group-border-width: opx; 
    --bs-list-group-border-radius: 0px; 
}

.heartRow {
	position: relative;
	height: 23px;
	text-align: right;
	bottom: 14px;
}

.form-check {
	height: 20px;
}

.liImage {
	width: 100%;
	height: 100%;
	padding: 0px;
}


.btn-warning {
	width: 100%;
	height: 100%;
    --bs-btn-color: white;
    --bs-btn-bg:#b2a08a;
    --bs-btn-border-color: none; 
    --bs-btn-hover-color: white;
    --bs-btn-hover-bg:#525252;
    --bs-btn-hover-border-color: none;
    --bs-btn-focus-shadow-rgb: 217,164,6;
    --bs-btn-active-color: white;
    --bs-btn-active-bg: #525252;
    --bs-btn-active-border-color: none;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #000;
    --bs-btn-disabled-bg: #ffc107;
    --bs-btn-disabled-border-color: #ffc107;
}

#tilde {
	text-align: center;
	font-weight: bold;
}

#category {
	margin-bottom: 10px;
}

.sideHr {
	margin-top: 5px;
	margin-bottom: 10px;
}

.list-group-item {
	padding: 20px;
}

.pageNavi{
height:100px;
padding-top:30px;
}

.brandRow {
	margin-top : 5px;
	padding: 2px;
	font-size: 13px;
	color: grey;
}

.nameRow {
	padding: 2px;
	font-size: 17px;
	font-weight: 380;
}

.priceRow {
	padding: 2px;
	color: #c28243;
	font-weight: bold;
}

.priceHr {
	margin-top: 10px;
	margin-bottom: 10px;
}

.true {
	color: #c28243;
}

#reload {
	position:relative;
	top : 80px;
	padding-top: 20px;
	padding-left: 0px;
	font-weight: bold;
}

#reload:hover {
	color: #c28243;
}

.textRow {
	text-align: center;
	height: 150px;
	padding-top: 70px;
}

#perfume {
	font-size: 25px;
	font-weight: 200;
}

.pageList{
width:30px;
height:30px;
line-height:30px;
color : grey;
}

.page{
color : grey;
}

#write{
color : lightgrey;
}

.boardList{
cursor: pointer;
}

.boardHover{
background-color: #EBEBEB;
opacity : 0.2;
} 

</style>

</head>
<body>
	<div class="row listHead">
			<c:import url="/WEB-INF/views/common/navi.jsp" />
		</div>
	<div class="container">
		<div class="row body">
			<div class="col body p-0">
				<div class="row imageRow m-0 p-0">
					<img src="/resources/perfume1_1.jpg" id="mainImage">
				</div>
				<div class="row textRow">
					<div class=col-12>
						<span id="perfume">perfume</span><br> 원하는 향수를 자유롭게 찾아보세요
					</div>
				</div>
				<div class="row contentTop m-0">
					<div class="col-12 contentTitle">perfume</div>
				</div>
				<div class="row m-0">
					<div class="col">
						<!-- 관리자 로그인시에만 활성화 -->
						<%-- <a href="/perfume/toInsert" id="write"> 글쓰기 </a> <input type="hidden"
							id="loginID" value="${sessionScope.loginID}"> --%>
					</div>
				</div>
				<div class="row m-0">
					<div class="col-4 col-md-3 col-lg-2 sideNavi">
						
						<div class="sideNaviBrand row p-2">
							<div class="col-12 BrandTitle">
								Brand
								<hr class="sideHr">
							</div>

							<c:forEach var="i" items="${brand}">
								<div class="form-check">
									<input class="form-check-input brand" type="checkbox"
										id="flexCheckDefault" value="${i}" name="checkedValue">
									<label class="form-check-label" for="flexCheckDefault"
										name="checkedValue"> ${i} </label>
								</div>
							</c:forEach>
						</div>
						<div class="sideNaviPrice row p-2">
							<div class="priceTitle col-12">
								Price
								<hr class="sideHr">
							</div>
							<div class="row p-0 m-0">
								<input type="text" class="col-12 form-control form-control-sm"
									id="startPrice" name="startPrice">
								<div class="col-12" id="tilde">~</div>
								<input type="text" class="col-12 form-control form-control-sm"
									id="endPrice" name="endPrice">
							</div>
							

						</div>
						<div class="sideNaviSearch row p-2">

							<div class="col-12 searchTitle">
								Search
								<hr class="sideHr">
							</div>
							<div class="col-12 p-0 m-0 selectCol">
								<select id="category" class="form-select form-select-sm">
									<option value="name">이름</option>
									<option value="note">노트</option>
								</select>
							</div>
							<div class="col-10 p-0 m-0">
								<input type="text" id="searchText"
									class="form-control form-control-sm">
								<!-- <button type="submit" id="search">검색</button> -->
							</div>
							<div class="col-2 p-0 m-0">
								<button type="submit" id="search"
									class="btn btn-warning p-0 m-0">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>

						</div>
						
						<div class="row p-2">
							<div class="col-12" id="reload">
								Reload <i class="fa-sharp fa-solid fa-rotate-right"></i>
							</div>
						</div>
					</div>
					<div class="col-8 col-md-9 col-lg-10 p-0" id="contentList">
						<ul class="row list-group list-group-horizontal m-0">
							<c:forEach var="i" items="${list}" begin="0" end="3" step="1">
								<li class="list-group-item col-sm-6 col-lg-3 boardList"
									value="${i.per_seq}">
									<div class="row contentImage">
										 <img src="/perfumeImage/${i.sysName}" class="liImage"> 
									</div>
									<div class="row brandRow">${i.per_brand}</div>
									<div class="row nameRow">${i.per_name }<hr class="priceHr">
									</div>
									<div class="row priceRow">
									<fmt:formatNumber  type="number" maxFractionDigits="3" value="${i.per_price}" />원
									</div>
									<div class="row heartRow">
										<input type="hidden" class="per_seq" name="per_seq"
											value="${i.per_seq}"> <i
											class="fa-heart fa-lg ${i.heartFlag==1 ? 'fa-solid true' : 'fa-regular false'}"></i>
									</div>
								</li>
							</c:forEach>
						</ul>

						<ul class="row list-group list-group-horizontal m-0">
							<c:if test="${list.size() > 4 }">
								<c:forEach var="i" items="${list }" begin="4" end="7" step="1">
									<li class="list-group-item col-sm-6 col-lg-3 boardList"
										value="${i.per_seq}">
										<div class="row contentImage">
											 <img src="/perfumeImage/${i.sysName}" class="liImage"> 
										</div>
										<div class="row brandRow">${i.per_brand}</div>
										<div class="row nameRow">${i.per_name }<hr class="priceHr">
										</div>
										<div class="row priceRow">
									<fmt:formatNumber  type="number" maxFractionDigits="3" value="${i.per_price}" />원
									</div>
										<div class="row heartRow">
											<input type="hidden" class="per_seq" name="per_seq"
												value="${i.per_seq}">
											<c:choose>
												<c:when test="${i.heartFlag == 0}">
													<i class="fa-regular fa-heart fa-lg false"></i>
												</c:when>
												<c:when test="${i.heartFlag == 1}">
													<i class="fa-solid fa-heart fa-lg true"></i>
												</c:when>
											</c:choose>
										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>


						<ul class="row list-group list-group-horizontal m-0">
							<c:if test="${list.size() > 8}">
								<c:forEach var="i" items="${list }" begin="8" end="11" step="1">
									<li class="list-group-item col-sm-6 col-lg-3 boardList"
										value="${i.per_seq}">
										<div class="row contentImage">
											<img src="/perfumeImage/${i.sysName}" class="liImage"> 
										</div>
										<div class="row brandRow">${i.per_brand}</div>
										<div class="row nameRow">${i.per_name }<hr class="priceHr">
										</div>
										<div class="row priceRow">
									<fmt:formatNumber  type="number" maxFractionDigits="3" value="${i.per_price}" />원
									</div>
										<div class="row heartRow">
											<input type="hidden" class="per_seq" name="per_seq"
												value="${i.per_seq}">
											<c:choose>
												<c:when test="${i.heartFlag == 0}">
													<i class="fa-regular fa-heart fa-lg false"></i>
												</c:when>
												<c:when test="${i.heartFlag == 1}">
													<i class="fa-solid fa-heart fa-lg true"></i>
												</c:when>
											</c:choose>
										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>

					</div>
					</div>
					<div class="row pageNavi">
						<nav aria-label="Page navigation example" align="center"
							id="pageNavigation">
							<ul class="pagination d-flex justify-content-center">
								<c:forEach var="i" items="${pagination}">
									<c:choose>
										<c:when test="${i eq '<<'}">
											<li class="pageList"><a class="page"
												href="/perfume/perfumeList?cpage=${start}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '<'}">
											<li class="pageList"><a class="page"
												href="/perfume/perfumeList?cpage=${cpage - 10}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '>'}">
											<li class="pageList"><a class="page"
												href="/perfume/perfumeList?cpage=${cpage + 10}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '>>'}">
											<li class="pageList"><a class="page"
												href="/perfume/perfumeList?cpage=${last}">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="pageList"><a
												class="page ${i == cpage ? 'current-page' : ''}"
												href="/perfume/perfumeList?cpage=${i}"
												${i == cpage ? "disabled" : ""} onclick="${i == cpage ? "event.preventDefault()" : ""}" >
													${i} </a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</nav>
					</div>
					
				</div>
			</div>
		</div>
		<div class="row footer">
						<c:import url="/WEB-INF/views/common/footer.jsp" />
					</div>


		<script>
    var currentPage = ${cpage}; // 현재 페이지 번호
    var pageLinks = document.querySelectorAll(".page"); // 페이지 링크 요소들을 가져옴

    for (var i = 0; i < pageLinks.length; i++) {
      // 페이지 링크 요소들에 클릭 이벤트를 추가
      pageLinks[i].addEventListener("click", function(event) {
        if (parseInt(event.target.textContent) === currentPage) {
          // 현재 페이지 번호와 클릭한 페이지 번호가 같으면 클릭 이벤트를 막음
          event.preventDefault();
        } else {
          // 현재 페이지 번호와 클릭한 페이지 번호가 다르면 링크를 따라 이동
          window.location.href = event.target.getAttribute("href");
        }
      });
    }
    
    const currentPage2 = document.querySelector('.current-page');
    currentPage2.style.color = 'black';
    currentPage2.style.fontWeight='500';
    
    // 향수 클릭 시 디테일 뷰 이동
    $(".boardList").on("click", function(){
    	let per_seq = $(this).val();
    	location.href="/perfume/select?per_seq="+per_seq+"&cpage="+currentPage;
    })
    
    // 동적으로 생긴 향수 목록 클릭 시 디테일 뷰 이동
     $(document).on("click", ".boardList", function() {
    	let per_seq = $(this).val();
    	location.href="/perfume/select?per_seq="+per_seq+"&cpage="+currentPage;
    }); 
   
	// 브랜드, 가격으로 필터
	function commonFunction(){ 
			  let checkedValue = [];
		 $(".brand:checked").each((i,e)=>{
			 checkedValue.push($(e).val());
			 console.log(i + " : " + e.value);
		 });
		 let startPrice = $("#startPrice").val();
	 	 if(startPrice == '' ){
			 startPrice = null;
		 } 
		 let endPrice = $("#endPrice").val();
		  if(endPrice == '' ){
			 endPrice = null;
		 } 
		 let category = $("#category").val();
		 let searchText = $("#searchText").val();
		 if(searchText == '' ){
			 searchText = null;
		 }
			 console.log(checkedValue);
			 console.log(startPrice);
			 console.log(endPrice); 
			 console.log(category); 
			 console.log(searchText); 
			 
		 let params = {
				 checkedValue: checkedValue || null,
				 startPrice: startPrice || null,
				 endPrice: endPrice,
				 category : category,
				 searchText:searchText
		 }
	      $.ajax({
	        url: "/perfume/entireSearch",
	        type: "post",
	        contentType: "application/json",
	        data: JSON.stringify(params)
	    }).done(function(resp){
	    	 $(".list-group").empty();
	    	$(".pagination").empty();
	    		let contentList = $("#contentList");
	    		let ul = $("<ul>").addClass("row list-group list-group-horizontal m-0");
	    			for(let i=0; i<resp.length; i++){
	    				let li = $("<li>").addClass("list-group-item col-sm-6 col-lg-3 boardList").val(resp[i].per_seq);
	    				let imageRow = $("<div>").addClass("row contentImage");
	    				let image = $("<img>").addClass("liImage").attr("src","/perfumeImage/"+resp[i].sysName);
	    				let hiddenSeq = $("<input>").attr("type","hidden").addClass("per_seq").attr("name","per_seq").val(resp[i].per_seq);
	    				let brand = $("<div>").addClass("row brandRow").text(resp[i].per_brand);
	    				let per_name = $("<div>").addClass("row nameRow").text(resp[i].per_name);
	    				let price = $("<div>").addClass("row priceRow").text(resp[i].per_price.toLocaleString()+"원");
	    				imageRow.append(image);
	    				per_name.append($("<hr>").addClass("priceHr"));
	    	    		li.append(imageRow);
	    	    		li.append(brand);
	    	    		li.append(per_name);
	    	    		li.append(price);
	    	    		ul.append(li); 
	    	     	} 
	    			contentList.empty(); 
	    			 contentList.append(ul);
	    })
	 }; 
	 
	 $(".brand").on("click", commonFunction);
	  $("#startPrice").on("keyup", commonFunction);
	 $("#endPrice").on("keyup", commonFunction); 
	 $("#search").on("click", commonFunction);
	 
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
		};
	  
	 // 좋아요 클릭
	 $(".fa-heart").on("click", function (ev) {
	
		 // boardlist 이벤트 막기
		 ev.stopPropagation();
		
		 this.className = $(this).hasClass('true') ? "fa-regular fa-heart fa-lg false" : "fa-solid fa-heart fa-lg true";	 
		 let per_seq =  $(this).prev().val();
		 let id = $("#loginID").val();
		 
		 // 넘어가는 값은 (id, true인지 false인지)
	 	 t(per_seq, $(this).hasClass('true'), id) 
	 });
    
	 //  검색 새로고침
	 $("#reload").on("click", function(){
		 location.reload();
	 })
	 
	 	// 향수 hover css 적용
	  $('.liImage').hover(
	    function() {
	      $(this).addClass('boardHover');
	    },
	    function() {
	      $(this).removeClass('boardHover');
	    }
	  ); 

    </script>
</body>
</html>