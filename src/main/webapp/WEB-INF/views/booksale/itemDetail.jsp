<%@page import="kr.co.domain.ItemDTO"%>
<%@page import="kr.co.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<%
	pageContext.setAttribute("crcn", "\n");
	pageContext.setAttribute("br", "<br/>");	
%>        



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.btn{
	background-color: rgb(67,22,7);
	color: white;
}
hr#clearBoth {
	clear: both;
}
#boardCommentContent5 {
	float: left;
	margin-bottom: 20px;
}
.box_detail_point5 {
	position: relative;
	padding-bottom: 20px;
	border-bottom: 1px solid #ddd;
}
.box_detail_point5 h1.title5 {
	display: inline;
	margin-right: 10px;
	font-size: 24px;
	line-height: 27px;
	color: #3a60df;
}
.content_middle5 {
	z-index: auto;
}
.box_detail_info5 {
	float: left;
	width: 200px;
}
.box_detail_point25 {
	/* border-left: 1px solid #ddd; */
	line-height: 27px;
}
.box_detail_point5 .back15 {
	margin-top: 10px;
	color: #777;
	line-height: 18px;
	/* font-size: 10px; */
}
.box_detail_point5 .back55 {
	color: black;
}
.box_detail_point5 .back65 {
	vertical-align: baseline;
	margin-right: 3px;
}
.box_detail_point5 .dc_rate {
	color: #5e6b9f;
}
.box_detail_point5 .sell_price {
	line-height: 30px;
	color: #f84450;
}
.box_detail_point5 .intext {
	width: 30px;
}
.btn_blue {
	margin-top: 10px;
	margin-bottom: -60px;
	background-image: none;
	background-color: #5e6b9f !important;
	border: 1px solid #5e6b9f;
	color: #fff !important;
	box-shadow: none;
	padding: 5px;
}
.btn_blue2 {
	background-image: none;
	background-color: #7b8ed1 !important;
	border: 1px solid #7b8ed1;
	color: #fff !important;
	box-shadow: none;
	padding: 5px;
}
#reviewBtn {
	margin-top: 5px;
	padding: 10px;
}
.bookinfotable5 {
	margin: auto;
	margin-top: 30px;
	width: 100%;
}
.tab_detail_content5 {
	margin: auto;
	margin-top: 30px;
/* 	width: 700px; */
	height: 36px;
	background-color: #fff;
	/* border: 1px solid #d7d7d7; */
	border-spacing: 0px;
}
.book_info_text5 {
	color: black;
	text-decoration: none;
}
.tab_detail_content5_td {
	border: 1px solid #d7d7d7;
	width: 120px;
	text-align: center;
}
.book_info_p {
	margin: 1px 20px 20px 20px;
}
.tab_detail_content5_td2 {
	width: 150px;
	height: 70px;
}
.tab_detail_content5_td3 {
	border: 1px solid #d7d7d7;
	font-size: 13px;
}
.tab_detail_content5_td4 {
	padding: 5px 5px 5px 50px;
	border-bottom: 1px solid;
	border-top: 1px solid;
	text-align: left;
	line-height: 120%;
}
.comment-writer5 {
	font-size: 15px;
	color: navy;
}
.comment-date5 {
	font-size: 15px;
	color: tomato;
}
.comment-content5 {
	font-size: 15px;
}
.book25 {
	width: 190px;
	height: 250px;
	margin-left: 10px;
}
table.tab_detail_content5 button.btn-delete {
	background: red;
	color: white;
	display: none;
	float: right;
}
table.tab_detail_content5 tr:hover button.btn-delete {
	display: inline;
}
td#imgTd {
	width: 25%;
}
table#tab_detail_content5{
	width: 100%;
}
td.padd {
	padding-left: 20px;
}
#star_grade a{
    text-decoration: none;
    color: gray;
    }
#star_grade a.on{
    color: red;
    }
</style>
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>
	
