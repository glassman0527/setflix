<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset=UTF-8>
<title>INDEX</title>
<link rel="stylesheet" href="css/index.css">
<%
	/* ======================================================================
	
	 * 
	
	 * 작성일 : 2019.03.22
	
	 *  
	
	 * 작성자 : 정공명,이호재
	
	 * 
	
	 * 상세설명 : 비회원메인화면
	
	 *   
	
	 * ======================================================================
	
	 * 수정일        			 작성자          		  내용     
	
	 * -----------------------------------------------------------------------
		03.24					박예빈				header taglib 추가
	 *  03.26					박예빈				header taglib 삭제
	
	 * ======================================================================
	
	 */
%>
</head>
<body>
    <header>
        <nav>
            <a class="logo" href="login">SETFLIX</a>
            <a class="signin" href="login">로그인</a>
        </nav>

        <section class="pitch">
            <h1 class="pitch_title">언제 어디서나 자유롭게</h1>
            <p class="pitch_subtitle">생활 속 어디서나</p>
            <button class="btn" onclick="location.href='login'">즐기러 가기</button>
        </section>
    </header>
    <div id="features">
        <article>
        	<h2 style="display: none">셋플릭스에 오신걸 환영합니다</h2>
            <section id="cancelanytime" class="is-selected size-70 center" data-id="cancelanytime">
            	<h3 style="display: none">1234</h3>
                <div class="columns">
                    <div class="column">
                        <h2>
                            TV, PHONE, PC 어떤 플랫폼으로 즐길 수 있습니다.
                        </h2>
                        <button class="btn btn-large" onclick="location.href='join'">가입하러가기</button>
                    </div>

                    <div class="column">
                        <img src="https://lh3.googleusercontent.com/sw_r8IKrEualA9M_IslyTFaGata6gZ5koDkCNoBygt-h46X3-7Fg5Xon0uZZVQwAb-V-nWh5nua2fcEDXQ2SlbB2tskXNQ-PHK9Ih8UItbLsj7DkCOgsQEKdD3njeU1LefLzzQxEuId0qPgVlJ_BeuMAAkX2U4Exl0_OmfET1CzKava7HS0BIf93ybpp6Jq0DfoYm-QLnXfmzMauhF9QcXzRD2G4VCVQOkDGEzgGG9Y8q07E3Pyj7hnqbomTrMVFJP8kIc7BQqDIvSr6ktSL3aHnQcbGgengDquKeabFYiW-il6xhX8IodZJzdFkvBSA5evlzqretmIonY1BRr0vgYIZXvS4VS8Vj0STchrM404uvD3kqb_ooVI7CzDBwJGhGKPx9LlJD70b4bfB5PTaf1r2AWrQ0wTL3dAam6Asec4PTjaSGnO0lG7Hw0KT8Hv9TLpBA7qi2OXU1U6bMBbh1o8eG9-_V4gMhHMDbLYdPL9MqL4fTeE5_S5sG5xbb5jTr8Vk7v4aCvkbhoVBhXByggOR69kjnqes6VuApApKCqoRQ-L7MHDgatuQaGefvIEJo4CY7EUNUl8k4vD4adJchwmLx_P6vOI9oSga9G8=w488-h312-no" alt="배경이미지">
                    </div>
                </div>
            </section>
        </article>
    </div>

<jsp:include page ="common/footer.jsp"/>   
</body>
</html>