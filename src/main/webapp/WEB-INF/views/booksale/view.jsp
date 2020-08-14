<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@ include file="../com/head.jsp"%>
<title>Insert title here</title>
<style type="text/css">

<style type="text/css">
	.categories {
		text-align: center;
		font-size: 28px;
		color: black;
		line-height: 1;
		font-weight: 400;
	}


	.categories ul li {
		display: inline-block;
		margin: 0px 5px;
	}

	.categories ul li a {
		display: block;
		font-size: 13px;
		color: rgb(85,85,85);
		padding: 0px 20px;
		height: 38px;
		line-height: 38px;
		border: 1px solid rgb(229,229,229);
	}

	.categories ul li a:hover {
		border-color: rgb(17,17,17);
	}
	
	.th-center{
		text-align: center;
	}
	
	.table_head{
		background-color: rgb(254,247,243);
	}
	
	td{
	text-align: center;
	}
	
	.page-link {
 	 color: rgb(90,56,37);
	}
	
	.pagination>li.active>a {
 	 background-color: rgb(90,56,37) !important;
 	 border-color: rgb(90,56,37) !important;
	}
	
	.searchbutton{
	background-color: rgb(90,56,37);
	color: white;
	}
	
	.current{
	background-color: rgb(23,6,0);
	color: white !important;
	}
	
	
	


.pd-wrap {
	padding: 40px 0;
	font-family: 'Poppins', sans-serif;
}
.heading-section {
	text-align: center;
	margin-bottom: 20px;
}
.sub-heading {
	font-family: 'Poppins', sans-serif;
    font-size: 12px;
    display: block;
    font-weight: 600;
    color: #2e9ca1;
    text-transform: uppercase;
    letter-spacing: 2px;
}
.heading-section h2 {
	font-size: 32px;
    font-weight: 500;
    padding-top: 10px;
    padding-bottom: 15px;
	font-family: 'Poppins', sans-serif;
}
.user-img {
    width: 80px;
    height: 480px;
    border-radius: 50%;
    position: relative;
	min-width: 80px;
	background-size: 100%;
}
.carousel-testimonial .item {
	padding: 30px 10px;
}
.quote {
	position: absolute;
    top: -23px;
    color: #2e9da1;
    font-size: 27px;
}
.name {
	margin-bottom: 0;
    line-height: 14px;
    font-size: 17px;
    font-weight: 500;
}
.position {
	color: #adadad;
	font-size: 14px;
}
.owl-nav button {
	position: absolute;
	top: 50%;
	transform: translate(0, -50%);
	outline: none;
	height: 25px;
}
.owl-nav button svg {
	width: 25px;
	height: 25px;
}
.owl-nav button.owl-prev {
	left: 25px;
}
.owl-nav button.owl-next {
	right: 25px;
}
.owl-nav button span {
	font-size: 45px;
}
.product-thumb .item img {
	height: 10px;
	width: 400px;
	
}
.product-name {
	font-size: 22px;
	font-weight: 500;
	line-height: 22px;
	margin-bottom: 4px;
}
.product-price-discount {
	font-size: 22px;
    font-weight: 400;
    padding: 10px 0;
    clear: both;
}
.product-price-discount span.line-through {
	text-decoration: line-through;
    margin-left: 10px;
    font-size: 14px;
    vertical-align: middle;
    color: #a5a5a5;
}
.display-flex {
	display: flex;
}
.align-center {
	align-items: center;
}
.product-info {
	width: 100%;
}
.reviews-counter {
    font-size: 13px;
}
.reviews-counter span {
	vertical-align: -2px;
}
.rate {
    float: left;
    padding: 0 10px 0 0;
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float: right;
    width: 15px;
    overflow: hidden;
    white-space: nowrap;
    cursor: pointer;
    font-size: 21px;
    color:#ccc;
	margin-bottom: 0;
	line-height: 21px;
}
.rate:not(:checked) > label:before {
    content: '\2605';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #deb217;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #c59b08;
}
.product-dtl p {
	font-size: 14px;
	line-height: 24px;
	color: #7a7a7a;
}
.product-dtl .form-control {
	font-size: 15px;
}
.product-dtl label {
	line-height: 16px;
	font-size: 15px;
}
.form-control:focus {
	outline: none;
	box-shadow: none;
}
.product-count {
	margin-top: 15px; 
}
.product-count .qtyminus,
.product-count .qtyplus {
	width: 34px;
    height: 34px;
    background: #212529;
    text-align: center;
    font-size: 19px;
    line-height: 36px;
    color: #fff;
    cursor: pointer;
}
.product-count .qtyminus {
	border-radius: 3px 0 0 3px; 
}
.product-count .qtyplus {
	border-radius: 0 3px 3px 0; 
}
.product-count .qty {
	width: 60px;
	text-align: center;
}
.round-black-btn {
	border-radius: 4px;
    background: #212529;
    color: #fff;
    padding: 7px 45px;
    display: inline-block;
    margin-top: 20px;
    border: solid 2px #212529; 
    transition: all 0.5s ease-in-out 0s;
}
.round-black-btn:hover,
.round-black-btn:focus {
	background: transparent;
	color: #212529;
	text-decoration: none;
}

