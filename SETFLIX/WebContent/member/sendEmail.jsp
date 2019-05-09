<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	/* =================================================================
	 * 
	
	 * 작성일 : 2019.04.01
	
	 *  
	
	 * 작성자 : 박예빈
	
	 * 
	
	 * 상세설명 : 이메일 인증안내화면
	
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
<title>eamilAuth page</title>
<link rel="stylesheet" href="css/join.css">
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
	<div class="emailAuth-wrapper">
		<section>
			<table class="emailAuth-table">
				<tr>
					<th colspan="2"><img src="image/email.png" alt="이메일"></th>
				</tr>
				<tr>
					<td colspan="2">입력하신 이메일로 인증메일을 발송하였습니다.</td>
				</tr>
				<tr>
					<td colspan="2">이메일 인증완료 후 이용해주세요.</td>
				</tr>
				<tr>
					<td><button type="button" onclick="window.location.reload()">이메일 재발송</button></td>
					<td><a href="login"><button type="button">로그인하기</button></a></td>
				</tr>
			</table>
		</section>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>