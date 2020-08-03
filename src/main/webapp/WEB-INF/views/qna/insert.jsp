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

<script type="text/javascript">


	$(document).ready(function() {

		 var chk = -1;
		 var eraseText = document.getElementsByClassName('book');

		 $(".findBook").on("click", function() {
				   $.ajax({
		            	type : 'post',
		                url : "/qna/findBook",
		                data : {
			                ititle : $("#ititle").val()
			            },
		                success : function (result) {
		                	if(result == 1){
		                		alert("책 검색 완료");
		                		chk = 1;
		                	}else{
		                		alert("현재 사이트에 없는 책입니다. 다시 검색해주세요");
		                		chk = -1;		
		                		for(var i=0; i< eraseText.length; i++){
		                			eraseText[i].value = '';
		                		}         
		                	}     
		         		}
				   })
				
		});


		 $("#isOk").on("click", function(event) {
				if (chk == -1) {
					alert("책 검색을 완료해주세요.");
					$("#ititle").focus();
					return false;
				}
		 });

	});




</script>

<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">




		<h1>Q&amp;A 등록</h1>

		<form action="/qna/insert" method="post" class="was-validated" enctype="multipart/form-data">
			 <input name="currentino" class="form-control" value="${ino}" type="hidden">
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
			
			<div class="form-group form-inline">
				<label for="ititle">책 :&nbsp;</label>
				 <input type="text" class="book form-control" placeholder="책 이름을 검색하세요." id="ititle" name="ititle" required>
				 &nbsp;<button type="button" style="background-color: rgb(67,22,7); color: white;" class="findBook btn btn-sm rounded-0">검색</button><br>
			</div>
			
			<div class="form-group">
				<label for="title">제목 : </label> <input type="text" class="form-control" placeholder="제목을 입력하세요." name="title" required>
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
			
			<button type="submit" id="isOk" class="btn btn-info rounded-0">작성완료</button>
			<a class="btn btn-secondary rounded-0" href="javascript:history.back();">목록</a>
		</form>



	</div>
	


<%@ include file="../com/footer.jsp"%>

</body>
</html>