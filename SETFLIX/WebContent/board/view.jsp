<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset='UTF-8'>
<link rel="stylesheet" href="css/cust_service.css">
<link rel="stylesheet" href="css/view.css">
<title>SETFLIX :: ${video.title}</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
/*
이유진
2019.4.10
*/
function sum(a,b) {
	Number(a);
	Number(b);
	return a+b;
}
function mul(a,b) {
	Number(a);
	Number(b);
	return a*b;
}
/**
	이유진
	댓글 리스트 가져오기
*/
function replyslist() {
	var boardno = '${param.boardno}';
	$.ajax({
		url : "reply",
		type : 'GET',
		data : {"boardno" : boardno},
		dataType : "json",
		success : function(data) {
			console.log(data);
			var str = "";
			for (var i = 0; i < data.length; i++) {
				var depth1 = sum(mul(data[i].rdepth,5),-1);
				var depth2 = sum(100,-depth1);
				
				if (depth1<0) {
					depth1 = 0;
					depth2=100;
				} else if (depth1>49){
					depth1 = 49;
					depth2 = 49;
				}else{
					
				}
				
				str +=
					'<div>'+
						'<div class="depth" style="width: '+depth1+'%"></div>'+
						'<div class="replys" style="width: '+depth2+'%">'+
							'<input type="hidden" value="'+data[i].replyno+'" name="replyno">'+
							'<input type="hidden" value="'+data[i].userno+'" name="userno">'+
							'<input type="hidden" value="'+data[i].rdepth+'" name="rdepth">'+
							'<input type="hidden" value="'+data[i].rgroup+'" name="rgroup">'+
							'<input type="hidden" value="'+data[i].rlevel+'" name="rlevel">'+
							'<h2>'+data[i].username+'<span>('+data[i].regdate+')</span>'+'</h2>'+
							'<p>'+data[i].content+'</p>'+
							'<h4>'+
								'<span>'+
									'<a class="rlike"><img src="image/iconmonstr-thumb-9-12.png" alt="좋아요" /><span>'+data[i].recommend+'</span></a>'+
								'</span>'+
								'<span><a class="toggle2" style="cursor: pointer;">댓글 쓰기<img src="image/iconmonstr-arrow-65-12.png" alt="댓글보기" /></a></span>'+
								'<span class="del">[삭제]</span>'+
							'</h4>'+
							'<div class="inner">'+
								'<form name="rfrm" method="post">'+
									'<input type="hidden" name="userno" value="'+data[i].userno+'">'+
									'<input type="hidden" name="boardno" value="'+data[i].boardno+'">'+
									'<input type="hidden" name="rlevel" value="'+sum(data[i].rlevel,1)+'">'+
									'<input type="hidden" name="preply" value="'+data[i].replyno+'">'+
									'<input type="hidden" name="rgroup" value="'+data[i].rgroup+'">'+
									'<input type="hidden" name="rdepth" value="'+sum(data[i].rdepth,1)+'">'+
									'<h2>'+data[i].username+'</h2>'+
									'<textarea name="reply"></textarea>'+
									'<button type="button">댓글</button>'+
								'</form>'+
							'</div>'+
						'</div>'+
					'</div>'
			}
			console.log(str)
			$("#replys").append(str);
		},
		error : function() {
		}
	});
}

	function search() {
		$(".sicon").click(function() {
			$(".sicon").hide();
			$(".search1").show();
		})
	}
	var page = 1;

	$(window).scroll(function() {
		if ($(document).height() - 5 <= $(window).scrollTop()+ $(window).height() && page == 1) {
			getList(page);
			page++;
		}
	});

	function getList(page) {
		var boardno = '${param.boardno}';
		$.ajax({
			type : 'POST',
			data : {
			"boardno" : boardno},
			dataType : "json",
			success : function(data) {
				for (var i = 1; i < 5; i++) {
					$('#appendbox').append("<div class='asidebox'><a href='?boardno="+ data[i].boardno+ "'><img class='thumbnail' src='" + data[i].thumbnail + "' alt='" + data[i].title + "'><a/>"+ "<p class='title'><a href='?boardno="+ data[i].boardno + "'>"+ data[i].title+ "</a></p></div>");}
			},
			beforeSend : function() {
				$('.loading').show();
			},
			complete : function() {
				$('.loading').hide();
			},
			error : function() {
			alert("데이터가 없습니다.")
			}
		});
	}
	
	replyslist();
	/* <!-- 		
	 * @author : 박예빈
	 * @Date : 2019. 4. 05.
	 * @변경이력 :
	 --> */
	$(function() {
		
		$('.heart').click(function() {
			var boardno = '${param.boardno}';
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
						$(".heart").eq(0).removeClass('hidden');
						$(".heart").eq(1).addClass('hidden');
						console.log(heart);
					} else {
						$(".heart").eq(0).addClass('hidden');
						$(".heart").eq(1).removeClass('hidden');
						console.log(heart);
					}
				},
				error : function() {
					alert("다시 시도해주세요.")
				}
			});
		})
		
		$('.toggle').click(function(e) {
			e.preventDefault();
			var $this = $(this);
			if ($this.next().hasClass('show')) {
				$this.next().removeClass('show');
				$this.next().slideUp(1);
				$this.text("댓글 펼치기")
				
			} else {
				$this.parent().parent().find('div .inner').removeClass('show');
				$this.parent().parent().find('div .inner').slideUp(1);
				$this.next().toggleClass('show');
				$this.next().slideToggle(1);
				$this.text("댓글 접기")
			}
		});
		$("#accordion").on("click", ".toggle2", function(e) {
			e.preventDefault();
			var $this = $(this);
			if ($this.parent().parent().next().hasClass('show')) {
				$this.parent().parent().next().removeClass('show');
				$this.parent().parent().next().slideUp(1);
				$this.text("댓글 쓰기")
				
			} else {
				$this.parent().parent().next().removeClass('show');
				$this.parent().parent().next().slideUp(1);
				$this.parent().parent().next().toggleClass('show');
				$this.parent().parent().next().slideToggle(1);
				$this.text("댓글 접기")
			}
		});
		$("#accordion").on("click", "button", function() {
			var rfrm = $(this).parent().serialize();
			$.ajax({
				url : "reply",
				type : 'POST',
				data : {"rfrm" : rfrm},
				success : function(data) {
					$("#replys>div").remove();
					replyslist();
					$("textarea").val("");
				},
				error : function() {
					alert("다시 시도해주세요.")
				}
			});
		});
		$("#accordion").on("click", ".rlike", function() {
			var $this = $(this);
			var replyno = $this.parent().parent().parent().find("input[name=replyno]").val();
			var boardno = '${param.boardno}';
			var like = Number($this.children().next().text())+1;
			$this.children().next().text(like);
			$.ajax({
				url : "reply",
				type : 'GET',
				data : {
					"type" : 'like',
					"replyno" : replyno,
					"boardno" : boardno
				},
				success : function() {
				},
				error : function() {
					alert("좋아요 다시 시도해주세요.")
				}
			});
		});
		$("#accordion").on("click", ".del", function() {
			var $this = $(this);
			var replyno = $this.parent().parent().parent().find("input[name=replyno]").val();
			var boardno = '${param.boardno}';
			var userno = '${member.userNo}';
			var admin = '${member.admin}';
			var ruserno = $this.parent().parent().parent().find("input[name=userno]").val();
			if (ruserno == userno | admin == 1) {
				$.ajax({
					url : "reply",
					type : 'GET',
					data : {
						"type" : 'del',
						"replyno" : replyno,
						"boardno" : boardno,
						"userno" : userno
					},
					success : function() {
						$this.parent().parent().find("p").text("삭제된 댓글입니다.");
						alert("댓글을 삭제했습니다.")
					},
					error : function() {
						alert("댓글 삭제 다시 시도해주세요.")
					}
				});
			}else{
				alert("자신이 작성한 댓글만 삭제 가능합니다")
			}
		});
		
	}); 
