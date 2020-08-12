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
.tb-head {
    line-height: 30px;
    text-align: center;
}

img{
width: 160px;
height: 100px;;
}

thead {
	border-top: 3px solid rgb(23,6,0);
}

tbody {
	text-align: center;
}

.page-link {
	color: rgb(90,56,37);
}
	
.pagination>li.active>a {
	background-color: rgb(90,56,37) !important;
	border-color: rgb(90,56,37) !important;
}
	
.pagination>li>a{
	color: rgb(51,19,2);
}

.btns{
	background-color: rgb(67,22,7);
	color: white;
}
	
</style>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>


	<div class="container" style="margin: 30px auto 30px auto;">
		
			<h1 style="color: rgb(23,6,0);">Event</h1>
		
		
		<div class="row">
			<table class="table table-hover">
			
				<thead>
					<tr>
					<th></th>
						<th><div class="tb-head" >Content</div></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="event">
						<tr>
							<td><img src="/resources/event/${event.titleImg}" alt="Event" /></td>
							<td><a href="/event/read/${event.eno}?id=${login.id}" style="color: rgb(51,19,2);">${event.title}</a></td>
							<td>${event.writeday}&nbsp;조회: ${event.readcnt}</td>
						</tr>
				</c:forEach>

				</tbody>
			</table>
		</div> <!-- class = row -->
		
		<ul class="pagination justify-content-center">
			<li class="page-item ${to.curPage == 1 ? 'disabled' : '' }"><a class="page-link"
					href="/event/eventlist/${to.curPage>1?to.curPage-1:1}?id=${login.id}">&laquo;</a></li>
			<c:forEach begin="${to.beginPageNum }" end="${to.stopPageNum }" var="page">
				<li class="page-item ${to.curPage == page ? 'active' : '' }"><a class="page-link" href="/event/eventlist/${page}?id=${login.id}">${page}</a></li>
			</c:forEach>
			<li class="page-item ${to.curPage == to.totalPage ? 'disabled' : '' }"><a class="page-link"
					href="/event/eventlist/${to.curPage<to.totalPage?to.curPage+1:to.curPage}?id=${login.id}">&raquo;</a></li>
		</ul>
		
		<nav class="navbar navbar-expand-sm bg-light navbar-dark">
			<form class="form-inline " name='sform' method='get' action='/event/searchlist/1'>
			<input type="hidden" name="id" value="${login.id}">
				<aside>
						<button type="button" class="btn btn-secondary rounded-0" disabled>이벤트 내용</button>
					 <input class="form-control mr-sm-2" type="text" name='search'>
					<button style="background-color: rgb(67,22,7); color: white;" class="btn btns rounded-0" type='submit'>검색</button>
				</aside>
			</form>
		</nav>
		
		
		<c:if test="${authority == '01' || authority == '02'}">
		<a style="position: relative; left: 90%;" href="/event/insert?id=${login.id}" class="btn btns rounded-0">
			<strong>글 쓰기</strong>
		</a>
		</c:if>
		
		
	</div>

<%@ include file="../com/footer.jsp"%>

</body>
</html>