<jsp:include page="../com/head.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "shorcut icon" href="favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<style type="text/css">
.row.heading h2 {
    color: #fff;
    font-size: 52.52px;
    line-height: 95px;
    font-weight: 400;
    text-align: center;
    margin: 0 0 40px;
    padding-bottom: 20px;
    text-transform: uppercase;
}
ul{
  margin:0;
  padding:0;
  list-style:none;
}
.heading.heading-icon {
    display: block;
}
.padding-lg {
	display: block;
	padding-top: 60px;
	padding-bottom: 60px;
}
.practice-area.padding-lg {
    padding-bottom: 55px;
    padding-top: 55px;
}
.practice-area .inner{ 
     border:1px solid #999999; 
	 text-align:center; 
	 margin-bottom:28px; 
	 padding:40px 25px;
}
.our-webcoderskull .cnt-block:hover {
    box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
    border: 0;
}
.practice-area .inner h3{ 
    color:#3c3c3c; 
	font-size:24px; 
	font-weight:500;
	font-family: 'Poppins', sans-serif;
	padding: 10px 0;
}
.practice-area .inner p{ 
    font-size:14px; 
	line-height:22px; 
	font-weight:400;
}
.practice-area .inner img{
	display:inline-block;
}


.our-webcoderskull{
 
  
}
.our-webcoderskull .cnt-block{ 
   float:left; 
   width:100%; 
   background:#fff; 
   padding:30px 20px; 
   text-align:center; 
   border:2px solid #d5d5d5;
   margin: 0 0 28px;
}
.our-webcoderskull .cnt-block figure{
   width:148px; 
   height:148px; 
   border-radius:100%; 
   display:inline-block;
   margin-bottom: 15px;
}
.our-webcoderskull .cnt-block img{ 
   width:148px; 
   height:148px; 
   border-radius:100%; 
}
.our-webcoderskull .cnt-block h3{ 
   color:#2a2a2a; 
   font-size:20px; 
   font-weight:500; 
   padding:6px 0;
   text-transform:uppercase;
}
.our-webcoderskull .cnt-block h3 a{
  text-decoration:none;
	color:#2a2a2a;
}
.our-webcoderskull .cnt-block h3 a:hover{
	color:#337ab7;
}
.our-webcoderskull .cnt-block p{ 
   color:#2a2a2a; 
   font-size:13px; 
   line-height:20px; 
   font-weight:400;
}
.our-webcoderskull .cnt-block .follow-us{
	margin:20px 0 0;
}
.our-webcoderskull .cnt-block .follow-us li{ 
    display:inline-block; 
	width:auto; 
	margin:0 5px;
}
.our-webcoderskull .cnt-block .follow-us li .fa{ 
   font-size:24px; 
   color:#767676;
}
.our-webcoderskull .cnt-block .follow-us li .fa:hover{ 
   color:#025a8e;
}

<!-- 파비콘 적용 -->


.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}


.container-fluid {
   max-width: none;
}

.float-right, .container-fluid footer {
   max-width: none;
   width: 100%;
}

.back {
   float: right;
   margin-bottom: 50px;
}

.manager, .customer {
   width: 50%;
   margin: 0px;
   max-width: inherit;
}





th {
   border: 3px solid black;
   border-top: 3px solid black;
   padding: 8px;
   text-align: left;
   max-width: inherit;
}

th.id, th.name {
   width: 35%;
}

th.prpt, th.del {
   width: 15%;
}

td {
   border-bottom: 3px solid silver;
   border-left: 1px solid silver;
   border-right: 1px solid silver;
   text-align: center;
}
</style>
  
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../com/top.jsp"/>
<jsp:include page="../com/navbar.jsp"/>

<br><br>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<section class="our-webcoderskull padding-lg">

  <div class="container">
   		<c:if test="${login.id=='admin' }">
        <h2>운영진</h2>
        </c:if>
   <ul class="row">
    <c:forEach items="${list01}" var="dto">
   
      <li class="col-12 col-md-6 col-lg-3">
          <div class="cnt-block equal-hight" style="height: 400px;">
            <figure><img src="/resources/img/${dto.fileName}" class="img-responsive" alt=""></figure>
            <h3><a>${dto.id }</a></h3>
            <h5>${dto.name }</h5>
            <h5>${dto.email }</h5>
            <h4>${dto.phoneNum }</h4>
            <ul class="follow-us clearfix">
              
             <li> <button class="btn btn-success"
                              onclick="grant('${dto.id}', '00')">권한 제거</button></li>
              
             
            </ul>
          </div>
      </li>
   
      </c:forEach>
    </ul> 
   



      <div class="customer" style="margin-top: 100px">
         <h3>회원</h3>
         <table class="table">
            <thead class="thead-dark">
               <tr>
                  <th class="id">아이디</th>
                  <th class="name">이름</th>
              		<c:if test="${login.id=='admin'}">
                     <th class="prpt">권한</th>
          			</c:if>
                  <th class="del">탈퇴</th>
                    <th class="del">기타기능</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${list02}" var="dto">
                  <tr class="thead-light">
                     <td style="vertical-align: middle">${dto.id}</td>
                     <td style="vertical-align: middle">${dto.name }</td>
            			<c:if test="${login.id=='admin'}">
                        <td style="text-align: center">
                           <button class="btn btn-outline-success"
                              onclick="grant('${dto.id}', '01')">권한 부여</button>
                        </td>
                		</c:if>
                     <td style="text-align: center">
                        <button class="btn btn-outline-danger"
                           onclick="deleteMember('${dto.id}', ${authority })">회원 탈퇴</button>
                     </td>
                     
                       <td style="text-align: center">
                        <button class="btn btn-outline-dark"
                           onclick="">기타기능</button>
                     </td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
         <br> <br>
      </div>

   </div>
   </section>

 <div style="margin-bottom: 250PX"></div>
<jsp:include page="../com/footer.jsp"/>

<script type="text/javascript">

function grant(id, authority) {
   if (authority == '00') {
      var isOk = confirm("권한을 제거하시겠습니까?");

   } else {
      var isOk = confirm("권한을 부여하시겠습니까?");

   }
   if (isOk == true) {
      document.location.href = "/member/membergrant?id=" + id + "&&authority="
            + authority;
   }
   return;
}

 function deleteMember(id, authority){
	var isOk = confirm("회원 탈퇴 시키겠습니까?");

	if(isOk==true){
		document.location.href = "/member/memberdelete?id="+id+"&&authority="+authority;
		}
	 }
</script>
</body>
</html>