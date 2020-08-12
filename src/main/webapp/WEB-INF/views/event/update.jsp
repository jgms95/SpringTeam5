<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../com/head.jsp"%>

<title>Spring Book</title>
<style type="text/css">

.btn {
background-color: rgb(67,22,7);
color: white;
}

</style>
</head>
<script type="text/javascript">
$(document).ready(function() {

	$("#isOk").on("click", function(event) {

		var ext1 = $('#firstImg').val().split('.').pop().toLowerCase();
	      if($('#firstImg').val()!=null and $.inArray(ext1, ['gif','png','jpg','jpeg']) == -1) {
			 alert('썸네일 이미지는 gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
			 $("#firstImg").focus();
			 return false;
	      }
		var ext2 = $('#SecondImg').val().split('.').pop().toLowerCase();
	      if($('#SecondImg').val()!=null and $.inArray(ext2, ['gif','png','jpg','jpeg']) == -1) {
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




		<h1>'${eventtitle}' 이벤트 수정</h1>

		<form action="/event/update" method="post" class="was-validated" enctype="multipart/form-data">
			<input name="eno" class="form-control" type="hidden" value="${eno}">
			<div class="form-group">
				<label for="id">ID : </label> <input name="id" class="form-control" readonly value="${login.id}">
			</div>
			<div class="form-group">
				<label for="title">제목 : </label> <input type="text" class="form-control" placeholder="제목을 입력하세요." name="title" required>
				<div class="valid-feedback">입력 완료</div>
				<div class="invalid-feedback">제목을 입력해주세요.</div>
			</div>
			내용 : <br>
			<textarea style="width: 100%" placeholder="내용을 입력하세요." name="content"></textarea>

			<br><br>
			(새로 등록하고 싶으신 이미지가 있으실 경우 올려주세요.)
			<br><br>
			썸네일 이미지: 
			<div class="custom-file mb-3">
    			<input type="file" class="custom-file-input" id="firstImg" name="firstImg">
    			<label class="custom-file-label" for="firstImg">Choose file</label>
  			 </div>
			이벤트 이미지: 
			<div class="custom-file mb-3">
     			<input type="file" class="custom-file-input" id="SecondImg" name="SecondImg">
    			<label class="custom-file-label" for="SecondImg">Choose file</label>
   			</div>
			<br><br>
			<button type="submit" id="isOk" class="btn rounded-0" >작성완료</button>
			<a class="btn rounded-0" href="javascript:history.back();">뒤로가                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    기</a>
			
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