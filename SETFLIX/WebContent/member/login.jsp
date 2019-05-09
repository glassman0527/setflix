<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	/* =================================================================
	
	 * 
	
	 * 작성일 : 2019.03.15
	
	 *  
	
	 * 작성자 : 박예빈
	
	 * 
	
	 * 상세설명 : 로그인화면
	
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
<title>login page</title>
<link rel="stylesheet" href="css/join.css">
<link rel="stylesheet" href="css/footer.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="script/kakao.js"></script>
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
		location.href="emailAuth";
	</script>
</c:if>
</head>
<body>
	<section class="login-wrapper">
			<form class="login-form" method="post">
				<img src="image/logoblack.jpg" alt="로고(검정)">
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
				<a class="find" href="findPw"> 비밀번호 찾기 </a> <a id="custom-login-btn"
					href="javascript:loginWithKakao()"> <img
					class="kakao-login-btn" src="image/kakao.png" alt="카카오로 로그인"></a> <a
					href="login-help">도움이 필요하신가요?</a>
				<p>
					SETFLIX 회원이 아닌가요? &nbsp;<a href="join">지금 가입하세요</a>
				</p>
			</form>
		</section>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>