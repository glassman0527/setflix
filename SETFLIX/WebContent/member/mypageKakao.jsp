<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	/* =================================================================
	
	 * 
	
	 * 작성일 : 2019.03.25
	
	 *  
	
	 * 작성자 : 박예빈
	
	 * 
	
	 * 상세설명 : 카카오로그인mypage화면
	
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

<title>mypage</title>
<link rel="stylesheet" href="css/join.css">
<link rel="stylesheet" href="css/footer.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="script/member.js"></script>

</head>
<body>
	<section class="mypage-wrapper">
			<form name="mypage" method="post">
				<div class="join">내 정보</div>
				<p>
					<label for="username">이메일</label> <input id="username" name="id"
						type="email" placeholder="${member.id}" readonly="readonly">
				</p>
				<p>
					<label for="name">닉네임</label> <input id="name" name="name"
						type="text" placeholder="${member.name}" readonly="readonly">
				</p>

				<p>
					<input type="button" class="resign" value="탈퇴">
				</p>
			</form>
		</section>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>