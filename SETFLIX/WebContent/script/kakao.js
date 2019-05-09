//<![CDATA[
Kakao.init('b660f39743c05b008e24c9f63b2eea9f'); // 사용할 앱의 JavaScript 키
// 카카오 로그인 버튼을 생성합니다.
function loginWithKakao() {
	Kakao.Auth.login({
		success : function(authObj) { // 성공
			Kakao.API.request({
				url : '/v1/user/me',

				success : function(res) { // Kakao.API.request 성공

					nickname = res.properties.nickname;
					authObj = $.extend(authObj, res, {
						nickname : nickname
					});
					$.ajax({
						type : "POST",
						url : "kakao",
						data : $.param(authObj),

						success : function(data) { // 접속성공,

							if (data.trim() == "success") { // DAO 성공
								location.href = "main";

							}

							else if (data.trim() == "fail") {// DAO 실패
								location.href = "login";

							}

						},
						error : function(e) { // 접속실패
							console.log(e);
						}
					});

				},

				fail : function(error) { // 실패
					console.log(error);
				}
			});
		},

		fail : function(err) {
			console.log(err);
		}
	});
};
// ]]>

