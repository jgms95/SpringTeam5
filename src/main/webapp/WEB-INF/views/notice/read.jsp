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
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">


		<h2 style="background-color: rgb(55, 55, 55); color: white;">${dto.title}</h2>
		<p class="far fa-sticky-note">&nbsp;글번호: ${dto.nno}&nbsp;&nbsp;조회수: ${dto.readcnt}</p>



		<br>


		<div class="jumbotron" style="background-color: rgb(57,14,0); color: white;">


			<h5>
				<strong>공지 제목 :</strong> ${dto.title}
			</h5>
			<h5>
				<strong>공지 내용 :</strong>
			</h5>
			<h6>${dto.content}</h6>



			<br>
			<h5>
				<strong>파일 :</strong>
			</h5>
			<c:forEach items="${filelist}" var="fileDto">
				<a style="color : white;" href = "/notice/fileDownload?file_num=${fileDto.file_num}">${fileDto.o_name}</a><br>
			</c:forEach>



		</div>
		<br>


		

			<c:if test="${authority == '01' || authority == '02'}">
				<a class="btn btn-warning rounded-0" href="/notice/update?nno=${dto.nno}&id=${login.id}">수정</a>
		|
		<button type="button" class="btn btn-danger rounded-0" data-toggle="modal" data-target="#myModal">삭제</button>
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title">'${dto.title}' 글 삭제</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">정말 삭제하시겠습니까?</div>

							<div class="modal-footer">
								<a class="btn btn-info" href="/notice/delete?nno=${dto.nno}&id=${login.id}">예</a>
								<button type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
							</div>

						</div>
					</div>
				</div>

		|
		</c:if>
		<a class="btn btn-secondary rounded-0" href="/notice/noticelist/1?id=${login.id}">목록</a>

			
		
		

</div>


<%@ include file="../com/footer.jsp"%>

</body>
</html>