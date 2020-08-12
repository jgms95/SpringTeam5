<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../com/head.jsp"%>

<title>Insert title here</title>
</head>

<script type="text/javascript">
$(document).ready(function() {

	$("#isOk").on("click", function(event) {

		var ext1 = $('#firstImg').val().split('.').pop().toLowerCase();
	      if($.inArray(ext1, ['gif','png','jpg','jpeg']) == -1) {
			 alert('썸네일 이미지는 gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
			 $("#firstImg").focus();
			 return false;
	      }
		var ext2 = $('#SecondImg').val().split('.').pop().toLowerCase();
	      if($.inArray(ext2, ['gif','png','jpg','jpeg']) == -1) {
		 	alert('이벤트 이미지는 gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
		 	$("#SecondImg").focus();
			 return false;
	      }

	});
	
});


</script>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">




		<h1>이벤트 등록</h1>

		<form action="/event/insert" method="post" class="was-validated" enctype="multipart/form-data">
			<div class="form-group">
				<label for="id">ID : </label> <input name="id" class="form-control" readonly value="${login.id}">
			</div>
			<div class="form-group">
				<label for="title">제목 : </label> <input type="text" class="form-control" placeholder="제목을 입력하세요." name="title" required>
				<div class="valid-feedback">입력 완료</div>
				<div class="invalid-feedback">제목을 입력해주세요.</div>
			</div>
			추가 내용 : <br>
			<textarea style="width: 100%" placeholder="내용을 입력하세요." name="content"></textarea>
			<div class="valid-feedback">입력 완료</div>
			<br>
			썸네일 이미지: 
			<div class="custom-file mb-3">
    			<input type="file" class="custom-file-input" id="firstImg" name="firstImg" required>
    			<label class="custom-file-label" for="firstImg">Choose file</label>
  			 </div>
			이벤트 이미지: 
			<div class="custom-file mb-3">
     			<input type="file" class="custom-file-input" id="SecondImg" name="SecondImg" required>
    			<label class="custom-file-label" for="SecondImg">Choose file</label>
   			</div>
			<br><br>
			<button type="submit" id="isOk" class="btn btn-info rounded-0">작성완료</button>
			<a class="btn btn-secondary rounded-0" href="/event/eventlist/1?id=${login.id}">목록</a>
		</form>



	</div>
<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
	


<%@ include file="../com/footer.jsp"%>

</body>
</html>