.product-info-tabs {
	margin-top: 25px; 
}
.product-info-tabs .nav-tabs {
	border-bottom: 2px solid #d8d8d8;
}
.product-info-tabs .nav-tabs .nav-item {
	margin-bottom: 0;
}
.product-info-tabs .nav-tabs .nav-link {
	border: none; 
	border-bottom: 2px solid transparent;
	color: #323232;
}
.product-info-tabs .nav-tabs .nav-item .nav-link:hover {
	border: none; 
}
.product-info-tabs .nav-tabs .nav-item.show .nav-link, 
.product-info-tabs .nav-tabs .nav-link.active, 
.product-info-tabs .nav-tabs .nav-link.active:hover {
	border: none; 
	border-bottom: 2px solid #d8d8d8;
	font-weight: bold;
}
.product-info-tabs .tab-content .tab-pane {
	padding: 30px 20px;
	font-size: 15px;
	line-height: 24px;
	color: #7a7a7a;
}
.review-form .form-group {
	clear: both;
}
.mb-20 {
	margin-bottom: 20px;
}

.review-form .rate {
	float: none;
	display: inline-block;
}
.review-heading {
	font-size: 24px;
    font-weight: 600;
    line-height: 24px;
    margin-bottom: 6px;
    text-transform: uppercase;
    color: #000;
}
.review-form .form-control {
	font-size: 14px;
}
.review-form input.form-control {
	height: 40px;
}
.review-form textarea.form-control {
	resize: none;
}
.review-form .round-black-btn {
	text-transform: uppercase;
	cursor: pointer;
}

/*# sourceMappingURL=style.css.map */

.product-dtl p{font-size: 17px;}

</style>
</head>

