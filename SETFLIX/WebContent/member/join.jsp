<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	/* =================================================================
	
	 * 
	
	 * 작성일 : 2019.03.22
	
	 *  
	
	 * 작성자 : 박예빈
	
	 * 
	
	 * 상세설명 : 회원가입화면
	
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
<title>join page</title>
<link rel="stylesheet" href="css/join.css">
<link rel="stylesheet" href="css/footer.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="script/join.js"></script>
<c:choose>
	<c:when test="${param.code == '0'}">
		<script>
			alert("입력값을 확인해보세요.");
			history.go(-1);
		</script>
	</c:when>
	<c:when test="${param.code == '2'}">
		<script>
			alert("비밀번호를 입력하세요.");
			history.go(-1);
		</script>
	</c:when>
	<c:when test="${param.code == '3'}">
		<script>
			alert("중복된 이메일입니다.");
			history.go(-1);
		</script>
	</c:when>
</c:choose>
</head>
<body>
	<section class="join-wrapper">
			<form method="post" action="join">
				<div class="join">회원가입</div>
				<p>
					<label for="username">이메일</label> <input id="username" name="id"
						type="email" placeholder="이메일을 입력하세요."
						autofocus="autofocus"> <span>이미 가입된 이메일입니다.</span>
				</p>
				<p>
					<label for="name">닉네임</label> <input id="name" name="name"
						type="text" placeholder="닉네임 입력하세요.">
				</p>
				<p>
					<label for="password">비밀번호</label> <input id="password"
						name="password" type="password" placeholder="비밀번호를 입력하세요." maxlength="12">
					<span>문자, 숫자, 특수문자를 결합한 5~12자리 암호를 권장합니다.</span>
				</p>
				<p>
					<label for="confirm_password">비밀번호 확인</label> <input
						id="confirm_password" name="confirm_password" type="password"
						placeholder="비밀번호를 확인하세요." maxlength="12"> <span class="newpwCk">비밀번호를
						확인하세요.</span>
				</p>
				<p>
					<input type="submit" id="submitCk" value="회원가입">
				</p>
			</form>
		</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>