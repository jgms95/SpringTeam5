<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
      
<jsp:include page="com/head.jsp"></jsp:include>


<title>Spring도서</title>

  <style>
  
      @import url("https://fonts.googleapis.com/css?family=Muli:400,700&display=swap");

body {
  margin: 0;
  height: calc(100vh - 8em);
  font-family: "Muli", sans-serif;

}

h1 {
  text-align: center;
  margin: 1.5em;
}

img {
  width: 35%;
  border-radius: 50%;
}

.container {
  width: 100%;
  overflow: hidden;
  position: relative;
}

.items {
  display: flex;
  align-items: center;
  width: fit-content;
  animation: carouselAnim 10s infinite alternate linear;
}

.entry {
  display: flex;
  align-items: center;
  flex-direction: column;
  position: relative;
  width: 300px;
  background: #fff;
  margin: 1em;
  padding: 0.5em;
  border-radius: 10px;
  box-shadow: 4px 4px 5px 0px rgba(0, 0, 0, 0.5);
}

@media only screen and (max-width: 768px) {
  .items {
    animation: carouselAnim 35s infinite alternate linear;
  }
  
  @keyframes carouselAnim {
    from {
      transform: translate(0, 0);
    }
    to {
      transform: translate(calc(-100% + (2 * 300px)));
    }
  }
}

.entry p {
  text-align: center;
  padding: 1em;
}

.name {
  font-weight: bold;
}

@keyframes carouselAnim {
  from {
    transform: translate(0, 0);
  }
  to {
    transform: translate(calc(-100% + (5 * 300px)));
  }
}

.container .faders {
  width: 100%;
  position: absolute;
  height: 100%;
}

.faders .right,
.faders .left {
  background: linear-gradient(
    to right,
    rgba(245, 245, 245, 1) 0%,
    rgba(255, 255, 255, 0) 100%
  );
  width: 15%;
  height: 100%;
  position: absolute;
  z-index: 200;
}

.right {
  right: 0;
  background: linear-gradient(
    to left,
    rgba(245, 245, 245, 1) 0%,
    rgba(255, 255, 255, 0) 100%
  );
}



  
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  #team {
    background: #eee !important;
}


.btn-primary:hover,
.btn-primary:focus {
 
    border-color: #108d6f;
    box-shadow: none;
    outline: none;
}

.btn-primary {
    color: #fff;
    background-color: #007b5e;
    border-color: #007b5e;
}

section {
    padding: 60px 0;
}

	.th-center{
		text-align: center;
	}
	
	.table_head{
		background-color: black;
		color: white;
	}
	
	td{
	text-align: center;
	}
	

