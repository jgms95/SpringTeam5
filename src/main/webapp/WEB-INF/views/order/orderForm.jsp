<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../com/head.jsp"%>
<title>주문페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function execDaumPostcode() {
      new daum.Postcode({
         oncomplete : function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if (data.buildingName !== '' && data.apartment === 'Y') {
                  extraAddr += (extraAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if (extraAddr !== '') {
                  extraAddr = ' (' + extraAddr + ')';
               }
               // 조합된 참고항목을 해당 필드에 넣는다.
               document.getElementById("addr3").value = extraAddr;
            } else {
               document.getElementById("addr3").value = '';
            }

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
         }
      }).open();
   }
</script>



<style type="text/css">
.boardWrite {
   table-layout: fixed;
   border: 0;
   border-top: 1px solid #ddd;
   border-bottom: 1px solid #ddd;
   line-height: 180%;
}

td {
   padding: 15px 5px 10px 5px;
}

.btn {
background-color: rgb(67,22,7);
color: white;
}
</style>



</head>


<script type="text/javascript">

      

</script>


<body>
   <%@ include file="../com/top.jsp"%>
   <%@ include file="../com/navbar.jsp"%>
   <table id="resultt" class="table table-striped cell">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">제목</th>
                            <th scope="col">수량</th>
                            <th scope="col" class="text-right">개당 가격</th>
                            <th scope="col" class="text-right">총 가격</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${pList}" var="pickup">
                        <tr class="pickupList">
                        
                            <td> <img src="/resources/img/${pickup.filename}" style="width: 50px; height: 50px; "/> </td>
                            <!-- <img src="https://dummyimage.com/50x50/55595c/fff" /> -->
                            <td>${pickup.ititle}</td>
                            <td>
                               <div class="container">
                                  <input style="width: 50px" class="form-control pickupUpdateInput" data-pno="${pickup.pno}" name="pcs" type="text" value="${pickup.pcs}" min="1" data-ino="${pickup.ino}" data-stock="${pickup.stock}"   data-pcs="${pickup.pcs}" readonly>
                               </div>
                              </td>
        <!-- 개당가격 -->      <td class="text-right"><fmt:formatNumber value="${pickup.price}" pattern="#,###,###"/>원</td> 
        <!-- 총 가격 -->       <td class="text-right itemPrice" id="itemPrice" data-pno="${pickup.pno}"><fmt:formatNumber value="${pickup.price * pickup.pcs}"  pattern="#,###,###"/>원</td> 
                        </tr>
                  </c:forEach>
                   
                </table>
   

   <div class="container" style="margin: 30px 0 30px 0;">
      <h2>주문하기</h2>
      <br>


      <form action="/order/orderlist" method="post" name="regist">
      <c:forEach items="${pList}" var="pickup">
      	<input type="hidden" name="ititles" value="${pickup.ititle}">
      	<input type="hidden" name="inoes" value="${pickup.ino}">
      	<input type="hidden" name="pcses" value="${pickup.pcs}">
      	<input type="hidden" name="filenames" value="${pickup.filename}">
      	<input type="hidden" name="payPrices" value="${pickup.price * pickup.pcs}">
      </c:forEach>
    <input type="hidden" name="id" value="${login.id}">
    <input type="hidden" name="totalprice" value="${totalprice}">
                <input type="hidden" value="${mRead.name}">
                  <input type="hidden" id="uaddr1" placeholder="주소" value="${mRead.userAddr1}"> 
                  <input type="hidden" id="uaddr2" placeholder="참고항목" value="${mRead.userAddr3}"> 
                  <input type="hidden" id="uaddr3" placeholder="상세주소" value="${mRead.userAddr2}">
         <table class="boardWrite">
            <tbody>

               <tr>
                  <th scope="row">이름 </th>
                  <td><input type="text" id="uname" readonly value="${mRead.name}"></td>
               </tr>

               <tr>
                  <th scope="row">휴대전화 </th>
                  <td><input type="text" id="upn" maxlength="11" placeholder="'-'를 빼고 입력해주세요." name="PhoneNum" value="${mRead.phoneNum}" readonly><br></td>
               </tr>
               
               <tr>
                  <th scope="row">이메일 </th>
                  <td><input type="text" name="email" readonly value="${mRead.email}"></td>
                     
               </tr>


                             
               <tr>
                  <th scope="row"></th>
                  <td>
