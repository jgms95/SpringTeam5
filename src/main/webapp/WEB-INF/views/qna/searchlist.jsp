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
	.categories {
		text-align: center;
		font-size: 28px;
		color: black;
		line-height: 1;
		font-weight: 400;
	}
	.categories ul li {
		display: inline-block;
		margin: 0px 5px;
	}
	.categories ul li a {
		display: block;
		font-size: 13px;
		color: rgb(85,85,85);
		padding: 0px 20px;
		height: 38px;
		line-height: 38px;
		border: 1px solid rgb(229,229,229);
	}
	.categories ul li a:hover {
		border-color: rgb(17,17,17);
	}
	
	.th-center{
		text-align: center;
	}
	
	.table_head{
		background-color: rgb(254,247,243);
	}
	
	td{
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
	
	.searchbutton{
	background-color: rgb(90,56,37);
	color: white;
	}
	
	.current{
	background-color: rgb(23,6,0);
	color: white !important;
	}
	
	
	
	
</style>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">
		
		 <h1 style="color: rgb(23,6,0);" class="far fa-comments" >Q&amp;A</h1>
		<p>
			Q&amp;A 게시판입니다. 궁금하신 사항은 '<strong>판매도서</strong>' 상세보기에서 '<strong>질문하기</strong>'로 문의해주세요.
		</p>
		
		<div class="categories">
			<ul>
				<li><a ${category=='book'?'class="current"':''} href="/qna/searchlist/1?ino=${ino==null?'all':ino}&category=book&search=${search}&find=${find}">도서문의</a></li>
				<li><a ${category=='money'?'class="current"':''} href="/qna/searchlist/1?ino=${ino==null?'all':ino}&category=money&search=${search}&find=${find}">입금/결제문의</a></li>
				<li><a ${category=='modify'?'class="current"':''} href="/qna/searchlist/1?ino=${ino==null?'all':ino}&category=modify&search=${search}&find=${find}">변경/취소</a></li>	
				<li><a ${category=='order'?'class="current"':''} href="/qna/searchlist/1?ino=${ino==null?'all':ino}&category=order&search=${search}&find=${find}">배송문의</a></li>
			</ul>
		</div>
		
		<div class="row">
			<table class="table table-hover">
				<thead class="table_head ">
					<tr>
						<th class="th-center">글번호</th>
						<th class="th-center">책</th>
						<th class="th-center">책이름</th>
						<th class="th-center" style="width: 50%">글제목</th>
						<th class="th-center">작성자</th>
						<th class="th-center">작성일</th>
						<th class="th-center">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="qna">
						<tr>
							<td>${qna.qno}</td>
							<td><img style="width: 40px; height: 75px; " src="/resources/img/${qna.filename}" alt="Book" /></td>
							<td>${qna.ititle}</td>
							<td>
							<c:choose>
							<c:when test="${qna.repStep > 0}">
							<c:forEach begin="1" end="${qna.repIndent}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<a href="/qna/read/${qna.qno}?id=${login.id}&ino=${ino==null?'all':ino}" style="color: rgb(51,19,2);">
							Re: <strong>${qna.title}</strong>
							</a>
							</c:when>
							<c:otherwise>
							<a href="/qna/read/${qna.qno}?id=${login.id}&ino=${ino==null?'all':ino}" style="color: rgb(51,19,2);" style="color: rgb(51,19,2);"> <strong>${qna.title}</strong></a>
							</c:otherwise>
							</c:choose>
							</td>
							<td>${qna.id}</td>
							<td>${qna.regdate}</td>
							<td>${qna.readcnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> <!-- class = row -->
		
		
		<ul class="pagination justify-content-center">
			<li class="page-item ${to.curPage == 1 ? 'disabled' : '' }"><a class="page-link"
					href="/qna/searchlist/${to.curPage>1?to.curPage-1:1}?ino=${ino==null?'all':ino}&category=${category}&search=${search}&find=${find}">&laquo;</a></li>
			<c:forEach begin="${to.beginPageNum }" end="${to.stopPageNum }" var="page">
				<li class="page-item ${to.curPage == page ? 'active' : '' }"><a class="page-link" href="/qna/searchlist/${page}?ino=${ino==null?'all':ino}&category=${category}&search=${search}&find=${find}">${page}</a></li>
			</c:forEach>
			<li class="page-item ${to.curPage == to.totalPage ? 'disabled' : '' }"><a class="page-link"
					href="/qna/searchlist/${to.curPage<to.totalPage?to.curPage+1:to.curPage}?ino=${ino==null?'all':ino}&category=${category}&search=${search}&find=${find}">&raquo;</a></li>
		</ul>
	
		<br>
	<nav class="navbar navbar-expand-sm bg-light">
			<form class="form-inline " name='sform' method='get' action='/qna/searchlist/1'>
				<aside>
					<select class="searchbutton btn btn-sm rounded-0" name='find'>
						<option value='title'>글제목</option>
						<option value='ititle'>책이름</option>
						<option value='id'>작성자</option>
					</select> <input class="form-control mr-sm-2" type="text" name='search'>
					 <input name="ino" class="form-control" value="${ino==null?'all':ino}" type="hidden">
					<button class="searchbutton btn btn-sm rounded-0" type='submit'>검색</button>
				</aside>

			</form>

		</nav>

		<a style="position: relative; left: 90%;" href="/qna/insert?id=${login.id}&ino=${ino==null?'all':ino}" class="btn btn-info rounded-0">
			<strong>글 쓰기</strong>
		</a>
		
		
	</div> <!-- class = container -->
	





<%@ include file="../com/footer.jsp"%>

</body>
</html>