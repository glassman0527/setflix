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
	
	 * 상세설명 : mypage화면
	
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

<c:choose>
	<c:when test="${param.code == '1'}"> //현재비번 틀릴때
		<script>
			$(function() {
				$("#nowPw").next().show("slow");
			});
		</script>
	</c:when>
	<c:when test="${param.code == '2'}"> //새비번,새비번확인 null && 값이 틀릴때 
		<script>
			$(function() {
				$("#password").next().show("slow");
			});
		</script>
	</c:when>
</c:choose>
<script>
	$(function() {
		$(document.mypage).submit(
			function(e) {
				e.preventDefault();
				var pw = $("#nowPw").val();
				var newpw = $("#password").val();
				$.ajax({ //데이터 보내기
					type : "POST",
					url : "pwCk",
					data : $.param({
						nowPw : pw,
					}),
					success : function(data) { 
						if (data.trim() == "success") { 
							if (isPasswordValid()
								&& checkPasswordPattern()
								&& arePasswordsMatching()) {
									document.mypage.submit();
								} else {
									$("#password").next().show("slow");
								}
						}
						else if (data.trim() == "fail") { 
							location.href = "mypage?code=1";
						}
					},
					error : function(e) { 
						console.log(e);
					}
				})
			}
		);
	})
</script>
</head>
<body>
	<div class="mypage-wrapper">
		<section>
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
					<label for="nowPw">비밀번호</label> <input id="nowPw" name="nowPw"
						type="password" placeholder="현재 비밀번호" maxlength="12"
						autofocus="autofocus"><span class="pwCk">비밀번호를
						확인하세요.</span>
				</p>
				<p>
					<input id="password" name="password" type="password"
						placeholder="새비밀번호" maxlength="12"> <span class="newpw">문자,
						숫자, 특수문자를 결합한 5~12자리 암호를 권장합니다.</span>
				</p>
				<p>
					<input id="confirm_password" name="confirm_password"
						type="password" placeholder="새비밀번호 확인" maxlength="12"> <span
						class="newpwCk">비밀번호를 확인하세요.</span>
				</p>
				<p>
					<input type="submit" id="submitCk" value="완료"> <input
						type="button" class="resign" value="탈퇴">
				</p>
			</form>
		</section>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>