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
   color: black;
   border-color: rgb(17,17,17);
   background-color: white;
}
/********************* shopping Demo-1 **********************/
.product-grid{font-family:Raleway,sans-serif;text-align:center;padding:0 0 72px;border:1px solid rgba(0,0,0,.1);overflow:hidden;position:relative;z-index:1}
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
.product-grid .title a{color:#828282}
.product-grid .title a:hover,.product-grid:hover .title a{color:#ef5777}
.product-grid .price{color:#333;font-size:17px;font-family:Montserrat,sans-serif;font-weight:700;letter-spacing:.6px;margin-bottom:8px;text-align:center;transition:all .3s}
.product-grid .price span{color:#999;font-size:13px;font-weight:400;text-decoration:line-through;margin-left:3px;display:inline-block}
.product-grid .add-to-cart{color:#000;font-size:13px;font-weight:600}
@media only screen and (max-width:990px){.product-grid{margin-bottom:30px}
}


</style>
</head>
<body>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



   <%@ include file="../com/top.jsp"%>
   <%@ include file="../com/navbar.jsp"%>

    
 


    
    
    
    

<div>
<br>
<br><br><br><br>
</div>


  
      
      


<div class="container center">

  <div class="categories">
         <ul>
            <li><a href="/booksale/searchlist?cataCode=시/에세이">시/에세이</a></li>
            <li><a href="/booksale/searchlist?cataCode=경제/경영">경제/경영</a></li>
            <li><a href="/booksale/searchlist?cataCode=자기계발">자기계발</a></li>
            <li><a href="/booksale/searchlist?cataCode=컴퓨터/IT">컴퓨터/IT</a></li>
            <li><a href="/booksale/searchlist?cataCode=소설">소설</a></li>
            <li><a href="/booksale/searchlist?cataCode=참고서/문제집">참고서/문제집</a></li>
            <li><a href="/booksale/searchlist?cataCode=요리">요리</a></li>
            <li><a href="/booksale/searchlist?cataCode=만화">만화</a></li>
            <li><a href="/booksale/searchlist?cataCode=인문">인문</a></li>
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
						<button class="btn btn-danger">검색</button>
					</span>
				</div>
			</form>
        
        <br><br><br><br><br><br>
               
                      <button type="button" class="btn btn-info btn-lg" style="float: right;"
               onclick="location.href='/booksale/insert'">상품등록</button>
    <h3 class="h3" style="float:  ">검색 : ${keyword}  </h3>

    <div class="row">
    
             
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
                        <li><a href="" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                        <br>
                         <li><a href="/booksale/delete/${dto.ino }"  data-tip="remove"><i class="fas fa-remove" style="color:red;" ></i></a></li>
                       <li><a href="/booksale/update/${dto.ino }" data-tip="update"><i class="fas fa-file" style="color:green;" ></i></a></li>
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
                    <div class="price">${dto.discountedPrice}원
                    
                    <%
                    
                    %>
                        <span>${dto.price}</span>
                    </div>
                    </c:if>
                    <c:if test="${dto.percent==0 }">
                    <div class="price">${dto.price}원
                    
                    </div>
                    </c:if>
                    <a class="add-to-cart" href="">+ Add To Cart</a>
                </div>
            </div>
            <br><br>
        </div>
        
        </c:forEach>

       </div>   
       
       <div align="center">
            <div class="container" align="right" >
             <div  style="width: 100px; height: 100px">
                            <select class="form-control search-slt" id="exampleFormControlSelect1">
                               
                                <option>인기순</option>
                                <option>등록순</option>
                                <option>조회순</option>
                           
                            </select>
                        </div>
         </div>
   <div align="center">
   
     <ul class="pagination" style="position: relative; bottom:50px; left: 40%" >
       <li class="page-item">
         <a class="page-link" href="/booksale/search?curPage=${to.curPage > 1 ? to.curPage-1 : 1 }&keyword=${keyword}&searchType=${searchType }" aria-label="Previous" tabindex="-1" ><span aria-hidden="true">&laquo;</span>
         <c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}" var="page">
        <c:if test="${to.curPage==page }">
          <li class="page-item active"><a class="page-link" href="/booksale/search?curPage=${page}&keyword=${keyword}&searchType=${searchType }">${page }</a></li>
         </c:if>
         <c:if test="${to.curPage!=page }">
        <li class="page-item"><a class="page-link" href="/booksale/search?curPage=${page}&keyword=${keyword}&searchType=${searchType }">${page }</a></li>
         </c:if>  
        </li>
        </c:forEach>
         <li>
          <a class="page-link" href="/booksale/search?curPage=${to.curPage < to.totalPage ? to.curPage+1 : to.curPage }&keyword=${keyword}&searchType=${searchType }" aria-label="Next">
              &raquo;</a>
          </li>
     </ul>
    </div>
     
</div>
       
       
</div>
</div>

<hr>
   

   <%@ include file="../com/footer.jsp"%>
  
<hr>
</body>
</html>