<!--라디오버튼  -->     <div class="address">
                        <input type="radio" id="address" name="ar" class="oldadd">
                        <label for="address">주문자 정보와 동일</label>
                        <input type="radio" id="address1" name="ar" class="newadd">
                        <label for="address1">새로운 배송지</label>
                     </div>
                     
                  </td>
               </tr>
               <tr>
                  <th scope="row">받으시는 분</th>
                  <td><input type="text" id="rname" name="receiver" class="newadds"></td>
               </tr>

               <tr class="">
                  <th scope="row">주소 </th>
                  <td><input type="text" name="userAddr1" placeholder="주소" class="newadds" id="addr1"> <input type="button" class="btn btn-sm rounded-0" onclick="execDaumPostcode()" value="주소 찾기"><br>
                  <br><input type="text" name="userAddr2" placeholder="상세주소" class="newadds" id="addr3">
                  <input type="text" name="userAddr3" placeholder="참고항목" class="newadds" id="addr2"></td>
               </tr>

               <tr>
                  <th scope="row">휴대전화 </th>
                  <td><input type="text" maxlength="11" id="pn" placeholder="'-'를 빼고 입력해주세요." class="newadds" name="phoneNum"><br></td>
               </tr>
            
               <tr>
                  <th scope="row">배송시 요청사항 </th>
                  <td><textarea style="resize: none;" maxlength="255" cols="70" name="message"></textarea>
                  <br></td>
               </tr>         

               <tr>
                  <th scope="row">총 결제 금액</th>
                  <td><fmt:formatNumber value="${totalprice}"  pattern="#,###,###"/>원</td>
                 
               </tr>
               </tbody>
            </tbody>
         </table>
         <div>
            <input type="checkbox" id="agree">
            <label for="agree">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
         </div>
         
         <br>
         <button id="isOk" class="btn rounded-0">결제완료</button>
         <button class="cencle btn rounded-0" type="button">취소</button>

      </form>
   </div>



   <%@ include file="../com/footer.jsp"%>
   
   <script type="text/javascript">


   $("#isOk").click(function(event){
	  var regist = document.regist;
	   if ($("#rname").val() == "") {
			alert("받으시는분 입력해주세요.");
			$("#rname").focus();
			return false;
		}
		if ($("#addr1").val() == "") {
			alert("주소를 입력해주세요.");
			$("#addr1").focus();
			return false;
		}
		if ($("#addr3").val() == "") {
			alert("상세 주소를 입력해주세요.");
			$("#addr3").focus();
			return false;
		}
		if ($("#pn").val() === "") {
			alert("휴대전화번호을 입력해주세요.");
			$("#pn").focus();
			return false;
		} else {
			var regexp = /^[0-9]*$/

			v = $("#pn").val();

			if (!regexp.test(v)) {
				alert("휴대전화 숫자만 입력하세요");
				$("#pn").val('');
				return false;
			}
		}
		if($("input:checkbox[id='agree']").is(":checked") == false){
			  alert("개인정보취급방침에 동의하여 주시기 바랍니다.");
          $('#agree').focus();
          return false;
		}
		
       var IMP = window.IMP; // 생략가능
       IMP.init('imp26883839'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
       var msg;
       
       IMP.request_pay({
           pg : 'kakaopay',
           pay_method : 'card',
           merchant_uid : 'merchant_' + new Date().getTime(),
           name : 'team5 도서 결제',
           amount : '${totalprice}',
           buyer_email : '${mRead.email}',
           buyer_name : '${mRead.name}',
           buyer_tel : '${mRead.phoneNum}',
           buyer_addr : '${mRead.userAddr1}'+ '${mRead.userAddr3}' + '${mRead.userAddr2}',
           buyer_postcode : '123-456',
           //m_redirect_url : 'http://www.naver.com'
       }, function(rsp) {
    	  
           if ( rsp.success ) {                
           		regist.submit();
           } else {
               msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
               return false;
           }
       });
       return false;
});
  
   
   $(".newadd").click(function(){
      $(".newadds").val("");
   });

    $(".oldadd").click(function(){
     $("#rname").val($('#uname').val());
     $("#addr1").val($('#uaddr1').val());
     $("#addr2").val($('#uaddr2').val());
     $("#addr3").val($('#uaddr3').val());
     $("#pn").val($('#upn').val());

   });
    
   


   </script>
</body>
</html>