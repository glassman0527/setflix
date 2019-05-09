<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="movie">
	<div class="wrap">
		<c:if test="${!empty searchM}">
			<h1>검색 결과</h1>
			<div class="bodywrappe" style="">
				<c:forEach items="${searchM}" var="row" varStatus="stat">
					<c:if test="${stat.index % 5 == 0}">
						<c:out value="<section class='imgsection'>" escapeXml="false"/>
					</c:if>
						<a href="view?boardno=${row.boardno}" class="imgA">
							<img class="lazy" src="${row.thumbnail}" />
							<span class="title1">
								<c:out value="<h3 class='titleF1'>" escapeXml="false"/>
									${row.title}
								<c:out value="</h3>" escapeXml="false"/>	
							</span>
						</a>
					<c:if test="${stat.index % 5 == 4 || stat.last }">
						<c:out value="</section>" escapeXml="false"/>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty searchM}">
			<h1>검색 결과 없음</h1>
		</c:if>
	</div>
</nav>
