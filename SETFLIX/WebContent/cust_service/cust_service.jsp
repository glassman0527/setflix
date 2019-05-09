<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<title>고객센터</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/cust_service.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="script/cust_service(1).js"></script>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
</head>
<body>
	<header>
		<nav id="gnb">
			<a href="main">SETFLIX</a>
			<ul>
				<li><a href="main" class="home">홈</a></li>
				<li><a href="categoryMain" class="">카테고리</a></li>
			</ul>
		</nav>
		<div class="menubar">
			<ul class="menubarIn">
				<li><img src="image/icon2.png" alt="아이콘"><a href="#" id="current"></a>
					<ul>
						<c:choose>
							<c:when test="${not empty member.id && member.admin=='1'}">
								<a class="signin" href="mypage">관리자</a>
								<li><a href="logout">로그아웃</a></li>
								<li><a href="help">고객센터</a></li>
							</c:when>
							<c:when test="${empty member.actoken}">
								<li><a href="mypage" class="current">${member.name}</a></li>
								<li><a href="logout">로그아웃</a></li>
								<li><a href="help">고객센터</a></li>
							</c:when>
							<c:when test="${not empty member.actoken}">
								<li><a href="login">로그인</a></li>
								<li><a href="help">고객센터</a></li>
							</c:when>
						</c:choose>
					</ul>
				</li>
			</ul>
		</div>
		<form action="get" class="sicon">
			<img src="image/search2.png" alt="검색" class="sicon1" onclick="search()">
		</form>
		<form method="get" hidden="" class="search1" action="searchmovie">
			<input class="fun-btn1" type="text" maxlength="10" name="seachmovieBtn"> <input class="fun-btn" type="submit" value="검색">
		</form>
	</header>
	<div id="container">
		<h3 style="clear: both;">공지사항</h3>
		<hr/>
		<div id="accordion">
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">3월 4주 새로 올라온 작품
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>이번 주에도 SETFLIX와 함께 하실 수 있도록 새로운 작품을 준비했어요.</p>
					<p>어떤 작품들이 추가되었는지 확인해보세요. 두근두근!</p>
					<br/>
					<strong>20세기 폭스 런칭!</strong>
					<p>&lt;그랜드 부다페스트 호텔&gt;, &lt;타이타닉&gt;, &lt;라이프 오브 파이&gt;, &lt;가위손&gt;, &lt;킹스맨 : 시크릿 에이전트&gt;, &lt;스토커&gt;, &lt;안녕,헤이즐&gt;, &lt;메이즈 러너&gt;, &lt;500일의 썸머&gt;, &lt;블랙</p>
					<p>스완&gt;, &lt;물랑 루즈&gt;, &lt;내겐 너무 가벼운 그녀&gt;, &lt;월터의 상상은 현실이 된다&gt;, &lt;엑스맨 탄생:울버린&gt;, &lt;엑스맨:퍼스트 클래스&gt;, &lt;더 울버린&gt;, &lt;엑스맨:데이즈 오브 퓨처</p>
					<p>패스트&gt;, &lt;28일 후&gt;, &lt;28주 후&gt;, &lt;혹성 탈출&gt;, &lt;혹성탈출:진화의 시작&gt;, &lt;혹성탈출:반격의 서막&gt;, &lt;아이, 로봇&gt;, &lt;투모로우&gt;, &lt;미스 리틀 선샤인&gt;, &lt;와일드&gt;, &lt;나니아 연</p>
					<p>대기:새벽 출정호의 항해&gt;, &lt;127시간&gt;, &lt;아담&gt;, &lt;25살의 키스&gt;</p>
					<p>*20세기 폭스의 명작 영화들이 계속해서 업데이트 예정입니다.</p>
					<br/>
					<strong>이번 주 주목할 만한 신작</strong>
					<p>생방송 원테이크로 담아낸 일본 코믹 좀비 영화, B급 저예산 영화로 입소문 제대로 탄 의외의 띵작 &lt;카메라를 멈추면 안 돼!&gt;</p>
					<p>맥컬리 컬킨과 안나 클럼스키가 아역으로 열연한 성장 영화의 정석! 울다가 웃다가 눈물콧물 쏙 빼는 &lt;마이 걸&gt;</p>
					<p>연애하고 싶어지는 달콤한 대만 로맨스 &lt;박통박통아애니&gt;, &lt;요리 고교생&gt;</p>
					<p>카툰 네트워크 최고 인기작 추가 시즌 도착 &lt;핀과 제이크의 어드벤처 타임 시즌 4-7&gt;</p>
					<p>총 영화 46편, TV시리즈 10편 (에피소드 361개)</p>
					<br/>
					<strong>최근 한 달간 새로 올라온 작품</strong>
					<p>&lt;레지던트 이블&gt;, &lt;라이프&gt;, &lt;한나&gt;, &lt;파괴지왕&gt;, &lt;커뮤니티&gt;, &lt;허스토리&gt;, &lt;하나 그리고 둘&gt;, &lt;트루먼 쇼&gt;, &lt;스쿨 오브 락&gt;, &lt;라이언 일병 구하기&gt;, &lt;주몽&gt;, &lt;기황후&gt;, &lt;</p>
					<p>캐치 미 이프 유 캔&gt;, &lt;터미널&gt;, &lt;포레스트 검프&gt;, &lt;드림걸즈&gt;, &lt;트랜스포머&gt;, &lt;스타트렉: 더 비기닝&gt;, &lt;스타트렉 다크니스&gt;, &lt;유주얼 서스펙트&gt;, &lt;셔터 아일랜드&gt;, &lt;퀸카</p>
					<p>로 살아남는 법&gt;, &lt;대부&gt;, &lt;노인을 위한 나라는 없다&gt;, &lt;아메리칸 뷰티&gt;, &lt;10일 안에 남자 친구에게 차이는 법&gt;, &lt;연을 쫓는 아이&gt;, &lt;루킹&gt;, &lt;청설&gt;, &lt;빅 리틀 라이즈&gt;, &lt;나</p>
					<p>를 차버린 스파이&gt;, &lt;마이 리틀 텔레비전&gt;, &lt;나는 가수다&gt;등</p>
					<p>총 영화 218편, TV시리즈 108편 (에피소드 3,033개)</p>
					<br/>
					<p>여러분이 좋아할 만한 작품, 매주 열심히 찾고 있어요.</p>
					<p>더 좋은 신작으로 찾아 올게요 :)</p>
					<br/>
					<p>SETFLIX 팀 드림</p>
				</div>
			</div>  
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">3월 3주 새로 올라온 작품
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>이번 주에도 SETFLIX와 함께 하실 수 있도록 새로운 작품을 준비했어요.</p>
					<p>어떤 작품들이 추가되었는지 확인해보세요. 두근두근!</p>
					<br/>
					<strong>20세기 폭스 런칭!</strong>
					<p>&lt;그랜드 부다페스트 호텔&gt;, &lt;타이타닉&gt;, &lt;라이프 오브 파이&gt;, &lt;가위손&gt;, &lt;킹스맨 : 시크릿 에이전트&gt;, &lt;스토커&gt;, &lt;안녕,헤이즐&gt;, &lt;메이즈 러너&gt;, &lt;500일의 썸머&gt;, &lt;블랙</p>
					<p>스완&gt;, &lt;물랑 루즈&gt;, &lt;내겐 너무 가벼운 그녀&gt;, &lt;월터의 상상은 현실이 된다&gt;, &lt;엑스맨 탄생:울버린&gt;, &lt;엑스맨:퍼스트 클래스&gt;, &lt;더 울버린&gt;, &lt;엑스맨:데이즈 오브 퓨처</p>
					<p>패스트&gt;, &lt;28일 후&gt;, &lt;28주 후&gt;, &lt;혹성 탈출&gt;, &lt;혹성탈출:진화의 시작&gt;, &lt;혹성탈출:반격의 서막&gt;, &lt;아이, 로봇&gt;, &lt;투모로우&gt;, &lt;미스 리틀 선샤인&gt;, &lt;와일드&gt;, &lt;나니아 연</p>
					<p>대기:새벽 출정호의 항해&gt;, &lt;127시간&gt;, &lt;아담&gt;, &lt;25살의 키스&gt;</p>
					<p>*20세기 폭스의 명작 영화들이 계속해서 업데이트 예정입니다.</p>
					<br/>
					<strong>이번 주 주목할 만한 신작</strong>
					<p>생방송 원테이크로 담아낸 일본 코믹 좀비 영화, B급 저예산 영화로 입소문 제대로 탄 의외의 띵작 &lt;카메라를 멈추면 안 돼!&gt;</p>
					<p>맥컬리 컬킨과 안나 클럼스키가 아역으로 열연한 성장 영화의 정석! 울다가 웃다가 눈물콧물 쏙 빼는 &lt;마이 걸&gt;</p>
					<p>연애하고 싶어지는 달콤한 대만 로맨스 &lt;박통박통아애니&gt;, &lt;요리 고교생&gt;</p>
					<p>카툰 네트워크 최고 인기작 추가 시즌 도착 &lt;핀과 제이크의 어드벤처 타임 시즌 4-7&gt;</p>
					<p>총 영화 46편, TV시리즈 10편 (에피소드 361개)</p>
					<br/>
					<strong>최근 한 달간 새로 올라온 작품</strong>
					<p>&lt;레지던트 이블&gt;, &lt;라이프&gt;, &lt;한나&gt;, &lt;파괴지왕&gt;, &lt;커뮤니티&gt;, &lt;허스토리&gt;, &lt;하나 그리고 둘&gt;, &lt;트루먼 쇼&gt;, &lt;스쿨 오브 락&gt;, &lt;라이언 일병 구하기&gt;, &lt;주몽&gt;, &lt;기황후&gt;, &lt;</p>
					<p>캐치 미 이프 유 캔&gt;, &lt;터미널&gt;, &lt;포레스트 검프&gt;, &lt;드림걸즈&gt;, &lt;트랜스포머&gt;, &lt;스타트렉: 더 비기닝&gt;, &lt;스타트렉 다크니스&gt;, &lt;유주얼 서스펙트&gt;, &lt;셔터 아일랜드&gt;, &lt;퀸카</p>
					<p>로 살아남는 법&gt;, &lt;대부&gt;, &lt;노인을 위한 나라는 없다&gt;, &lt;아메리칸 뷰티&gt;, &lt;10일 안에 남자 친구에게 차이는 법&gt;, &lt;연을 쫓는 아이&gt;, &lt;루킹&gt;, &lt;청설&gt;, &lt;빅 리틀 라이즈&gt;, &lt;나</p>
					<p>를 차버린 스파이&gt;, &lt;마이 리틀 텔레비전&gt;, &lt;나는 가수다&gt;등</p>
					<p>총 영화 218편, TV시리즈 108편 (에피소드 3,033개)</p>
					<br/>
					<p>여러분이 좋아할 만한 작품, 매주 열심히 찾고 있어요.</p>
					<p>더 좋은 신작으로 찾아 올게요 :)</p>
					<br/>
					<p>SETFLIX 팀 드림</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">3월까지 감상 가능한 콘텐츠
				<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>3월까지 감상 가능한 콘텐츠</p>
					<br/>
					<p>SETFLIX에 콘텐츠를 제공하는 권리사의 요청으로 안타깝게도 각 종료일까지 SETFLIX에서 볼 수 있는 컨텐츠들입니다.</p>
					<p>더 좋은 콘텐츠로 서비스할 수 있도록 계속 노력하겠습니다.</p>
					<br/>
					<p>2019. 3. 1</p>
					<p>워리어스 레인보우: 항전의 시작(2011)</p>
					<p>김정일리아(2009)</p>
					<p>우리들과 경찰아저씨의 700일 전쟁(2008)</p>
					<p>퍼스트 나이트(2010)</p>
					<br/>
					<p>2019. 3. 11</p>
					<p>맘스 나이트 아웃(2014)</p>
					<br/>
					<p>2019. 3. 14</p>
					<p>도쿄 센티멘탈(2016)</p>
					<br/>
					<p>2019. 3. 17</p>
					<p>밸리 오브 본즈(2017)</p>
					<br/>
					<p>2019. 3. 22</p>
					<p>잔 다르크 (1999)</p>
					<br/>
					<p>2019. 3. 24</p>
					<p>건륭왕조 (2002)</p>
					<br/>
					<p>2019. 3. 25</p>
					<p>헬보이(2004)</p>
					<br/>
					<p>2019. 3. 26</p>
					<p>셰임(2011)</p>
					<p>패트리어티 (1998)</p>
					<p>컨트랙트 투 킬 (2016)</p>
					<br/>
					<p>2019. 3. 29</p>
					<p>사조영웅전 2008 (2008)</p>
					<br/>
					<p>2019. 3. 30</p>
					<p>프렌즈 위드 베네핏(2011)</p>
					<br/>
					<p>2019. 3. 31</p>
					<p>래리 플린트(1996)</p>
					<p>좀비랜드(2009)</p>
					<p>테이크 미 홈(2011)</p>
					<p>6번째 날(2000)</p>
					<p>월드 인베이젼(2011)</p>
					<p>레지던트 이블 4: 끝나지 않은 전쟁 3D(2010)</p>
					<p>보쉬 시즌 1(2014)</p>
					<p>보쉬 시즌 2(2016)</p>
					<p>아리요시의 솔직한 산책(2013)</p>
					<p>반딧불이의 묘(2005)</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">CPT 스토어 설문 조사에 참여해주세요!
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요. 콘텐츠 프로토콜 팀입니다:)</p>
					<br/>
					<p>지난 공지에서 살짝 말씀드렸던 'CPT 스토어'에 대해 여러분의 소중한 의견을 들어보기 위해 간단한 설문과 소정의 선물을 준비했어요.</p>
					<br/>
					<p>3월 오픈 예정인 'CPT 스토어'에서는 SETFLIX 활동에 대한 보상으로 제공되는 CPT를 SETFLIX 이용권뿐 아니라, 다양한 문화 콘텐츠 상품과 교환할 수 있게 될 예정이랍니다. </p>
					<br/>
					<p>그래서 다양한 상품들을 준비하고 있고 여러분의 소중한 의견을 더해 더 알찬 상품들로 구성하려고 해요. 설문에 참여하신 분 중 추첨을 통해 총 5 분께, 각각 5000 CPT와</p>
					<p>영화 예매권(2인)도 드릴 예정이니 많은 참여 부탁드려요</p>
					<br/>
					<a href='#'>☞설문조사 참여하러 가기</a>
					<br/>
					<p>-설문 조사 기간: 2019.02.22 (금) - 2019.02.28 (목) 오후 3시</p>
					<p>-당첨자 발표: 2019.03.04 (월)</p>
					<p>-경품 지급일: 2019.03.11 (월)</p>
					<br/>
					<p>*당첨자 발표 및 경품 지급 안내는 이메일을 통해 개별적으로 연락 드릴 예정이에요.</p>
					<br/>
					<p>늘 고맙습니다.</p>
					<p>콘텐츠 프로토콜 팀 드림</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">2월까지 감상 가능한 콘텐츠
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>3월까지 감상 가능한 콘텐츠</p>
					<br/>
					<p>SETFLIX에 콘텐츠를 제공하는 권리사의 요청으로 안타깝게도 각 종료일까지 SETFLIX에서 볼 수 있는 컨텐츠들입니다.</p>
					<p>더 좋은 콘텐츠로 서비스할 수 있도록 계속 노력하겠습니다.</p>
					<br/>
					<p>2019. 2. 1</p>
					<p>워리어스 레인보우: 항전의 시작(2011)</p>
					<p>김정일리아(2009)</p>
					<p>우리들과 경찰아저씨의 700일 전쟁(2008)</p>
					<p>퍼스트 나이트(2010)</p>
					<br/>
					<p>2019. 2. 11</p>
					<p>맘스 나이트 아웃(2014)</p>
					<br/>
					<p>2019. 2. 14</p>
					<p>도쿄 센티멘탈(2016)</p>
					<br/>
					<p>2019. 2. 17</p>
					<p>밸리 오브 본즈(2017)</p>
					<br/>
					<p>2019. 2. 22</p>
					<p>잔 다르크 (1999)</p>
					<br/>
					<p>2019. 2. 24</p>
					<p>건륭왕조 (2002)</p>
					<br/>
					<p>2019. 2. 25</p>
					<p>헬보이(2004)</p>
					<br/>
					<p>2019. 2. 26</p>
					<p>셰임(2011)</p>
					<p>패트리어티 (1998)</p>
					<p>컨트랙트 투 킬 (2016)</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">CPT가 낯선 분들을 위한 공지
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요. 콘텐츠 프로토콜 팀입니다:)</p>
					<br/>
					<p>CPT 보상을 진행하는 동안 ‘왜 포인트가 아닌 암호화폐를 사용하는지’ 많은 분이 궁금해하셨는데요.</p>
					<br/>
					<p>앞으로 SETFLIX 뿐 아니라 전 세계의 영화, 음악, 웹툰 등 다양한 콘텐츠 플랫폼에 CPT 보상 모델을 적용시킬 예정이며, 이에 따라 국가와 카테고리에 국한되지 않고 자유롭게</p>
					<p>사용 가능하기 위해 디지털 암호화폐를 선택하게 되었어요.</p>
					<br/>
					<p>CPT를 지급받기위해 거래소 가입이 필요했던 이유는 거래소가 마치 디지털 암호화폐의 ‘은행’ 같은 역할을 하기 때문인데요. 보상받은 CPT를 현금화하거나 추가로 구매하</p>
					<p>기 위해서 필요한 서비스입니다.</p>
					<br/>
					<p>이제 CPT는 업비트(UPbit)라는 거래소를 통해 거래가 가능합니다. 업비트(UPbit)는 약 120만 명이 사용하는 대한민국 최대 암호화폐 거래소로, 안정성 및 보안에 있어서</p>
					<p>우리나라에서 가장 신뢰할 수 있는 곳이에요. 이 기사를 읽어보시면 확인하실 수 있어요.</p>
					<br/>
					<p>하지만 CPT가 아직 많이 낯설고 어려우실 수 있을 것 같아 간단한 가이드를 준비해보았습니다.<a href='#'>☞안내/가이드 바로 가기</a></p>
					<br/>
					<p>CPT는 [CPT 스토어] 라는 서비스(가칭)를 통하여, SETFLIX 구독을 비롯한 다양한 문화 콘텐츠 소비에 사용 가능할 예정이에요. 예상 오픈 시점은 올해 3월 경이며, 오픈</p>
					<p>후 한정된 기간 동안 SETFLIX 이용권을 할인 판매할 예정이랍니다.</p>
					<br/>
					<p>앞으로도 CPT 보상은 계속될 예정이니, SETFLIX와 SETFLIX에서의 활동을 통해 건강한 콘텐츠 생태계를 만들고자 하는 비전에 동참해주세요!</p>
					<br/>
					<p>혹시 CPT를 아직 지급 받지 않으셨다면 여기서 수령하세요. <a href='#'>☞CPT지급 받으러 가기</a></p>
					<br/>
					<p>늘 고맙습니다.</p>
					<p>콘텐츠 프로토콜 팀 드림</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">거래소를 통한 실제 CPT 지급이 시작됩니다.
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요. 콘텐츠 프로토콜 팀입니다:)</p>
					<br/>
					<p>혹시 CPT를 아직 지급 받지 않으셨다면 여기서 수령하세요. <a href='#'>☞CPT지급 받으러 가기</a></p>
					<br/>
					<p>올해 3월경엔 CPT 스토어(가칭)가 오픈되어 지급받으신 CPT로 SETFLIX 구독을 비롯해 다양한 문화 콘텐츠를 구매할 수 있게 될거에요! </p>
					<br/>
					<p>오픈 기념으로 SETFLIX 이용권도 할인 판매할 예정이며 CPT를 가지고 있으면 받을 수 있는 다양한 혜택도 기획 중이니 기대해주세요:) CPT 보상 또한 앞으로의 활동 및</p>
					<p>기여도에 따라 지속해서 지급될 예정이오니 많은 관심 부탁드릴게요!</p>
					<br/>
					<p>늘 고맙습니다.</p>
					<p>콘텐츠 프로토콜 팀 드림</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">SETFLIX CPT 보상의 진실 혹은 거짓
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요 SETFLIX 팀입니다.</p>
					<br/>
					<p>모두 받게 될 CPT 수량을 확인하셨는지 모르겠네요 :)</p>
					<p>이번엔 자주 문의해주신 내용을 준비해보았으니 많은 관심 부탁드려요!</p>
					<br/>
					<p>1. CPT 보상이 시작되면 내 개인정보가 공유되나요?</p>
					<p>절대 아닙니다! ❌ 제작사에 전달되는 데이터는 개인을 특정할 수 없는 통계 형식으로 표현된답니다 🙂 쉬운 예시를 볼까요?</p>
					<img src='image/9b28b1fc861bfa2bf6a918c0c6400e0b569b008f.png' alt="이미지">
					<br/>
					<p>이처럼 여러분의 소중한 개인정보는 절대 공유되지 않으니 걱정하지 마세요! </p>
					<br/>
					<p>이것 외에도 자주 묻는 질문을 모아보았어요. </p>
					<br/>
					<p>2. 그럼 본인인증은 왜 하나요?</p>
					<p>한 사람당 하나의 SETFLIX 계정으로 CPT 보상을 받을 수 있도록 하기 위해서예요! </p>
					<p>여러 개의 계정으로 보상을 중복으로 받거나 허위 계정, 봇 계정 등을 생성해 보상받는 것을 방지하기 위해서니 많은 협조 부탁드려요 :)</p>
					<br/>
					<p>3. 내 데이터를 제공하지 않을 수도 있나요?</p>
					<p>당연하죠! 데이터 제공 여부는 언제든 ON/OFF 설정할 수 있도록 기능이 구현 될 거예요! </p>
					<p>설정을 OFF한 유저의 데이터는 일절 공유되지 않고 CPT보상 대상자에서도 제외될 예정이에요.</p>
					<br/>
					<p>4. 어뷰징은 어떻게 막을 건가요?</p>
					<p>SETFLIX 팀은 지금까지 알바 계정들과 싸우며 어뷰징을 관리하는 기술과 노하우를 쌓아왔어요. </p>
					<p>앞으로도 지속적인 모니터링과 시스템 고도화를 통해 어뷰징을 최소화해서 데이터가 오염되지 않도록 노력할 테니 믿고 맡겨주세요 :) </p>
					<br/>
					<p>여러분의 궁금증이 많이 해결되었기를 바라며</p>
					<p>혹시 아직도 CPT 수량을 확인하지 않았다면 링크를 클릭해 바로 확인해 보세요</p>
					<a href='#'>☞내가 받을 CPT 수량 확인하기</a>
					<p>늘 고맙습니다.</p>
					<p>SETFLIX 팀 드림.</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">워너 브라더스 서비스 목록
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<img src='image/ee0cb402d7fd4fa1f676e0ec340d88f36b8fbdc9.jpg' alt="이미지">
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">SETFLIX 활동에 대한 보상을 시작합니다!
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요 SETFLIX 팀입니다.</p>
					<br/>
					<p>그동안 프로젝트의 목적, 방향 등에 대해 조금씩 이야기해왔는데요. 이야기 드렸던 것처럼 콘텐츠 프로토콜은 제작자에게 데이터를 공유해 더 나은 환경을 제공함으로써 더</p>
					<p>좋은 콘텐츠를 생산할 수 있도록 하는, 한마디로 건강한 생태계를 만드는 프로젝트랍니다.</p>
					<br/>
					<p>사실 저희가 이런 프로젝트를 기획할 수 있었던 것은 여러분이 지금까지 SETFLIX와 SETFLIX를 사용하며 양질의 평가/감상 데이터를 쌓아주셨기 때문이에요. 그래서 본격적</p>
					<p>인 프로젝트 시작에 앞서 그동안의 활동에 대한 보상을 제공해드리려고 합니다.</p>
					<br/>
					<p>보상은 CPT라고 불리는 토큰으로 지급될 예정이며 공정한 보상이 될 수 있도록 활동 기간, 평가/코멘트/컬렉션 활동, SETFLIX 구독 등을 토대로 꼼꼼하게 산정했어요.</p> 
					<p>링크를 클릭해 본인인증만 하면 받게 될 CPT 수량을 바로 확인할 수 있어요!</p>
					<a href='#'>☞내가 받을 CPT 수량 확인하기</a>
					<p>이번에 CPT를 받지 못하는 분들도 계실 텐데요. 너무 실망하지 마세요. 앞으로도 여러분의 SETFLIX와 SETFLIX 활동에 대해 지속적으로 CPT 보상을 진행할 예정이니 지금</p>
					<p>까지처럼 서비스를 잘 사용해주시면 된답니다 :)</p>
					<br/>
					<p>늘 고맙습니다.</p>
					<p>SETFLIX 팀 드림.</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">콘텐츠프로토콜 두 번째 이야기
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요 SETFLIX 팀입니다.</p>
					<br/>
					<p>지난번 공지에서는 콘텐츠 프로토콜을 전체적으로 소개해드렸어요. 프로젝트를 시작하게 된 이유, 콘텐츠 산업의 현실 등 하고 싶은 말이 많아서 글이 길어졌었죠</p>
					<br/>
					<p>여러분이 영화 감상을 하는 것만으로도 더 나은 세상을 만들고 있다는 거, 알고 계셨나요?</p>
					<br/>
					<p>이번에는 긴 글 대신 짤막한 영상으로 준비해봤어요. SETFLIX가 더 나은 세상을 만드는 방법, 영상으로 확인해보세요.</p>
					<br/>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/qSURO4hwNRE"></iframe>
					<br/>
					<p>그리고 12월엔 그동안 여러분의 SETFLIX와 SETFLIX 활동에 대한 보상이 시작될 예정이에요. 많이 이용해주셨던 만큼 계속 관심 부탁드릴게요! 🙏</p>
					<br/>
					<p>그럼 세 번째 이야기로 12월에 만나요. </p>
					<p>늘 고맙습니다.</p>
					<p>SETFLIX 팀 드림.</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">SETFLIX의 새로운 프로젝트, "콘텐츠 프로토콜"을 소개합니다.
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요 SETFLIX 팀입니다.</p>
					<br/>
					<p>오늘 우리의 새로운 프로젝트를 여러분들에게 소개하려고 해요.</p>
					<br/>
					<p>우리는 SETFLIX를 2016년 1월 31일에 런칭했어요. 그리고 감사하게도, 너무 많은 것을 받았어요.</p>
					<br/>
					<p>기억나세요? SETFLIX 모바일 앱 사전예약 신청 때에는 여러분 중 2만명이 등록을 해주셨고, 100여분을 모셨던 오프라인 간담회에서는 무려 4천명의 회원님들이 신청을 </p>
					<p>해주셨어요. 이후에도 꾸준히 사랑을 받아 300만 앱 다운로드, 1억 6천만번의 시청, 잘 알려진 대기업들보다도 더 높은 구독자 수 같은 것들을 선물 받았어요. 우리 같이 작</p>
					<p>은 스타트업이 ‘성취’하기엔 참 벅찬 것들이었어요. 그리고 우린 이런 것들이 SETFLIX를 오랫동안 사랑해주시고 응원해주신 회원님들 덕분이라는 것을 잘 알고 있어요. </p>
					<br/>
					<p>우리는 SETFLIX를 하면서 많은 것을 배우기도 했어요. 우리는 헐리우드 스튜디오, 국내 대형 방송사 등 60여곳의 콘텐츠 제작/유통사들과 처음으로 가까이 일하기 시작</p>
					<p>했어요. 업계의 선배들이 만들어놓은 훌륭한 원칙과 관습들도 있었지만, 기술을 통해 충분히 해결할 수 있는 케케묵은 문제들도 많이 보였어요. 그 중 가장 근본적이고 고질</p>
					<p>적인 문제는 '데이터 공유'의 문제였어요. 콘텐츠 제작/유통사들은 더 나은 콘텐츠를 제작하기 위해 시청자들의 '소비 데이터'를 간절히 원하고 있었어요. 자신들의 콘텐츠</p>
					<p>가 얼마나 감상되고, 어떤 사용자들에게 주로 감상되며, 시청자들이 보통 어느 구간에서 집중을 잃는지 등과 같은 데이터예요.</p>
					<br/>
					<p>세상의 많은 산업 분야에서 빅데이터 혁신이 일어나고 있어요. 점점 더 많은 산업에서 많은 회사들이 오랫동안 쌓아온 빅데이터를 통해 더 많은 것을 배우고 예측해요. 그리</p>
					<p>고 시장에 더 합리적인 가격에 더 훌륭한 상품을 제공하죠. 그런데 콘텐츠 생태계 저변에서는 그런 일이 일어나고 있지 않아요. 왜냐하면 스트리밍 서비스 같은 플랫폼들이</p>
					<p>데이터를 독점하면서, ‘비즈니스 논리’에 의해 그것들을 공유하고 있지 않기 때문이에요.</p>
					<br/>
					<p>우리가 새로 시작하는 "콘텐츠 프로토콜" 프로젝트는 이런 값진 데이터들이 콘텐츠 제작사/유통사들에게 투명하게 공유되게 하는 프로젝트예요. ‘더 나은 콘텐츠’가 세상</p>
					<p>에 더 많이 나올 수 있도록, 그래서 ‘더 나은 문화 생활’을 우리가 더 많이 누릴 수 있도록.</p>
					<p>우리는 이 변화를 생태계 자체의 큰 도약으로 만들기 위해 SETFLIX와 SETFLIX 뿐 아닌 전세계 모든 콘텐츠 플랫폼이 동참할 수 있도록 설계하고 있어요. </p>
					<br/>
					<p>이 프로젝트는 "블록체인"이라는 기술을 사용해요. 블록체인 기술은 데이터의 조작 가능성을 차단하고 투명성을 담보해줄 수 있기 때문에, SETFLIX 뿐 아니라 전세계 어느 플</p>
					<p>랫폼이 사용하든 콘텐츠 제작자는 그 데이터를 신뢰할 수 있게 될 거예요. </p>
					<br/>
					<p>유저 분들은 제작자, 플랫폼과 함께 이 중요한 움직임의 한 참여자가 될 거예요. 따라서 이런 데이터를 제공해주시는 유저 분들은 ‘데이터 제공 참여자’로서 그에 맞는 보상</p>
					<p>을 받을 수 있게 될 거예요. 우리는 이 공정하지만 아직은 낯선 방식이 결국 상식이 되는 세상이 올 것으로 생각해요. 보상은 CPT 라는 이름을 가진 토큰으로 주어질 거예요. </p>
					<p>이 CPT 토큰은 콘텐츠 프로토콜 운동에 동참하는 모든 플랫폼에서 구독하거나 결제할 때 화폐처럼 쓰이게 될 거예요. </p>
					<br/>
					<p>앞으로 몇주간, 여러분들에게 더 자세히 설명드릴게요. 나중에는 선물도 드릴 거예요. 지금껏 주신 사랑에 대한 보답으로요.</p>
					<br/>
					<p>그럼 지켜봐주세요.</p>
					<br/>
					<p>늘 고맙습니다.</p>
					<p>SETFLIX 팀 드림.</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">SETFLIX, SETFLIX 개인정보취급방침 개정
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요 SETFLIX 팀입니다.</p>
					<br/>
					<p>SETFLIX, SETFLIX 개인정보취급방침 약관이  아래와 같이 개정되어 안내 드리니, 이용에 참고하여 주시기 바랍니다.</p>
					<br/>
					<p>1. 개정 시행일자 : 2018년 10월 31일</p>
					<br/>
					<p>2. 세부 개정 내용</p>
					<br/>
					<p>개인정보의 수집범위 및 수집방법(개정)</p>
					<p>6. 회사는 기본적 인권침해의 우려가 있는 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)를 요구하지 않으며, 위</p>
					<p>의 항목 이외에 다른 어떠한 목적으로도 수집, 사용하지 않습니다.</p>
					<br/>
					<p>개인정보의 자동 수집 장치의 설치, 운영 및 그 거부에 관한 사항(개정)</p>
					<p>2. 회원은 쿠키 설치에 대한 선택권을 가지고 있으며 회원은 웹브라우저에서 옵션을 설정함으로서 모든 쿠키를 허용하거나, 또는 쿠키가 저장될 때마다 확인을 거치거나, </p>
					<p>혹은 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 회원이 쿠키 설치를 거부하는 경우 서비스 제공에 어려움이 발생할 수도 있습니다.</p>
					<p>3. 회사가 쿠키를 통해 수집하는 정보는 회원의 고유번호에 한하며, 그 외의 다른 정보는 수집하지 않습니다. 회사가 쿠키(cookie)를 통해 수집한 회원의 고유번호는 다음</p>
					<p>의 목적을 위해 사용될 수 있습니다.</p>
					<p>(1) 개인의 관심 분야에 따라 차별화 된 정보를 제공</p>
					<p>(2) 회원과 비회원의 접속 빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 타겟 (target) 마케팅에 활용</p>
					<p>(3) 서비스 이용 내역을 추적하여 분석을 통한 추후 개인 맞춤 서비스를 제공 및 서비스 개편 등의 척도로 활용</p>
					<p>(4) 유료서비스 이용 시 이용기간 안내 등</p>
					<br/>
					<p>[고객상담센터](개정)</p>
					<p>- 전화번호 : 02-515-9985</p>
					<p>- 팩스번호 : 02-3478-2202</p>
					<p>- 전자우편 : cs@watcha.com</p>
					<p>- 사업자 주소: 서울특별시 서초구 강남대로343 신덕빌딩 3층</p>
					<br/>
					<br/>
					<p>변경된 개인정보취급방침 내용에 대한 문의사항이 있으신 경우, SETFLIX 고객센터(cs@watcha.com)로 문의 주시면 친절하게 안내해드리겠습니다.</p>
					<p>더욱 편리하고 안정적인 서비스로 회원님의 성원에 보답하겠습니다.</p>
					<br/>
					<p>늘 고맙습니다.</p>
					<p>SETFLIX 팀 드림.</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">SETFLIX 서비스 이용약관 개정
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>안녕하세요 SETFLIX 팀입니다.</p>
					<br/>
					<p>SETFLIX 서비스 약관이  아래와 같이 개정되어 안내 드리니, 이용에 참고하여 주시기 바랍니다.</p>
					<br/>
					<p>1. 개정 시행일자 : 2018년 10월 31일</p>
					<br/>
					<p>2. 세부 개정 내용</p>
					<br/>
					<p>7조 (미성년자 이용계약에 관한 특칙)(추가))</p>
					<p>- 회사는 만 19세 이하의 미성년이용자가 유료서비스를 이용하고자 하는 경우에 부모 등 법정 대리인의 동의를 얻거나, 계약체결 후 추인을 얻지 않으면 미성년자 본인 또는</p>
					<p>법정대리인이 그 계약을 취소할 수 있다는 내용을 계약체결 전에 고지하는 조치를 취합니다. 다만, 미성년자가 속임수로써 자기를 성년자로 믿게 하거나 법정대리인의 동의</p>
					<p>가 있는 것으로 믿게 한 경우에는 취소할 수 없습니다.</p>
					<p>- 전 항과 관련하여 당사자가 미성년자인지 여부는 결제가 진행된 모바일 기기, 결제 실행자의 정보, 결제 수단의 명의자 등을 근거로 하여 종합적으로 판단합니다. 또한 회</p>
					<p>사는 정당한 취소권의 행사인지 여부를 확인하기 위하여 미성년자 및 법정대리인임을 증명할 수 있는 서류의 제출을 요청할 수 있습니다.</p>
					<br/>
					<p>13조 2항 유료서비스 예약 변경, 즉시 변경 등(개정)</p>
					<p>- 예약 변경의 경우, 회원이 변경 요청한 달의 이용기간이 만료되는 날까지 기존 구매/가입한 이용권을 이용할 수 있으며, 이용기간 만료일 익일부터 변경 요청한 이용권으</p>
					<p>로 변경 적용됩니다. 다만 타사 계정을 결제 수단으로 사용하여 결제한 경우 해당 타사의 정책을 따릅니다.</p>
					<br/>
					<p>14조 10항 유료서비스 이용 중 회원 탈퇴(개정)</p>
					<p>- 유료서비스를 이용 중인 유료회원이 탈퇴하는 경우 해당 이용권은 즉시 해지되며 환불은 불가능합니다. 이 경우 유료회원의 정보와 SETFLIX 이용내용은 관련 법령이 </p>
					<p>정하는 경우를 제외하고는 SETFLIX 약관 및 이 약관에 따라 처리됩니다. 다만 타사 계정을 결제 수단으로 사용하여 구독한 경우, 해당 타사를 통해서 해지해야 할 수도 있습니</p>
					<p>다. </p>
					<br/>
					<p>변경된 SETFLIX 서비스 이용약관 내용에 대한 문의사항이 있으신 경우, SETFLIX 고객센터(cs@watcha.com)로 문의 주시면 친절하게 안내해드리겠습니다.</p>
					<p>더욱 편리하고 안정적인 서비스로 회원님의 성원에 보답하겠습니다.</p>
					<br/>
					<p>늘 고맙습니다.</p>
					<p>SETFLIX 팀 드림.</p>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">HBO 시리즈 서비스 목록
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<img src='image/0dc0087570f554a6994e1d1cdce3540df709b57a.jpg' alt="이미지" style='width: 900px;'>
				</div>
			</div>
			<div class="accordion-div">
				<a class="toggle" href="javascript:void(0);">SETFLIX, 크롬캐스트 기능 지원!
					<img src="image/arrow.png" alt="화살표">
				</a>
				<div class="inner">
				<hr style="margin: 25px 0;">
					<p>오래 기다리셨죠? 알아요...</p>
					<p>드디어 SETFLIX에 크롬캐스트 기능이 추가되었어요!</p>
					<br/>
					<p>SETFLIX에 매주 업데이트 되는 좋은 영화, 드라마들을 이제 크롬캐스트로 TV에서도 마음껏 감상해 보세요 :)</p>
					<p>(크롬캐스트는 TV의 HDMI 포트에 연결해 사용하는 장치로, 크롬캐스트에 대한 자세한 내용은 이곳을 눌러 확인해보세요. Google Cast 기능이 있는 Android TV 기기들</p>
					<p>에서도 사용할 수 있어요.)</p>
					<br/>
					<p>크롬캐스트를 이용하기 위해선 SETFLIX를 최신 버전으로 업데이트하셔야 해요.</p>
					<p>아래 버튼을 눌러 스토어로 들어간 다음, "업데이트" 버튼이 상단에 있다면 업데이트 해주세요.</p>
					<a href='#'>[업데이트하러 가기]</a>
					<br/>
					<p>이제, 큰 화면에서 더욱 풍부하게 즐기세요.</p>
				</div>
			</div>
		</div>
		<h3>FAQ</h3>
		<div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">자주 묻는 질문</a></li>
		    <li><a href="#tabs-2">결제</a></li>
		    <li><a href="#tabs-3">해지/환불</a></li>
		    <li><a href="#tabs-4">이용권/쿠폰</a></li>
		    <li><a href="#tabs-5">로그인/계정관리</a></li>
		    <li><a href="#tabs-6">컨텐츠</a></li>
		    <li><a href="#tabs-7">재생 문의</a></li>
		    <li><a href="#tabs-8">서비스 문의</a></li>
		  </ul>
		  <div id="tabs-1">
			<div class="accordion">
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 안드로이드 기기에서 회색 화면이 뜨면서 앱 실행 혹은 재생이 안돼요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>일부 안드로이드 기기에서 앱 실행 시, 혹은 영상 재생 시 회색화면이 뜨면서 진행되지 않는 경우가 발생하고 있어요.</p>
						<p>회색 화면이 뜨는 경우 '기기 재부팅'을 시도해주세요. </p>
						<p>기기 재부팅 이후에도 동일한 문제가 발생한다면 고객센터에 문의해주세요. </p>
						<br/>
						<p>이용에 불편을 드려 죄송합니다.</p>
						<p>해당 오류가 발생하지 않도록 원인과 해결방안을 모색하고 있으며, 빠른 시일내에 수정되도록 최선을 다하겠습니다.</p>	
					</div>
				</div>  
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 다개월(3,6,12개월) 이용권으로 어떻게 변경하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<strong>구글플레이 결제</strong>
						<p>구독 중에 이용권 변경은 어려워요. 기존 구독 해지 신청 후 재 결제하실 때 변경 원하시는 이용권으로 구매해주세요.</p>
						<p>* 해지하셔도 기존 이용권 만료일까지 감상 가능해요.</p>
						<p>* 해지 후 재구매 시 이전에 서비스되었던 일부 이용권은 구매가 불가능할 수도 있는 점 참고해주세요.</p>
						<br/>
						<strong>구글플레이 결제 해지 방법</strong>
						<p>SETFLIX 앱 마이페이지 > 설정 > 계정 설정 > 해지하기</p>
						<br/>
						<br/>
						<strong>애플 결제</strong>
						<p>애플 결제는 애플 구독 페이지에서 원하시는 이용권 신청하시면 '다음 재 결제일'에 새롭게 신청한 이용권으로 구독되어요.</p>
						<p>ex) 11/10 1개월 이용권 구독 신청 후 11/15 3개월 이용권으로 변경 신청하시면, 다음 결제일인 12/10 3개월 이용권으로 구독이 시작돼요.</p>
						<p>** 기본 이용권, TV 이용권은 현재 판매 중단되었으니 '이용권' 으로 변경해주세요.</p>
						<br/>
						<strong>애플 결제 이용권 변경 방법</strong>
						<p>1. 아이폰 설정의 [iTunes 및 App Store]</p>
						<p>2. Apple ID : ***@***.*** 선택</p>
						<p>3. [Apple ID 보기] 선택 후 로그인</p>
						<p>4. [구독] 선택 (구독한 사항이 없으면 표시되지 않습니다)</p>
						<p>5. SETFLIX 선택</p>
						<p>6. 원하는 이용권 선택 후 구독</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 새로운 작품 추가를 제안하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>보고싶은 영화나 TV 프로그램이 SETFLIX에 없다면,</p>
						<p>아래 &lt;작품 제안하기&gt; 링크를 눌러 추가 신청을 해주세요. 저희 콘텐츠 업데이트 계획에 반영할게요!</p>
						<br/>
						<strong>작품 제안하기</strong>
						<br/>
						<p>보고싶은 작품의 업데이트 소식을 받고싶다면, </p>
						<p>"SETFLIX"에서 해당 작품의 &lt;보고싶어요&gt; 를 클릭해주세요! 업데이트 시 회원님의 SETFLIX 앱에서 알람이 갈거에요 :)</p>
						<br/>
						<strong>애플 결제</strong>
						<p>SETFLIX: 별점을 남기고 코멘트를 작성할 수 있어요.</p>
						<p>SETFLIX: 영화와 드라마를 감상할 수 있어요.</p>
						<br/>
						<img src="image/HvK6efy.png" alt="이미지" style="width: 900px;">
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 해지는 어떻게 하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>* 해지 후에도 현재 구독 중인 이용권의 만료일까지 감상 가능하며, 다음 결제일부터 자동결제 되지 않아요.</p>
						<p>* 결제일 당일에 해지하신 경우 다음 결제 예정일에 반영될 수 있어요.</p>
						<p>* 애플/구글플레이 결제의 경우 웹이 아닌 앱에서 해지를 진행해주세요.</p>
						<br/>
						<strong>[카드 결제/쿠폰 등록/휴대폰 소액 결제]</strong>
						<strong>앱에서 해지</strong>
						<p>1. 마이페이지</p>
						<p>2. 설정</p>
						<p>3. 계정 설정</p>
						<p>4. 하단의 ‘해지하기’ 선택</p>
						<strong>웹에서 해지</strong>
						<p>1. SETFLIX 사이트(play.watcha.net)</p>
						<p>2. 우측 상단의 프로필 아이콘 선택</p>
						<p>3. 설정</p>
						<p>4. ‘해지하기’ 선택</p>
						<br/>
						<strong>[해지 취소하기]</strong>
						<p>앱에서 해지 취소: 마이페이지 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
						<p>웹에서 해지 취소: SETFLIX 사이트(play.watcha.net) > 우측 상단의 프로필 아이콘 선택 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 이용권이 없다고 나와요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>정기 구독 중인데 이용권이 없다고 나오나요? 아래와 같은 사유로 인해 이용권이 보이지 않을 수 있어요.</p>
						<br/>
						<strong>일시적인 오류로 인해 이용권 지급이 안된 경우</strong>
						<p>: SETFLIX 앱 로그아웃 > 로그인 > 이용권 구매하기 화면에서 하단의 [구매내역복원] 선택</p>
						<br/>
						<strong>잔액 부족, 결제 정보 변경, 한도 초과 등 자동 결제가 실패되어 정상적으로 이용권이 지급되지 않은 경우</strong>
						<p>: 다른 결제 수단으로 다시 결제를 진행해주세요.</p>
						<br/>
						<strong>이용권을 구매한 아이디가 아닌 다른 아이디로 로그인한 경우</strong>
						<p>: 로그아웃 후, 이용권을 구매한 아이디로 다시 로그인 해주세요.</p>
						<br/>
						<p>만약 위와 같은 상황이 아니라면 고객센터로 문의 해주세요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 이용권 구독 중 자동 결제가 실패됐어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>카드/휴대폰 결제 중 잔액 부족 등으로 결제가 실패된 경우 SETFLIX pc웹 상단의 '결제수단변경' 버튼을 통해 다시 구독을 진행해주세요.</p>
						<p>* 애플, 구글 결제의 경우 결제 수단 변경은 iTunes 또는 구글 Play Store에서 변경부탁드려요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. SETFLIX의 예상별점과 추천의 원리는 무엇인가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 SETFLIX에서 쌓은 데이터를 활용해 영화와 드라마를 추천해드려요!</p>
						<br/>
						<p>1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾아요. 누구나 영화나 드라마를 볼 때 자기만의 중요한 기준이 있어요. 예를 들면, "난 영상미나 음악이 중요해… 아</p>
						<p>니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가</p>
						<p>중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있어요. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람</p>
						<p>들이 바로 나와 취향이 비슷한 사람들이에요.</p>
						<br/>
						<p>2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 작품 별로 "내 예상별점"을 만들어요. 나와 취향이 비슷한 사람들이 개별 작품에 매긴 점수는, 아마도 내가 실제로 </p>
						<p>매길 점수와 아주 아주 유사할거에요. 즉 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 작품에 몇 점을 줄지 미리 알 수가 있는 것이죠. SETFLIX는 나와 취향이 비슷한</p>
						<p>사람들의 평가를 종합해서, 자동으로 작품 별 "내 예상별점"을 계산하고 즉시 보여줘요.</p>
						<br/>
						<p>3. "내 예상별점"이 높은 작품들을 추천해요. 이렇게 계산된 예상별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높아요. 따라서 이런 작품들을 </p>
						<p>나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천한답니다.</p>
						<br/>
						<p>어때요? 참 쉽죠! 물론 이건 말로 간단히 풀어 설명한 것이고, 실제 위의 1~3번 과정을 "엄청난 양의 데이터에 대해 실시간으로 오류 없이 정확하게 계산하는 것"은 정말 정</p>
						<p>말 어려운 일이에요.</p>
						<br/>
						<p>SETFLIX는 수 년에 걸쳐 자체 개발한 추천 엔진 '핀셋'을 통해 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 </p>
						<p>개선되고 있어요. 이제 뭐볼지 고민하지 마세요!</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 코멘트는 어떻게 작성하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>(주)SETFLIX는 SETFLIX와 SETFLIX 두 서비스를 운영하고 있어요. SETFLIX는 영화, 드라마 평가/추천 전문 서비스이며, SETFLIX는 영화/드라마 감상 서비스에요. SETFLIX와 SETFLIX플</p>
						<p>레이는 연동되어 있어 동일한 계정으로 SETFLIX와 SETFLIX 모두 사용 가능하답니다. 평가 초기화, 코멘트/댓글 작성, 컬렉션 생성은 SETFLIX에서 가능해요.😄 SETFLIX는 앱과 웹을</p>
						<p>지원하고 있어요. 아래와 같이 이용 가능하니 참고해주세요.</p>
						<br/>
						<p>4억 개의 별점 데이터를 바탕으로 내 취향을 분석하는 SETFLIX 이용하기!</p>
						<strong><a href='#'>[앱스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[Play 스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[SETFLIX PC에서 접속하기]</a></strong>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. TV로 감상할 수 있는 방법은 무엇인가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX의 이용권으로 모바일, 테블릿, pc, 맥을 포함한 Chromecast, 안드로이드 TV에서 SETFLIX 작품을 감상하실 수 있도록 지원하고 있어요. 상세한 지원 기기</p>
						<p>는 아래와 같으니 참고 부탁드려요.</p>
						<br/>
						<strong>[ TV 지원 이용권의 상세 지원 목록]</strong>
						<strong>- 16~18년형 삼성 스마트TV</strong>
						<strong>- 16~18년형 LG 스마트TV</strong>
						<p>- skyUHD A+ 상품 가입 시 제공받는 Android TV 셋탑 박스</p>
						<p>- Chromecast(1,2,3세대, Ultra)</p>
						<p>- 크라이저 셋탑 박스(U4X+S)</p>
						<p>- 구글 플레이 스토어가 지원되는 안드로이드 셋탑 박스</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 안드로이드에서 영상 재생이 되지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX를 사용하기 위한 최소 사양은 아래와 같습니다. 낮은 사양의 버전에서는 SETFLIX가 정상적으로 작동되지 않을 수 있으니 참고부탁드립니다.</p>
						<p> - 안드로이드 버전 4.1.2(젤리빈) 이상</p>
						<br/>
						<p>아래와 같이 일부 기기에서는 제조사 OS 개발 환경에 따라 재생이 제한될 수 있습니다.</p>
						<p> - LG V10(OS 7.0 이상)</p>
						<p> - 블랙베리 키원</p>
						<p> - 갤럭시 탭</p>
						<p> - 레노바 요가 탭</p>
						<p> - 기타 직수입된 외산 기기</p>
						<p>* 컨텐츠 보호를 위해 루팅된 폰에서는 모든 영상의 재생이 제한될 수 있습니다. </p>
						<br/>
						<p>만약 위 내용과 상관없이 재생이 되지 않으신다면 아래와 같이 진행해주세요. 확인 후에도 재생이 되지 않는다면 고객센터로 문의부탁드립니다.</p>
						<br/>
						<p>1. 기기 펌웨어를 최신 버전으로 업데이트</p>
						<p>기기의 설정 >  휴대폰 정보 > 소프트웨어 업데이트 > 최신 버전으로 업데이트</p>
						<br/>
						<p>2. 데이터 삭제 후 재설치</p>
						<p>SETFLIX 앱> 설정 > 캐시 삭제 > 앱 재설치</p>
						<br/>
						<p>3. 기기 재부팅 후 다시 재생 시도</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 동영상 재생 시 Microsoft Silverlight를 설치하라고 떠요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>Chrome, edge 등 일부 브라우저가 아닌 브라우저에서 영상 재생 시 Silverlight 플러그인 설치가 필요합니다. </p>
						<p>만약 실버라이트를 설치한 후에도 동일한 메시지가 뜬다면 아래와 같이 진행해주세요.</p>
						<br/>
						<p>- Internet explorer 의 경우 : Internet explorer 실행 > 도구 > 추가 기능 관리 > 도구 모음 및 확장 프로그램 > 하단 '표시'에서 '모든 추가 기능'으로 선택 > Microsoft </p>
						<p>Silverlight 선택 후 사용 함으로 설정 후 감상 시도</p>
						<br/>
						<p>- Safari11이하 버전의 경우 : 좌측 상단의 Safari 선택 > 환경 설정 선택 > '보안 탭'의 플러그인 중 Silverlight 선택 후 play.watcha.net 항목을 [켬]으로 설정 > 완료</p>
						<br/>
						<p>- Safari12이상 버전의 경우: 애플의 정책으로 인해 safari 12.0버전부터 Microfoft Silverlight(실버라이트)를 포함한 외부 플러그인은 지원되지 않습니다. 때문에 해당 </p>
						<p>브라우저에서 감상이 불가한 점 양해부탁드려요. 크롬브라우저는 실버라이트 설치 없이 재생이 가능합니다.</p>
						<br/>
						<a href='#'>[크롬브라우저 다운로드하러 가기]</a>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 화질이 별로예요. 좋은 화질로 볼 수 없나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 대부분의 작품을 1080p(FHD)로 서비스하고 있습니다. 다만 원활한 감상을 위해 이용하시는 환경에 따라 자동으로 1080p, 720p, 480p, 360p로 설정되어 </p>
						<p>재생됩니다. </p>
						<br/>
						<p>아래 환경에서는 1080p 재생이 제한될 수 있는 점 참고부탁드립니다.</p>
						<p>- 네트워크 환경이 원활하지 않은 경우:</p>
						<p>　 1. 기숙사, 병원, 회사, 학교 등 네트워크 대역폭이 제한된 경우</p>
						<p>　 2. WiFi로 접속 시 공유기와의 거리가 멀거나 장애물이 있는 경우</p>
						<p>- PC/노트북에서 여러 작업을 동시에 진행하는 경우</p>
						<br/>
						<p>* 원본 자체가 저화질인 일부 컨텐츠의 경우(오래전에 제작된 작품 등) 원활한 네트워크 환경이라도 고화질로 자동변환되지 않습니다.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 영상/자막/내용의 문제를 제보하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>작품을 감상하시는 중 아래와 같은 영상/자막/내용 상의 문제가 있는 경우 알려주세요.</p>
						<p>(자막의 경우, SETFLIX는 컨텐츠 권리사에서 제공받은 공식 자막으로 서비스되고 있기 때문에, 임의적인 수정이 어려울 수 있어요.)</p>
						<br/>
						<p>아래 "작품 검수 요청" 눌러서 제보해주시면 확인 후 최대한 반영하도록 할게요.</p>	
						<br/>
						<p>- 자막 오역 및 맞춤법 (단, 영상에 입혀져있는 자막의 경우에는 처리하는 데에 시간이 오래 걸릴 수 있어요.😭)</p>
						<p>- 자막과 영상 싱크</p>
						<p>- 음성과 영상 싱크</p>
						<p>- 줄거리, 감독, 배우 등 작품 설명 내용 오류</p>
						<strong><a href='#'>작품 검수 요청</a></strong>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 첫 구독 무료 이벤트 혜택 후 의무 사용기간이 있나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX를 처음 찾아주시는 모든 회원분들에게 첫 구독 무료 이벤트를 진행하고 있어요. 물론 의무 사용 기간은 없으며 언제든지 간편하게 해지와 해지취소가 가능해요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 결제 했는데 이용권이 보이지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>결제 후 이용권 지급이 안됐다면 아래와 같이 진행해주세요.</p>
						<br/>
						<p>이용권 구매 > 화면 맨 하단 [구매내역복원] 터치</p>
						<br/>
						<p>만약 위를 통해서도 이용권이 지급되지 않는다면 고객센터로 문의주세요.</p>
						<p>빠르게 확인 도와드릴게요.</p>
					</div>
				</div>
			</div>
		  </div>
		  <div id="tabs-2">
			<div class="accordion">
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 다개월(3,6,12개월) 이용권으로 어떻게 변경하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>일부 안드로이드 기기에서 앱 실행 시, 혹은 영상 재생 시 회색화면이 뜨면서 진행되지 않는 경우가 발생하고 있어요.</p>
						<p>회색 화면이 뜨는 경우 '기기 재부팅'을 시도해주세요. </p>
						<p>기기 재부팅 이후에도 동일한 문제가 발생한다면 고객센터에 문의해주세요. </p>
						<br/>
						<p>이용에 불편을 드려 죄송합니다.</p>
						<p>해당 오류가 발생하지 않도록 원인과 해결방안을 모색하고 있으며, 빠른 시일내에 수정되도록 최선을 다하겠습니다.</p>	
					</div>
				</div>  
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 이용권 구독 중 자동 결제가 실패됐어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<strong>구글플레이 결제</strong>
						<p>구독 중에 이용권 변경은 어려워요. 기존 구독 해지 신청 후 재 결제하실 때 변경 원하시는 이용권으로 구매해주세요.</p>
						<p>* 해지하셔도 기존 이용권 만료일까지 감상 가능해요.</p>
						<p>* 해지 후 재구매 시 이전에 서비스되었던 일부 이용권은 구매가 불가능할 수도 있는 점 참고해주세요.</p>
						<br/>
						<strong>구글플레이 결제 해지 방법</strong>
						<p>SETFLIX 앱 마이페이지 > 설정 > 계정 설정 > 해지하기</p>
						<br/>
						<br/>
						<strong>애플 결제</strong>
						<p>애플 결제는 애플 구독 페이지에서 원하시는 이용권 신청하시면 '다음 재 결제일'에 새롭게 신청한 이용권으로 구독되어요.</p>
						<p>ex) 11/10 1개월 이용권 구독 신청 후 11/15 3개월 이용권으로 변경 신청하시면, 다음 결제일인 12/10 3개월 이용권으로 구독이 시작돼요.</p>
						<p>** 기본 이용권, TV 이용권은 현재 판매 중단되었으니 '이용권' 으로 변경해주세요.</p>
						<br/>
						<strong>애플 결제 이용권 변경 방법</strong>
						<p>1. 아이폰 설정의 [iTunes 및 App Store]</p>
						<p>2. Apple ID : ***@***.*** 선택</p>
						<p>3. [Apple ID 보기] 선택 후 로그인</p>
						<p>4. [구독] 선택 (구독한 사항이 없으면 표시되지 않습니다)</p>
						<p>5. SETFLIX 선택</p>
						<p>6. 원하는 이용권 선택 후 구독</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 첫 구독 무료 이벤트 신청했는데 결제가 되었어요.
						<img src="image/arrow.png" alt="화살표">	
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>보고싶은 영화나 TV 프로그램이 SETFLIX에 없다면,</p>
						<p>아래 &lt;작품 제안하기&gt; 링크를 눌러 추가 신청을 해주세요. 저희 콘텐츠 업데이트 계획에 반영할게요!</p>
						<br/>
						<strong>작품 제안하기</strong>
						<br/>
						<p>보고싶은 작품의 업데이트 소식을 받고싶다면, </p>
						<p>"SETFLIX"에서 해당 작품의 &lt;보고싶어요&gt; 를 클릭해주세요! 업데이트 시 회원님의 SETFLIX 앱에서 알람이 갈거에요 :)</p>
						<br/>
						<strong>애플 결제</strong>
						<p>SETFLIX: 별점을 남기고 코멘트를 작성할 수 있어요.</p>
						<p>SETFLIX: 영화와 드라마를 감상할 수 있어요.</p>
						<br/>
						<img src="image/HvK6efy.png" alt="이미지">
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 결제 승인한 적이 없는데 결제되었어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>* 해지 후에도 현재 구독 중인 이용권의 만료일까지 감상 가능하며, 다음 결제일부터 자동결제 되지 않아요.</p>
						<p>* 결제일 당일에 해지하신 경우 다음 결제 예정일에 반영될 수 있어요.</p>
						<p>* 애플/구글플레이 결제의 경우 웹이 아닌 앱에서 해지를 진행해주세요.</p>
						<br/>
						<strong>[카드 결제/쿠폰 등록/휴대폰 소액 결제]</strong>
						<strong>앱에서 해지</strong>
						<p>1. 마이페이지</p>
						<p>2. 설정</p>
						<p>3. 계정 설정</p>
						<p>4. 하단의 ‘해지하기’ 선택</p>
						<strong>웹에서 해지</strong>
						<p>1. SETFLIX 사이트(play.watcha.net)</p>
						<p>2. 우측 상단의 프로필 아이콘 선택</p>
						<p>3. 설정</p>
						<p>4. ‘해지하기’ 선택</p>
						<br/>
						<strong>[해지 취소하기]</strong>
						<p>앱에서 해지 취소: 마이페이지 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
						<p>웹에서 해지 취소: SETFLIX 사이트(play.watcha.net) > 우측 상단의 프로필 아이콘 선택 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 결제수단을 변경하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>정기 구독 중인데 이용권이 없다고 나오나요? 아래와 같은 사유로 인해 이용권이 보이지 않을 수 있어요.</p>
						<br/>
						<strong>일시적인 오류로 인해 이용권 지급이 안된 경우</strong>
						<p>: SETFLIX 앱 로그아웃 > 로그인 > 이용권 구매하기 화면에서 하단의 [구매내역복원] 선택</p>
						<br/>
						<strong>잔액 부족, 결제 정보 변경, 한도 초과 등 자동 결제가 실패되어 정상적으로 이용권이 지급되지 않은 경우</strong>
						<p>: 다른 결제 수단으로 다시 결제를 진행해주세요.</p>
						<br/>
						<strong>이용권을 구매한 아이디가 아닌 다른 아이디로 로그인한 경우</strong>
						<p>: 로그아웃 후, 이용권을 구매한 아이디로 다시 로그인 해주세요.</p>
						<br/>
						<p>만약 위와 같은 상황이 아니라면 고객센터로 문의 해주세요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 결제가 되지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>카드/휴대폰 결제 중 잔액 부족 등으로 결제가 실패된 경우 SETFLIX pc웹 상단의 '결제수단변경' 버튼을 통해 다시 구독을 진행해주세요.</p>
						<p>* 애플, 구글 결제의 경우 결제 수단 변경은 iTunes 또는 구글 Play Store에서 변경부탁드려요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 법인 카드/알뜰폰/기프트 카드로 결제 가능한가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 SETFLIX에서 쌓은 데이터를 활용해 영화와 드라마를 추천해드려요!</p>
						<br/>
						<p>1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾아요. 누구나 영화나 드라마를 볼 때 자기만의 중요한 기준이 있어요. 예를 들면, "난 영상미나 음악이 중요해… 아</p>
						<p>니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가</p>
						<p>중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있어요. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람</p>
						<p>들이 바로 나와 취향이 비슷한 사람들이에요.</p>
						<br/>
						<p>2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 작품 별로 "내 예상별점"을 만들어요. 나와 취향이 비슷한 사람들이 개별 작품에 매긴 점수는, 아마도 내가 실제로 </p>
						<p>매길 점수와 아주 아주 유사할거에요. 즉 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 작품에 몇 점을 줄지 미리 알 수가 있는 것이죠. SETFLIX는 나와 취향이 비슷한</p>
						<p>사람들의 평가를 종합해서, 자동으로 작품 별 "내 예상별점"을 계산하고 즉시 보여줘요.</p>
						<br/>
						<p>3. "내 예상별점"이 높은 작품들을 추천해요. 이렇게 계산된 예상별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높아요. 따라서 이런 작품들을 </p>
						<p>나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천한답니다.</p>
						<br/>
						<p>어때요? 참 쉽죠! 물론 이건 말로 간단히 풀어 설명한 것이고, 실제 위의 1~3번 과정을 "엄청난 양의 데이터에 대해 실시간으로 오류 없이 정확하게 계산하는 것"은 정말 정</p>
						<p>말 어려운 일이에요.</p>
						<br/>
						<p>SETFLIX는 수 년에 걸쳐 자체 개발한 추천 엔진 '핀셋'을 통해 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 </p>
						<p>개선되고 있어요. 이제 뭐볼지 고민하지 마세요!</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 자동결제는 언제마다 이루어지나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>(주)SETFLIX는 SETFLIX와 SETFLIX 두 서비스를 운영하고 있어요. SETFLIX는 영화, 드라마 평가/추천 전문 서비스이며, SETFLIX는 영화/드라마 감상 서비스에요. SETFLIX와 SETFLIX플</p>
						<p>레이는 연동되어 있어 동일한 계정으로 SETFLIX와 SETFLIX 모두 사용 가능하답니다. 평가 초기화, 코멘트/댓글 작성, 컬렉션 생성은 SETFLIX에서 가능해요.😄 SETFLIX는 앱과 웹을</p>
						<p>지원하고 있어요. 아래와 같이 이용 가능하니 참고해주세요.</p>
						<br/>
						<p>4억 개의 별점 데이터를 바탕으로 내 취향을 분석하는 SETFLIX 이용하기!</p>
						<strong><a href='#'>[앱스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[Play 스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[SETFLIX PC에서 접속하기]</a></strong>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 앱을 삭제하면 결제가 되지 않나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX의 이용권으로 모바일, 테블릿, pc, 맥을 포함한 Chromecast, 안드로이드 TV에서 SETFLIX 작품을 감상하실 수 있도록 지원하고 있어요. 상세한 지원 기기</p>
						<p>는 아래와 같으니 참고 부탁드려요.</p>
						<br/>
						<strong>[ TV 지원 이용권의 상세 지원 목록]</strong>
						<strong>- 16~18년형 삼성 스마트TV</strong>
						<strong>- 16~18년형 LG 스마트TV</strong>
						<p>- skyUHD A+ 상품 가입 시 제공받는 Android TV 셋탑 박스</p>
						<p>- Chromecast(1,2,3세대, Ultra)</p>
						<p>- 크라이저 셋탑 박스(U4X+S)</p>
						<p>- 구글 플레이 스토어가 지원되는 안드로이드 셋탑 박스</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 결제 했는데 이용권이 보이지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX를 사용하기 위한 최소 사양은 아래와 같습니다. 낮은 사양의 버전에서는 SETFLIX가 정상적으로 작동되지 않을 수 있으니 참고부탁드립니다.</p>
						<p> - 안드로이드 버전 4.1.2(젤리빈) 이상</p>
						<br/>
						<p>아래와 같이 일부 기기에서는 제조사 OS 개발 환경에 따라 재생이 제한될 수 있습니다.</p>
						<p> - LG V10(OS 7.0 이상)</p>
						<p> - 블랙베리 키원</p>
						<p> - 갤럭시 탭</p>
						<p> - 레노바 요가 탭</p>
						<p> - 기타 직수입된 외산 기기</p>
						<p>* 컨텐츠 보호를 위해 루팅된 폰에서는 모든 영상의 재생이 제한될 수 있습니다. </p>
						<br/>
						<p>만약 위 내용과 상관없이 재생이 되지 않으신다면 아래와 같이 진행해주세요. 확인 후에도 재생이 되지 않는다면 고객센터로 문의부탁드립니다.</p>
						<br/>
						<p>1. 기기 펌웨어를 최신 버전으로 업데이트</p>
						<p>기기의 설정 >  휴대폰 정보 > 소프트웨어 업데이트 > 최신 버전으로 업데이트</p>
						<br/>
						<p>2. 데이터 삭제 후 재설치</p>
						<p>SETFLIX 앱> 설정 > 캐시 삭제 > 앱 재설치</p>
						<br/>
						<p>3. 기기 재부팅 후 다시 재생 시도</p>
					</div>
				</div>
			</div>
		  </div>
		  <div id="tabs-3">
		    <div class="accordion">
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 해지는 어떻게 하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>일부 안드로이드 기기에서 앱 실행 시, 혹은 영상 재생 시 회색화면이 뜨면서 진행되지 않는 경우가 발생하고 있어요.</p>
						<p>회색 화면이 뜨는 경우 '기기 재부팅'을 시도해주세요. </p>
						<p>기기 재부팅 이후에도 동일한 문제가 발생한다면 고객센터에 문의해주세요. </p>
						<br/>
						<p>이용에 불편을 드려 죄송합니다.</p>
						<p>해당 오류가 발생하지 않도록 원인과 해결방안을 모색하고 있으며, 빠른 시일내에 수정되도록 최선을 다하겠습니다.</p>	
					</div>
				</div>  
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 이용권이 없다고 나와요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<strong>구글플레이 결제</strong>
						<p>구독 중에 이용권 변경은 어려워요. 기존 구독 해지 신청 후 재 결제하실 때 변경 원하시는 이용권으로 구매해주세요.</p>
						<p>* 해지하셔도 기존 이용권 만료일까지 감상 가능해요.</p>
						<p>* 해지 후 재구매 시 이전에 서비스되었던 일부 이용권은 구매가 불가능할 수도 있는 점 참고해주세요.</p>
						<br/>
						<strong>구글플레이 결제 해지 방법</strong>
						<p>SETFLIX 앱 마이페이지 > 설정 > 계정 설정 > 해지하기</p>
						<br/>
						<br/>
						<strong>애플 결제</strong>
						<p>애플 결제는 애플 구독 페이지에서 원하시는 이용권 신청하시면 '다음 재 결제일'에 새롭게 신청한 이용권으로 구독되어요.</p>
						<p>ex) 11/10 1개월 이용권 구독 신청 후 11/15 3개월 이용권으로 변경 신청하시면, 다음 결제일인 12/10 3개월 이용권으로 구독이 시작돼요.</p>
						<p>** 기본 이용권, TV 이용권은 현재 판매 중단되었으니 '이용권' 으로 변경해주세요.</p>
						<br/>
						<strong>애플 결제 이용권 변경 방법</strong>
						<p>1. 아이폰 설정의 [iTunes 및 App Store]</p>
						<p>2. Apple ID : ***@***.*** 선택</p>
						<p>3. [Apple ID 보기] 선택 후 로그인</p>
						<p>4. [구독] 선택 (구독한 사항이 없으면 표시되지 않습니다)</p>
						<p>5. SETFLIX 선택</p>
						<p>6. 원하는 이용권 선택 후 구독</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 해지 신청했는데 이용권이 아직 있어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>보고싶은 영화나 TV 프로그램이 SETFLIX에 없다면,</p>
						<p>아래 &lt;작품 제안하기&gt; 링크를 눌러 추가 신청을 해주세요. 저희 콘텐츠 업데이트 계획에 반영할게요!</p>
						<br/>
						<strong>작품 제안하기</strong>
						<br/>
						<p>보고싶은 작품의 업데이트 소식을 받고싶다면, </p>
						<p>"SETFLIX"에서 해당 작품의 &lt;보고싶어요&gt; 를 클릭해주세요! 업데이트 시 회원님의 SETFLIX 앱에서 알람이 갈거에요 :)</p>
						<br/>
						<strong>애플 결제</strong>
						<p>SETFLIX: 별점을 남기고 코멘트를 작성할 수 있어요.</p>
						<p>SETFLIX: 영화와 드라마를 감상할 수 있어요.</p>
						<br/>
						<img src="image/HvK6efy.png" alt="이미지">
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 결제취소(환불) 하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>* 해지 후에도 현재 구독 중인 이용권의 만료일까지 감상 가능하며, 다음 결제일부터 자동결제 되지 않아요.</p>
						<p>* 결제일 당일에 해지하신 경우 다음 결제 예정일에 반영될 수 있어요.</p>
						<p>* 애플/구글플레이 결제의 경우 웹이 아닌 앱에서 해지를 진행해주세요.</p>
						<br/>
						<strong>[카드 결제/쿠폰 등록/휴대폰 소액 결제]</strong>
						<strong>앱에서 해지</strong>
						<p>1. 마이페이지</p>
						<p>2. 설정</p>
						<p>3. 계정 설정</p>
						<p>4. 하단의 ‘해지하기’ 선택</p>
						<strong>웹에서 해지</strong>
						<p>1. SETFLIX 사이트(play.watcha.net)</p>
						<p>2. 우측 상단의 프로필 아이콘 선택</p>
						<p>3. 설정</p>
						<p>4. ‘해지하기’ 선택</p>
						<br/>
						<strong>[해지 취소하기]</strong>
						<p>앱에서 해지 취소: 마이페이지 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
						<p>웹에서 해지 취소: SETFLIX 사이트(play.watcha.net) > 우측 상단의 프로필 아이콘 선택 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 이용권이 없다고 나와요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>정기 구독 중인데 이용권이 없다고 나오나요? 아래와 같은 사유로 인해 이용권이 보이지 않을 수 있어요.</p>
						<br/>
						<strong>일시적인 오류로 인해 이용권 지급이 안된 경우</strong>
						<p>: SETFLIX 앱 로그아웃 > 로그인 > 이용권 구매하기 화면에서 하단의 [구매내역복원] 선택</p>
						<br/>
						<strong>잔액 부족, 결제 정보 변경, 한도 초과 등 자동 결제가 실패되어 정상적으로 이용권이 지급되지 않은 경우</strong>
						<p>: 다른 결제 수단으로 다시 결제를 진행해주세요.</p>
						<br/>
						<strong>이용권을 구매한 아이디가 아닌 다른 아이디로 로그인한 경우</strong>
						<p>: 로그아웃 후, 이용권을 구매한 아이디로 다시 로그인 해주세요.</p>
						<br/>
						<p>만약 위와 같은 상황이 아니라면 고객센터로 문의 해주세요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 앱을 삭제하면 결제가 되지 않나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>카드/휴대폰 결제 중 잔액 부족 등으로 결제가 실패된 경우 SETFLIX pc웹 상단의 '결제수단변경' 버튼을 통해 다시 구독을 진행해주세요.</p>
						<p>* 애플, 구글 결제의 경우 결제 수단 변경은 iTunes 또는 구글 Play Store에서 변경부탁드려요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 앱에서 [해지취소] 했는데 다시 결제하라는 팝업이 떠요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 SETFLIX에서 쌓은 데이터를 활용해 영화와 드라마를 추천해드려요!</p>
						<br/>
						<p>1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾아요. 누구나 영화나 드라마를 볼 때 자기만의 중요한 기준이 있어요. 예를 들면, "난 영상미나 음악이 중요해… 아</p>
						<p>니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가</p>
						<p>중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있어요. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람</p>
						<p>들이 바로 나와 취향이 비슷한 사람들이에요.</p>
						<br/>
						<p>2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 작품 별로 "내 예상별점"을 만들어요. 나와 취향이 비슷한 사람들이 개별 작품에 매긴 점수는, 아마도 내가 실제로 </p>
						<p>매길 점수와 아주 아주 유사할거에요. 즉 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 작품에 몇 점을 줄지 미리 알 수가 있는 것이죠. SETFLIX는 나와 취향이 비슷한</p>
						<p>사람들의 평가를 종합해서, 자동으로 작품 별 "내 예상별점"을 계산하고 즉시 보여줘요.</p>
						<br/>
						<p>3. "내 예상별점"이 높은 작품들을 추천해요. 이렇게 계산된 예상별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높아요. 따라서 이런 작품들을 </p>
						<p>나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천한답니다.</p>
						<br/>
						<p>어때요? 참 쉽죠! 물론 이건 말로 간단히 풀어 설명한 것이고, 실제 위의 1~3번 과정을 "엄청난 양의 데이터에 대해 실시간으로 오류 없이 정확하게 계산하는 것"은 정말 정</p>
						<p>말 어려운 일이에요.</p>
						<br/>
						<p>SETFLIX는 수 년에 걸쳐 자체 개발한 추천 엔진 '핀셋'을 통해 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 </p>
						<p>개선되고 있어요. 이제 뭐볼지 고민하지 마세요!</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 첫 구독 무료 이벤트로 이용권 구매했는데 결제되었어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>(주)SETFLIX는 SETFLIX와 SETFLIX 두 서비스를 운영하고 있어요. SETFLIX는 영화, 드라마 평가/추천 전문 서비스이며, SETFLIX는 영화/드라마 감상 서비스에요. SETFLIX와 SETFLIX플</p>
						<p>레이는 연동되어 있어 동일한 계정으로 SETFLIX와 SETFLIX 모두 사용 가능하답니다. 평가 초기화, 코멘트/댓글 작성, 컬렉션 생성은 SETFLIX에서 가능해요.😄 SETFLIX는 앱과 웹을</p>
						<p>지원하고 있어요. 아래와 같이 이용 가능하니 참고해주세요.</p>
						<br/>
						<p>4억 개의 별점 데이터를 바탕으로 내 취향을 분석하는 SETFLIX 이용하기!</p>
						<strong><a href='#'>[앱스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[Play 스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[SETFLIX PC에서 접속하기]</a></strong>
					</div>
				</div>
			</div>
		  </div>
		  <div id="tabs-4">
		    <div class="accordion">
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 쿠폰이 등록되지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>일부 안드로이드 기기에서 앱 실행 시, 혹은 영상 재생 시 회색화면이 뜨면서 진행되지 않는 경우가 발생하고 있어요.</p>
						<p>회색 화면이 뜨는 경우 '기기 재부팅'을 시도해주세요. </p>
						<p>기기 재부팅 이후에도 동일한 문제가 발생한다면 고객센터에 문의해주세요. </p>
						<br/>
						<p>이용에 불편을 드려 죄송합니다.</p>
						<p>해당 오류가 발생하지 않도록 원인과 해결방안을 모색하고 있으며, 빠른 시일내에 수정되도록 최선을 다하겠습니다.</p>	
					</div>
				</div>  
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 이용권이 없다고 나와요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<strong>구글플레이 결제</strong>
						<p>구독 중에 이용권 변경은 어려워요. 기존 구독 해지 신청 후 재 결제하실 때 변경 원하시는 이용권으로 구매해주세요.</p>
						<p>* 해지하셔도 기존 이용권 만료일까지 감상 가능해요.</p>
						<p>* 해지 후 재구매 시 이전에 서비스되었던 일부 이용권은 구매가 불가능할 수도 있는 점 참고해주세요.</p>
						<br/>
						<strong>구글플레이 결제 해지 방법</strong>
						<p>SETFLIX 앱 마이페이지 > 설정 > 계정 설정 > 해지하기</p>
						<br/>
						<br/>
						<strong>애플 결제</strong>
						<p>애플 결제는 애플 구독 페이지에서 원하시는 이용권 신청하시면 '다음 재 결제일'에 새롭게 신청한 이용권으로 구독되어요.</p>
						<p>ex) 11/10 1개월 이용권 구독 신청 후 11/15 3개월 이용권으로 변경 신청하시면, 다음 결제일인 12/10 3개월 이용권으로 구독이 시작돼요.</p>
						<p>** 기본 이용권, TV 이용권은 현재 판매 중단되었으니 '이용권' 으로 변경해주세요.</p>
						<br/>
						<strong>애플 결제 이용권 변경 방법</strong>
						<p>1. 아이폰 설정의 [iTunes 및 App Store]</p>
						<p>2. Apple ID : ***@***.*** 선택</p>
						<p>3. [Apple ID 보기] 선택 후 로그인</p>
						<p>4. [구독] 선택 (구독한 사항이 없으면 표시되지 않습니다)</p>
						<p>5. SETFLIX 선택</p>
						<p>6. 원하는 이용권 선택 후 구독</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. SETFLIX 이용권을 구매하면 어떤 서비스를 받을 수 있나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>보고싶은 영화나 TV 프로그램이 SETFLIX에 없다면,</p>
						<p>아래 &lt;작품 제안하기&gt; 링크를 눌러 추가 신청을 해주세요. 저희 콘텐츠 업데이트 계획에 반영할게요!</p>
						<br/>
						<strong>작품 제안하기</strong>
						<br/>
						<p>보고싶은 작품의 업데이트 소식을 받고싶다면, </p>
						<p>"SETFLIX"에서 해당 작품의 &lt;보고싶어요&gt; 를 클릭해주세요! 업데이트 시 회원님의 SETFLIX 앱에서 알람이 갈거에요 :)</p>
						<br/>
						<strong>애플 결제</strong>
						<p>SETFLIX: 별점을 남기고 코멘트를 작성할 수 있어요.</p>
						<p>SETFLIX: 영화와 드라마를 감상할 수 있어요.</p>
						<br/>
						<img src="image/HvK6efy.png" alt="이미지">
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 구글/애플 결제와 카드/휴대폰 결제한 이용권은 다른가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>* 해지 후에도 현재 구독 중인 이용권의 만료일까지 감상 가능하며, 다음 결제일부터 자동결제 되지 않아요.</p>
						<p>* 결제일 당일에 해지하신 경우 다음 결제 예정일에 반영될 수 있어요.</p>
						<p>* 애플/구글플레이 결제의 경우 웹이 아닌 앱에서 해지를 진행해주세요.</p>
						<br/>
						<strong>[카드 결제/쿠폰 등록/휴대폰 소액 결제]</strong>
						<strong>앱에서 해지</strong>
						<p>1. 마이페이지</p>
						<p>2. 설정</p>
						<p>3. 계정 설정</p>
						<p>4. 하단의 ‘해지하기’ 선택</p>
						<strong>웹에서 해지</strong>
						<p>1. SETFLIX 사이트(play.watcha.net)</p>
						<p>2. 우측 상단의 프로필 아이콘 선택</p>
						<p>3. 설정</p>
						<p>4. ‘해지하기’ 선택</p>
						<br/>
						<strong>[해지 취소하기]</strong>
						<p>앱에서 해지 취소: 마이페이지 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
						<p>웹에서 해지 취소: SETFLIX 사이트(play.watcha.net) > 우측 상단의 프로필 아이콘 선택 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 쿠폰 등록은 어떻게 하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>정기 구독 중인데 이용권이 없다고 나오나요? 아래와 같은 사유로 인해 이용권이 보이지 않을 수 있어요.</p>
						<br/>
						<strong>일시적인 오류로 인해 이용권 지급이 안된 경우</strong>
						<p>: SETFLIX 앱 로그아웃 > 로그인 > 이용권 구매하기 화면에서 하단의 [구매내역복원] 선택</p>
						<br/>
						<strong>잔액 부족, 결제 정보 변경, 한도 초과 등 자동 결제가 실패되어 정상적으로 이용권이 지급되지 않은 경우</strong>
						<p>: 다른 결제 수단으로 다시 결제를 진행해주세요.</p>
						<br/>
						<strong>이용권을 구매한 아이디가 아닌 다른 아이디로 로그인한 경우</strong>
						<p>: 로그아웃 후, 이용권을 구매한 아이디로 다시 로그인 해주세요.</p>
						<br/>
						<p>만약 위와 같은 상황이 아니라면 고객센터로 문의 해주세요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 이용권 만료일을 어떻게 확인할 수 있나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>카드/휴대폰 결제 중 잔액 부족 등으로 결제가 실패된 경우 SETFLIX pc웹 상단의 '결제수단변경' 버튼을 통해 다시 구독을 진행해주세요.</p>
						<p>* 애플, 구글 결제의 경우 결제 수단 변경은 iTunes 또는 구글 Play Store에서 변경부탁드려요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 해지 후 이용권 만료일이 지났는데 계속 재생이 돼요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 SETFLIX에서 쌓은 데이터를 활용해 영화와 드라마를 추천해드려요!</p>
						<br/>
						<p>1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾아요. 누구나 영화나 드라마를 볼 때 자기만의 중요한 기준이 있어요. 예를 들면, "난 영상미나 음악이 중요해… 아</p>
						<p>니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가</p>
						<p>중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있어요. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람</p>
						<p>들이 바로 나와 취향이 비슷한 사람들이에요.</p>
						<br/>
						<p>2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 작품 별로 "내 예상별점"을 만들어요. 나와 취향이 비슷한 사람들이 개별 작품에 매긴 점수는, 아마도 내가 실제로 </p>
						<p>매길 점수와 아주 아주 유사할거에요. 즉 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 작품에 몇 점을 줄지 미리 알 수가 있는 것이죠. SETFLIX는 나와 취향이 비슷한</p>
						<p>사람들의 평가를 종합해서, 자동으로 작품 별 "내 예상별점"을 계산하고 즉시 보여줘요.</p>
						<br/>
						<p>3. "내 예상별점"이 높은 작품들을 추천해요. 이렇게 계산된 예상별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높아요. 따라서 이런 작품들을 </p>
						<p>나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천한답니다.</p>
						<br/>
						<p>어때요? 참 쉽죠! 물론 이건 말로 간단히 풀어 설명한 것이고, 실제 위의 1~3번 과정을 "엄청난 양의 데이터에 대해 실시간으로 오류 없이 정확하게 계산하는 것"은 정말 정</p>
						<p>말 어려운 일이에요.</p>
						<br/>
						<p>SETFLIX는 수 년에 걸쳐 자체 개발한 추천 엔진 '핀셋'을 통해 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 </p>
						<p>개선되고 있어요. 이제 뭐볼지 고민하지 마세요!</p>
					</div>
				</div>
			</div>
		  </div>
		  <div id="tabs-5">
		    <div class="accordion">
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 스마트TV(셋톱 박스)에서 OTP 숫자 6자리는 어디에 입력하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>일부 안드로이드 기기에서 앱 실행 시, 혹은 영상 재생 시 회색화면이 뜨면서 진행되지 않는 경우가 발생하고 있어요.</p>
						<p>회색 화면이 뜨는 경우 '기기 재부팅'을 시도해주세요. </p>
						<p>기기 재부팅 이후에도 동일한 문제가 발생한다면 고객센터에 문의해주세요. </p>
						<br/>
						<p>이용에 불편을 드려 죄송합니다.</p>
						<p>해당 오류가 발생하지 않도록 원인과 해결방안을 모색하고 있으며, 빠른 시일내에 수정되도록 최선을 다하겠습니다.</p>	
					</div>
				</div>  
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 가입한 이메일 주소와 비밀번호를 변경하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<strong>구글플레이 결제</strong>
						<p>구독 중에 이용권 변경은 어려워요. 기존 구독 해지 신청 후 재 결제하실 때 변경 원하시는 이용권으로 구매해주세요.</p>
						<p>* 해지하셔도 기존 이용권 만료일까지 감상 가능해요.</p>
						<p>* 해지 후 재구매 시 이전에 서비스되었던 일부 이용권은 구매가 불가능할 수도 있는 점 참고해주세요.</p>
						<br/>
						<strong>구글플레이 결제 해지 방법</strong>
						<p>SETFLIX 앱 마이페이지 > 설정 > 계정 설정 > 해지하기</p>
						<br/>
						<br/>
						<strong>애플 결제</strong>
						<p>애플 결제는 애플 구독 페이지에서 원하시는 이용권 신청하시면 '다음 재 결제일'에 새롭게 신청한 이용권으로 구독되어요.</p>
						<p>ex) 11/10 1개월 이용권 구독 신청 후 11/15 3개월 이용권으로 변경 신청하시면, 다음 결제일인 12/10 3개월 이용권으로 구독이 시작돼요.</p>
						<p>** 기본 이용권, TV 이용권은 현재 판매 중단되었으니 '이용권' 으로 변경해주세요.</p>
						<br/>
						<strong>애플 결제 이용권 변경 방법</strong>
						<p>1. 아이폰 설정의 [iTunes 및 App Store]</p>
						<p>2. Apple ID : ***@***.*** 선택</p>
						<p>3. [Apple ID 보기] 선택 후 로그인</p>
						<p>4. [구독] 선택 (구독한 사항이 없으면 표시되지 않습니다)</p>
						<p>5. SETFLIX 선택</p>
						<p>6. 원하는 이용권 선택 후 구독</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 이메일주소/비밀번호가 기억나지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>보고싶은 영화나 TV 프로그램이 SETFLIX에 없다면,</p>
						<p>아래 &lt;작품 제안하기&gt; 링크를 눌러 추가 신청을 해주세요. 저희 콘텐츠 업데이트 계획에 반영할게요!</p>
						<br/>
						<strong>작품 제안하기</strong>
						<br/>
						<p>보고싶은 작품의 업데이트 소식을 받고싶다면, </p>
						<p>"SETFLIX"에서 해당 작품의 &lt;보고싶어요&gt; 를 클릭해주세요! 업데이트 시 회원님의 SETFLIX 앱에서 알람이 갈거에요 :)</p>
						<br/>
						<strong>애플 결제</strong>
						<p>SETFLIX: 별점을 남기고 코멘트를 작성할 수 있어요.</p>
						<p>SETFLIX: 영화와 드라마를 감상할 수 있어요.</p>
						<br/>
						<img src="image/HvK6efy.png" alt="이미지">
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 페이스북으로 로그인을 할 수 없어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>* 해지 후에도 현재 구독 중인 이용권의 만료일까지 감상 가능하며, 다음 결제일부터 자동결제 되지 않아요.</p>
						<p>* 결제일 당일에 해지하신 경우 다음 결제 예정일에 반영될 수 있어요.</p>
						<p>* 애플/구글플레이 결제의 경우 웹이 아닌 앱에서 해지를 진행해주세요.</p>
						<br/>
						<strong>[카드 결제/쿠폰 등록/휴대폰 소액 결제]</strong>
						<strong>앱에서 해지</strong>
						<p>1. 마이페이지</p>
						<p>2. 설정</p>
						<p>3. 계정 설정</p>
						<p>4. 하단의 ‘해지하기’ 선택</p>
						<strong>웹에서 해지</strong>
						<p>1. SETFLIX 사이트(play.watcha.net)</p>
						<p>2. 우측 상단의 프로필 아이콘 선택</p>
						<p>3. 설정</p>
						<p>4. ‘해지하기’ 선택</p>
						<br/>
						<strong>[해지 취소하기]</strong>
						<p>앱에서 해지 취소: 마이페이지 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
						<p>웹에서 해지 취소: SETFLIX 사이트(play.watcha.net) > 우측 상단의 프로필 아이콘 선택 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 휴대폰 번호 이외에 본인(성인)인증을 할 수 있는 방법은 없나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>정기 구독 중인데 이용권이 없다고 나오나요? 아래와 같은 사유로 인해 이용권이 보이지 않을 수 있어요.</p>
						<br/>
						<strong>일시적인 오류로 인해 이용권 지급이 안된 경우</strong>
						<p>: SETFLIX 앱 로그아웃 > 로그인 > 이용권 구매하기 화면에서 하단의 [구매내역복원] 선택</p>
						<br/>
						<strong>잔액 부족, 결제 정보 변경, 한도 초과 등 자동 결제가 실패되어 정상적으로 이용권이 지급되지 않은 경우</strong>
						<p>: 다른 결제 수단으로 다시 결제를 진행해주세요.</p>
						<br/>
						<strong>이용권을 구매한 아이디가 아닌 다른 아이디로 로그인한 경우</strong>
						<p>: 로그아웃 후, 이용권을 구매한 아이디로 다시 로그인 해주세요.</p>
						<br/>
						<p>만약 위와 같은 상황이 아니라면 고객센터로 문의 해주세요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 탈퇴하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>카드/휴대폰 결제 중 잔액 부족 등으로 결제가 실패된 경우 SETFLIX pc웹 상단의 '결제수단변경' 버튼을 통해 다시 구독을 진행해주세요.</p>
						<p>* 애플, 구글 결제의 경우 결제 수단 변경은 iTunes 또는 구글 Play Store에서 변경부탁드려요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 탈퇴한 이메일 계정을 다시 복구할 수 있나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 SETFLIX에서 쌓은 데이터를 활용해 영화와 드라마를 추천해드려요!</p>
						<br/>
						<p>1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾아요. 누구나 영화나 드라마를 볼 때 자기만의 중요한 기준이 있어요. 예를 들면, "난 영상미나 음악이 중요해… 아</p>
						<p>니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가</p>
						<p>중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있어요. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람</p>
						<p>들이 바로 나와 취향이 비슷한 사람들이에요.</p>
						<br/>
						<p>2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 작품 별로 "내 예상별점"을 만들어요. 나와 취향이 비슷한 사람들이 개별 작품에 매긴 점수는, 아마도 내가 실제로 </p>
						<p>매길 점수와 아주 아주 유사할거에요. 즉 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 작품에 몇 점을 줄지 미리 알 수가 있는 것이죠. SETFLIX는 나와 취향이 비슷한</p>
						<p>사람들의 평가를 종합해서, 자동으로 작품 별 "내 예상별점"을 계산하고 즉시 보여줘요.</p>
						<br/>
						<p>3. "내 예상별점"이 높은 작품들을 추천해요. 이렇게 계산된 예상별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높아요. 따라서 이런 작품들을 </p>
						<p>나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천한답니다.</p>
						<br/>
						<p>어때요? 참 쉽죠! 물론 이건 말로 간단히 풀어 설명한 것이고, 실제 위의 1~3번 과정을 "엄청난 양의 데이터에 대해 실시간으로 오류 없이 정확하게 계산하는 것"은 정말 정</p>
						<p>말 어려운 일이에요.</p>
						<br/>
						<p>SETFLIX는 수 년에 걸쳐 자체 개발한 추천 엔진 '핀셋'을 통해 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 </p>
						<p>개선되고 있어요. 이제 뭐볼지 고민하지 마세요!</p>
					</div>
				</div>
			</div>
		  </div>
		  <div id="tabs-6">
		    <div class="accordion">
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 새로운 작품 추가를 제안하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>일부 안드로이드 기기에서 앱 실행 시, 혹은 영상 재생 시 회색화면이 뜨면서 진행되지 않는 경우가 발생하고 있어요.</p>
						<p>회색 화면이 뜨는 경우 '기기 재부팅'을 시도해주세요. </p>
						<p>기기 재부팅 이후에도 동일한 문제가 발생한다면 고객센터에 문의해주세요. </p>
						<br/>
						<p>이용에 불편을 드려 죄송합니다.</p>
						<p>해당 오류가 발생하지 않도록 원인과 해결방안을 모색하고 있으며, 빠른 시일내에 수정되도록 최선을 다하겠습니다.</p>	
					</div>
				</div>  
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 영어 자막을 요청하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<strong>구글플레이 결제</strong>
						<p>구독 중에 이용권 변경은 어려워요. 기존 구독 해지 신청 후 재 결제하실 때 변경 원하시는 이용권으로 구매해주세요.</p>
						<p>* 해지하셔도 기존 이용권 만료일까지 감상 가능해요.</p>
						<p>* 해지 후 재구매 시 이전에 서비스되었던 일부 이용권은 구매가 불가능할 수도 있는 점 참고해주세요.</p>
						<br/>
						<strong>구글플레이 결제 해지 방법</strong>
						<p>SETFLIX 앱 마이페이지 > 설정 > 계정 설정 > 해지하기</p>
						<br/>
						<br/>
						<strong>애플 결제</strong>
						<p>애플 결제는 애플 구독 페이지에서 원하시는 이용권 신청하시면 '다음 재 결제일'에 새롭게 신청한 이용권으로 구독되어요.</p>
						<p>ex) 11/10 1개월 이용권 구독 신청 후 11/15 3개월 이용권으로 변경 신청하시면, 다음 결제일인 12/10 3개월 이용권으로 구독이 시작돼요.</p>
						<p>** 기본 이용권, TV 이용권은 현재 판매 중단되었으니 '이용권' 으로 변경해주세요.</p>
						<br/>
						<strong>애플 결제 이용권 변경 방법</strong>
						<p>1. 아이폰 설정의 [iTunes 및 App Store]</p>
						<p>2. Apple ID : ***@***.*** 선택</p>
						<p>3. [Apple ID 보기] 선택 후 로그인</p>
						<p>4. [구독] 선택 (구독한 사항이 없으면 표시되지 않습니다)</p>
						<p>5. SETFLIX 선택</p>
						<p>6. 원하는 이용권 선택 후 구독</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 영상/자막/내용의 문제를 제보하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>보고싶은 영화나 TV 프로그램이 SETFLIX에 없다면,</p>
						<p>아래 &lt;작품 제안하기&gt; 링크를 눌러 추가 신청을 해주세요. 저희 콘텐츠 업데이트 계획에 반영할게요!</p>
						<br/>
						<strong>작품 제안하기</strong>
						<br/>
						<p>보고싶은 작품의 업데이트 소식을 받고싶다면, </p>
						<p>"SETFLIX"에서 해당 작품의 &lt;보고싶어요&gt; 를 클릭해주세요! 업데이트 시 회원님의 SETFLIX 앱에서 알람이 갈거에요 :)</p>
						<br/>
						<strong>애플 결제</strong>
						<p>SETFLIX: 별점을 남기고 코멘트를 작성할 수 있어요.</p>
						<p>SETFLIX: 영화와 드라마를 감상할 수 있어요.</p>
						<br/>
						<img src="image/HvK6efy.png" alt="이미지">
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 영어자막 콘텐츠는 어디서 볼 수 있나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>* 해지 후에도 현재 구독 중인 이용권의 만료일까지 감상 가능하며, 다음 결제일부터 자동결제 되지 않아요.</p>
						<p>* 결제일 당일에 해지하신 경우 다음 결제 예정일에 반영될 수 있어요.</p>
						<p>* 애플/구글플레이 결제의 경우 웹이 아닌 앱에서 해지를 진행해주세요.</p>
						<br/>
						<strong>[카드 결제/쿠폰 등록/휴대폰 소액 결제]</strong>
						<strong>앱에서 해지</strong>
						<p>1. 마이페이지</p>
						<p>2. 설정</p>
						<p>3. 계정 설정</p>
						<p>4. 하단의 ‘해지하기’ 선택</p>
						<strong>웹에서 해지</strong>
						<p>1. SETFLIX 사이트(play.watcha.net)</p>
						<p>2. 우측 상단의 프로필 아이콘 선택</p>
						<p>3. 설정</p>
						<p>4. ‘해지하기’ 선택</p>
						<br/>
						<strong>[해지 취소하기]</strong>
						<p>앱에서 해지 취소: 마이페이지 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
						<p>웹에서 해지 취소: SETFLIX 사이트(play.watcha.net) > 우측 상단의 프로필 아이콘 선택 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 보고 있던 콘텐츠가 사라졌어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>정기 구독 중인데 이용권이 없다고 나오나요? 아래와 같은 사유로 인해 이용권이 보이지 않을 수 있어요.</p>
						<br/>
						<strong>일시적인 오류로 인해 이용권 지급이 안된 경우</strong>
						<p>: SETFLIX 앱 로그아웃 > 로그인 > 이용권 구매하기 화면에서 하단의 [구매내역복원] 선택</p>
						<br/>
						<strong>잔액 부족, 결제 정보 변경, 한도 초과 등 자동 결제가 실패되어 정상적으로 이용권이 지급되지 않은 경우</strong>
						<p>: 다른 결제 수단으로 다시 결제를 진행해주세요.</p>
						<br/>
						<strong>이용권을 구매한 아이디가 아닌 다른 아이디로 로그인한 경우</strong>
						<p>: 로그아웃 후, 이용권을 구매한 아이디로 다시 로그인 해주세요.</p>
						<br/>
						<p>만약 위와 같은 상황이 아니라면 고객센터로 문의 해주세요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 더빙 애니메이션은 제공하고 있지 않나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>카드/휴대폰 결제 중 잔액 부족 등으로 결제가 실패된 경우 SETFLIX pc웹 상단의 '결제수단변경' 버튼을 통해 다시 구독을 진행해주세요.</p>
						<p>* 애플, 구글 결제의 경우 결제 수단 변경은 iTunes 또는 구글 Play Store에서 변경부탁드려요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 영상에 모자이크를 없앨 수 없나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 SETFLIX에서 쌓은 데이터를 활용해 영화와 드라마를 추천해드려요!</p>
						<br/>
						<p>1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾아요. 누구나 영화나 드라마를 볼 때 자기만의 중요한 기준이 있어요. 예를 들면, "난 영상미나 음악이 중요해… 아</p>
						<p>니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가</p>
						<p>중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있어요. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람</p>
						<p>들이 바로 나와 취향이 비슷한 사람들이에요.</p>
						<br/>
						<p>2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 작품 별로 "내 예상별점"을 만들어요. 나와 취향이 비슷한 사람들이 개별 작품에 매긴 점수는, 아마도 내가 실제로 </p>
						<p>매길 점수와 아주 아주 유사할거에요. 즉 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 작품에 몇 점을 줄지 미리 알 수가 있는 것이죠. SETFLIX는 나와 취향이 비슷한</p>
						<p>사람들의 평가를 종합해서, 자동으로 작품 별 "내 예상별점"을 계산하고 즉시 보여줘요.</p>
						<br/>
						<p>3. "내 예상별점"이 높은 작품들을 추천해요. 이렇게 계산된 예상별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높아요. 따라서 이런 작품들을 </p>
						<p>나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천한답니다.</p>
						<br/>
						<p>어때요? 참 쉽죠! 물론 이건 말로 간단히 풀어 설명한 것이고, 실제 위의 1~3번 과정을 "엄청난 양의 데이터에 대해 실시간으로 오류 없이 정확하게 계산하는 것"은 정말 정</p>
						<p>말 어려운 일이에요.</p>
						<br/>
						<p>SETFLIX는 수 년에 걸쳐 자체 개발한 추천 엔진 '핀셋'을 통해 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 </p>
						<p>개선되고 있어요. 이제 뭐볼지 고민하지 마세요!</p>
					</div>
				</div>
			</div>
		  </div>
		  <div id="tabs-7">
		    <div class="accordion">
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 안드로이드 기기에서 회색 화면이 뜨면서 앱 실행 혹은 재생이 안돼요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>일부 안드로이드 기기에서 앱 실행 시, 혹은 영상 재생 시 회색화면이 뜨면서 진행되지 않는 경우가 발생하고 있어요.</p>
						<p>회색 화면이 뜨는 경우 '기기 재부팅'을 시도해주세요. </p>
						<p>기기 재부팅 이후에도 동일한 문제가 발생한다면 고객센터에 문의해주세요. </p>
						<br/>
						<p>이용에 불편을 드려 죄송합니다.</p>
						<p>해당 오류가 발생하지 않도록 원인과 해결방안을 모색하고 있으며, 빠른 시일내에 수정되도록 최선을 다하겠습니다.</p>	
					</div>
				</div>  
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 빔 프로젝터 혹은 미러링으로 감상 가능한가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<strong>구글플레이 결제</strong>
						<p>구독 중에 이용권 변경은 어려워요. 기존 구독 해지 신청 후 재 결제하실 때 변경 원하시는 이용권으로 구매해주세요.</p>
						<p>* 해지하셔도 기존 이용권 만료일까지 감상 가능해요.</p>
						<p>* 해지 후 재구매 시 이전에 서비스되었던 일부 이용권은 구매가 불가능할 수도 있는 점 참고해주세요.</p>
						<br/>
						<strong>구글플레이 결제 해지 방법</strong>
						<p>SETFLIX 앱 마이페이지 > 설정 > 계정 설정 > 해지하기</p>
						<br/>
						<br/>
						<strong>애플 결제</strong>
						<p>애플 결제는 애플 구독 페이지에서 원하시는 이용권 신청하시면 '다음 재 결제일'에 새롭게 신청한 이용권으로 구독되어요.</p>
						<p>ex) 11/10 1개월 이용권 구독 신청 후 11/15 3개월 이용권으로 변경 신청하시면, 다음 결제일인 12/10 3개월 이용권으로 구독이 시작돼요.</p>
						<p>** 기본 이용권, TV 이용권은 현재 판매 중단되었으니 '이용권' 으로 변경해주세요.</p>
						<br/>
						<strong>애플 결제 이용권 변경 방법</strong>
						<p>1. 아이폰 설정의 [iTunes 및 App Store]</p>
						<p>2. Apple ID : ***@***.*** 선택</p>
						<p>3. [Apple ID 보기] 선택 후 로그인</p>
						<p>4. [구독] 선택 (구독한 사항이 없으면 표시되지 않습니다)</p>
						<p>5. SETFLIX 선택</p>
						<p>6. 원하는 이용권 선택 후 구독</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 스마트 TV에서 재생이 되지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>보고싶은 영화나 TV 프로그램이 SETFLIX에 없다면,</p>
						<p>아래 &lt;작품 제안하기&gt; 링크를 눌러 추가 신청을 해주세요. 저희 콘텐츠 업데이트 계획에 반영할게요!</p>
						<br/>
						<strong>작품 제안하기</strong>
						<br/>
						<p>보고싶은 작품의 업데이트 소식을 받고싶다면, </p>
						<p>"SETFLIX"에서 해당 작품의 &lt;보고싶어요&gt; 를 클릭해주세요! 업데이트 시 회원님의 SETFLIX 앱에서 알람이 갈거에요 :)</p>
						<br/>
						<strong>애플 결제</strong>
						<p>SETFLIX: 별점을 남기고 코멘트를 작성할 수 있어요.</p>
						<p>SETFLIX: 영화와 드라마를 감상할 수 있어요.</p>
						<br/>
						<img src="image/HvK6efy.png" alt="이미지">
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 다중 자막으로 감상이 가능한가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>* 해지 후에도 현재 구독 중인 이용권의 만료일까지 감상 가능하며, 다음 결제일부터 자동결제 되지 않아요.</p>
						<p>* 결제일 당일에 해지하신 경우 다음 결제 예정일에 반영될 수 있어요.</p>
						<p>* 애플/구글플레이 결제의 경우 웹이 아닌 앱에서 해지를 진행해주세요.</p>
						<br/>
						<strong>[카드 결제/쿠폰 등록/휴대폰 소액 결제]</strong>
						<strong>앱에서 해지</strong>
						<p>1. 마이페이지</p>
						<p>2. 설정</p>
						<p>3. 계정 설정</p>
						<p>4. 하단의 ‘해지하기’ 선택</p>
						<strong>웹에서 해지</strong>
						<p>1. SETFLIX 사이트(play.watcha.net)</p>
						<p>2. 우측 상단의 프로필 아이콘 선택</p>
						<p>3. 설정</p>
						<p>4. ‘해지하기’ 선택</p>
						<br/>
						<strong>[해지 취소하기]</strong>
						<p>앱에서 해지 취소: 마이페이지 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
						<p>웹에서 해지 취소: SETFLIX 사이트(play.watcha.net) > 우측 상단의 프로필 아이콘 선택 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. SDK Error 메세지와 함께 재생이 되지 않습니다.
						<img src="image/arrow.png" alt="화살표">
					</a>	
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>정기 구독 중인데 이용권이 없다고 나오나요? 아래와 같은 사유로 인해 이용권이 보이지 않을 수 있어요.</p>
						<br/>
						<strong>일시적인 오류로 인해 이용권 지급이 안된 경우</strong>
						<p>: SETFLIX 앱 로그아웃 > 로그인 > 이용권 구매하기 화면에서 하단의 [구매내역복원] 선택</p>
						<br/>
						<strong>잔액 부족, 결제 정보 변경, 한도 초과 등 자동 결제가 실패되어 정상적으로 이용권이 지급되지 않은 경우</strong>
						<p>: 다른 결제 수단으로 다시 결제를 진행해주세요.</p>
						<br/>
						<strong>이용권을 구매한 아이디가 아닌 다른 아이디로 로그인한 경우</strong>
						<p>: 로그아웃 후, 이용권을 구매한 아이디로 다시 로그인 해주세요.</p>
						<br/>
						<p>만약 위와 같은 상황이 아니라면 고객센터로 문의 해주세요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 동시 시청이 가능한가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>카드/휴대폰 결제 중 잔액 부족 등으로 결제가 실패된 경우 SETFLIX pc웹 상단의 '결제수단변경' 버튼을 통해 다시 구독을 진행해주세요.</p>
						<p>* 애플, 구글 결제의 경우 결제 수단 변경은 iTunes 또는 구글 Play Store에서 변경부탁드려요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 안드로이드에서 영상 재생이 되지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 SETFLIX에서 쌓은 데이터를 활용해 영화와 드라마를 추천해드려요!</p>
						<br/>
						<p>1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾아요. 누구나 영화나 드라마를 볼 때 자기만의 중요한 기준이 있어요. 예를 들면, "난 영상미나 음악이 중요해… 아</p>
						<p>니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가</p>
						<p>중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있어요. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람</p>
						<p>들이 바로 나와 취향이 비슷한 사람들이에요.</p>
						<br/>
						<p>2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 작품 별로 "내 예상별점"을 만들어요. 나와 취향이 비슷한 사람들이 개별 작품에 매긴 점수는, 아마도 내가 실제로 </p>
						<p>매길 점수와 아주 아주 유사할거에요. 즉 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 작품에 몇 점을 줄지 미리 알 수가 있는 것이죠. SETFLIX는 나와 취향이 비슷한</p>
						<p>사람들의 평가를 종합해서, 자동으로 작품 별 "내 예상별점"을 계산하고 즉시 보여줘요.</p>
						<br/>
						<p>3. "내 예상별점"이 높은 작품들을 추천해요. 이렇게 계산된 예상별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높아요. 따라서 이런 작품들을 </p>
						<p>나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천한답니다.</p>
						<br/>
						<p>어때요? 참 쉽죠! 물론 이건 말로 간단히 풀어 설명한 것이고, 실제 위의 1~3번 과정을 "엄청난 양의 데이터에 대해 실시간으로 오류 없이 정확하게 계산하는 것"은 정말 정</p>
						<p>말 어려운 일이에요.</p>
						<br/>
						<p>SETFLIX는 수 년에 걸쳐 자체 개발한 추천 엔진 '핀셋'을 통해 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 </p>
						<p>개선되고 있어요. 이제 뭐볼지 고민하지 마세요!</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 감상 가능한 브라우저를 알려주세요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>(주)SETFLIX는 SETFLIX와 SETFLIX 두 서비스를 운영하고 있어요. SETFLIX는 영화, 드라마 평가/추천 전문 서비스이며, SETFLIX는 영화/드라마 감상 서비스에요. SETFLIX와 SETFLIX플</p>
						<p>레이는 연동되어 있어 동일한 계정으로 SETFLIX와 SETFLIX 모두 사용 가능하답니다. 평가 초기화, 코멘트/댓글 작성, 컬렉션 생성은 SETFLIX에서 가능해요.😄 SETFLIX는 앱과 웹을</p>
						<p>지원하고 있어요. 아래와 같이 이용 가능하니 참고해주세요.</p>
						<br/>
						<p>4억 개의 별점 데이터를 바탕으로 내 취향을 분석하는 SETFLIX 이용하기!</p>
						<strong><a href='#'>[앱스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[Play 스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[SETFLIX PC에서 접속하기]</a></strong>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 성인 인증 후에도 청소년관람불가 컨텐츠 재생이 되지 않습니다.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX의 이용권으로 모바일, 테블릿, pc, 맥을 포함한 Chromecast, 안드로이드 TV에서 SETFLIX 작품을 감상하실 수 있도록 지원하고 있어요. 상세한 지원 기기</p>
						<p>는 아래와 같으니 참고 부탁드려요.</p>
						<br/>
						<strong>[ TV 지원 이용권의 상세 지원 목록]</strong>
						<strong>- 16~18년형 삼성 스마트TV</strong>
						<strong>- 16~18년형 LG 스마트TV</strong>
						<p>- skyUHD A+ 상품 가입 시 제공받는 Android TV 셋탑 박스</p>
						<p>- Chromecast(1,2,3세대, Ultra)</p>
						<p>- 크라이저 셋탑 박스(U4X+S)</p>
						<p>- 구글 플레이 스토어가 지원되는 안드로이드 셋탑 박스</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 동영상 재생 시 Microsoft Silverlight를 설치하라고 떠요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX를 사용하기 위한 최소 사양은 아래와 같습니다. 낮은 사양의 버전에서는 SETFLIX가 정상적으로 작동되지 않을 수 있으니 참고부탁드립니다.</p>
						<p> - 안드로이드 버전 4.1.2(젤리빈) 이상</p>
						<br/>
						<p>아래와 같이 일부 기기에서는 제조사 OS 개발 환경에 따라 재생이 제한될 수 있습니다.</p>
						<p> - LG V10(OS 7.0 이상)</p>
						<p> - 블랙베리 키원</p>
						<p> - 갤럭시 탭</p>
						<p> - 레노바 요가 탭</p>
						<p> - 기타 직수입된 외산 기기</p>
						<p>* 컨텐츠 보호를 위해 루팅된 폰에서는 모든 영상의 재생이 제한될 수 있습니다. </p>
						<br/>
						<p>만약 위 내용과 상관없이 재생이 되지 않으신다면 아래와 같이 진행해주세요. 확인 후에도 재생이 되지 않는다면 고객센터로 문의부탁드립니다.</p>
						<br/>
						<p>1. 기기 펌웨어를 최신 버전으로 업데이트</p>
						<p>기기의 설정 >  휴대폰 정보 > 소프트웨어 업데이트 > 최신 버전으로 업데이트</p>
						<br/>
						<p>2. 데이터 삭제 후 재설치</p>
						<p>SETFLIX 앱> 설정 > 캐시 삭제 > 앱 재설치</p>
						<br/>
						<p>3. 기기 재부팅 후 다시 재생 시도</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 크롬(Chrome) 브라우저에서 재생이 안돼요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>Chrome, edge 등 일부 브라우저가 아닌 브라우저에서 영상 재생 시 Silverlight 플러그인 설치가 필요합니다. </p>
						<p>만약 실버라이트를 설치한 후에도 동일한 메시지가 뜬다면 아래와 같이 진행해주세요.</p>
						<br/>
						<p>- Internet explorer 의 경우 : Internet explorer 실행 > 도구 > 추가 기능 관리 > 도구 모음 및 확장 프로그램 > 하단 '표시'에서 '모든 추가 기능'으로 선택 > Microsoft </p>
						<p>Silverlight 선택 후 사용 함으로 설정 후 감상 시도</p>
						<br/>
						<p>- Safari11이하 버전의 경우 : 좌측 상단의 Safari 선택 > 환경 설정 선택 > '보안 탭'의 플러그인 중 Silverlight 선택 후 play.watcha.net 항목을 [켬]으로 설정 > 완료</p>
						<br/>
						<p>- Safari12이상 버전의 경우: 애플의 정책으로 인해 safari 12.0버전부터 Microfoft Silverlight(실버라이트)를 포함한 외부 플러그인은 지원되지 않습니다. 때문에 해당 </p>
						<p>브라우저에서 감상이 불가한 점 양해부탁드려요. 크롬브라우저는 실버라이트 설치 없이 재생이 가능합니다.</p>
						<br/>
						<a href='#'>[크롬브라우저 다운로드하러 가기]</a>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 로드 속도가 느리고 버퍼링으로 인해 재생이 원활하지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 대부분의 작품을 1080p(FHD)로 서비스하고 있습니다. 다만 원활한 감상을 위해 이용하시는 환경에 따라 자동으로 1080p, 720p, 480p, 360p로 설정되어 </p>
						<p>재생됩니다. </p>
						<br/>
						<p>아래 환경에서는 1080p 재생이 제한될 수 있는 점 참고부탁드립니다.</p>
						<p>- 네트워크 환경이 원활하지 않은 경우:</p>
						<p>　 1. 기숙사, 병원, 회사, 학교 등 네트워크 대역폭이 제한된 경우</p>
						<p>　 2. WiFi로 접속 시 공유기와의 거리가 멀거나 장애물이 있는 경우</p>
						<p>- PC/노트북에서 여러 작업을 동시에 진행하는 경우</p>
						<br/>
						<p>* 원본 자체가 저화질인 일부 컨텐츠의 경우(오래전에 제작된 작품 등) 원활한 네트워크 환경이라도 고화질로 자동변환되지 않습니다.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 화질이 별로예요. 좋은 화질로 볼 수 없나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>작품을 감상하시는 중 아래와 같은 영상/자막/내용 상의 문제가 있는 경우 알려주세요.</p>
						<p>(자막의 경우, SETFLIX는 컨텐츠 권리사에서 제공받은 공식 자막으로 서비스되고 있기 때문에, 임의적인 수정이 어려울 수 있어요.)</p>
						<br/>
						<p>아래 "작품 검수 요청" 눌러서 제보해주시면 확인 후 최대한 반영하도록 할게요.</p>	
						<br/>
						<p>- 자막 오역 및 맞춤법 (단, 영상에 입혀져있는 자막의 경우에는 처리하는 데에 시간이 오래 걸릴 수 있어요.😭)</p>
						<p>- 자막과 영상 싱크</p>
						<p>- 음성과 영상 싱크</p>
						<p>- 줄거리, 감독, 배우 등 작품 설명 내용 오류</p>
						<strong><a href='#'>작품 검수 요청</a></strong>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 소리가 나오지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX를 처음 찾아주시는 모든 회원분들에게 첫 구독 무료 이벤트를 진행하고 있어요. 물론 의무 사용 기간은 없으며 언제든지 간편하게 해지와 해지취소가 가능해요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. LG V20에서 재생이 되지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>결제 후 이용권 지급이 안됐다면 아래와 같이 진행해주세요.</p>
						<br/>
						<p>이용권 구매 > 화면 맨 하단 [구매내역복원] 터치</p>
						<br/>
						<p>만약 위를 통해서도 이용권이 지급되지 않는다면 고객센터로 문의주세요.</p>
						<p>빠르게 확인 도와드릴게요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. LG 스마트 빔 프로젝터에서 자막이 정상적으로 보이지 않아요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>결제 후 이용권 지급이 안됐다면 아래와 같이 진행해주세요.</p>
						<br/>
						<p>이용권 구매 > 화면 맨 하단 [구매내역복원] 터치</p>
						<br/>
						<p>만약 위를 통해서도 이용권이 지급되지 않는다면 고객센터로 문의주세요.</p>
						<p>빠르게 확인 도와드릴게요.</p>
					</div>
				</div>
			</div>
		  </div>
		  <div id="tabs-8">
		    <div class="accordion">
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 해외에서도 SETFLIX를 이용할 수 있나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>일부 안드로이드 기기에서 앱 실행 시, 혹은 영상 재생 시 회색화면이 뜨면서 진행되지 않는 경우가 발생하고 있어요.</p>
						<p>회색 화면이 뜨는 경우 '기기 재부팅'을 시도해주세요. </p>
						<p>기기 재부팅 이후에도 동일한 문제가 발생한다면 고객센터에 문의해주세요. </p>
						<br/>
						<p>이용에 불편을 드려 죄송합니다.</p>
						<p>해당 오류가 발생하지 않도록 원인과 해결방안을 모색하고 있으며, 빠른 시일내에 수정되도록 최선을 다하겠습니다.</p>	
					</div>
				</div>  
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 다 본 작품/이어보기 삭제는 어떻게 하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<strong>구글플레이 결제</strong>
						<p>구독 중에 이용권 변경은 어려워요. 기존 구독 해지 신청 후 재 결제하실 때 변경 원하시는 이용권으로 구매해주세요.</p>
						<p>* 해지하셔도 기존 이용권 만료일까지 감상 가능해요.</p>
						<p>* 해지 후 재구매 시 이전에 서비스되었던 일부 이용권은 구매가 불가능할 수도 있는 점 참고해주세요.</p>
						<br/>
						<strong>구글플레이 결제 해지 방법</strong>
						<p>SETFLIX 앱 마이페이지 > 설정 > 계정 설정 > 해지하기</p>
						<br/>
						<br/>
						<strong>애플 결제</strong>
						<p>애플 결제는 애플 구독 페이지에서 원하시는 이용권 신청하시면 '다음 재 결제일'에 새롭게 신청한 이용권으로 구독되어요.</p>
						<p>ex) 11/10 1개월 이용권 구독 신청 후 11/15 3개월 이용권으로 변경 신청하시면, 다음 결제일인 12/10 3개월 이용권으로 구독이 시작돼요.</p>
						<p>** 기본 이용권, TV 이용권은 현재 판매 중단되었으니 '이용권' 으로 변경해주세요.</p>
						<br/>
						<strong>애플 결제 이용권 변경 방법</strong>
						<p>1. 아이폰 설정의 [iTunes 및 App Store]</p>
						<p>2. Apple ID : ***@***.*** 선택</p>
						<p>3. [Apple ID 보기] 선택 후 로그인</p>
						<p>4. [구독] 선택 (구독한 사항이 없으면 표시되지 않습니다)</p>
						<p>5. SETFLIX 선택</p>
						<p>6. 원하는 이용권 선택 후 구독</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 새로운 작품 추가를 제안하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>보고싶은 영화나 TV 프로그램이 SETFLIX에 없다면,</p>
						<p>아래 &lt;작품 제안하기&gt; 링크를 눌러 추가 신청을 해주세요. 저희 콘텐츠 업데이트 계획에 반영할게요!</p>
						<br/>
						<strong>작품 제안하기</strong>
						<br/>
						<p>보고싶은 작품의 업데이트 소식을 받고싶다면, </p>
						<p>"SETFLIX"에서 해당 작품의 &lt;보고싶어요&gt; 를 클릭해주세요! 업데이트 시 회원님의 SETFLIX 앱에서 알람이 갈거에요 :)</p>
						<br/>
						<strong>애플 결제</strong>
						<p>SETFLIX: 별점을 남기고 코멘트를 작성할 수 있어요.</p>
						<p>SETFLIX: 영화와 드라마를 감상할 수 있어요.</p>
						<br/>
						<img src="image/HvK6efy.png" alt="이미지">
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 기기 초기화는 어떻게 하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>* 해지 후에도 현재 구독 중인 이용권의 만료일까지 감상 가능하며, 다음 결제일부터 자동결제 되지 않아요.</p>
						<p>* 결제일 당일에 해지하신 경우 다음 결제 예정일에 반영될 수 있어요.</p>
						<p>* 애플/구글플레이 결제의 경우 웹이 아닌 앱에서 해지를 진행해주세요.</p>
						<br/>
						<strong>[카드 결제/쿠폰 등록/휴대폰 소액 결제]</strong>
						<strong>앱에서 해지</strong>
						<p>1. 마이페이지</p>
						<p>2. 설정</p>
						<p>3. 계정 설정</p>
						<p>4. 하단의 ‘해지하기’ 선택</p>
						<strong>웹에서 해지</strong>
						<p>1. SETFLIX 사이트(play.watcha.net)</p>
						<p>2. 우측 상단의 프로필 아이콘 선택</p>
						<p>3. 설정</p>
						<p>4. ‘해지하기’ 선택</p>
						<br/>
						<strong>[해지 취소하기]</strong>
						<p>앱에서 해지 취소: 마이페이지 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
						<p>웹에서 해지 취소: SETFLIX 사이트(play.watcha.net) > 우측 상단의 프로필 아이콘 선택 > 설정 > 이용권 상태의 '해지 취소' 선택</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. SETFLIX의 예상별점과 추천의 원리는 무엇인가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>정기 구독 중인데 이용권이 없다고 나오나요? 아래와 같은 사유로 인해 이용권이 보이지 않을 수 있어요.</p>
						<br/>
						<strong>일시적인 오류로 인해 이용권 지급이 안된 경우</strong>
						<p>: SETFLIX 앱 로그아웃 > 로그인 > 이용권 구매하기 화면에서 하단의 [구매내역복원] 선택</p>
						<br/>
						<strong>잔액 부족, 결제 정보 변경, 한도 초과 등 자동 결제가 실패되어 정상적으로 이용권이 지급되지 않은 경우</strong>
						<p>: 다른 결제 수단으로 다시 결제를 진행해주세요.</p>
						<br/>
						<strong>이용권을 구매한 아이디가 아닌 다른 아이디로 로그인한 경우</strong>
						<p>: 로그아웃 후, 이용권을 구매한 아이디로 다시 로그인 해주세요.</p>
						<br/>
						<p>만약 위와 같은 상황이 아니라면 고객센터로 문의 해주세요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 예상별점은 얼마나 정확한가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>카드/휴대폰 결제 중 잔액 부족 등으로 결제가 실패된 경우 SETFLIX pc웹 상단의 '결제수단변경' 버튼을 통해 다시 구독을 진행해주세요.</p>
						<p>* 애플, 구글 결제의 경우 결제 수단 변경은 iTunes 또는 구글 Play Store에서 변경부탁드려요.</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 같이 감상하는 친구의 예상별점도 궁금해요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX는 SETFLIX에서 쌓은 데이터를 활용해 영화와 드라마를 추천해드려요!</p>
						<br/>
						<p>1. 먼저, 내가 매긴 별점을 통해 취향이 비슷한 사람을 찾아요. 누구나 영화나 드라마를 볼 때 자기만의 중요한 기준이 있어요. 예를 들면, "난 영상미나 음악이 중요해… 아</p>
						<p>니야 스토리가 갑이지… 에이 영화는 연기 보는 맛이야…" 같은 것이죠. 결국 나도 모르게 이 기준에 따라 별점을 주게 되고, 따라서 내가 매긴 별점들을 쭈욱 분석하면 내가</p>
						<p>중요하게 생각하는 기준, 나만의 성향을 분석할 수가 있어요. 그리고 이렇게 분석한 성향을 서로 서로 비교하면, 아주 비슷한 성향을 가진 사람들을 찾을 수 있겠죠. 이 사람</p>
						<p>들이 바로 나와 취향이 비슷한 사람들이에요.</p>
						<br/>
						<p>2. 이렇게 내 취향과 비슷한 사람들이 매긴 평가를 모아서 작품 별로 "내 예상별점"을 만들어요. 나와 취향이 비슷한 사람들이 개별 작품에 매긴 점수는, 아마도 내가 실제로 </p>
						<p>매길 점수와 아주 아주 유사할거에요. 즉 보지 않았더라도 이 사람들이 매긴 점수를 보면, 내가 이 작품에 몇 점을 줄지 미리 알 수가 있는 것이죠. SETFLIX는 나와 취향이 비슷한</p>
						<p>사람들의 평가를 종합해서, 자동으로 작품 별 "내 예상별점"을 계산하고 즉시 보여줘요.</p>
						<br/>
						<p>3. "내 예상별점"이 높은 작품들을 추천해요. 이렇게 계산된 예상별점이 "3점 후반대 ~ 5점"에 가까운 영화들은 내가 재미있게 즐길 확률이 높아요. 따라서 이런 작품들을 </p>
						<p>나에게 추천하되, 만약 내가 좋아하는 감독이나 장르에 해당한다면 가산점을 줘서 더 먼저 추천한답니다.</p>
						<br/>
						<p>어때요? 참 쉽죠! 물론 이건 말로 간단히 풀어 설명한 것이고, 실제 위의 1~3번 과정을 "엄청난 양의 데이터에 대해 실시간으로 오류 없이 정확하게 계산하는 것"은 정말 정</p>
						<p>말 어려운 일이에요.</p>
						<br/>
						<p>SETFLIX는 수 년에 걸쳐 자체 개발한 추천 엔진 '핀셋'을 통해 이 모든 과정을 아주 안정적으로 제공하고 있고 별점과 사용자가 쌓일 때마다 "기계학습" 이라는 과정으로 계속 </p>
						<p>개선되고 있어요. 이제 뭐볼지 고민하지 마세요!</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 코멘트는 어떻게 작성하나요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>(주)SETFLIX는 SETFLIX와 SETFLIX 두 서비스를 운영하고 있어요. SETFLIX는 영화, 드라마 평가/추천 전문 서비스이며, SETFLIX는 영화/드라마 감상 서비스에요. SETFLIX와 SETFLIX플</p>
						<p>레이는 연동되어 있어 동일한 계정으로 SETFLIX와 SETFLIX 모두 사용 가능하답니다. 평가 초기화, 코멘트/댓글 작성, 컬렉션 생성은 SETFLIX에서 가능해요.😄 SETFLIX는 앱과 웹을</p>
						<p>지원하고 있어요. 아래와 같이 이용 가능하니 참고해주세요.</p>
						<br/>
						<p>4억 개의 별점 데이터를 바탕으로 내 취향을 분석하는 SETFLIX 이용하기!</p>
						<strong><a href='#'>[앱스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[Play 스토어에서 바로 SETFLIX 다운받기]</a></strong>
						<strong><a href='#'>[SETFLIX PC에서 접속하기]</a></strong>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 평가한 별점을 초기화하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX의 이용권으로 모바일, 테블릿, pc, 맥을 포함한 Chromecast, 안드로이드 TV에서 SETFLIX 작품을 감상하실 수 있도록 지원하고 있어요. 상세한 지원 기기</p>
						<p>는 아래와 같으니 참고 부탁드려요.</p>
						<br/>
						<strong>[ TV 지원 이용권의 상세 지원 목록]</strong>
						<strong>- 16~18년형 삼성 스마트TV</strong>
						<strong>- 16~18년형 LG 스마트TV</strong>
						<p>- skyUHD A+ 상품 가입 시 제공받는 Android TV 셋탑 박스</p>
						<p>- Chromecast(1,2,3세대, Ultra)</p>
						<p>- 크라이저 셋탑 박스(U4X+S)</p>
						<p>- 구글 플레이 스토어가 지원되는 안드로이드 셋탑 박스</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. TV로 감상할 수 있는 방법은 무엇인가요?
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>SETFLIX를 사용하기 위한 최소 사양은 아래와 같습니다. 낮은 사양의 버전에서는 SETFLIX가 정상적으로 작동되지 않을 수 있으니 참고부탁드립니다.</p>
						<p> - 안드로이드 버전 4.1.2(젤리빈) 이상</p>
						<br/>
						<p>아래와 같이 일부 기기에서는 제조사 OS 개발 환경에 따라 재생이 제한될 수 있습니다.</p>
						<p> - LG V10(OS 7.0 이상)</p>
						<p> - 블랙베리 키원</p>
						<p> - 갤럭시 탭</p>
						<p> - 레노바 요가 탭</p>
						<p> - 기타 직수입된 외산 기기</p>
						<p>* 컨텐츠 보호를 위해 루팅된 폰에서는 모든 영상의 재생이 제한될 수 있습니다. </p>
						<br/>
						<p>만약 위 내용과 상관없이 재생이 되지 않으신다면 아래와 같이 진행해주세요. 확인 후에도 재생이 되지 않는다면 고객센터로 문의부탁드립니다.</p>
						<br/>
						<p>1. 기기 펌웨어를 최신 버전으로 업데이트</p>
						<p>기기의 설정 >  휴대폰 정보 > 소프트웨어 업데이트 > 최신 버전으로 업데이트</p>
						<br/>
						<p>2. 데이터 삭제 후 재설치</p>
						<p>SETFLIX 앱> 설정 > 캐시 삭제 > 앱 재설치</p>
						<br/>
						<p>3. 기기 재부팅 후 다시 재생 시도</p>
					</div>
				</div>
				<div class="accordion-div">
					<a class="toggle" href="javascript:void(0);">Q. 새로운 기능을 제안하고 싶어요.
						<img src="image/arrow.png" alt="화살표">
					</a>
					<div class="inner">
					<hr style="margin: 25px 0;">
						<p>Chrome, edge 등 일부 브라우저가 아닌 브라우저에서 영상 재생 시 Silverlight 플러그인 설치가 필요합니다. </p>
						<p>만약 실버라이트를 설치한 후에도 동일한 메시지가 뜬다면 아래와 같이 진행해주세요.</p>
						<br/>
						<p>- Internet explorer 의 경우 : Internet explorer 실행 > 도구 > 추가 기능 관리 > 도구 모음 및 확장 프로그램 > 하단 '표시'에서 '모든 추가 기능'으로 선택 > Microsoft </p>
						<p>Silverlight 선택 후 사용 함으로 설정 후 감상 시도</p>
						<br/>
						<p>- Safari11이하 버전의 경우 : 좌측 상단의 Safari 선택 > 환경 설정 선택 > '보안 탭'의 플러그인 중 Silverlight 선택 후 play.watcha.net 항목을 [켬]으로 설정 > 완료</p>
						<br/>
						<p>- Safari12이상 버전의 경우: 애플의 정책으로 인해 safari 12.0버전부터 Microfoft Silverlight(실버라이트)를 포함한 외부 플러그인은 지원되지 않습니다. 때문에 해당 </p>
						<p>브라우저에서 감상이 불가한 점 양해부탁드려요. 크롬브라우저는 실버라이트 설치 없이 재생이 가능합니다.</p>
						<br/>
						<a href='#'>[크롬브라우저 다운로드하러 가기]</a>
					</div>
				</div>
			</div>
		  </div>
		</div>
	</div>
	<footer>
		<div>
			<ul class="columns flex-wrap">
				<li class="column is-25">
					<a href="#">SETFLIX 서비스 이용 약관</a>
				</li>
				<li class="column is-25">
					<a href="help">SETFLIX 고객센터 문의</a>
				</li>
				<li class="column is-25">
					<a href="mailto:dlsdudg15@naver.com">dlsdudg15@naver.com</a>
				</li>
			</ul>
			<p id="company">SETFLIX Copyright ⓒ2019 by JRP_PIRATE. All rights reserved</p>
		</div>
	</footer>
</body>
</html>