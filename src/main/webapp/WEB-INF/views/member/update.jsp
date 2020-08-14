<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
 <%@ include file="../com/head.jsp"%>
	
	<script src="/resources/js/uploadfn.js" type="text/javascript"></script>
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
		
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../com/top.jsp"/>
<jsp:include page="../com/navbar.jsp"/>

 <div class="container">
	 	<div class="row text-center">
	 		<h1>수정</h1>
	 		<br>
	 		
	 	</div>
	
	 
	 	<div class="row center">
	 			
			

			<form action="/member/update" method="post" id="fileform"  enctype="multipart/form-data" style="width:600px ">
				
				
				
				
				<div class="form-group">
					<label for="writer">ID</label>
					<input name="id" id="id" class="form-control" valuer="" readonly="readonly" value="${dto.id }" >
				</div>
				
				<div class="form-group">
					<label for="title">이름</label>
					<input name="name" id="name" class="form-control" value="${dto.name}" readonly="readonly">
				</div>
				
				<tr>
						<th scope="row">비밀번호 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							alt="필수" /><br></th>
						<td><input type="text" maxlength="15" id="pw"
							placeholder="pw확인" name="pw">
							<input type="hidden" name="id" value="${dto.id }"> 
							<button type="button" class="checkPw btn  btn-dark rounded-0"
								id="PwCheck" value="N">중복확인</button></td>
				</tr>
				
								
				<div class="form-group">
					<label for="writer">email</label>
					<input name="email" id="email" class="form-control" value="${dto.email }" required="required" >
				</div>
				<div class="form-group">
					<label for="writer">폰넘버</label>
					<input name="phoneNum" id="phoneNum" class="form-control" value="${dto.phoneNum }" required="required">
				</div>
					<tr class="">
						<th scope="row">주소 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							class="" alt="필수" /><br></th>
						<td><input type="text" id="userAddr1" name="userAddr1"
							placeholder="주소" readonly="readonly"> <input type="button"
							class="btn btn-dark rounded-0" onclick="execDaumPostcode()"
							value="주소 찾기"><br>
						<br> <input type="text" id="userAddr3" name="userAddr3"
							placeholder="참고항목" readonly="readonly"> <input type="text" id="userAddr2"
							name="userAddr2" placeholder="상세주소"></td>
					</tr> <br>
					
				
		
				
	
			
			
		  <div class="form-group">
    <label for="file">내 사진</label>
    <input type = "file" name="file"  class="form-control" id="file"></textarea>
  </div>
 

			
			<div class="form-group">
				 <button type="submit" class="btn btn-primary" onClick="fileSubmit();">글쓰기</button>
				
			</div>
	 	</form>
	 	
	 
	 	</div>
	 </div>
	 

<script>

	
	function fileSubmit() {
		var formData = new FormData($("#fileForm")[0]);
	
	
		$.ajax({
			type : 'post',
			url : '/booksale/update',
			data : formData,
			processData : false,
			contentType : false,
			success : function(html) {
			
			},
			error : function(error) {
				
				console.log(error);
				console.log(error.status);
			}
		});
	} 
	
</script>
<script type="text/javascript">

	$(document).ready(function() {
		$(".checkPw").on("click", function(event) {
			$.ajax({
				type : 'post',
				url : '/member/checkPw',
				dataType : 'text',
				data : {
					pw : $(pw).val(),
					id : $(id).val()
				},
				success : function(data) {
					if (data == 0) {
						$("#IdCheck").attr("value", "Y");
						alert("비밀번호 일치");
					} else {
						$("#IdCheck").attr("value", "N");
						alert("비밀번호가 다릅니다.");
					}
				}

			});

		});
});
</script>
	 	<%@ include file="../com/footer.jsp"%>
</body>
</html>