<%@ include file="../com/top.jsp"%><%@ include file="../com/navbar.jsp"%>
<html lang="en">

    

  <body>
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"><div class="pd-wrap">
		<div class="container">
	        <div class="heading-section">
	            <h2>책 정보</h2>
	        </div>
	        <div class="row">
	        	<div class="col-md-5">
	        		<div>
						<div >
						  	<img src="../resources/img/${dto.filename}" style="margin-left:50px; width: 300px";height="300px"/>
						</div>
					
	        	    </div>
	        	    </div>
	        	<div class="col-md-6" style="margin-left: 70px">
	        		<div class="product-dtl">
        				<div class="product-info">
		        			<div class="product-name">${dto.ititle }</div>
		        			<div class="reviews-counter">
								<div class="rate">
								    ${dto.like1 }  <i class="fas fa-thumbs-up" style="color:black;" ></i>
								  </div>
								<span>3 Reviews</span>
							</div>
		        			<div class="product-price-discount"><span style="color: red;">${dto.discountedPrice}</span><span class="line-through">정가 : ${dto.price }</span></div>
		        		</div>
	        			<p>저자 : ${dto.iwriter }</p>
	        			<p>출판사 :${dto.publisher }</p>
	        			<p>출판일 : ${dto.publishDay }</p>
	        			<p> ${dto.totalPage }p</p>
	        			<p> ${dto.TC }</p>
	        		
	        			<div class="product-count">
	        				<label for="size">수량</label>
	        				<form action="#" class="display-flex">
							    <div class="qtyminus">-</div>
							    <input type="text" name="quantity" value="1" class="qty">
							    <div class="qtyplus">+</div>
							</form>
							<a href="#" class="round-black-btn">장바구니 추가</a>
	        			</div>
	        		</div>
	        	</div>
	        </div>
	        <div class="product-info-tabs">
		        <ul class="nav nav-tabs" id="myTab" role="tablist">
				  	<li class="nav-item">
				    	<a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">책 소개</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="review-tab" data-toggle="tab" href="#question" role="tab" aria-controls="question" aria-selected="false"> Q & A</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="description-tab" data-toggle="tab" href="#refund" role="tab" aria-controls="refund" aria-selected="false"> 교환 /반품/품절</a>
				  	</li>
				</ul>
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab" style="font-size: 18px;" >
				  	<h2>목차</h2>
				  	<pre style="width: 100%;height: 100%;">
				  		${dto.TC }
				  		</pre>
				  	<h2>책소개</h2>
				  	<pre style="width: 100%;height: 100%;">
				  		${dto.bookInfo }
				  		</pre>
				  	<h2>내용</h2>
				  	<pre style="width: 100%;height: 100%;">
				  		${dto.content }
	
				  		</pre>
				  		<h2>작가소개</h2>
				  		<pre style="width: 100%;height: 100%;">
				  		${dto.iwriterInfo}
				  		</pre>	
				  		
				  	</div>
				  	<div class="tab-pane fade" id="question" role="tabpanel" aria-labelledby="question-tab">
				  	<div class="container" style="margin: 30px auto 30px auto;">
		
		 <h1 style="color: rgb(23,6,0);" class="far fa-comments" >Q&amp;A</h1>
		<p>
			Q&amp;A 게시판입니다. 궁금하신 사항은 '<strong>판매도서</strong>' 상세보기에서 '<strong>질문하기</strong>'로 문의해주세요.
		</p>
		
		<div class="categories">
			<ul>
				<li><a ${category=='book'?'class="current"':''} href="/qna/allqnalist/1?ino=${ino==null?'all':ino}&category=book">도서문의</a></li>
				<li><a ${category=='money'?'class="current"':''} href="/qna/allqnalist/1?ino=${ino==null?'all':ino}&category=money">입금/결제문의</a></li>
				<li><a ${category=='modify'?'class="current"':''} href="/qna/allqnalist/1?ino=${ino==null?'all':ino}&category=modify">변경/취소</a></li>	
				<li><a ${category=='order'?'class="current"':''} href="/qna/allqnalist/1?ino=${ino==null?'all':ino}&category=order">배송문의</a></li>
			</ul>
		</div>
		
		<div class="row">
			<table class="table table-hover">
				<thead class="table_head ">
					<tr>
						<th class="th-center">글번호</th>
						<th class="th-center">책</th>
						<th class="th-center">책이름</th>
						<th class="th-center" style="width: 50%">글제목</th>
						<th class="th-center">작성자</th>
						<th class="th-center">작성일</th>
						<th class="th-center">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="qna">
						<tr>
							<td>${qna.qno}</td>
							<td><img style="width: 40px; height: 75px; " src="/resources/img/${qna.filename}" alt="Book" /></td>
							<td>${qna.ititle}</td>
							<td>
							<c:choose>
							<c:when test="${qna.repStep > 0}">
							<c:forEach begin="1" end="${qna.repIndent}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<a href="/qna/read/${qna.qno}?id=${login.id}&ino=${ino==null?'all':ino}" style="color: rgb(51,19,2);">
							Re: <strong>${qna.title}</strong>
							</a>
							</c:when>
							<c:otherwise>
							<a href="/qna/read/${qna.qno}?id=${login.id}&ino=${ino==null?'all':ino}" style="color: rgb(51,19,2);" style="color: rgb(51,19,2);"> <strong>${qna.title}</strong></a>
							</c:otherwise>
							</c:choose>
							</td>
							<td>${qna.id}</td>
							<td>${qna.regdate}</td>
							<td>${qna.readcnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> <!-- class = row -->
		
		
		<ul class="pagination justify-content-center">
			<li class="page-item ${to.curPage == 1 ? 'disabled' : '' }"><a class="page-link"
					href="/qna/allqnalist/${to.curPage>1?to.curPage-1:1}?ino=${ino==null?'all':ino}&category=${category}">&laquo;</a></li>
			<c:forEach begin="${to.beginPageNum }" end="${to.stopPageNum }" var="page">
				<li class="page-item ${to.curPage == page ? 'active' : '' }"><a class="page-link" href="/qna/allqnalist/${page}?ino=${ino==null?'all':ino}&category=${category}">${page}</a></li>
			</c:forEach>
			<li class="page-item ${to.curPage == to.totalPage ? 'disabled' : '' }"><a class="page-link"
					href="/qna/allqnalist/${to.curPage<to.totalPage?to.curPage+1:to.curPage}?ino=${ino==null?'all':ino}&category=${category}">&raquo;</a></li>
		</ul>
	
		<br>
	<nav class="navbar navbar-expand-sm bg-light">
			<form class="form-inline " name='sform' method='get' action='#'>
				<aside>
					<select class="searchbutton btn btn-sm rounded-0" name='find'>
						<option value='title'>글제목</option>
						<option value='ititle'>책이름</option>
						<option value='id'>작성자</option>
					</select> <input class="form-control mr-sm-2" type="text" name='search'>
					<button class="searchbutton btn btn-sm rounded-0" type='submit'>검색</button>
				</aside>

			</form>

		</nav>

		<a style="position: relative; left: 90%;" href="/qna/insert?id=${login.id}&ino=${ino==null?'all':ino}" class="btn btn-info rounded-0">
			<strong>글 쓰기</strong>
		</a>
		
		
	</div> <!-- class = container -->
	</div>
	<div class="tab-pane fade" id="refund" role="tabpanel" aria-labelledby="refund-tab">
	<div class="container">
   <h2> 교환/반품/품절 안내</h2>
   <p>※ 상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질 수 있습니다.)</p>
  <table class="table table-bordered">
 
    <tbody>
      <tr>
        <td style="font-weight: bold; background-color:#eee" >반품/교환방법</td>
        <td><strong> 마이룸 > 주문관리 > 주문/배송내역 > 주문조회 > 반품/교환신청 ,</strong><br>
			<strong>[1:1상담>반품/교환/환불] 또는 고객센터 (1544-1900)</strong><br>
					※ 오픈마켓, 해외배송주문, 기프트 주문시 [1:1상담>반품/교환/환불]<br>
   							 또는 고객센터 (1544-1900)</td>

      </tr>
      <tr>
        <td style="font-weight: bold; background-color:#eee">반품/교환가능 기간</td>
        <td>	변심반품의 경우 수령 후 7일 이내,<br>