</script>
<style type="text/css">
	#replys {width: 100%;}
	#replys form{margin: 10px 0;width: 100%; margin: 20px 0;}
	#replys form:not(h2){text-align: right}
	#replys form:not(button), #replys>form:not(textarea){text-align: left;}
	#replys form>*{display: inline-block; line-height: 100%; margin: 0 auto; vertical-align: middle; width: 10%;}
	#replys form h2{text-align: center;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;margin: 0}
	#replys form button{border: 0; background: #eee; color: black; margin: 0 5px; padding: 12px 0}
	#replys form textarea {width: 75%; height: 100%; resize: none; background: #5555; border:0; overflow: hidden; resize: none; font-size: 1.5em;overflow-y: scroll;}
	
	#replys form+hr{margin-bottom: 20px;}
	
	#replys>div{width: 100%; margin: 1% 0;}
	#replys>div>div:nth-child(2){ background: #99999911;}
	.depth, .replys{display: inline-block;}
	.depth{height: 10px;}
	
	.reply h4{margin-top: 10px; padding: 0 10px;}
	.reply h4>*{margin: 0 20px;}
	.reply h4>span:first-child{margin-left: 0;}
	.reply h4>span:last-child{margin-right: 0;}
	.reply h2{margin-bottom: 10px}
	.reply h2>span{font-size: .5em;}
	.del{float: right;}

