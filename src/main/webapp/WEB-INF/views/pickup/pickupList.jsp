<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>

<%@ include file="../com/head.jsp"%>

<title>Insert title here</title>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">장바구니</h1>
     </div>
</section>

<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
            <div class="allCheck">
<!-- 전체선택  -->&nbsp;&nbsp;	<input data-price="${pickup.price * pickup.pcs}" type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">&nbsp;&nbsp;&nbsp;&nbsp;전체 선택</label>
							<button data-pno="${pickup.pno}" class="btn btn-sm btn-danger pickupSelectDelete">삭제</button> 
			</div>
			
                <table class="table table-striped cell">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col"> </th>
                            <th scope="col">제목</th>
                            <th scope="col">수량</th>
                            <th scope="col" class="text-right">개당 가격</th>
                            <th scope="col" class="text-right">총 가격</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach items="${pickupList}" var="pickup">
                        <tr class="pickupList">
                        	<td><input type="checkbox" name="chBox" class="chBox" data-pno="${pickup.pno}" data-price="${pickup.price * pickup.pcs}"/></td>
                            <td> <img src="/resources/img/${pickup.filename}" style="width: 50px; height: 50px; "/> </td>
                            <!-- <img src="https://dummyimage.com/50x50/55595c/fff" /> -->
                            <td>${pickup.ititle}</td>
                            <td>
	                            <div class="container">
	                            	<input style="width: 65px" class="form-control pickupUpdateInput" data-pno="${pickup.pno}" name="pcs" type="text" value="${pickup.pcs}" min="1" data-ino="${pickup.ino}" data-stock="${pickup.stock}"   data-pcs="${pickup.pcs}">
	                            	<button type="button" class="btn btn-sm plus" data-pno="${pickup.pno}">+</button>
									<button type="button" class="btn btn-sm minus" >-</button>
	                            	<button class="btn btn-sm btn-danger rounded-0 pickupUpdateButton" data-pno="${pickup.pno}" data-pcs="${pickup.pcs}" data-stock="${pickup.stock}">변경</button>
	                            </div>
                           	</td>
        <!-- 개당가격 -->      <td class="text-right"><fmt:formatNumber value="${pickup.price}" pattern="#,###,###"/>원</td> 
        <!-- 총 가격 -->       <td class="text-right itemPrice" id="itemPrice" data-pno="${pickup.pno}"><fmt:formatNumber value="${pickup.price * pickup.pcs}" pattern="#,###,###"/>원</td> 
        <!-- 삭제버튼 -->      <td class="text-right"><button data-pno="${pickup.pno}" class="btn btn-sm btn-danger pickupDelete"><i class="fa fa-trash"></i> </button> </td>
                        </tr>
                        <c:set var="sum" value="${sum + (pickup.price * pickup.pcs)}" />
						</c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
    <!--상품금액  -->          <td>상품금액</td>
                            <td class="text-right" id="itemsPrice">0원</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>(배송비)</td>
                            <td class="text-right">0원</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
    <!--결제예정금액  -->       <td><strong>결제예정금액</strong></td>
                            <td class="text-right" id="totalPrice"><strong>0원</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <button class="btn btn-block btn-light rounded-0">계속 쇼핑하기</button>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <button class="btn btn-lg btn-block btn-success rounded-0 text-uppercase order">결제하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
	
<%@ include file="../com/footer.jsp"%>
</body>

<script type="text/javascript">



$(".order").click(function() {
	location.assign("/order/orderForm/${login.id}");
});

/* 장바구니 개별 삭제 */
$(".pickupDelete").click(function() {
	var pno = $(this).attr("data-pno");
	var confirm_val = confirm("삭제하시겠습니까?");
	if(confirm_val){
		location.assign("/pickup/pickupDelete/"+pno+"?id=${login.id}");
	}
});

/* 수량 변경 버튼  */
   $('.pickupUpdateButton').click(function() {
	var pcs = $(this).siblings('input')[0].value;
	var pno = $(this).attr("data-pno");
	console.log(pcs);
	var stock = $(this).attr("data-stock");
	console.log(stock);
	stock = Number(stock);
	pcs = Number(pcs);
	if(stock >= pcs){
	var confirm_val = confirm("변경하시겠습니까?");
		if(confirm_val){
			location.assign("/pickup/pickupUpdate/"+pno+"/"+pcs+"?id=${login.id}");
		}
   	}else {
		alert('재고 부족');
		location.assign("/pickup/pickupList/${login.id}")	
	}
});  

/* 수량 증가 */
$(".plus").click(function(){
	
	var num = $(this).siblings('input')[0].value;
	$(this).siblings('input')[0].value = Number(num) + 1;
});

/* 수량 감소 */
$(".minus").click(function(){
	
	var num = $(this).siblings('input')[0].value
	if($(this).siblings('input')[0].value > 1){
		$(this).siblings('input')[0].value = Number(num) - 1;
	}
	   
});

/* 전체 선택 */
$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");

	 if(chk) {
	 	$(".chBox").prop("checked", true);
	 } else{
	 	$(".chBox").prop("checked", false);
	 } 

	  var itemsPrice = 0;
	  var totalPrice = 0;
	  $(".chBox:checked").each(function() {
	    var price = $(this).attr("data-price");
	    itemsPrice += parseInt(price);
	    totalPrice += parseInt(price);
	  });
	  itemsPrice += '원';
	  totalPrice += '원';
	  $('#itemsPrice').text(itemsPrice);
	  $('#totalPrice').text(totalPrice);

});

 $(".chBox").click(function(){
	$("#allCheck").prop("checked", false);
}); 

 $(".chBox").click(function(){
	  var itemsPrice = 0;
	  var totalPrice = 0;
	  $(".chBox:checked").each(function() {
	    var price = $(this).attr("data-price");
	    itemsPrice += parseInt(price);
	    totalPrice += parseInt(price);
	  });
	  itemsPrice += '원';
	  totalPrice += '원';
	  $('#itemsPrice').text(itemsPrice);
	  $('#totalPrice').text(totalPrice);
}); 


/* 체크박스 체크된 것 삭제 */
$(".pickupSelectDelete").click(function(){
	var confirm_val = confirm("정말 삭제하시겠습니까?");
 
if(confirm_val) {
	var checkArr = new Array();
    
$("input[class='chBox']:checked").each(function(){
	checkArr.push($(this).attr("data-pno"));
});
   
	$.ajax({
		url : "/pickup/pickupDelete?id=${login.id}",
		type : "POST",
		data : { chBox : checkArr
			},
		success : function(){
			location.assign("/pickup/pickupList/${login.id}");
		}
	});
};
});

</script>

</html>