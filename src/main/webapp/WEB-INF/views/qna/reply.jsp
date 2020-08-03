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
<style type="text/css">
	.btn{
	background-color: rgb(67,22,7);
	color: white;
	}
	
</style>

<script type="text/javascript">

$(document).ready(function(){

	$("#addFile").on("click", function(event){
		event.preventDefault();
		fn_addFile();
	});

	
});

function fn_addFile(){
	var str = "<input type='file' id='customFile' name='uploadFile'><br>"
		
	$("#files").append(str);
}

</script>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">


		<h2 style="background-color: rgb(55, 55, 55); color: white;">${dto.title}</h2>
		
		<form action="/qna/reply" method="post" class="was-validated" enctype="multipart/form-data">
			<input name="currentIno" class="form-control" value="${currentIno}" type="hidden">
			<input name="orgqno" class="form-control" value="${orgdto.qno}" type="hidden">
			<input name="filename" class="form-control" value="${orgdto.filename}" type="hidden">
			<div class="form-group">
				<label for="id">ID : </label> <input name="id" class="form-control" readonly value="${login.id}">
			</div>
			<div class="form-group">
				<label for="category">카테고리 : </label> <input name="category" class="form-control" readonly value="${orgdto.category}">
			</div>
			<div class="form-group">
				<label for="ino">상품번호 : </label> <input name="ino" class="form-control" readonly value="${orgdto.ino}">
			</div>
			<div class="form-group">
				<label for="ititle">책 이름 : </label> <input name="ititle" class="form-control" readonly value="${orgdto.ititle}">
			</div>
			<div class="form-group">
				<label for="title">원글 제목 : </label> <input name="title" class="form-control" readonly value="${orgdto.title}">
			</div>
			답변 내용 : <br>
			<textarea style="width: 100%" placeholder="내용을 입력하세요." name="content" required></textarea>
			<div class="valid-feedback">입력 완료</div>
			<br><br>
			첨부 파일: <button type="button" style="background-color: rgb(67,22,7); color: white;" class="btn btn-sm rounded-0" id="addFile">파일 추가</button>
			<div id="files">
				<input type="file" id="customFile" name="uploadFile"><br>		
			</div>
			
			<br><br>
			
			<button type="submit" id="isOk" class="btn rounded-0">작성완료</button>
			<a class="btn rounded-0" href="javascript:history.back();">답변 취소</a>
			<a class="btn rounded-0" href="/qna/allqnalist/1?ino=${currentIno}">목록</a>
		</form>


		


		
	

</div>



<%@ include file="../com/footer.jsp"%>

</body>
</html>