<table class="bookinfotable5">
	<tr>
		<td id="imgTd" rowspan="4">
			<div class="box_detail_info5">
				<div class="box_detail_cover5">
					<div class="bookinfocover5">
						<img class="book25"
							src="/resources/img/${dto.sfilename}"
							alt="book_image"/>
					</div>
				</div>
			</div>
		</td>
		<td colspan="2">
			<div class="content_middle5">
			<div class="jumbotron">
				<div class="box_detail_point5">
					<h1 class="title5">
						<strong>${dto.ititle}</strong>
					</h1>
					<br />
					<br /> <span class="back15">${dto.iwriter} 지음 | </span>
					<span class="back15">${dto.publisher} | </span> <span
						class="back15">${dto.publishDay} 출간</span>
				</div>
			</div>	
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="content_middle5">
				<div class="box_detail_point5">
					<span class="back15"> 정가 : <fmt:formatNumber  value="${dto.price}" type="number" var="i_price" />
				         ${i_price}원
					</span> <br /> <span class="back15 back55">판매가 : </span> <span
						class="sell_price"><fmt:formatNumber  value="${dto.discountedPrice}" type="number" var="discounted_price" />
				         ${discounted_price}원 
					</span> 
					<br/>
				</div>
			</div>
		</td>
		<td>
			<div class="content_middle5">
				<div class="box_detail_point5 box_detail_point25">
					<span class="back45">${dto.stock}<br/>
					</span>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="content_middle5">
				<div class="box_detail_point5">
					<span class="back15 back55">배송비 : 2500원</span> <br /> <span
						class="back15 back55"> 배송일정 : 지금 주문하면 </span> <br /> <span class="back15 back55">바로드림 : 인터넷으로
						주문하고 매장에서 직접 수령</span>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="content_middle5">
				<div class="box_detail_point5 back65">					
					<form method="post" id="orderForm">
						<span class="back15 back55">주문수량 : </span> <input type="number"
							name="pcs" id="pcs" value="1" class="intext" min="1" />
						<br/>							
																		
						<input type="button" id="pickupBtn" value="장바구니 담기" class=" btn_blue" onclick="javascript:goPickupPage();"/> 
						<input type="submit" id="orderBtn" value="바로구매" class=" btn_blue2" onclick="javascript:goOrderPage();" />											
					</form>				
				</div>
			</div>
		</td>
	</tr>

</table>

<table class="tab_detail_content5" id="tab_detail_content5">
	<tr>
		<td class="tab_detail_content5_td"><a href="#book_info5"
			class="book_info_text5">상품정보</a></td>
		<td class="tab_detail_content5_td"><a href="#book_info_review"
			class="book_info_text5">회원리뷰</a></td>
		<td class="tab_detail_content5_td"><a href="#book_info_guide"
			class="book_info_text5">교환/반품/품절</a></td>
	</tr>
