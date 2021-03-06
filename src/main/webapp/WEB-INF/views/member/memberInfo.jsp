<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../com/head.jsp"/>
<style type="text/css">
body{
    background: -webkit-linear-gradient(left, white, gray);
}
.emp-profile{
	
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;     
    width:300PX;
    height:300PX;

}
.profile-img img{
    width: 70%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 18px;
    background: #212529b8;
   
}
.profile-img .file input {

    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 20px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 20px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
	
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
    
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 20px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 18px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
     font-size: 18px;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
    font-size: 18px;
}
</style>

<title>Insert title here</title>
</head>
<body>

<jsp:include page="../com/top.jsp"/>
<jsp:include page="../com/navbar.jsp"/>
<div class="container emp-profile" style="margin-top: 10%">
            <form method="post">
                <div class="row" >
                    <div class="col-md-4">
                        <div class="profile-img">
                        	<c:if test="${dto.fileName != null }">
                            <img src="/resources/img/${dto.fileName}" alt=""/>
                            </c:if>
                            <c:if test="${dto.fileName == null }">
                            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h4>
                                    	내정보 
                                       ${dto.name }
                                    </h4>
                                    <h6>
                                        	${authority}
                                    </h6>
                                    <p class="proile-rating">회원 등급 <span>${grade}</span></p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                             
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <button type="button" class="btn btn-dark" style="float: right; size: 20px"
               onclick="location.href='/member/update/${login.id}'">회원 정보 수정</button>
                    </div>
                </div>
             
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>내정보</p>
                            <c:if test="${page==1 }">
                            <a href="/member/memberInfo?id=${login.id}&page=1" style="color: highlight;">내정보</a><br/>
                            </c:if>
                            <c:if test="${page!=1 }">
                            <a href="/member/memberInfo?id=${login.id}&page=1" >내정보</a><br/>
                            </c:if>
                             <a href="/order/orderInfo/${login.id}">주문 내역</a><br/>
                            <c:if test="${page!=2 }">
                            <a href="/member/memberInfo?id=${login.id}&page=2" >회원 등급 안내</a><br/>
                        	</c:if>
                            <c:if test="${page==2 }">
                            <a href="/member/memberInfo?id=${login.id}&page=2" style="color: highlight;">회원 등급 안내</a><br/>
                        	</c:if>
                            <p>마이 쇼핑</p>
                            <br>
                            <br>
                            <br>
                            <br>
                           
                            
                            <c:if test="${dto.authority==02}">
                            <a href="/member/memberlist?authority=${dto.authority}" style="color: red; bottom: 100px">토탈 회원 정보</a>
                            </c:if>
                             <c:if test="${dto.authority==01}">
                            <a href="/member/memberlist?authority=${dto.authority}" style="color: red; bottom: 100px">회원 정보</a>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <c:if test="${page==1}">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${dto.id }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${dto.name }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${dto.email }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${dto.phoneNum }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>생년월일 </label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${year}${month}${day}</p>
                                            </div>
                                        </div>
                                           <div class="row">
                                            <div class="col-md-6">
                                                <label>나이</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${dto.age }</p>
                                            </div>
                          				</div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>집 주소</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${dto.userAddr1}${dto.userAddr2}${dto.userAddr3}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>회원등급</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${grade }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>총 구매 액수</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${dto.purchased_amount }</p>
                                            </div>
                                        </div>
                                     </c:if>
                                     
                                     <c:if test="${page==2 }">
                                     <div class="row">
                                            <div class="col-md-6">
                                                <label>실버 회원 </label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>50000원미만 고객<br> 할인없음 </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>골드 회원</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>50000원이상 100000미만 고객 <br>총급액의 5% 할인</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>플레티넘 회원</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>100000원 이상 300000원 미만 고객 <br> 총금액의 10%할인</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>VIP 고객</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>3000000원 이상 고객 <br> 총금액의 15% 할인</p>
                                            </div>
                                        </div>
                                     </c:if>
                                     
                             
                           
                        </div>
                    </div>
                </div>
            </form>           
        </div>
    <div style="margin-bottom: 250PX"></div>
  
    </div>
      <jsp:include page="../com/footer.jsp"/>
      <script type="text/javascript">



      </script>
 
</body>
</html>