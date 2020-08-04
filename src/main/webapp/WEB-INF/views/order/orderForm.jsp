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
					document.getElementById("userAddr3").value = extraAddr;
				} else {
					document.getElementById("userAddr3").value = '';
				}

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("userAddr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("userAddr2").focus();
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


	<div class="container" style="margin: 30px 0 30px 0;">
		<h2>주문하기</h2>
		<br>


		<form action="" method="post" id="">

			<table class="boardWrite">
				<tbody>

					<tr>
						<th scope="row">이름 </th>
						<td><input type="text" id="name" value="${mRead.name}"></td>
					</tr>

					<tr>
						<th scope="row">휴대전화 </th>
						<td><input type="text" maxlength="11" id="phoneNum"
							placeholder="'-'를 빼고 입력해주세요." name="phoneNum" value="${mRead.phoneNum}"><br></td>
					</tr>
					
					<tr>
						<th scope="row">이메일 </th>
						<td><input type="text" id="email" name="email" value="${mRead.email}"></td>
							
					</tr>

					<tr>
						<th scope="row"></th>
						<td>
							<div class="address">
								<input type="radio" id="address" name="ar" class="oldadd" checked="checked">
								<label for="address">주문자 정보와 동일</label>
								<input type="radio" id="address1" name="ar" class="newadd">
								<label for="address1">새로운 배송지</label>
							</div>
							
						</td>
					</tr>
					<tr>
						<th scope="row">받으시는 분</th>
						<td><input type="text"  value="${mRead.name}" class="newadds"></td>
					</tr>

					<tr class="">
						<th scope="row">주소 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							class="" alt="필수" /></th>
						<td><input type="text" name="userAddr1"
							placeholder="주소" value="${mRead.userAddr1}" class="newadds"> <input type="button"
							class="btn btn-sm rounded-0" onclick="execDaumPostcode()"
							value="주소 찾기"><br>
						<br> <input type="text"  name="userAddr3"
							placeholder="참고항목" value="${mRead.userAddr3}" class="newadds" > <input type="text" 
							name="userAddr2" placeholder="상세주소" value="${mRead.userAddr2}" class="newadds" ></td>
					</tr>

					<tr>
						<th scope="row">휴대전화 </th>
						<td><input type="text" maxlength="11" placeholder="'-'를 빼고 입력해주세요." class="newadds" name="newPhoneNum" value="${mRead.phoneNum}"><br></td>
					</tr>
				

					<tr>
						<th scope="row">배송시 요청사항 </th>
						<td><textarea style="resize: none;" maxlength="255" cols="70"></textarea>
						<br></td>
					</tr>

					<tr>
						<th scope="row">결제 방법</th>
						<td>
							<div class="address">
								<input type="radio">
								<label>무통장 입금</label>
								<input type="radio">
								<label>카드 결제</label>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row">총 결제 금액</th>
						<td>255,500원</td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="checkbox" id="agree">
				<label for="agree">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
			</div>
			
			<br>
			<button type="submit" id="isOk" class="btn rounded-0">회원가입</button>
			<button class="cencle btn rounded-0" type="button">취소</button>

		</form>
	</div>



	<%@ include file="../com/footer.jsp"%>
	
	<script type="text/javascript">

	$(".newadd").click(function(){
		$(".newadds").val("");
	});

	
	</script>
</body>
</html>