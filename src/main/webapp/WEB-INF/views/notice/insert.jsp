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



<script type="text/javascript">

$(document).ready(function(){

	$("#addFile").on("click", function(event){
		event.preventDefault();
		fn_addFile();
	});

	
});

function fn_addFile(){
	var str = "<div class='custom-file mb-3'>"
		+"<input type='file' class='custom-file-input' id='customFile' name='uploadFile'>"
		+"<label class='custom-file-label' for='customFile'>Choose file</label>"
		+"</div>";
	$("#files").append(str);
}

</script>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">




		<h1>공지사항 등록</h1>

		<form action="/notice/insert" method="post" class="was-validated" enctype="multipart/form-data">
			<div class="form-group">
				<label for="id">ID : </label> <input name="id" class="form-control" readonly value="${login.id}">
			</div>
			<div class="form-group">
				<label for="title">제목 : </label> <input type="text" class="form-control" placeholder="제목을 입력하세요." name="title" required>
				<div class="valid-feedback">입력 완료</div>
				<div class="invalid-feedback">제목을 입력해주세요.</div>
			</div>
			내용 : <br>
			<textarea style="width: 100%" placeholder="내용을 입력하세요." name="content" required></textarea>
			<div class="valid-feedback">입력 완료</div>
			<br>
			첨부 파일: <button type="button" style="background-color: rgb(67,22,7); color: white;" class="btn btn-sm rounded-0" id="addFile">파일 추가</button>
			<div id="files">
			<div class="custom-file mb-3">
				<input type="file" class="custom-file-input" id="customFile" name="uploadFile">
				<label class="custom-file-label" for="customFile">Choose file</label>
			</div>
			</div>
			
			<br><br>
			<button type="submit" class="btn btn-info rounded-0">작성완료</button>
			<a class="btn btn-secondary rounded-0" href="/notice/noticelist/1?id=${login.id}">목록</a>
		</form>



	</div>
	
<%@ include file="../com/footer.jsp"%>

<script>
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});


</script>

</body>
</html>