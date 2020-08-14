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
<script type="text/javascript">
$(document).ready(function(){
	$(".deletefile").on("click",function(event){
		event.preventDefault();
      	var that = $(this);
	       $.ajax({
	          type : 'post',
	          url : '/notice/deletefile',
	          dataType : 'text',
	          data : {
	        	  file_num : that.attr("href")
	          },
	          success : function(result){
	             that.parent("div").remove();
	          }
	       });  
	
	
	 });
	$("#addFile").on("click", function(event){
		event.preventDefault();
		fn_addFile();
	});
	
	
		
	
});
function fn_addFile(){
	var str = "<input type='file' id='customFile' name='newFile'><br>"
		
	$("#files").append(str);
}
</script>



</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">




		<h1>${nno}. 공지사항 수정</h1>

		<form action="/notice/update" method="post" class="was-validated" enctype="multipart/form-data">
			<input name="nno" class="form-control" type="hidden" value="${nno}">
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
			<br><br>
			기존 첨부파일: (삭제 버튼을 누르시면  바로 삭제됩니다.) <br>
			<c:forEach items="${filelist}" var="fileDto">
			<div>
				
				<a style="color : rgb(23,6,0);" href = "/notice/fileDownload?file_num=${fileDto.file_num}">${fileDto.o_name}</a>
				<a href="${fileDto.file_num}" class="deletefile">
				<img src=https://cdn.jsdelivr.net/npm/bootstrap-icons/icons/trash-fill.svg width="20" height="20" alt="삭제">
				</a>
      	  </div>
			</c:forEach>

			<br><br>
			첨부 파일 추가:	<button type="button" class="btn btn-sm rounded-0" id="addFile">파일 추가</button>
			<br><br>
			<div id="files">
			<input type='file' id='customFile' name='newFile'><br>
			</div>
			<br><br>
			<button type="submit" class="btn rounded-0" >작성완료</button>
			<a class="btn rounded-0" href="javascript:history.back();">뒤로가기</a>
			
		</form>



	</div>



<%@ include file="../com/footer.jsp"%>

</body>
</html>