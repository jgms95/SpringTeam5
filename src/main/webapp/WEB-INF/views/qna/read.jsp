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
	.btn{
	background-color: rgb(90,56,37);
	color: white;
	}
	
</style>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">


		<h2 style="background-color: rgb(55, 55, 55); color: white;">${dto.title}</h2>
		<p class="far fa-sticky-note">&nbsp;글번호: ${dto.qno}&nbsp;&nbsp;조회수: ${dto.readcnt}</p>



		<br>


		<div class="jumbotron" style="background-color: rgb(57,14,0); color: white;">


			<h5>
				<strong>Q&amp;A 제목 :</strong> ${dto.title}
			</h5>
			<h5>
				<strong>Q&amp;A 내용 :</strong>
			</h5>
			<h6>${dto.content}</h6>



			<br>
			<h5>
				<strong>파일 :</strong>
			</h5>
			<c:forEach items="${filelist}" var="fileDto">
				<a style="color : white;" href = "/qna/fileDownload?file_num=${fileDto.file_num}">${fileDto.o_name}</a><br>
			</c:forEach>



		</div>
		<br>


		

		<c:if test="${login.id == dto.id}">
				<a class="btn rounded-0" href="#">수정</a>
		|
		</c:if>
		<c:if test="${authority == '01' || authority == '02' || login.id == dto.id}">
		<button type="button" class="btn rounded-0" data-toggle="modal" data-target="#myModal">삭제</button>
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title">'${dto.title}' 글 삭제</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">정말 삭제하시겠습니까?</div>

							<div class="modal-footer">
								<a class="btn rounded-0" href="#">예</a>
								<button type="button" class="btn rounded-0" data-dismiss="modal">아니요</button>
							</div>

						</div>
					</div>
				</div>
		|
		<a class="btn rounded-0" href="/qna/reply?qno=${dto.qno}&id=${login.id}&currentIno=${currentIno}">답변 달기</a>
		|
		</c:if>
		
		<a class="btn rounded-0" href="/qna/allqnalist/1?ino=${currentIno}">목록</a>

		
			
	

			
		
		

</div>


<%@ include file="../com/footer.jsp"%>

</body>
</html>