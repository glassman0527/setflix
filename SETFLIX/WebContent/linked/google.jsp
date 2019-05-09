<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- =================================================================
작성일 : 2019.03.22
작성자 : 박예빈
상세설명 : 구글 OOS
=================================================================
수정일         작성자             내용     
-----------------------------------------------------------------
================================================================= -->
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Login Demo - Kakao JavaScript SDK</title>
<meta name="google-signin-client_id"
	content="924651610485-8d6bg1p861sod4ql4i9dimdn82chtlqb.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
			console.log("ID: " + profile.getId()); // Don't send this directly to your server!
			console.log('Full Name: ' + profile.getName());
			console.log('Given Name: ' + profile.getGivenName());
			console.log('Family Name: ' + profile.getFamilyName());
			console.log("Image URL: " + profile.getImageUrl());
			console.log("Email: " + profile.getEmail());
			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);
		};
</script>
</head>
<body>
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
</body>
</html>

