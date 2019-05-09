$(function() {
	$("form span").hide();

	// When event happens on password input
	$("#password").keyup(passwordEvent).keyup(confirmPasswordEvent);
	$("#confirm_password").keyup(confirmPasswordEvent);

});

// 비밀번호 길이 Ck OK
function isPasswordValid() {
	return $("#password").val().length > 4 && $("#password").val().length < 13;
}

// 비밀번호 패턴 체크 (비밀번호 길이ck, 문자, 숫자, 특수문자 포함여부 체크)
function checkPasswordPattern() {
	var newPw = $("#password").val();
	var pattern1 = /[0-9]/; // 숫자
	var pattern2 = /[a-zA-Z]/; // 문자
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자

	if (newPw.search(/\s/) == -1) {
		if (pattern1.test(newPw) && pattern2.test(newPw)
				&& pattern3.test(newPw) && isPasswordValid()) {
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

// password Valid
function passwordEvent() {
	var b = isPasswordValid() && checkPasswordPattern();
	$("#password").next().show("slow");
	if (b) {
		$("#password").next().hide("slow");
	}
	$("#submitCk").prop("disabled", !b);
}

// confirm Password
function confirmPasswordEvent() {
	var a = $("#confirm_password").val() == $("#password").val();
	if (a) {
		$("#confirm_password").next().hide("slow");
	} else {
		$("#confirm_password").next().show("slow");
	}
	$("#submitCk").prop("disabled", !a);
}
