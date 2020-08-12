<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<style type="text/css">
<style>
    .left,
    .right {
        top: 50%;
        float: right;
        transform: translateY(125%);
    }

    .left {
    	margin-top:50px;
    	position:fixed;
    	right:0px;
    	
        background: black;
        display: inline-block;
        white-space: nowrap;
        width: 50px;
        transition: width .5s;
    }

    .right {
        background: blue;
        width: 350px;
        transition: width 1s;
        border-style: solid;
        border-color: #ccc;
        border-width: 1px;
    }

    .left:hover {
        width: 250px;
    }

    .item:hover {
        background-color: gray;
        color: black;
        
    }

    .left .fas {
        
        margin: 15px;
        width: 20px;
        color: #fff;
    }
    .left .item:hover {
    	
      
        color: black;
    }

    i.fas {
        font-size: 17px;
        vertical-align: middle !important;
    }

    .item {
        height: 50px;
        overflow: hidden;
        color: #fff;
    }

</style>


<title>Insert title here</title>
</head>

<div style="margin-top: -40px">
<c:if test="${login.id!=null }">
<div class="left" style="float: right;">
    <div class="item">
         <a style="font-size: 25px;margin-left:50px; font-weight: bold;">스프링 북</a>
    </div>
        <div class="item">

        <i class="fas fa-fw fa-user-circle"></i> </i><a class="y" href="/member/memberInfo?id=${login.id }" style="color: white; font: bold;"> 내정보</a>
    </div>
    <div class="item active">
        <i class="fas fa fa-lightbulb-o"></i><a class="y" href="/event/eventlist/1?id=${login.id}" style="color: white; font: bold;"> 이벤트</a>
        <span class="badge badge-pill badge-danger">2</span>
    </div>
    <div class="item">
        <i class="fas fa fa-shopping-cart"></i> </i><a class="y" href="/pickup/pickupList/${login.id}" style="color: white; font: bold;"> 장바구니</a>
        <span class="badge badge-pill badge-danger">${cart }</span>
    </div>
    <div class="item">
        <i class="fas fa-fw fa-th"></i> </i><a class="y" href="" style="color: white; font: bold;"> Map</a>
    </div>

    <div class="item">
        
    </div>
    <div class="item">

    </div>
    <div class="item">
    
    </div>
    <div class="item">
    <i class="fas fa fa-phone"></i> <a class="y" href="" style="color: white; font: bold;"> 고객센터</a>
    </div>
    <div class="item">
     <i class="fas fa fa-power-off"></i> </i><a class="y" href="/member/logout" style="color: white; font: bold;"> 로그아웃</a>
    </div>
</div>
</c:if>


<nav class="navbar navbar-expand-sm text-white navbar-dark" style="background-color : rgb(23,6,0)">
	<a class="navbar-brand" href="/"><img src="/resources/img/book.jpg" alt="Logo" style="width:40px; height: 40px;"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<c:if test="${null ne login.id }">
				<li class="nav-item active"><a class="nav-link" href="/member/logout">로그아웃</a></li>
				<li class="nav-item active"><a class="nav-link" href="/member/memberInfo?id=${login.id }">회원정보</a></li>
			</c:if>
			<c:if test="${null eq login.id }">
				<li class="nav-item active"><a class="nav-link" href="/member/login">로그인</a></li>
				<li class="nav-item active"><a class="nav-link" href="/member/insert">회원가입</a></li>
			</c:if>
			<li class="nav-item active"><a class="nav-link" href="/booksale/list?id=${login.id}">판매 도서</a></li>
			<li class="nav-item active"><a class="nav-link" href="/notice/noticelist/1?id=${login.id}">공지사항</a></li>
			<li class="nav-item active"><a class="nav-link" href="/qna/allqnalist/1">Q&amp;A</a></li>
			<li class="nav-item active"><a class="nav-link" href="/event/eventlist/1?id=${login.id}">이벤트</a></li>
			<c:if test="${null ne login.id }">
            <li class="nav-item active"><a class="nav-link" href="/pickup/pickupList/${login.id}">장바구니</a></li>
            <span class="badge badge-danger">${cart }</span>
         	</c:if>
		</ul>
	</div>
	
</nav>
</div>