상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내</td>
      
      </tr>
      <tr>
        <td style="font-weight: bold; background-color:#eee">반품/교환비용</td>
        <td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
    
       </tr>
          <tr>
        <td style="font-weight: bold; background-color:#eee">반품/교환 불가 사유</td>
        <td><li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br>(단지 확인을 위한 포장 훼손은 제외)
         	<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br>
예) 화장품, 식품, 가전제품(악세서리 포함) 등     <li>복제가 가능한 상품 등의 포장을 훼손한 경우<br>
예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집 <li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)
<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우
<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우
<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에<br>
해당되는 경우
</li></td>
      </tr>
           <tr>
        <td style="font-weight: bold; background-color:#eee">상품 품절</td>
        <td>공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는<br>
이메일과 문자로 안내드리겠습니다.</td>
    
      </tr>
           <tr>
        <td style="font-weight: bold; background-color:#eee">소비자 피해보상 <br>
환불지연에 따른 배상</td>
        <td><li>상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은<br>
소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨
<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의<br>
소비자 보호에 관한 법률에 따라 처리함</td>
    
      </tr>
    </tbody>
  </table>
</div>
	</div>
	
				  	</div>
				</div>
	
			
			<div style="text-align:center;font-size:14px;padding-bottom:20px;">책은 마음의 양식 책구매는 언제나 <a style="color:#ff5e63;font-weight:bold;">www.springBook.com</a></div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<%@ include file="../com/footer.jsp"%>
<script type="text/javascript">



</script>
</body>
</html>