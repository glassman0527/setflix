<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<div id="replys">
		<form name="rfrm" method="post">
			<input type="hidden" name="userno" value="${member.userNo}">
			<input type="hidden" name="boardno" value="${param.boardno}">
			<input type="hidden" name="rlevel" value="${param.rlevel}">
			<input type="hidden" name="preply" value="${param.preply}">
			<input type="hidden" name="rgroup" value="${param.rgroup}">
			<input type="hidden" name="rdepth" value="${param.rdepth}">
			<h2>${member.name}</h2>
			<textarea name="reply" ></textarea>
			<button type="button">댓글</button>
		</form>
		<hr>
	</div>
