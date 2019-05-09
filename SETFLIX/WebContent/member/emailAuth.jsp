<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	/* =================================================================
	
	 * 
	
	 * 작성일 : 2019.03.15
	
	 *  
	
	 * 작성자 : 박예빈
	
	 * 
	
	 * 상세설명 : 이메일 인증 완료 로그인화면
	
	 *   
	
	 * =================================================================
	
	 * 수정일         작성자             내용     
	
	 * -----------------------------------------------------------------------
	
	 * 
	
	 * =================================================================
	
	 */
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>emailAuth login page</title>

<link rel="stylesheet" href="css/join.css">
<link rel="stylesheet" href="css/footer.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
		$(function() {
			$(".login-form span").hide();
		});
	</script>
<c:if test="${param.code=='1'}">
	<script>
		$(function() {
			$(".login-form span").show("slow");
		});
	</script>
</c:if>
<c:if test="${param.code=='2'}">
	<script>
		alert("이메일인증을 완료해주세요.");
		history.go(-1);
	</script>
</c:if>
</head>
<body>
	<div class="login-wrapper">
		<section>
			<h2 style="display: none;">이메일 인증</h2>
			<form class="login-form emailAuth-form" method="post" action="login">
				<img src="image/logoblack.jpg" alt="로고(검정)">
				<p>이메일인증이 완료되었습니다.</p>
				<p>
					<label for="email">이메일</label> <input id="email" name="id"
						type="email" placeholder="이메일을 입력하세요." autofocus="autofocus">
				</p>
				<p>
					<label for="inpw">비밀번호</label> <input id="inpw" name="pw"
						type="password" placeholder="비밀번호를 입력하세요." required> <span>아이디
						또는 비밀번호를 확인하세요.</span>
				</p>
				<p>
					<input type="submit" value="로그인" id="submit">
				</p>
				<a class="find" href="findPw"> 비밀번호 찾기 </a>
			</form>
		</section>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>