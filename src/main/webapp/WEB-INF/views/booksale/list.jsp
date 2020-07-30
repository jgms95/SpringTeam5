<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

	
<%@ include file="../com/head.jsp"%>

<title>Insert title here</title>

<style type="text/css">

h3.h3{text-align:center;margin:1em;text-transform:capitalize;font-size:1.7em;}
.categories {
	text-align: center;
	font-size: 28px;
	color: black;
	line-height: 1;
	font-weight: 400;
}


.categories ul li {
	display: inline-block;
	margin: 0px 10px;
	margin-bottom: 20px;
}

.categories ul li a {
	display: block;
	font-size: 20px;
	color: rgb(85,85,85);
	padding: 0px 20px;
	height: 38px;
	line-height: 38px;
	border: 1px solid rgb(229,229,229);
}

.categories ul li a:hover {
	color: black;
	border-color: rgb(17,17,17);
	background-color: white;
}
/********************* shopping Demo-1 **********************/
.product-grid{font-family:Raleway,sans-serif;text-align:center;padding:0 0 72px;border:1px solid rgba(0,0,0,.1);overflow:hidden;position:relative;z-index:1 }
.product-grid .product-image{position:relative;transition:all .3s ease 0s}
.product-grid .product-image a{display:block}
.product-grid .product-image img{width:100%;height:auto}
.product-grid .pic-1{opacity:1;transition:all .3s ease-out 0s}
.product-grid:hover .pic-1{opacity:1}
.product-grid .pic-2{opacity:0;position:absolute;top:0;left:0;transition:all .3s ease-out 0s}
.product-grid:hover .pic-2{opacity:1}
.product-grid .social{width:150px;padding:0;margin:0;list-style:none;opacity:0;transform:translateY(-50%) translateX(-50%);position:absolute;top:60%;left:50%;z-index:1;transition:all .3s ease 0s}
.product-grid:hover .social{opacity:1;top:50%}
.product-grid .social li{display:inline-block}
.product-grid .social li a{color:#fff;background-color:#333;font-size:16px;line-height:40px;text-align:center;height:40px;width:40px;margin:0 2px;display:block;position:relative;transition:all .3s ease-in-out}
.product-grid .social li a:hover{color:#fff;background-color:#ef5777}
.product-grid .social li a:after,.product-grid .social li a:before{content:attr(data-tip);color:#fff;background-color:#000;font-size:12px;letter-spacing:1px;line-height:20px;padding:1px 5px;white-space:nowrap;opacity:0;transform:translateX(-50%);position:absolute;left:50%;top:-30px}
.product-grid .social li a:after{content:'';height:15px;width:15px;border-radius:0;transform:translateX(-50%) rotate(45deg);top:-20px;z-index:-1}
.product-grid .social li a:hover:after,.product-grid .social li a:hover:before{opacity:1}
.product-grid .product-discount-label,.product-grid .product-new-label{color:#fff;background-color:#ef5777;font-size:12px;text-transform:uppercase;padding:2px 7px;display:block;position:absolute;top:10px;left:0}
.product-grid .product-discount-label{background-color:#333;left:auto;right:0}
.product-grid .rating{color:#FFD200;font-size:12px;padding:12px 0 0;margin:0;list-style:none;position:relative;z-index:-1}
.product-grid .rating li.disable{color:rgba(0,0,0,.2)}
.product-grid .product-content{background-color:#fff;text-align:center;padding:12px 0;margin:0 auto;position:absolute;left:0;right:0;bottom:-27px;z-index:1;transition:all .3s}
.product-grid:hover .product-content{bottom:0}
.product-grid .title{font-size:13px;font-weight:400;letter-spacing:.5px;text-transform:capitalize;margin:0 0 10px;transition:all .3s ease 0s}
.product-grid .title1{font-size:18px;color:red; font:bold; font-weight:400;letter-spacing:.5px;text-transform:capitalize;margin:0 0 10px;transition:all .3s ease 0s}
.product-grid .title a{color:#828282}
.product-grid .title a:hover,.product-grid:hover .title a{color:#ef5777}
.product-grid .price{color:#333;font-size:17px;font-family:Montserrat,sans-serif;font-weight:700;letter-spacing:.6px;margin-bottom:8px;text-align:center;transition:all .3s}
.product-grid .price span{color:#999;font-size:13px;font-weight:400;text-decoration:line-through;margin-left:3px;display:inline-block}
.product-grid .add-to-cart{color:#000;font-size:13px;font-weight:600}

@media only screen and (max-width:990px){.product-grid{margin-bottom:30px }
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


@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
#team {
    background: #eee !important;
}


.btn-primary:hover,
.btn-primary:focus {
    background-color: #108d6f;
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

section .section-title {
    text-align: center;
    color: #007b5e;
    margin-bottom: 50px;
    text-transform: uppercase;
    font-family: Aclonica; font-size: 40px; font-style: normal; font-variant: normal; font-weight: 700; line-height: 16.5px; 
}

#team .card {
    border: none;
    background: #ffffff;
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
<body>





	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>

    
 


    
    
    
    

<div>
<br>
<br><br><br><br>
</div>


  
		
		


<div class="container center">

  <div class="categories" >
			<ul>
				<li><a href="/booksale/searchlist?cataCode=시/에세이" >시/에세이</a></li>
				<li><a href="/booksale/searchlist?cataCode=경제/경영">경제/경영</a></li>
				<li><a href="/booksale/searchlist?cataCode=자기계발">자기계발</a></li>
				<li><a href="/booksale/searchlist?cataCode=컴퓨터/IT">컴퓨터/IT</a></li>
				<li><a href="/booksale/searchlist?cataCode=소설">소설</a></li>
				<li><a href="/booksale/searchlist?cataCode=참고서/문제집">참고서/문제집</a></li>
				<li><a href="/booksale/searchlist?cataCode=요리">요리</a></li>
				<li><a href="/booksale/searchlist?cataCode=만화">만화</a></li>
				<li><a href="/booksale/searchlist?cataCode=인문">인문</a></li>
			    <li><a href="/booksale/searchlist?cataCode=수필">수필</a></li>
			</ul>
		</div>
		
		   	<form  action="/booksale/search" method="get" style="float: right;">
				<div class="input-group">
					<span class="input-group-addon">
						<select name="searchType" class="form-control search-slt" id="exampleFormControlSelect1" style="width: 120px">
							<option value="all">검색 기준</option>
							<option value="ititle">책 제목</option>
							<option value="iwriter">지은이</option>
							<option >기타 추가할만한 내용</option>
						</select>
					</span>					
					<input class="form-contro search-slt" name="keyword" style="width: 200px" placeholder="검색">
					<span class="input-group-btn">
						<button class="btn btn-danger rounded-0">검색</button>
					</span>
				</div>
			</form>
			 <br><br><br>
        	  <button type="button" class="btn btn-info btn-lg" style="float: right;"
               onclick="location.href='/booksale/insert'">상품등록</button>
               	 <br><br><br>
              <hr>


<!-- best -->
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1">베스트 셀러  </h5>        
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

        
        
        
        <br><br>
	   
               
     <div class = "list">               
    <h3 class="list h3">책 목록 </h3>

    <div class="row" id="sell">
    
             
          <c:forEach items="${list}" var="dto">
         
         <div class="col-md-3 col-sm-6">
            <div class="product-grid">
                <div class="product-image">
                    <a href="#">
                    <img class="pic-1" src="/resources/img/${dto.filename}"
                    style="width: 300px; height: 400px; ">
                      
                              </a>
                    <ul class="social">
                        <li><a href="" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                        <li><a href="" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                        <li><a href="#" data-tip="Add to Cart" class="pickupInsert" data-pcs="${pickup.pcs}" data-ititle="${dto.ititle}" data-id="${login.id}" data-ino="${dto.ino}" data-price="${dto.price}" data-filename="${dto.filename}"><i class="fa fa-shopping-cart"></i></a></li>
                        <br>
                   		<li><a href="/booksale/delete/${dto.ino }"  data-tip="remove"><i class="fas fa-remove" style="color:red;" ></i></a></li>
                 		<li><a href="/booksale/update/${dto.ino }" data-tip="update"><i class="fas fa-file" style="color:green;" ></i></a></li>
                   		<br><br>
                   		<li><a href="/booksale/like/${dto.ino }" data-tip="좋아요"><i class="fas fa-thumbs-up" style="color:yellow;" ></i></a></li>
                    </ul>
               		<c:if test="${dto.percent!= 0 }">
                    <span class="product-new-label">Sale </span>
                  	
                    <span class="product-discount-label">${dto.percent }%</span>
                    </c:if>
                </div>
         
                <div class="product-content">
                    <h1 class="title"><a href="#">${dto.ititle }</a></h1>
                      <h1 class="title"><a href="#"> 지은이: ${dto.iwriter }</a></h1>
                      <h1 class="title"><a href="#"> 출판사: ${dto.publisher }</a></h1>
                   <c:if test="${dto.percent!=0 }">
                     <div class="price"><A style="color: red;">${dto.discountedPrice}원</A> 
                        <span>${dto.price}</span>
                    </div>
                    </c:if>
                    <c:if test="${dto.percent==0 }">
                    <div class="price">${dto.price}원
                    
                    </div>
                    </c:if>
                    <a class="add-to-cart" data-pcs="${pickup.pcs}" data-ititle="${dto.ititle}" data-id="${login.id}" data-ino="${dto.ino}" data-price="${dto.price}" href="">+ Add To Cart</a>
                </div>
            </div>
            <br><br>
        </div>
        
        </c:forEach>
		</div>
       </div>   
       
       
       
	<div align="center">
	
 	 <ul class="pagination" style="position: relative; bottom:50px; left: 35%" >
    	<li class="page-item">
     	 <a class="page-link" href="/booksale/list?curPage=${to.curPage > 1 ? to.curPage-1 : 1 }" aria-label="Previous" tabindex="-1" ><span aria-hidden="true">&laquo;</span>
  		 <c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}" var="page">
    	 <c:if test="${to.curPage==page }">
   		 <li class="page-item active"><a class="page-link" href="/booksale/list?curPage=${page}">${page }</a></li>
  		 </c:if>
  		 <c:if test="${to.curPage!=page }">
    	 <li class="page-item"><a class="page-link" href="/booksale/list?curPage=${page}">${page }</a></li>
  		 </c:if>  
    	 </li>
    	 </c:forEach>
     	 <li>
      	 <a class="page-link" href="/booksale/list?curPage=${to.curPage < to.totalPage ? to.curPage+1 : to.curPage }" aria-label="Next">
        		&raquo;</a>
   		 </li>
  	</ul>
    </div>
	  
       
       
</div>


<hr>
	

	
  
<hr>
<%@ include file="../com/footer.jsp"%>
<script type="text/javascript">


$(".add-to-cart").click(function(){
	/* var num = $(this).siblings('input')[0].value */
	var ino = $(this).attr("data-ino");
	var pno = 1;
	var pcs = $(this).attr("data-pcs");
	var price = $(this).attr("data-price");
	var id = $(this).attr("data-id");
	var filename = '';
	var ititle = $(this).attr("data-ititle");
	var data = {
	  ino : ino,
	  pno : pno,
	  pcs : pcs,
	  price : price,
	  id : id,
	  filename : filename,
	  ititle : ititle
	  };
		
	$.ajax({
			url : "/booksale/pickupInsert",
			type : "POST",
			data : data,
			success : function(result){
				location.assign("/pickup/pickupList/${login.id}");
			},
			
	   });
	});


$(".pickupInsert").click(function(){
var confirm_val = confirm("장바구니에 담겼습니다 장바구니로 이동하시겠습니까?");
var ino = $(this).attr("data-ino");
var pno = 1;
var pcs = $(this).attr("data-pcs");
var price = $(this).attr("data-price");
var id = $(this).attr("data-id");
var filename = $(this).attr("data-filename");
var ititle = $(this).attr("data-ititle");
var data = {
  ino : ino,
  pno : pno,
  pcs : pcs,
  price : price,
  id : id,
  filename : filename,
  ititle : ititle
  };
	
$.ajax({
		url : "/booksale/pickupInsert",
		type : "POST",
		data : data,
		success : function(result){
			if(confirm_val){
			location.assign("/pickup/pickupList/${login.id}");
			}
		},
		
   });
});

</script>

</body>
</html>