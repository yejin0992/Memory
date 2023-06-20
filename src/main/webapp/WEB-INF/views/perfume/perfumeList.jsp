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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>Perfume List</title>
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

.body {
	position: relative;
	background-color: aqua;
}

.image {
	height: 300px;
	background-color: aquamarine;
	position: static;
	top: 100px;
}

.contentTop {
	position: sticky;
	top: 100px;
	height: 40px;
	border-bottom: 1px solid black;
	background-color: rgb(240, 218, 237);
	z-index: 2;
}

.sideNaviBrand {
	position: relative;
	top: 30px;
	height: 300px;
	overflow-y: auto;
	background-color: beige;
}

.BrandTitle {
	position: sticky;
	top: 0px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-top: 5px;
	z-index: 1;
}

.sideNaviPrice {
	position: relative;
	top: 60px;
	overflow-y: auto;
	background-color: beige;
}

.priceTitle {
	position: sticky;
	top: 0px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-top: 5px;
	z-index: 1;
}

.sideNaviSearch {
	position: relative;
	top: 90px;
	overflow-y: auto;
	background-color: beige;
}

#contentList {
	min-height: 1100px;
	max-height: 1300px;
	overflow-y: auto;
}

.contentTitle {
	line-height: 30px;
	color: red;
	font-weight: bold;
}

.contentImage {
	height: 265px;
}

.list-group {
	border: 0px;
	z-index: 0;
}

.heartRow {
	height: 23px;
	text-align: center;
}

.liImage{
width:100%;
height:100%;
}



</style>



