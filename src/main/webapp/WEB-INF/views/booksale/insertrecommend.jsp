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
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>
	
	<div class="container" style="margin: 30px auto 30px auto;">




		<h1>추천작품</h1>

		<form action="/booksale/insertrecommend" method="post" class="was-validated" enctype="multipart/form-data">
			<div class="form-group">
				<label for="id">ID : </label> <input name="id" class="form-control" readonly value="${login.id}">
			</div>
			
			<div class="form-group form-inline">
			<label for="ititle">책 :&nbsp;</label>
				 <input type="text" class="book form-control" placeholder="책 이름을 검색하세요." id="ititle" name="bookName" required>
				 &nbsp;<button type="button" style="background-color: rgb(67,22,7); color: white;" class="findBook btn btn-sm rounded-0">검색</button><br>
			</div>
			한줄평 : <br>
			<textarea style="width: 100%" placeholder="내용을 입력하세요." name="content" required></textarea>
			<div class="valid-feedback">입력 완료</div>
			<br>
			
			<br><br>
			<button type="submit" class="btn btn-info rounded-0">작성완료</button>
			<a class="btn btn-secondary rounded-0" href="/">목록</a>
		</form>



	</div>
	
	<div style="margin-top: 300px">
	</div>
	
 	<%@ include file="../com/footer.jsp"%>
</body>
</html>