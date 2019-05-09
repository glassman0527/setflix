<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<nav class="movie">	
	<div class="wrap mypick">
		<c:if test="${not empty pickmovie}">
			<c:set var="len" value="${pickmovie}" />  
			<fmt:parseNumber var="lastTmp" value="${((fn:length(len)-1)/5)}" integerOnly="true"/>
			<c:set var="last" value="${(lastTmp+1)*5-1}" />
			<h1>내가 찜한 목록</h1>
			<div class="bodywrappe">
				<c:forEach varStatus="stat2" begin="0" end="${last}">
					<c:if test="${stat2.index % 5 == 0 }">
						<c:out value="<section class='imgsection'>" escapeXml="false"/>
					</c:if>
					<c:if test="${not empty len[stat2.index]}">
					<a href="view?boardno=${len[stat2.index].boardno}" class="imgA">
						<img class="lazy" src="${len[stat2.index].thumbnail}"/>
						<span class="title">
							<c:out value="<h3 class='titleF'>" escapeXml="false"/>
								${len[stat2.index].title}
							<c:out value="</h3>" escapeXml="false"/>
						</span>
					</a>
					</c:if>
					
					<c:if test="${empty len[stat2.index]}">					
						<img class="lazy" src="image/back.png"/>
					</c:if>
					
					<c:if test="${stat2.index % 5 == 4}">
						<c:out value="</section>" escapeXml="false"/>
					</c:if>
				</c:forEach> 
			</div> 
		</c:if>
	</div>

	<div class="wrap">
		<c:forEach items="${genreList}" var="row1" varStatus="stat" begin="1" end="3"> 
			<c:set var="len" value="${result[stat.index]}" />  
			<fmt:parseNumber var="lastTmp" value="${((fn:length(len)-1)/5)}" integerOnly="true"/>
			<c:set var="last" value="${(lastTmp+1)*5-1}" />
			<h1>${row1}</h1>
			<div class="bodywrappe">
				<c:forEach varStatus="stat2" begin="0" end="${last}">
					<c:if test="${stat2.index % 5 == 0 }">
						<c:out value="<section class='imgsection'>" escapeXml="false"/>
					</c:if>

					<c:if test="${not empty len[stat2.index]}">
					<a href="view?boardno=${len[stat2.index].boardno}" class="imgA">
						<img class="lazy" src="${len[stat2.index].thumbnail}"/>
						<span class="title">
							<c:out value="<h3 class='titleF'>" escapeXml="false"/>
								${len[stat2.index].title}
							<c:out value="</h3>" escapeXml="false"/>
						</span>
					</a>
					</c:if>
					
					<c:if test="${empty len[stat2.index]}">					
						<img class="lazy" src="image/back.png"/>
					</c:if>
					
					<c:if test="${stat2.index % 5 == 4}">
						<c:out value="</section>" escapeXml="false"/>
					</c:if>
				</c:forEach> 
			</div>
		</c:forEach>
	</div>

</nav>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$('.bodywrappe').bxSlider({
		/* mode : "fade", */
		speed : 1000,
		slideWidth: 1800,
		touchEnabled : false
	});
</script>
</body>
</html>