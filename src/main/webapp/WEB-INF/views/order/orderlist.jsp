<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../com/head.jsp"/>


<title>Insert title here</title>
<style type="text/css">

.btn {
background-color: rgb(23,6,0);
color: white;
}

</style>
</head>
<body>

<jsp:include page="../com/top.jsp"/>
<jsp:include page="../com/navbar.jsp"/>
<div class="jumbotron text-center" style="background-color: rgb(255,255,255)">
      
      <h2>주문 내역</h2>
      <div align="center">
   <table id="resultt" class="table table-striped cell" style="width: 80%; align-content: center;" >
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                           <th>주문번호</th>
                            <th scope="col">책 이름</th>
                            <th scope="col">수량</th>
                            <th scope="col">가격</th>
                            <th scope="col">받는 사람</th>
                           <th scope="col">받는 주소</th>
                            <th scope="col">전화번호</th>
                            <th scope="col">배송메세지</th>
                            <th scope="col">주문 일시</th>
                       	</tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${list}" var="orderlist">
                        <tr class="orderlist">
                            <td> <img src="/resources/img/${orderlist.filename}" style="width: 50px; height: 50px; "/> </td>
                           <td>${orderlist.ono}</td>
                            <!-- <img src="https://dummyimage.com/50x50/55595c/fff" /> -->
                            <td>${orderlist.ititle}</td>
                            <td>${orderlist.pcs}</td> 
                            <td>${orderlist.payPrice}원</td>  
                            <td>${orderlist.receiver}</td>
                           <td>${orderlist.userAddr1}${orderlist.userAddr2}${orderlist.userAddr3}</td>
                            <!-- <img src="https://dummyimage.com/50x50/55595c/fff" /> -->
                            <td>${orderlist.phoneNum}</td>
                            <td>${orderlist.message}</td> 
                           	<td>${orderlist.writeday}</td>                            
                        </tr>
                  </c:forEach>
                   
                </table>
                                <div>
                                <h4 align="RIGHT" style="margin-right: 10%">${login.id}님이 사용하신 총 금액 : ${purchasedAmount}원 </h4>
                                </div>
                <a class="btn rounded-0" href="javascript:history.back();">뒤로가기</a>
      </div>
                                
                                
<%--    <h2>배송지 정보</h2>  
   <table id="resultt" class="table table-striped cell">
                    <thead>
                        <tr>
                        </tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${list}" var="orderlist">
                        <tr class="orderlist">
                        </tr>
                  </c:forEach>
                   
                </table>
                
  
 --%>      
</div>
    <div style="margin-bottom: 250PX"></div>
  
      <jsp:include page="../com/footer.jsp"/>
 
</body>
</html>