</table>
<br /><div class="book_info_product5">
<table class="tab_detail_content5">
	
		<tr>
			<td class="tab_detail_content5_td">목차</td>
			<td colspan="2" class="tab_detail_content5_td">
			<p>${dto.TC}</p></td>
		</tr>
		<tr>
			<td class="tab_detail_content5_td">쪽수</td>
			<td colspan="2" class="tab_detail_content5_td">
				${dto.totalPage}쪽</td>
		</tr>
		<tr>
			<td colspan="2" id="book_info5" class="book_info_table_td5">
				<h3>책 소개</h3>
				<div class="book_info_intro_div">
					<hr />
					이 책의 장르 <br />
					<br />
					<p>${fn:replace(dto.cataCode,crcn,br)}</p>
					<br />
					<br />					
						<p class="book_info_p" style="font-size: 14px;">${dto.bookInfo}</p>
					<hr/>							
					<br />
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<h3>저자 소개</h3>
				<div class="book_info_intro_div">
					<hr />
					이 책의 저자 <br />
					<br />
					${dto.iwriter}
					<br />
					<br />					
						<p class="book_info_p" style="font-size: 14px;">${dto.iwriterInfo}</p>						
					<hr/>
					<br />
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<h3>프롤로그</h3>
				<div class="book_info_intro_div">
					<hr />
					<br />					
						<p class="book_info_p" style="font-size: 14px;">${fn:replace(dto.prolog,crcn,br)}</p>										
					<hr/>
					<br />
				</div>
			</td>
		</tr>	
		<tr>
			<td colspan="2" id="book_info_review" class="book_info_table_td5">				
				<div class="book_info_form5">
				
				
				
				<!-- 리뷰 시작 -->
				<form action="/booksale/reviews" method="post" class="was-validated">
				
				<input type="hidden" name="ino" value="${dto.ino}">
				<input type="hidden" name="id" value="${login.id}">
				<textarea rows="5" class="form-control" name="content" required></textarea>
				<button class="btn btn-block rounded-0" type="submit">리뷰등록</button>
				
				</form>
				
				
				<!-- 리뷰 목록 -->
				 
        <table class="table table-stripped">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Text</th>
                </tr>
            </thead>
            <tbody>
              <c:forEach  items="${reviews}" var="review">
                    <tr>
                        <td>${review.id}</td>                        
                        <td>${review.content}
                        
                        
                        
                        <c:if test="${review.id eq login.id}">


				<button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModalupdate${review.rno}">수정</button>
				<div class="modal fade" id="myModalupdate${review.rno}">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">댓글 수정</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<form action="/booksale/updateReviews" method="post" class="was-validated">

								<input type="hidden" name="id" value="${login.id}">
								<input type="hidden" name="rno" value="${review.rno}">
								<input type="hidden" name="ino" value="${review.ino}"> 
								<div class="modal-body">

									<div class="form-group">
										<label for="content">내용 : </label> <input type="text" class="form-control" placeholder="내용을 입력하세요." name="content" required>
										<div class="valid-feedback">입력 완료</div>
										<div class="invalid-feedback">정보를 입력해주세요.</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info">수정 완료</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>




				<button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModaldelete${review.rno}">삭제</button>
				<div class="modal fade" id="myModaldelete${review.rno}">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">댓글 삭제</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<form action="/booksale/deleteReviews" method="post" class="was-validated">

								<input type="hidden" name="id" value="${login.id}">
								<input type="hidden" name="rno" value="${review.rno}">
								<input	type="hidden" name="ino" value="${review.ino}">								
								<div class="modal-body">정말 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info">예</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
								</div>
							</form>
						</div>
					</div>

				</div>

			</c:if>
                        
                        
                        
                        
                        </td> 
                        
                                             
                   		
                    </tr>
                </c:forEach>           

                
            </tbody>
        </table>   							
				</div>
				<div class="book_info_intro_div">			  
				</div>
			</td>
		</tr>
		<tr>
	
	
		
		
		<tr>
			<td colspan="2" id="book_info_guide" class="book_info_table_td5">

				<br />
				<h3>교환/반품/품절 안내</h3>
				<div class="book_info_intro_div">
					<p class="book_info_p" style="font-size: 12px;">※ 상품 설명에 반품/교환
						관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질 수 있습니다.)</p>
					<hr />
					<div class="book_info_intro_div"></div>
					<br />
				</div>
			</td>
		</tr>
		<tr>
			<td class="tab_detail_content5_td tab_detail_content5_td2">반품/교환방법</td>
			<td class="tab_detail_content5_td3 padd">
				<p>
					[1:1상담>반품/교환/환불] 또는 고객센터 (ㅁㅇㅁㅇ-ㅇㅇㅇㅇ) <br /> ※ 오픈마켓, 해외배송주문, 기프트
					주문시 [1:1상담>반품/교환/환불] <br /> 또는 고객센터 (ㅇㅇㅇㅇ-ㅇㅇㅇㅇ)
				</p>
			</td>
		</tr>
		<tr>
			<td class="tab_detail_content5_td tab_detail_content5_td2">반품/교환가능
				기간</td>
			<td class="tab_detail_content5_td3 padd">
				<p>
					변심반품의 경우 수령 후 7일 이내, <br /> 상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내
				</p>
			</td>
		</tr>
		<tr>
			<td class="tab_detail_content5_td tab_detail_content5_td2">반품/교환비용</td>
			<td class="tab_detail_content5_td3 padd">
				<p>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</p>
			</td>
		</tr>
		<tr>
			<td class="tab_detail_content5_td tab_detail_content5_td2">반품/교환
				불가 사유</td>
			<td class="tab_detail_content5_td3">
				<ul>
					<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우 <br /> (단지 확인을 위한 포장
						훼손은 제외)
					</li>
					<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우 <br /> 예) 화장품,
						식품, 가전제품(악세서리 포함) 등
					</li>
					<li>복제가 가능한 상품 등의 포장을 훼손한 경우 <br /> 예) 음반/DVD/비디오, 소프트웨어,
						만화책, 잡지, 영상 화보집
					</li>
					<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)</li>
					<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우</li>
					<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
					<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 <br /> 해당되는
						경우
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="tab_detail_content5_td tab_detail_content5_td2">상품 품절</td>
			<td class="tab_detail_content5_td3 padd">
				<p>
					공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는 <br /> 이메일과 문자로
					안내드리겠습니다.
				</p>
			</td>
		</tr>
		<tr>
			<td class="tab_detail_content5_td tab_detail_content5_td2">소비자
				피해보상 환불지연에 따른 배상</td>
			<td class="tab_detail_content5_td3">
				<ul>
					<li>상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 <br />
						소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨
					</li>
					<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 <br /> 소비자
						보호에 관한 법률에 따라 처리함
					</li>
				</ul>

			</td>
		</tr>	
