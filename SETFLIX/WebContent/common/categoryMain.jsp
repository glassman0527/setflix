<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset=UTF-8>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen" href="css/header.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/categorymovie.css">
<link rel="stylesheet" href="css/footer.css">
<title>MAIN</title>
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
<jsp:include page ="categorymovie.jsp"/>  
<jsp:include page ="footer.jsp"/>  
</body>
</html>