</head>
<body>
	<div class="container">
		<div class="row head">헤더</div>
		<div class="row body">
			<div class="col body">
				<div class="row image">image</div>
				<div class="row contentTop">
					<div class="col-12 contentTitle">perfume</div>
				</div>
				<div class="row">
					공백
					<div class="col">
						<!-- 관리자 로그인시에만 활성화 -->
						<button>
							<a href="/perfume/toInsert"> 글쓰기</a>
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-4 col-md-3 col-lg-2 sideNavi">
						<div class="sideNaviBrand row p-2">
							<div class="BrandTitle">Brand</div>
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
							<div class="priceTitle col-12">Price</div>
							<div class="row p-0 m-0">
								<input type="text" class="priceText col-5" id="startPrice"
									name="startPrice">
								<div class="col-1">~</div>
								<input type="text" class="priceText col-5" id="endPrice"
									name="endPrice">
							</div>

						</div>
						<div class="sideNaviSearch row p-2">
							<div class="col-12 SearchTitle">Search</div>
							<select id="category">
								<option value="note">노트</option>
								<option value="name">이름</option>
							</select> <input type="text" id="searchText">
							<button type="submit" id="search">검색</button>
						</div>
					</div>
					<div class="col-8 col-md-9 col-lg-10 p-0" id="contentList">
						<ul class="row list-group list-group-horizontal m-0">
							<c:forEach var="i" items="${list}" begin="0" end="3" step="1">
								<li class="list-group-item col-sm-6 col-lg-3 boardList" value="${i.per_seq}">
									<div class="row contentImage">
										<img src="/perfumeImage/${i.sysName}" class="liImage">
									</div>
									<div class="row">${i.per_brand}</div>
									<div class="row">${i.per_name }</div>
									<div class="row">${i.per_price}</div>
									<div class="row heartRow">
									<input type="hidden" class="per_seq" name="per_seq" value="${i.per_seq}">
									<c:choose>
									<c:when test="${i.heart_flag == 0}">
									
									<i class="fa-regular fa-heart false"></i>
									</c:when>
									<c:when test="${i.heart_flag == 1}">
									<i class="fa-solid fa-heart true"></i>
									</c:when>
									</c:choose>	</div>										
								</li>
							</c:forEach>
						</ul>

						<ul class="row list-group list-group-horizontal m-0">
							<c:if test="${list.size() > 4 }">
								<c:forEach var="i" items="${list }" begin="4" end="7" step="1">
									<li class="list-group-item col-sm-6 col-lg-3 boardList">
										<div class="row contentImage">
											<img src="/perfumeImage/${i.sysName}" class="liImage">
									</div>
									<div class="row">${i.per_brand}</div>
									<div class="row">${i.per_name }</div>
									<div class="row">${i.per_price}</div>
									<div class="row heartRow">
									<input type="hidden" class="per_seq" name="per_seq" value="${i.per_seq}">
									<c:choose>
									<c:when test="${i.heart_flag == 0}">
									<i class="fa-regular fa-heart false"></i>
									</c:when>
									<c:when test="${i.heart_flag == 1}">
									<i class="fa-solid fa-heart true"></i>
									</c:when>
									</c:choose>	</div>										
								</li>
								</c:forEach>
							</c:if>
						</ul>


						<ul class="row list-group list-group-horizontal m-0">
							<c:if test="${list.size() > 8}">
								<c:forEach var="i" items="${list }" begin="8" end="11" step="1">
									<li class="list-group-item col-sm-6 col-lg-3 boardList">
										<div class="row contentImage">
										<img src="/perfumeImage/${i.sysName}" class="liImage">
									</div>
									<div class="row">${i.per_brand}</div>
									<div class="row">${i.per_name }</div>
									<div class="row">${i.per_price}</div>
									<div class="row heartRow">
									<input type="hidden" class="per_seq" name="per_seq" value="${i.per_seq}">
									<c:choose>
									<c:when test="${i.heart_flag == 0}">
									
									<i class="fa-regular fa-heart false"></i>
									</c:when>
									<c:when test="${i.heart_flag == 1}">
									<i class="fa-solid fa-heart true"></i>
									</c:when>
									</c:choose>	</div>										
								</li>
								</c:forEach>
							</c:if>
						</ul>

					</div>
					<div class="row pageNavi">
						<nav aria-label="Page navigation example" align="center" id="pageNavigation">
							<ul class="pagination d-flex justify-content-center">
								<c:forEach var="i" items="${pagination}">
									<c:choose>
										<c:when test="${i eq '<<'}">
											<li class="page-item"><a class="page-link"
												href="/perfume/perfumeList?cpage=${start}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '<'}">
											<li class="page-item"><a class="page-link"
												href="/perfume/perfumeList?cpage=${cpage - 10}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '>'}">
											<li class="page-item"><a class="page-link"
												href="/perfume/perfumeList?cpage=${cpage + 10}">${i}</a></li>
										</c:when>
										<c:when test="${i eq '>>'}">
											<li class="page-item"><a class="page-link"
												href="/perfume/perfumeList?cpage=${end}">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link ${i == cpage ? 'current-page' : ''}"
												href="/perfume/perfumeList?cpage=${i}"
												${i == cpage ? "disabled" : ""} onclick="${i == cpage ? "event.preventDefault()" : ""}" >
													${i} </a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</nav>
					</div>
					<div class="row footer">푸터</div>
				</div>
			</div>
		</div>


		<script>
    var currentPage = ${cpage}; // 현재 페이지 번호
    var pageLinks = document.querySelectorAll(".page-link"); // 페이지 링크 요소들을 가져옴

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
    currentPage2.style.backgroundColor = '#1e3c3e';
    currentPage2.style.color = 'white';
    
    // 향수 클릭 시 디테일 뷰 이동
    $(".boardList").on("click", function(){
    	let per_seq = $(this).val();
    	alert(per_seq);
    	location.href="/perfume/select?per_seq="+per_seq;
    })
    
    // 동적으로 생긴 향수 목록 클릭 시 디테일 뷰 이동
     $(document).on("click", ".boardList", function() {
    	let per_seq = $(this).val();
    	alert(per_seq);
    	location.href="/perfume/select?per_seq="+per_seq;
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
	    				let brand = $("<div>").addClass("row").text(resp[i].per_brand);
	    				let per_name = $("<div>").addClass("row").text(resp[i].per_name);
	    				let price = $("<div>").addClass("row").text(resp[i].per_price);
	    				
	    				imageRow.append(image);
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
	 
	 t = (per_seq, isTrue) => {
		 console.log("per_seq : "+per_seq);
		 console.log("isTrue : "+ isTrue);
		  $.ajax({
		    url: "/perfume/heartFlagTrue",
		    type: "post",
		    data: {
		      per_seq: per_seq,
		      isTrue: isTrue
		    }
		  });
		  alert("ajax수행");
		};
	  
	 // 좋아요 클릭
	 $(".fa-heart").on("click", function (ev) {
		 // boardlist 이벤트 막기
		 ev.stopPropagation();
		 this.className = $(this).hasClass('true') ? "fa-regular fa-heart false" : "fa-solid fa-heart true";	 
		 console.log($(this).hasClass('true'));
		 let per_seq =  $(this).prev().val();
		 // 넘어가는 값은 (id, true인지 false인지)
	 	 t(per_seq, $(this).hasClass('true')) 
	 });
    
    </script>
</body>
</html>