</table>
</div>
<%@ include file="../com/footer.jsp"%>	
<script type="text/javascript">
$(document).ready(function(){
	var formData = new FormData($("#orderForm")[0]);
	
	
		function goPickupPage(){
			$.ajax({
				type: 'post',
				url: '/pickup/pickupList',
				data: formData,
				processData: false,
				contentType: false,
				success : function(html){
					alert("본 상품이 장바구니에 추가되었습니다.");
					this.action = '/pickup/pickupList';
					},
				error : function(error){
					alert("장바구니 물품 추가에 문제가 생겼습니다.");
					history.go(-1);
					console.log(error);
					console.log(error.status);
				}
				
		});	
	};

	
		function goOrderPage(){		
			$.ajax({
				type: 'post',
				url: '/order/orderList',
				data: formData,
				processData: false,
				contentType: false,
				success : function(html){
					alert("본 상품이 구매페이지에 추가되었습니다.");
					this.action = '/order/orderList';
				},
				error : function(error){
					alert("구매 요청을 다시 진행해주시기 바랍니다.");
					history.go(-1);
					console.log(error);
					console.log(error.status);
				}
				
		});	
		
	};

}

});	

$(".modal-update-btn").click(function(){
	var rno = $(".modal-rno").text();
	var replytext = $(".modal-replytext").val();

	$.ajax({
		type: 'put',
		url: '/reviews/'+rno,
		headers: {
			
		'Content-Type' : 'application/json',
		'X-HTTP-Method-Override' : 'PUT'
									
		},
		dataType: 'text',
		data : JSON.stringify({						
			replytext : replytext
		}),  
		success : function(result){

			if(result === "success"){
				getList(bno);
			}
									
			

		},
		error : function(request, status, error){
			console.log(error);

		}			

			});	

		});



$("#replies").on("click", ".replydelete", function(){
	var rno = $(this).attr("data-rno");

	$.ajax({
		type: 'delete',
		url: '/reviews',
		headers : {
		'Content-Type' : 'application/json',
		'X-HTTP-Method-Override' : 'DELETE'
		},
		dataType: 'text',
		data : JSON.stringify ({
			rno : rno
			}),
		success : function(result){
			
				getReviewList(ino);
			
			

		}	

	});
	
});


function getReviewList(ino){

var str = '';
	
$.getJSON("/reviews/all/"+ino, function(data){

for(var i = 0; i < data.length; i++){
	str += '<div class="panel-heading"><span>rno: '+data[i]["rno"]+'</span>, <span>작성자: '+data[i]["replyer"]+'</span><span class="pull-right">'+data[i]["updatedate"]+'</span></div><div class="panel-body"><p>'+data[i]["replytext"]+'</p><button data-name="'+data[i]["replyer"]+'" data-rno="'+data[i]["rno"]+'" class="btn btn-warning btn-xs replymodify">수정</button><button data-rno="'+data[i]["rno"]+'" class="btn btn-danger btn-xs replydelete">삭제</button></div></div>';			
}

$("#replies").html(str);

});
}

</script>
</body>	
</html>