<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../com/head.jsp"%>
	
	<script src="/resources/js/uploadfn.js" type="text/javascript"></script>
		
<title>Insert title here</title>
<style type="text/css">
	
</style>
</head>
<script type="text/javascript">
$(document).ready(function() {

   $("#isOk").on("click", function(event) {

      var ext = $('#file').val().split('.').pop().toLowerCase();
         if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
          alert('썸네일 이미지는 gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
          $("#file").focus();
          return false;
         }
     

   });
   
});


</script>
<body>
<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>
	 
	 <div class="container">
	 	<div class="row text-center">
	 		<h1>책등록</h1>
	 	</div>
	 
	 	<div class="row center">
	 	


			<form action="/booksale/insert" method="post" id="fileform"  enctype="multipart/form-data" style="width:600px " class="was-validated">
				<div class="form-group">
					<label for="title">책제목</label>
					<input name="ititle" id="ititle" class="form-control" required>
				</div>
				
				<div class="form-group">
					<label for="id">작성자</label>
					<input name="id" id="id" class="form-control" value="${id }" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="writer">저자</label>
					<input name="iwriter" id="iwriter" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="writer">출판사</label>
					<input name="publisher" id="publisher" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="writer">출판일</label>
					<input type="date" name="publishDay" id="publishday" class="form-control" required>
				</div>
				<div class="form-group">
				<select class="form-control search-slt"  name="cateCode">
                                <option>카테고리</option>
                                <option value="시/에세이">시/에세이</option>
                                <option value="경제/경영">경제/경영</option>
                                <option value="자기계발">자기계발</option>
                                <option value="컴퓨터/IT">컴퓨터/IT</option>
                                <option value="소설">소설</option>
                                <option value="참고서/문제집">참고서/문제집</option>
                                <option value="요리">요리</option>
                                <option value="만화">만화</option>
                                <option value="인문">인문</option>
                                <option value="수필">수필</option>

                            </select>
				</div>
				<div class="form-group">
					<label for="writer">가격</label>
					<input name="price" id="price" class="form-control" required>
				</div>
				
				<div class="form-group">
					<label for="writer">재고량</label>
					<input name="stock" id="stock" class="form-control" required>
				</div>
				
				<div class="form-group">
					<label for="writer">할인율</label>
					<input type="number" name="percent" id="discount" class="form-control" required>
				</div>
			
				
				<div class="form-group">
					<label for="content">내용</label>
					<textarea rows="5" name="content" id="content" class="form-control" style="width: 1000px" required></textarea>
				</div>
				
				<div class="form-group">
					<label for="content">프롤로그</label>
					<textarea rows="5" name="prolog" id="prolog" class="form-control"  maxlength="300" required></textarea>
			</div>
			<div class="form-group">
					<label for="TC">목차</label>
					<textarea name="TC" id="TC" class="form-control"></textarea>
				</div>
					<div class="form-group">
					<label for="writer">총페이지</label>
					<input type="number" name="totalpage" id="discount" class="form-control" required>
				</div>
				
					<div class="form-group">
					<label for="iwriterInfo">저자 설명</label>
					<textarea rows="5" name="iwriterInfo" id="iwriterInfo" class="form-control" style="width: 1000px" maxlength="300"></textarea>
				</div>
				<div class="form-group">
					<label for="bookInfo">책 소개</label>
					<textarea rows="5" name="bookInfo" id="bookInfo" class="form-control" style="width: 1000px" maxlength="300"></textarea>
				</div>
			
			
			
		  <div class="form-group">
    <label for="file">첨부파일</label>
    <input type = "file" name="file"  class="form-control" id="file"></textarea>
  </div>
 

			
			<div class="form-group">
				 <button type="submit" id="isOk" class="btn btn-primary" onClick="fileSubmit();">글쓰기</button>
				<button class="btn btn-info" id="listbtn" onclick="location.href='/booksale/list'">목록</button>
			</div>
	 	</form>
	 	
	 
	 	</div>
	 </div>
	 

<script>
	function fileSubmit() {
		var formData = new FormData($("#fileForm")[0]);
		$.ajax({
			type : 'post',
			url : '/booksale/insert',
			data : formData,
			processData : false,
			contentType : false,
			success : function(html) {
				alert("파일 업로드하였습니다.");
			},
			error : function(error) {
				
				console.log(error);
				console.log(error.status);
			}
		});
	}
</script>
	 	<%@ include file="../com/footer.jsp"%>
</body>
</html>