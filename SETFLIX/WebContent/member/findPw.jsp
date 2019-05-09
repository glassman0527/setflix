<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	/* =================================================================
	
	 * 
	
	 * 작성일 : 2019.04.01
	
	 *  
	
	 * 작성자 : 박예빈
	
	 * 
	
	 * 상세설명 : 비밀번호찾기화면
	
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
<title>findPassword page</title>
<link rel="stylesheet" href="css/join.css">
<link rel="stylesheet" href="css/footer.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<c:if test="${param.code=='1'}">
	<script>
		alert("등록된 이메일이 아닙니다.");
		history.go(-1);
	</script>
</c:if>
</head>
<body>
	<div class="findPw-wrapper">
		<section>
			<h2 style="display: none;">비밀번호 찾기</h2>
			<form class="login-form findPw-form" method="post">
				<img src="image/password.png" alt="비밀번호 찾기">
				<p>회원가입하신 이메일을 입력하시면</p>
				<p>임시 비밀번호가 발송됩니다.</p>
				<input id="id" name="id" type="email" placeholder="이메일을 입력하세요."
					autofocus="autofocus" required> <input type="submit"
					value="비밀번호 찾기" id="submit">
			</form>
		</section>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>