</style>
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
	<div class="wrap">
		<section>
			<article>
				<c:if test="${!empty video }">
					<iframe src="${video.content}"></iframe>
					<h2 style="float: left">${video.title}</h2>
			<!-- 		
			 * @author : 박예빈
			 * @Date : 2019. 4. 08.
			 * @변경이력 :
			 -->
					<c:choose>
						<c:when test="${heartCk}">
							<img class="heart hidden" src="image/heart.png" alt="좋아요">
							<img class="heart" src="image/no-bg-heart.png" alt="좋아요" data-opt='fill'>
						</c:when>
						<c:when test="${!heartCk}">
							<img class="heart" src="image/heart.png" alt="좋아요">
							<img class="heart hidden" src="image/no-bg-heart.png" alt="좋아요" data-opt='fill'>
						</c:when>
					</c:choose>
					<h4 style="clear: both;">
						<c:forEach items="${genres}" var="genre">
							<span>${genre}</span>
						</c:forEach>
					</h4>
					<p>${video.contentDescription}</p>
					<c:if test="${not empty member.id && member.admin=='1'}">
						<a href="delete?boardno=${param.boardno}"><button type="button">삭제</button></a>
					</c:if>
				</c:if>
			</article>
			<article id="accordion" class="reply">
				<h3 style="display: none;">댓글</h3>
				<a class="toggle" href="javascript:void(0);">댓글 펼치기</a>
				<div class="inner">
					<jsp:include page="reply.jsp"></jsp:include>
				</div>
			</article>
		</section>
		<aside id="appendbox">
			<h2>관련 동영상 추천</h2>
			<c:forEach items="${list}" var="list" end="5">
				<div class="asidebox">
					<a href="?boardno=${list.boardno}"><img class="thumbnail" alt="${list.title}" src="${list.thumbnail}"></a>
					<p class='title'>
						<a href="?boardno=${list.boardno}">${list.title}</a>
					</p>
				</div>
			</c:forEach>
			<img class="loading" src="image/loading.gif" alt="로딩" />
		</aside>
	</div>
	<footer>
		<div>
			<ul class="columns flex-wrap">
				<li class="column is-25"><a href="#">SETFLIX 서비스 이용 약관</a></li>
				<li class="column is-25"><a href="help">SETFLIX 고객센터 문의</a></li>
				<li class="column is-25"><a href="#">dlsdudg15@naver.com</a></li>
			</ul>
			<p id="company">SETFLIX Copyright ⓒ2019 by JRP_PIRATE. All rights
				reserved</p>
		</div>
	</footer>
	<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
</body>
</html>