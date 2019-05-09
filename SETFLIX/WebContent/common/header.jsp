<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
/**
*=======================================================================
 *작성일 : 2019.03.22
 *작성자 : 정공명, 이호재
 *상세설명 : 메인화면
*=======================================================================
 *수정일        			 작성자          			 내용     
*-----------------------------------------------------------------------
*03.26					 박예빈					#current 수정
*03.27					 박예빈					href 추가
*=======================================================================
*/
%>
<div id="wrapper">
	<header>
		<nav class="gnb">
			<p>
				<a href="main">SETFLIX</a>	
			</p>
			<ul>
				<li><a href="main" class="home">홈</a></li>
				<li><a href="categoryMain" class="">카테고리</a></li>
			</ul>
		</nav>
		<div class="menubar">
			<ul class="menubarIn">
				<li><img  class="sicon2" src="image/icon2.png"  alt="이미지를 불러올수 없습니다."><a href="#" id="current"></a>
					<ul>
						<c:choose>
				            <c:when test="${not empty member.id && member.admin=='1'}">
					            <a class="signin" href="mypage">관리자</a>
				            </c:when>
				            <c:when test="${empty member.actoken}">
									<li><a href="mypage" class="current">${member.name}</a></li>
							</c:when>
							<c:when test="${not empty member.actoken}">
									<li><a href="mypageKakao" class="current">${member.name}</a></li>
							</c:when>
			            </c:choose>
						<li><a href="logout">로그아웃</a></li>
						<li><a href="help">고객센터</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<form action="#" class="sicon" >
			<img src="image/search2.png"  class="sicon1" alt="이미지를 불러올수 없습니다.">
		</form>
		<form method="get" hidden="" class="search1" action="searchmovie">
			<input  class="fun-btn1" type="text" maxlength="10" name="seachmovieBtn">
			<input class="fun-btn" type="submit" value="검색" >
		</form>
	</header>
</div>


