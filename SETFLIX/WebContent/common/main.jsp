<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset=UTF-8>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/header.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/movie.css">
<link rel="stylesheet" href="css/footer.css">
<title>MAIN</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(function() {
	$(".sicon1").click(function() {		
			$(".sicon").hide();
			$(".search1").show();
	})	
});
	
	$(function() {
		$('.heart').click(function() {
			var boardno = 2403;
			var heart = $(this).data("opt") == 'fill';
			$.ajax({
				url : "pick",
				type : 'GET',
				data : {
					"boardno" : boardno,
					"heart" : heart
				},
				dataType : "text",
				success : function(data) {
					if (heart) {
						$(".heart").removeAttr("data-opt")
						$(".heart a").text('즐겨찾기');
					} else {
						$(".heart").data("opt", "fill")
						$(".heart a").text('추가완료');
					}
				},
				error : function() {
					alert("다시 시도해주세요.")
				}
			});
			
			
			return false;
		})
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- <iframe width="1900" height="400" src="https://www.youtube.com/embed/ObILg1vmjl0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
	<video src="video/MainVideo.mp4" autoplay="autoplay" muted="muted"
		width="500" id="bg" loop="loop" height="500"></video>
	<img class="logo" src="image/avengersEndgameLogo.png" alt="어벤져스 로고">
	<pre>   
         인피니티 워 이후 절반만 살아남은 지구
	 마지막 희망이 된 어벤져스
	 먼저 떠난 그들을 위해 모든 것을 걸었다!

 
	 위대한 어벤져스
	 운명을 바꿀 최후의 전쟁이 펼쳐진다!
</pre>
	<span class="col-md-3 col-sm-3 col-xs-6"> <a
		href="view?boardno=2403" class="btn btn-sm animated-button sandy-one">재생하기</a></span>

	<c:choose>
		<c:when test="${heartCk != 'TRUE'}">
			<span class="heart col-md-3 col-sm-3 col-xs-6 "> <a href=""
				class="btn btn-sm animated-button sandy-two">즐겨찾기</a></span>
		</c:when>
		<c:when test="${heartCk == 'TRUE'}">
			<span class="heart col-md-3 col-sm-3 col-xs-6 " data-opt='fill'>
				<a href="" class="btn btn-sm animated-button sandy-two">추가완료</a>
			</span>
		</c:when>
	</c:choose>

	<jsp:include page="movie.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>