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




		<h1>Q&amp;A 등록</h1>

		<form action="#" method="post" class="was-validated" enctype="multipart/form-data">
			<div class="form-group">
				<label for="id">ID : </label> <input name="id" class="form-control" readonly value="${login.id}">
			</div>
			<div class="form-group">
			<label for="category">카테고리 : </label> 
				<select name="category" class="custom-select mb-3">
   					 <option value="book">도서문의</option>
    				 <option value="money">입금/결제문의</option>
 					 <option value="modify">변경/취소</option>
 					 <option value="modify">배송문의</option>
  				</select>
			</div>
			<div class="form-group">
				<label for="title">제목 : </label> <input type="text" class="form-control" placeholder="제목을 입력하세요." name="title" required>
				<div class="valid-feedback">입력 완료</div>
				<div class="invalid-feedback">제목을 입력해주세요.</div>
			</div>
			내용 : <br>
			<textarea style="width: 100%" placeholder="내용을 입력하세요." name="content" required></textarea>
			<div class="valid-feedback">입력 완료</div>
			<br><br>
			첨부 파일: <button type="button" style="background-color: rgb(67,22,7); color: white;" class="btn btn-sm rounded-0" id="addFile">파일 추가</button>
			<div id="files">
				<input type="file" id="customFile" name="uploadFile"><br>		
			</div>
			
			<br><br>
			<button type="submit" class="btn btn-info rounded-0">작성완료</button>
			<a class="btn btn-secondary rounded-0" href="javascript:history.back();">목록</a>
		</form>



	</div>
	


<%@ include file="../com/footer.jsp"%>

</body>
</html>