.product-gri .product-discount-label,.product-gri .product-new-label{color:#fff;background-color:#ef5777;font-size:12px;text-transform:uppercase;padding:2px 7px;display:block;position:absolute;top:10px;left:0}
.product-gri .product-discount-label{background-color:#333;left:auto;right:0}
.product-gri .product-image{position:relative;transition:all .3s ease 0s}
.product-gri .product-image a{display:block}
.product-gri .product-image img{width:100%;height:auto}
.product-gri{font-family:Raleway,sans-serif;text-align:center;overflow:hidden;position:relative;}
.product-gri .price{color:#333;font-size:17px;font-family:Montserrat,sans-serif;font-weight:700;letter-spacing:.6px;margin-bottom:8px;text-align:center;transition:all .3s}
.product-gri .price span{color:#999;font-size:13px;font-weight:400;text-decoration:line-through;margin-left:3px;display:inline-block}

.product-gri .social{opacity:1;top:50%}
.product-gri .social li{display:inline-block}
.product-gri .social li a{color:#fgf;background-color:#333;font-size:20px;line-height:50px;text-align:center;height:50px;width:50px;margin:0 2px;display:block;position:relative;right:10px; transition:all .3s ease-in-out}

.product-gri .social li a:after,.product-gri .social li a:before{content:attr(data-tip);color:#fff;background-color:#000;font-size:12px;letter-spacing:1px;line-height:20px;padding:1px 5px;white-space:nowrap;opacity:0;transform:translateX(-50%);position:absolute;left:30%;top:-30px}
.product-gri .social li a:after{content:'';height:15px;width:15px;border-radius:0;transform:translateX(-50%) rotate(45deg);top:-20px;z-index:-1}
.product-gri .social li a:after,.product-gri .social li a:before{opacity:1}


section .section-title {
    text-align: center;
    color: #007b5e;
    margin-bottom: 50px;
    text-transform: uppercase;
    font-family: Aclonica; font-size: 40px; font-style: normal; font-variant: normal; font-weight: 700; line-height: 16.5px; 
}

#team .card {
    border: none;
   
}

.image-flip:hover .backside,
.image-flip.hover .backside {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg);
    border-radius: .25rem;
}

.image-flip:hover .frontside,
.image-flip.hover .frontside {
    -webkit-transform: rotateY(180deg);
    -moz-transform: rotateY(180deg);
    -o-transform: rotateY(180deg);
    transform: rotateY(180deg);
    
}
.list h3  { font-family: Arimo;	
		    font-size: 24px;
		   font-style: normal; font-variant: normal; font-weight: 700;	
		   line-height: 26.4px; 	
		    text-align: center;
   			 color: #007b5e;
   			 margin-bottom: 50px;
   			font-size: 35px 
   			 }


.mainflip {
    -webkit-transition: 1s;
    -webkit-transform-style: preserve-3d;
    -ms-transition: 1s;
    -moz-transition: 1s;
    -moz-transform: perspective(1000px);
    -moz-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transition: 1s;
    transform-style: preserve-3d;
    position: relative;
}

.frontside {
    position: relative;
    -webkit-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    z-index: 2;
    margin-bottom: 30px;
}

.backside {
    position: absolute;
    top: 0;
    left: 0;
    background: red;
    -webkit-transform: rotateY(-180deg);
    -moz-transform: rotateY(-180deg);
    -o-transform: rotateY(-180deg);
    -ms-transform: rotateY(-180deg);
    transform: rotateY(-180deg);
    -webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    -moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    
    
}

.frontside,
.backside {
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
    -webkit-transition: 1s;
    -webkit-transform-style: preserve-3d;
    -moz-transition: 1s;
    -moz-transform-style: preserve-3d;
    -o-transition: 1s;
    -o-transform-style: preserve-3d;
    -ms-transition: 1s;
    -ms-transform-style: preserve-3d;
    transition: 1s;
    transform-style: preserve-3d;
}

.frontside .card,
.backside .card {
    min-height: 312px;
}

.backside .card a {
    font-size: 18px;
    color: #007b5e !important;
}

.frontside .card .card-title,
.backside .card .card-title {
    color: #007b5e !important;
}

.frontside .card .card-body img {
    width: 300px;
    height: 350px;
    
}

 .page-link {
     color: rgb(90,56,37);
   }
   
   .pagination>li.active>a {
     background-color: rgb(90,56,37) !important;
     border-color: rgb(90,56,37) !important;
   }
   .list{
  background-color: buttonface; !important;
  padding: 20px
 }

  </style>
  
</head>
<body translate="no">

  
<%@ include file="com/top.jsp"%>
<%@ include file="com/navbar.jsp"%>


    <main role="main">

      <section class="jumbotron text-center" style="background-color: black;">
        <div class="container" >
       		   	<form  action="/booksale/search" method="get">
				<div class="input-group">
					<span class="input-group-addon">
						<select name="searchType" class="form-control search-slt" id="exampleFormControlSelect1" >
							<option value="all">검색 기준</option>
							<option value="ititle">책 제목</option>
							<option value="iwriter">지은이</option>
							<option >기타 추가할만한 내용</option>
						</select>
					<input type="hidden" value="${login.id}" name="id">	
					</span>					
					<input class="form-contro search-slt" name="keyword" style="width: 400px" placeholder="검색">
					<span class="input-group-btn">
						<button class="btn btn-danger rounded-0">검색</button>
					</span>
				</div>
			</form>
        </div>
      </section>
      
      
      <section id="team" class="pb-5"  style="margin-top: -50px">
    <div class="container">
        <h5 class="section-title h1" style="margin-top: 50px">베스트 셀러  </h5>        
        <div class="row">
					<!-- item -->
					<c:forEach items="${best}" var="dto">
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
             
                                <div class="card-body text-center">
                                 <div class="product-gri">
             					   <div class="product-image">                                   
                                    <p><img class=" img-fluid" src="/resources/img/${dto.filename}" alt="card image"></p>
                                          <span class="product-new-label">Sale </span>                  	
                  						  <span class="product-discount-label">${dto.percent }%</span>
                  				   </div>
                  				 </div>
                  				 	<div class="product-gri">
                                    <h4 class="card-title">${dto.ititle }</h4>
                                    <p class="card-text">${dto.iwriter} | ${dto.publisher }</p>
                 					
                 					  <c:if test="${dto.percent!=0 }">
                 					   <div class="price"><A style="color: red;">${dto.discountedPrice}원</A>             
                   				       <span>${dto.price} 
              					       </div>
              					       </span>
              					       
              					       <div class="row" style="position: relative;left: 70%">
                   				      <ul><i class="fas fa-thumbs-up">${dto.like1 }</i></ul>
                				      </c:if>
                				      </div>
                				      
                 				      <c:if test="${dto.percent==0 }">
                                      <div class="price">${dto.price}원                               
                                      </div>
                                     
                                      </c:if>
                         		    </div>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">${dto.ititle }</h4>
                                    <p class="card-text">${dto.prolog }</p>
                   <br><br>
                   
                    <div class="product-gri">
             
                     <ul class="social">
                        <li><a href="" data-tip="Quick View"><i class="fa fa-search" style="color: white;"></i></a></li>
                        <li><a href="" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag" style="color: white;"></i></a></li>
                        <li><a href="" data-tip="Add to Cart"><i class="fa fa-shopping-cart" style="color: white;"></i></a></li>
                        <br>


       
                    </ul>
                   
                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>	<br><br><br>
           </c:forEach>
			

        </div>
    </div>
</section>


<!-- best -->




<div class="container" >
<c:if test="${login.id=='admin' }">
<input type="button" class="btn btn-danger" value="추천책" style="float: right;" onclick="location.href='/booksale/insertrecommend/'">
</c:if>
<h3 style="margin-top: 30px">판매자 추천도서</h3>


<div class="faders">
<div class="left"></div>
<div class="right"></div>
</div>
<div class="items">
<c:forEach items="${recommend}" var="dto">
<div class="entry">
<p class="name">${dto.bookName}</p>
<img src="/resources/img/${dto.fileName}" />
<a href="" style="color: black"><p class="quote" style="font-size: large;">${dto.content }</p></a>
</div>
</c:forEach>

</div>
</div>

	
      <div class="album py-5 bg-light">
    
        <div class="container">
  			<h3 style="margin-bottom: 30px">진행중 이벤트</h3>
          <div class="row">
            <c:forEach items="${event}" var="dto" begin="0" end="2">
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top" data-src="/resources/event/${dto.titleImg}" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" src="/resources/event/${dto.titleImg}" data-holder-rendered="true">
                <div class="card-body">
                      <p class="card-text">${dto.title }</p>
                  <p class="card-text">${dto.content }</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='/event/read/${dto.eno}?id=${login.id}'" >자세히 보기</button>
                      
                    </div>
                    <small class="text-muted">${dto.writeday}</small>
                  </div>
                </div>
              </div>
            </div>
      		</c:forEach></div>
      		</div></div>

    	<div class="container" style="margin: 30px auto 30px auto; margin-bottom: 100px">
		
			<a   href="/notice/noticelist/1?id=${login.id}"><h3 style="color: rgb(23,6,0); float: left; ">최근공지사항</h3></a> <br><br>
		
		
		<div class="row" style="background-color: #f9f9f9;">
			<table class="table table-hover">
				<thead class="table_head">
					<tr>
						<th class="th-center">글번호</th>
						<th class="th-center" style="width: 50%">글제목</th>
						<th class="th-center">작성자</th>
						<th class="th-center">작성일</th>
						<th class="th-center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="notice">
						<tr>
							<td>${notice.nno}</td>
							<td><a href="/notice/read/${notice.nno}?id=${login.id}" style="color: rgb(51,19,2);">${notice.title}</a></td>
							<td>${notice.id}</td>
							<td>${notice.writeday}</td>
							<td>${notice.readcnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> <!-- class = row -->

    </main>



</body>
 
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>

<svg xmlns="http://www.w3.org/2000/svg" width="208" height="226" viewBox="0 0 208 226" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="11" style="font-weight:bold;font-size:11pt;font-family:Arial, Helvetica, Open Sans, sans-serif">Thumbnail</text></svg>
<%@ include file="com/footer.jsp"%>
</body>
</html>