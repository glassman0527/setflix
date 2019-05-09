<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset=UTF-8>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen" href="css/header.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/searchmovie.css">
<link rel="stylesheet" href="css/footer.css">
<title>SearchMovie</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(function() {
	$(".sicon1").click(function() {		
			$(".sicon").hide();
			$(".search1").show();
	})	
});
</script>
</head>
<body>
<jsp:include page ="header.jsp"/>  
<video src="video/MainVideo.mp4" autoplay="autoplay"  muted="muted" width= "500px" id="bg" loop="loop" height="500px"></video> 
<jsp:include page ="searchresult.jsp"/> 
<jsp:include page ="footer.jsp"/>  
</body>
</html>