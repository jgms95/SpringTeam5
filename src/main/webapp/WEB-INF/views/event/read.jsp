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
	background-color: rgb(67,22,7);
	color: white;
}

img{
	width: 85%;
	height: auto;
}
	
</style>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>


<div class="container" style="margin: 30px auto 30px auto;">





		<div class="media border p-3">
			<div class="media-body">
				<h4>${dto.title}
				</h4>
			</div>
		</div>
		  <div class="row">
    <div class="col-sm-9 far fa-sticky-note" >&nbsp;글번호:
			${dto.eno}&nbsp;&nbsp;조회수: ${dto.readcnt}&nbsp;&nbsp;작성자: ${dto.id}</div>
    <div class="col-sm-3" style="text-align: right;" >작성일: ${dto.writeday}</div>
  </div>
	
		

		<div class="jumbotron" style="text-align:center; background-color: rgb(255,245,242);" >


			
		<img src="/resources/event/${dto.filename}" alt="event" />

		<p>${dto.content}</p>
			<br>



		</div>
		<br>




		
		<c:if test="${authority == '01' || authority == '02'}">
		<c:if test="${not fn:contains(dto.title,'(진행종료)')}">
			<a class="btn rounded-0" href="/event/finishevent?id=${login.id}&eno=${eno}&title=${dto.title}">이벤트 종료</a>
		|
		</c:if>
			<a class="btn rounded-0" href="/event/update?eno=${dto.eno}&id=${login.id}">수정</a>
		|
			<button type="button" class="btn rounded-0" data-toggle="modal"
				data-target="#myModal">삭제</button>
			<div class="modal fade" id="myModal">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">

						<div class="modal-header">
							<h4 class="modal-title">'${dto.title}' 글 삭제</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">정말 삭제하시겠습니까?</div>

						<div class="modal-footer">
							<a class="btn rounded-0" href="/event/delete?eno=${dto.eno}&id=${login.id}&filename=${dto.filename}&titleImg=${dto.titleImg}">삭제</a>
							<button type="button" class="btn rounded-0" data-dismiss="modal">취소</button>
						</div>

					</div>
				</div>
			</div>
		|
		</c:if>

		<a class="btn rounded-0" href="/event/eventlist/1?id=${login.id}">목록</a>
		
		
		
		
		
		
		
			<br> <br>
		<hr>
		<c:if test="${login.id ne null}">
		<h5 class="fas fa-pen-fancy">
			<strong> 댓글 남기기</strong>
		</h5>
		<form action="/event/insertComment" method="post" class="was-validated">
			<input type="hidden" name="id" value="${login.id}">
			<input type="hidden" name="eno" value="${dto.eno}">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="내용을 입력하세요." name="content" required>
				<div class="valid-feedback">입력 완료</div>
				<div class="invalid-feedback">정보를 입력해주세요.</div>
			</div>
			<button type="submit" class="btn btn-warning">작성완료</button>
		</form>
		<br>
		<hr>
		</c:if>

		
		<h5 class="far fa-copy">
			<strong>댓글 목록 [${count}] </strong>
		</h5>
		<br><br>
		<c:forEach items="${eventCommentlist}" var="commentdto">

			<c:if test="${commentdto.repIndent>0}">
				<h4>
				<svg class="bi bi-arrow-return-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 9l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
  <path fill-rule="evenodd" d="M3 2.5a.5.5 0 0 0-.5.5v4A2.5 2.5 0 0 0 5 9.5h8.5a.5.5 0 0 0 0-1H5A1.5 1.5 0 0 1 3.5 7V3a.5.5 0 0 0-.5-.5z"/>
</svg>
					<span class="badge badge-pill badge-info ">
					Re: ${commentdto.orgWriter} </span>
				</h4>
			</c:if>


			<div class="media border p-3">

				<div class="media-body">
					<h4>${commentdto.id}
						<small><i>${commentdto.writeday}</i></small>
					</h4>
					<p>${commentdto.content}</p>
				</div>
			</div>



			<br>
			<c:if test="${login.id ne null}">
			<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModal${commentdto.num}">답변 달기</button>
			<div class="modal fade" id="myModal${commentdto.num}">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">답변 달기</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<form action="/event/replycomment" method="post" class="was-validated">

							<input type="hidden" name="id" value="${login.id}">
							<input type="hidden" name="orgNum" value="${commentdto.num}">
							<input type="hidden" name="eno" value="${commentdto.eno}"> 
							<input type="hidden" name="orgWriter" value="${commentdto.id}">
							<div class="modal-body">


								<div class="form-group">
									<label for="content">내용 : </label> <input type="text" class="form-control" placeholder="내용을 입력하세요." name="content" required>
									<div class="valid-feedback">입력 완료</div>
									<div class="invalid-feedback">정보를 입력해주세요.</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-info">작성완료</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							</div>

						</form>

					</div>
				</div>
			</div>
			</c:if>

			<c:if test="${commentdto.id eq login.id || authority == '01' || authority == '02'}">


				<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModalupdate${commentdto.num}">수정</button>
				<div class="modal fade" id="myModalupdate${commentdto.num}">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">댓글 수정</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<form action="/event/updateComment" method="post" class="was-validated">

								<input type="hidden" name="id" value="${login.id}">
								<input type="hidden" name="num" value="${commentdto.num}">
								<input type="hidden" name="eno" value="${commentdto.eno}"> 
								<div class="modal-body">

									<div class="form-group">
										<label for="content">내용 : </label> <input type="text" class="form-control" placeholder="내용을 입력하세요." name="content" required>
										<div class="valid-feedback">입력 완료</div>
										<div class="invalid-feedback">정보를 입력해주세요.</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info">수정 완료</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>




				<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModaldelete${commentdto.num}">삭제</button>
				<div class="modal fade" id="myModaldelete${commentdto.num}">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">댓글 삭제</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<form action="/event/deleteComment" method="post" class="was-validated">

								<input type="hidden" name="id" value="${login.id}">
								<input type="hidden" name="num" value="${commentdto.num}">
								<input	type="hidden" name="eno" value="${commentdto.eno}">
								<input type="hidden" name="repIndent" value="${commentdto.repIndent}">
								<input type="hidden" name="repRoot" value="${commentdto.repRoot}">
								<div class="modal-body">정말 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info">예</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
								</div>
							</form>
						</div>
					</div>

				</div>

			</c:if>





			<hr>

		</c:forEach>
	









		

</div>

<%@ include file="../com/footer.jsp"%>

</body>
</html>